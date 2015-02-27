package net.hunanst.eduz100.service.oa.impl;

import net.hunanst.common.api.constant.OfficialdocumentConstant;
import net.hunanst.common.api.constant.RemindConstant;
import net.hunanst.common.api.enumeration.OfficialDocumentStatusEnum;
import net.hunanst.eduz100.api.oa.*;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.api.sys.vo.AcOperatorVo;
import net.hunanst.eduz100.dto.OfficialDocumentDto;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.oa.*;
import net.hunanst.eduz100.service.sys.AcOperatorService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:31
 *
 * @author: guanshj QQ: 928990049
 */
@Service("officialdocumentService")
public class OfficialdocumentServiceImpl extends BaseServiceImpl<Officialdocument> implements OfficialdocumentService {

    @Autowired
    private OfficialdocumentDeliverService officialdocumentDeliverService;

    @Autowired
    private OfficialdocumentFileService officialdocumentFileService;

    @Autowired
    private OfficialdocumentPostilService officialdocumentPostilService;

    @Autowired
    private OfficialdocumentMonitorService officialdocumentMonitorService;

    @Autowired
    private OfficialdocumentRecordService officialdocumentRecordService;

    @Autowired
    private AcOperatorService acOperatorService;

    @Autowired
    private RemindService remindService;

    @Override
    public String getNamespace() {
        return "Officialdocument";
    }

    @Override
    public Integer insertResultId (Officialdocument record){
        int n = sqlSessionTemplate.insert(getNamespace() + ".insertSelective",record);
        if(n > 0){
            return record.getId();
        }else{
            return null;
        }
    }

    @Override
    public int deleteByIdList(List<Integer> idArr) throws Exception {

        return sqlSessionTemplate.delete( getNamespace() + ".deleteByIdList" , idArr);
    }

    @Override
    public List<Officialdocument> selectApproveForUser(Officialdocument record) throws Exception {
        return (List<Officialdocument>) sqlSessionTemplate.selectList( getNamespace() + ".selectApproveForUser_page" , record );
    }

    @Override
    public List<Officialdocument> selectApproveForOrg(Officialdocument record) throws Exception {
        return (List<Officialdocument>) sqlSessionTemplate.selectList( getNamespace() + ".selectApproveForOrg_page" , record );
    }

    @Override
    public List<Officialdocument> selectNewestPage(Officialdocument record) throws Exception {
        return (List<Officialdocument>) sqlSessionTemplate.selectList( getNamespace() + ".selectNewest_page" , record );
    }

    /*@Override
    public List<Officialdocument> selectRecord(Officialdocument record) throws Exception {
        return (List<Officialdocument>) sqlSessionTemplate.selectList(getNamespace() + ".selectRecord_page" , record);
    }*/

    /**
     * 保存
     * @param dto 对数传输对象
     * @param flag 标识： 1：保存草稿 ；2：正式提交（公文流转启动） (根据OfficialDocumentStatusEnum.java 来的)
     * @throws Exception
     */
    @Override
    public Integer save (OfficialDocumentDto dto , int flag) throws Exception {
        // validate
        if(dto.getUserid() == null){
            System.out.println("参数不正确,或者未登陆");
            throw new Exception();
        }

        Integer status = null;
        Integer changeFlag = null;

        if( OfficialDocumentStatusEnum.DRAFT.getCode() == flag ){
            status = OfficialDocumentStatusEnum.DRAFT.getCode();
            changeFlag = OfficialdocumentConstant.CHANGEFLAG_OFF;

        }else if ( OfficialDocumentStatusEnum.PENDINGAPPROVAL.getCode() == flag){
            if (dto.getDeliverid() == null || dto.getDelivertype() == null
                    || StringUtils.isEmpty(dto.getTitle()) || StringUtils.isEmpty(dto.getContent())) {
                System.out.println("参数不正确,或者未登陆");
                throw new Exception();
            }
            status = OfficialDocumentStatusEnum.PENDINGAPPROVAL.getCode();
            changeFlag = OfficialdocumentConstant.CHANGEFLAG_ON;
        }else{
            System.out.println("参数不合法");
            throw new Exception();
        }

        Integer userid = dto.getUserid();
        Integer orgid = dto.getOrgid();
        Date now = new Date();

        // 公文主要信息
        Officialdocument officialDocument = new Officialdocument();
        officialDocument.setTitle( StringUtils.isEmpty(dto.getTitle())?"未命名":dto.getTitle() );
        officialDocument.setContent( dto.getContent() );
        officialDocument.setImportantlevel( dto.getImportantlevel() );
        officialDocument.setStatus( status );  // 草稿
        officialDocument.setTimelinessflag( dto.getTimelinessflag() );
        if(!StringUtils.isEmpty(dto.getLastdateStr())){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            officialDocument.setLastdate( df.parse(dto.getLastdateStr()) );
        }
        officialDocument.setDraftuserid( userid );
        officialDocument.setDraftorgid( orgid );

        if ( OfficialDocumentStatusEnum.PENDINGAPPROVAL.getCode() == flag) officialDocument.setCommitdate(now);

        Integer id = dto.getOfficialDocumentId();
        if(id != null){
            // update
            officialDocument.setId(id);
            this.updateByPrimaryKeySelective(officialDocument);
        }else{
            // insert
            officialDocument.setCreatedate( now );
            id = this.insertResultId(officialDocument);
        }

        if(id != null){
            if( OfficialDocumentStatusEnum.PENDINGAPPROVAL.getCode() == flag ){
                // 正式提交的时候， 写入跟踪监视记录
                this.addMonitor( id ,userid );// 写入跟踪监视记录   先要判断是否已经 有跟踪记录
            }

            // 删除 附件
            if(dto.getFileIdList() !=null && !dto.getFileIdList().isEmpty()){
                officialdocumentFileService.deleteList( dto.getFileIdList() );
            }

            // 需要 公文主表 ID 有值才行
            // 附件
            if(dto.getOfficialdocumentFileList()!=null && !dto.getOfficialdocumentFileList().isEmpty()){
                List<OfficialdocumentFile> insertFileList = new ArrayList<OfficialdocumentFile>();
                for(OfficialdocumentFile odFile : dto.getOfficialdocumentFileList()){
                    if(StringUtils.isEmpty(odFile.getFilename()) || StringUtils.isEmpty(odFile.getFilepath())) continue;

                    odFile.setOfficialdocumentid(id); // 公文主表的ID 关联
                    odFile.setUserid(userid);
                    odFile.setOrgid(orgid);

                    odFile.setSourcefileflag(OfficialdocumentConstant.SOURCEFILEFLAG_YES); // 是源文件，
                    odFile.setUploaddate(now);

                    if(!StringUtils.isEmpty(odFile.getFilepath())){
//                        odFile.getFilepath().length()
                        String houzui = odFile.getFilepath().substring( odFile.getFilepath().lastIndexOf('.')+1 );
                        odFile.setSuffix( houzui );
                    }

                    insertFileList.add(odFile);
                }
                //  批量插入文件
                officialdocumentFileService.insertList (insertFileList) ;
            }

            // 如果有指派人 记录下来
            if(dto.getDeliverid() != null && dto.getDelivertype() !=null){
                OfficialdocumentDeliver deliver = new OfficialdocumentDeliver();

                deliver.setDeliverid( dto.getDeliverid() );
                deliver.setDelivertype(dto.getDelivertype());
                deliver.setDeliverdate(now);

                deliver.setChangeflag( changeFlag );
                deliver.setChangestatus( status );

                deliver.setOfficialdocumentid(id);
                deliver.setUserid(userid);
                deliver.setOrgid(orgid);

                //  插入流转记录
                officialdocumentDeliverService.insertSelective(deliver);

                // 正式提交时，提交给具体人时，提醒开关打开时； 调用发送提醒的接口， 提醒待审
                if (OfficialDocumentStatusEnum.PENDINGAPPROVAL.getCode() == flag &&
                        dto.getDelivertype().equals(OfficialdocumentConstant.DELIVERTYPE_USER) &&
                        RemindConstant.REMIND_ON.equals(dto.getRemindflag())) {
                    remindService.save_officialDocument_remind(dto.getRemindtype(), officialDocument.getDraftuserid(), dto.getDeliverid()
                            , OfficialDocumentStatusEnum.PENDINGAPPROVAL.getCode(), officialDocument.getTitle());
                }
            }
        }

        return id;
    }

    /**
     * 私有方法， 处理 移交、审批通过、驳回 公文 的逻辑操作
     * @param flag  1：移交 ； 2：通过；5：驳回   (根据OfficialDocumentStatusEnum.java 来的)
     * @param odid  公文主表ID
     * @param userid 操作人ID
     * @param orgid  操作人组织机构ID
     * @param postilContent 批注内容
     * @param fileList  文件集合
     * @param moveid,moveType 当flag == 1时必填
     * @throws Exception
     */
    @Override
    public void save_examine(int flag, Integer odid, Integer userid, Integer orgid
            , String postilContent, List<OfficialdocumentFile> fileList, Integer moveid, Integer moveType ,Integer remindflag,Integer remindtype) throws Exception {

        Date now = new Date();

        Officialdocument odObj = this.selectByPrimaryKey( odid );

        this.addMonitor( odid ,userid );// 写入跟踪监视记录   先要判断是否已经 有跟踪记录

        // 流转记录 对象
        OfficialdocumentDeliver deliver = new OfficialdocumentDeliver();

        if( OfficialDocumentStatusEnum.PENDINGAPPROVAL.getCode() == flag ){
            // 移交
            // validate
            if(odid ==null || userid == null || orgid == null || moveid == null || moveType == null ){
                System.out.println("参数不正确,或者未登陆");
                throw new Exception();
            }

            deliver.setDeliverdate(now);
            deliver.setDeliverid(moveid);
            deliver.setDelivertype(moveType);

            deliver.setChangeflag(OfficialdocumentConstant.CHANGEFLAG_OFF);
            deliver.setChangestatus( odObj.getStatus() );   //  根据公文主表的状态来填写

            // 提交给具体人时，提醒开关打开时； 调用发送提醒的接口 ，提醒待审
            if ( moveType.equals(OfficialdocumentConstant.DELIVERTYPE_USER) &&
                    RemindConstant.REMIND_ON.equals(remindflag)) {
                remindService.save_officialDocument_remind(remindtype, userid, moveid
                        , flag, odObj.getTitle() );
            }

        }else if( OfficialDocumentStatusEnum.TOBEISSUED.getCode() == flag ){
            // 通过
            // validate
            if(odid ==null || userid == null || orgid == null){
                System.out.println("参数不正确,或者未登陆");
                throw new Exception();
            }

            // 更新公文状态
            Officialdocument updateOdRecord = new Officialdocument();
            updateOdRecord.setId( odid );
            updateOdRecord.setStatus( OfficialDocumentStatusEnum.TOBEISSUED.getCode() );  // 审批通过，等待签发
            this.updateByPrimaryKeySelective(updateOdRecord);

            // 流转记录
            deliver.setDeliverdate(now);
            deliver.setDeliverid( odObj.getDraftuserid() );     // 回到发起人
            deliver.setDelivertype( OfficialdocumentConstant.DELIVERTYPE_USER );

            deliver.setChangeflag(OfficialdocumentConstant.CHANGEFLAG_ON);
            deliver.setChangestatus( OfficialDocumentStatusEnum.TOBEISSUED.getCode() );   //  审批通过，等待签发

            if (fileList != null && !fileList.isEmpty()) for (OfficialdocumentFile odFile : fileList) {
                if (odFile.getId() != null && !StringUtils.isEmpty(odFile.getSealpath())){
                    odFile.setSuffix("pdf");
                    officialdocumentFileService.updateByPrimaryKeySelective(odFile);
                }
            }
            /*if( fileList !=null && !fileList.isEmpty()){
                List<OfficialdocumentFile> insertFileList = new ArrayList<OfficialdocumentFile>();
                for(OfficialdocumentFile odFile : fileList){

                    odFile.setOfficialdocumentid(odObj.getId()); // 公文主表的ID 关联
                    odFile.setDeliverid(deliverid); // 流转记录

                    odFile.setUserid(userid);
                    odFile.setOrgid(orgid);

                    odFile.setSourcefileflag(OfficialdocumentConstant.SOURCEFILEFLAG_NO); // 不是源文件，
                    odFile.setUploaddate(now);

                    insertFileList.add(odFile);
                }
                //  批量插入文件
                officialdocumentFileService.insertList (insertFileList) ;
            }*/

            // 提醒开关打开时； 调用发送提醒的接口 ，提醒通过可签发
            if ( RemindConstant.REMIND_ON.equals(remindflag)) {
                remindService.save_officialDocument_remind(remindtype, userid, odObj.getDraftuserid()
                        , flag, odObj.getTitle() );
            }

        }else if( OfficialDocumentStatusEnum.REJECT.getCode() == flag ){
            // 驳回
            // validate
            if(odid ==null || userid == null || orgid == null){
                System.out.println("参数不正确,或者未登陆");
                throw new Exception();
            }
            // 更新公文状态
            Officialdocument updateOdRecord2 = new Officialdocument();
            updateOdRecord2.setId( odid );
            updateOdRecord2.setStatus( OfficialDocumentStatusEnum.REJECT.getCode() );   // 驳回
            this.updateByPrimaryKeySelective(updateOdRecord2);

            // 流转记录
            deliver.setDeliverdate(now);
            deliver.setDeliverid(odObj.getDraftuserid());   // 回到发起人
            deliver.setDelivertype(OfficialdocumentConstant.DELIVERTYPE_USER);

            deliver.setChangeflag( OfficialdocumentConstant.CHANGEFLAG_ON );
            deliver.setChangestatus( OfficialDocumentStatusEnum.REJECT.getCode() );   //  驳回

            // 提醒开关打开时； 调用发送提醒的接口 提醒被驳回
            if ( RemindConstant.REMIND_ON.equals(remindflag)) {
                remindService.save_officialDocument_remind(remindtype, userid, odObj.getDraftuserid()
                        , flag, odObj.getTitle() );
            }
        }else{
            System.out.println("参数不正确");
            throw new Exception();
        }

        deliver.setOfficialdocumentid(odObj.getId());
        deliver.setUserid(userid);
        deliver.setOrgid(orgid);

        Integer deliverid = officialdocumentDeliverService.insertResultId(deliver);



        if(deliverid != null ){

            if (!StringUtils.isEmpty(postilContent)) {
                OfficialdocumentPostil postil = new OfficialdocumentPostil();

                postil.setOfficialdocumentid(odObj.getId());
                postil.setDeliverid(deliverid); // 流转记录

                postil.setUserid(userid);
                postil.setOrgid(orgid);
                postil.setDate(now);

                postil.setContent(postilContent);

                officialdocumentPostilService.insertSelective(postil);
            }
        }
    }



    @Override
    public void save_beissued(Integer odid, Integer userid, Integer orgid, List<Integer> useridList ,List<Integer> orgidList
            ,Integer remindflag,Integer remindtype ) throws Exception {
        this.addMonitor(odid,userid);// 写入跟踪监视记录   先要判断是否已经 有跟踪记录

        Officialdocument officialdocument = new Officialdocument();

        officialdocument.setId(odid);
        officialdocument.setStatus(OfficialDocumentStatusEnum.TOSIGNFORIT.getCode());
        this.updateByPrimaryKeySelective(officialdocument);
        // 更新公文信息

        if(useridList == null ) useridList = new ArrayList<Integer>();

        if(orgidList!=null && !orgidList.isEmpty()){
            AcOperatorVo vo = new AcOperatorVo();
            vo.setiDisplayLength(100);
            vo.setiDisplayStart(0);
            for(Integer oid : orgidList){
                vo.setOrgid(oid);
                List<AcOperator> userList = acOperatorService.selectByConditionPage(vo);
                if(userList !=null && !userList.isEmpty()){
//                boolean isadd = true;
                    for(AcOperator obj : userList){
                        if(!inspectionExist(obj.getId() , useridList)){
                            useridList.add(obj.getId());
                        }
                    }
                }
            }
        }

        List<OfficialdocumentDeliver> deliverList = new ArrayList<OfficialdocumentDeliver>();

        for(Integer deliverUserid : useridList){
            OfficialdocumentDeliver odDeliver = new OfficialdocumentDeliver();
            odDeliver.setOfficialdocumentid(odid);
            odDeliver.setUserid(userid);
            odDeliver.setOrgid(orgid);
            odDeliver.setDeliverdate(new Date());

            odDeliver.setDeliverid(deliverUserid);
            odDeliver.setDelivertype(OfficialdocumentConstant.DELIVERTYPE_USER);
            odDeliver.setChangeflag(OfficialdocumentConstant.CHANGEFLAG_ON);
            odDeliver.setChangestatus(OfficialDocumentStatusEnum.TOSIGNFORIT.getCode());   // 提交到待签收

            deliverList.add(odDeliver);

        }

        officialdocumentDeliverService.insertList(deliverList);   // 记录流转信息

        // 提醒开关打开时； 调用发送提醒的接口，提醒需签收
        if ( RemindConstant.REMIND_ON.equals(remindflag)){
            Officialdocument od = this.selectByPrimaryKey(odid);
            List<Remind> remindList = new ArrayList();
            for(OfficialdocumentDeliver deliver : deliverList){
                Remind remind = remindService.get_officialDocument_remind(remindtype, userid, deliver.getDeliverid()
                        , OfficialDocumentStatusEnum.TOSIGNFORIT.getCode(), od.getTitle());
                if(remind !=null){
                    remindList.add(remind);
                }
            }
            remindService.save_officialDocument_remind(remindList);
        }
    }

    @Override
    public void save_sign(Integer odid, Integer userid, Integer orgid  ,Integer remindflag,Integer remindtype) throws Exception {
        this.addMonitor( odid ,userid );// 写入跟踪监视记录   先要判断是否已经 有跟踪记录

        OfficialdocumentDeliver odDeliver = new OfficialdocumentDeliver();
        odDeliver.setOfficialdocumentid(odid);
        odDeliver.setUserid(userid);
        odDeliver.setOrgid(orgid);
        odDeliver.setDeliverdate(new Date());
        odDeliver.setDeliverid(userid);
        odDeliver.setDelivertype(OfficialdocumentConstant.DELIVERTYPE_USER);

        Officialdocument od = this.selectByPrimaryKey(odid);

        if(od.getStatus().equals(OfficialDocumentStatusEnum.TOBEISSUED.getCode())){  // 还是待签发状态：表示 是审批通过由 发起人直接签收
            odDeliver.setChangeflag(OfficialdocumentConstant.CHANGEFLAG_ON);
            odDeliver.setChangestatus(OfficialDocumentStatusEnum.ATAO.getCode());

            // 更新 公文状态
            Officialdocument updateOd = new Officialdocument();
            updateOd.setId(od.getId());
            updateOd.setStatus(OfficialDocumentStatusEnum.ATAO.getCode());
            this.updateByPrimaryKeySelective(updateOd);

        }else if(od.getStatus().equals(OfficialDocumentStatusEnum.TOSIGNFORIT.getCode())){
            // 待签收状态:表示已经有签发动作，需要判断  是否全部签收
            odDeliver.setChangeflag(OfficialdocumentConstant.CHANGEFLAG_OFF);    // 并没有改变 公文状态，
            odDeliver.setChangestatus(OfficialDocumentStatusEnum.ATAO.getCode());   // 提交 已签收

            OfficialdocumentDeliver deliverSeleObj = new OfficialdocumentDeliver();
            deliverSeleObj.setiDisplayLength(100);
            deliverSeleObj.setiDisplayStart(0);
            deliverSeleObj.setOfficialdocumentid(odid);
            deliverSeleObj.setChangestatus( OfficialDocumentStatusEnum.TOSIGNFORIT.getCode() );
            List<OfficialdocumentDeliver> signforitList = officialdocumentDeliverService.selectPage(deliverSeleObj);
            deliverSeleObj.setChangestatus( OfficialDocumentStatusEnum.ATAO.getCode() );
            List<OfficialdocumentDeliver> ataoList = officialdocumentDeliverService.selectPage(deliverSeleObj);
            Integer ataolist_size = ataoList==null||ataoList.isEmpty()?0:ataoList.size();
            if(signforitList!=null && (signforitList.size() - ataolist_size == 1)){
                odDeliver.setChangeflag(OfficialdocumentConstant.CHANGEFLAG_ON);    // 改变 公文状态，

                // 更新 公文状态
                Officialdocument updateOd = new Officialdocument();
                updateOd.setId(od.getId());
                updateOd.setStatus(OfficialDocumentStatusEnum.ATAO.getCode());
                this.updateByPrimaryKeySelective(updateOd);

                // 无需提醒开关打开； 调用发送提醒的接口 ，提醒全部签收
                remindService.save_officialDocument_remind(RemindConstant.REMINDTYPE_ALL, userid, od.getDraftuserid()
                            , OfficialDocumentStatusEnum.ATAO.getCode(), od.getTitle() );
            }
        }
        officialdocumentDeliverService.insertSelective(odDeliver);
    }

    @Override
    public void save_sign_force(Integer odid ,Integer remindflag,Integer remindtype) throws Exception {
        Officialdocument od = this.selectByPrimaryKey(odid);

        // 更新 公文状态
        Officialdocument updateOd = new Officialdocument();
        updateOd.setId(od.getId());
        updateOd.setStatus(OfficialDocumentStatusEnum.ATAO.getCode());
        this.updateByPrimaryKeySelective(updateOd);

        // 流转操作记录
        OfficialdocumentDeliver odDeliver = new OfficialdocumentDeliver();
        odDeliver.setOfficialdocumentid(odid);
        odDeliver.setUserid(od.getDraftuserid());
        odDeliver.setOrgid(od.getDraftorgid());
        odDeliver.setDeliverdate(new Date());
        odDeliver.setDeliverid(od.getDraftuserid());
        odDeliver.setDelivertype(od.getDraftorgid());

        odDeliver.setChangeflag(OfficialdocumentConstant.CHANGEFLAG_ON);    // 改变 公文状态，
        odDeliver.setChangestatus(OfficialDocumentStatusEnum.ATAOFORCE.getCode());   // 记录强制签收的操作记录
        officialdocumentDeliverService.insertSelective(odDeliver);

        //  未签收用户 添加 跟踪记录
        OfficialdocumentDeliver deliverSeleObj = new OfficialdocumentDeliver();
        deliverSeleObj.setiDisplayLength(100);
        deliverSeleObj.setiDisplayStart(0);
        deliverSeleObj.setOfficialdocumentid(odid);
        deliverSeleObj.setChangestatus( OfficialDocumentStatusEnum.TOSIGNFORIT.getCode() );
        List<OfficialdocumentDeliver> signforitList = officialdocumentDeliverService.selectPage(deliverSeleObj);   // 签发流转记录列表
        for(OfficialdocumentDeliver deliver : signforitList){
            this.addMonitor( deliver.getOfficialdocumentid() ,deliver.getDeliverid() );// 写入跟踪监视记录   先要判断是否已经 有跟踪记录

            /*// 提醒开关打开时； 调用发送提醒的接口 ，提醒强制签收
            if( RemindConstant.REMIND_ON.equals(remindflag) ){
                remindService.save_officialDocument_remind(remindtype, od.getDraftuserid(), deliver.getDeliverid()
                        , OfficialDocumentStatusEnum.ATAOFORCE.getCode(), od.getTitle() );
            }*/
        }
    }

    @Override
    public void save_in_record(Integer odid ,Integer userid, Integer orgid , Integer type) throws Exception {
        if (odid == null || userid == null) {
            System.out.println("参数不全");
            throw new Exception();
        }

        if (orgid != null && orgid != 0 && type != null && type != 0) {
            OfficialdocumentRecord record = new OfficialdocumentRecord();
            record.setOfficialdocumentid(odid);
            record.setType(type);
            if (type.equals(OfficialdocumentConstant.DELIVERTYPE_USER)) {
                record.setUserid(userid);
            } else {
                record.setOrgid(orgid);
            }
            officialdocumentRecordService.insertSelective(record);

        }

        // 删除跟踪记录
        OfficialdocumentMonitor delObj = new OfficialdocumentMonitor();
        delObj.setUserid(userid);
        delObj.setOfficialdocumentid(odid);
        officialdocumentMonitorService.deleteSelective(delObj);
    }

    @Override
    public void save_resubmit(OfficialDocumentDto dto ,Integer remindflag,Integer remindtype) throws Exception {
        // validate
        if(dto.getOfficialDocumentId()==null || dto.getDeliverid() == null || dto.getDelivertype() ==null){
            System.out.println("参数不正确,或者未登陆");
            throw new Exception();
        }

        // 公文主要信息
        Officialdocument officialDocument = new Officialdocument();
//        officialDocument.setTitle( StringUtils.isEmpty(dto.getTitle())?"未命名":dto.getTitle() );
        officialDocument.setContent( dto.getContent() );
        officialDocument.setImportantlevel( dto.getImportantlevel() );
        officialDocument.setStatus( OfficialDocumentStatusEnum.PENDINGAPPROVAL.getCode() );  // 状态变为 等待审批
        officialDocument.setTimelinessflag( dto.getTimelinessflag() );
        if(!StringUtils.isEmpty(dto.getLastdateStr())){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            officialDocument.setLastdate( df.parse(dto.getLastdateStr()) );
        }

        officialDocument.setDraftuserid( dto.getUserid() );
        officialDocument.setDraftorgid( dto.getOrgid() );

        Integer id = dto.getOfficialDocumentId();
        // update
        officialDocument.setId(id);
        this.updateByPrimaryKeySelective(officialDocument);

        // 删除 附件
        if(dto.getFileIdList() !=null && !dto.getFileIdList().isEmpty()){
            officialdocumentFileService.deleteList( dto.getFileIdList() );
        }

        // 附件
        if(dto.getOfficialdocumentFileList()!=null && !dto.getOfficialdocumentFileList().isEmpty()){
            List<OfficialdocumentFile> insertFileList = new ArrayList<OfficialdocumentFile>();
            for(OfficialdocumentFile odFile : dto.getOfficialdocumentFileList()){
                if(StringUtils.isEmpty(odFile.getFilename()) || StringUtils.isEmpty(odFile.getFilepath())) continue;

                odFile.setOfficialdocumentid(id); // 公文主表的ID 关联
                odFile.setUserid( dto.getUserid() );
                odFile.setOrgid( dto.getOrgid() );

                odFile.setSourcefileflag(OfficialdocumentConstant.SOURCEFILEFLAG_YES); // 是源文件，
                odFile.setUploaddate( new Date() );

                if(!StringUtils.isEmpty(odFile.getFilepath())){
//                        odFile.getFilepath().length()
                    String houzui = odFile.getFilepath().substring( odFile.getFilepath().lastIndexOf('.')+1 );
                    odFile.setSuffix( houzui );
                }

                insertFileList.add(odFile);
            }
            //  批量插入文件
            officialdocumentFileService.insertList (insertFileList) ;
        }

        // 重新提交 流转记录
        Officialdocument officialDocumentUpdateed = this.selectByPrimaryKey(id);
        OfficialdocumentDeliver deliver = new OfficialdocumentDeliver();

        deliver.setDeliverid( dto.getDeliverid() );
        deliver.setDelivertype(dto.getDelivertype());
        deliver.setDeliverdate( new Date() );

        deliver.setChangeflag( OfficialdocumentConstant.CHANGEFLAG_ON );
        deliver.setChangestatus( OfficialDocumentStatusEnum.RESUBMIT.getCode() );

        deliver.setOfficialdocumentid(id);
        deliver.setUserid( officialDocumentUpdateed.getDraftuserid() );
        deliver.setOrgid( officialDocumentUpdateed.getDraftorgid() );

        //  插入流转记录
        officialdocumentDeliverService.insertSelective(deliver);

        // 提交给一个人时； 提醒开关打开时； 调用发送提醒的接口 ，提醒重新提交
        Officialdocument od = this.selectByPrimaryKey(id);
        if( deliver.getDelivertype().equals(OfficialdocumentConstant.DELIVERTYPE_USER) &&
                RemindConstant.REMIND_ON.equals(remindflag) ){
            remindService.save_officialDocument_remind(remindtype, od.getDraftuserid(), deliver.getDeliverid()
                    , OfficialDocumentStatusEnum.RESUBMIT.getCode(), od.getTitle() );
        }
    }

    /**
     * in this service fn
     * 检查一个ID 是否在一个集合中
     * @param cur 当前id
     * @param list id 集合
     */
    private boolean inspectionExist (Integer cur , List<Integer> list){
        for(Integer item : list){
            if(cur.equals(item)) return true;
        }
        return false;
    }

    /**
     * in this service fn
     * 写入跟踪监视记录   先要判断是否已经 有跟踪记录
     * @param odid 公文id
     * @param userid 用户id
     */
    private void addMonitor (Integer odid , Integer userid) {
        OfficialdocumentMonitor monitor = new OfficialdocumentMonitor();
        monitor.setOfficialdocumentid( odid );
        monitor.setUserid(userid);
        monitor.setiDisplayLength(10);
        monitor.setiDisplayStart(0);
        List<OfficialdocumentMonitor> monitorList = officialdocumentMonitorService.selectPage(monitor);
        if(monitorList==null || monitorList.isEmpty() ){
            officialdocumentMonitorService.insertSelective(monitor);
        }
    }
}

