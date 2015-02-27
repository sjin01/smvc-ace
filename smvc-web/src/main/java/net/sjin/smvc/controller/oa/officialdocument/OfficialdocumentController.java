package net.sjin.smvc.controller.oa.officialdocument;

import net.sjin.smvc.constant.OfficialdocumentConstant;
import net.sjin.smvc.enumeration.OfficialDocumentStatusEnum;
import net.sjin.common.util.json.JsonConfigUtil;
import net.sjin.smvc.api.oa.*;
import net.sjin.smvc.api.sys.AcOperator;
import net.sjin.smvc.api.sys.AcOrg;
import net.sjin.smvc.controller.BaseController;
import net.sjin.smvc.dto.OfficialDocumentDto;
import net.sjin.smvc.service.oa.*;
import net.sjin.smvc.service.sys.AcOperatorService;
import net.sjin.smvc.service.sys.AcOrgService;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:   OA 系统 公文流转 控制器
 * 创建日期: 12/10  12:03
 *
 * @author: guanshj QQ: 928990049
 */
@Controller
@RequestMapping("oa/officialdocument")
public class OfficialdocumentController extends BaseController{

    @Autowired
    private OfficialdocumentService officialdocumentService;

    @Autowired
    private OfficialdocumentMonitorService officialdocumentMonitorService;

    @Autowired
    private OfficialdocumentRecordService officialdocumentRecordService;

    @Autowired
    private OfficialdocumentDeliverService officialdocumentDeliverService;

    @Autowired
    private OfficialdocumentFileService officialdocumentFileService;

    @Autowired
    private AcOrgService orgService;

    @Autowired
    private AcOperatorService operatorService;

    @RequestMapping(value = "")
    public ModelAndView main ( Integer flag ,Integer deliverid,Integer delivertype, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("oa/officialdocument/main");
        mv.addObject("flag" , (flag==null || flag.equals(0)) ? 1 :flag );

        //  获取userid 和 机构 列表
        AcOperator login_user = (AcOperator) request.getSession().getAttribute("loginUser");
        List<AcOrg> login_orgList = orgService.selectByUserid(login_user.getId());

        mv.addObject("login_user" ,login_user );
        mv.addObject("login_orgList" ,login_orgList );

        mv.addObject("deliverid" , deliverid == null ? login_user.getId() : deliverid );
        mv.addObject("delivertype" ,delivertype == null ? 1 : delivertype );

        return mv;
    }

    @RequestMapping(value = "monitor")
    public ModelAndView main_monitor ( HttpServletRequest request) throws Exception {
        return this.main(2,null,null,request);
    }
    @RequestMapping(value = "draft")
    public ModelAndView main_draft ( HttpServletRequest request) throws Exception {
        return this.main(3,null,null,request);
    }
    @RequestMapping(value = "record")
    public ModelAndView main_record (Integer deliverid,Integer delivertype, HttpServletRequest request) throws Exception {
        return this.main(4,deliverid,delivertype,request);
    }

    /**
     * html : 公文起草页面
     * @return
     */
    @RequestMapping(value = "release")
    public ModelAndView addhtml (Integer odid , HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("oa/officialdocument/add");

        AcOperator login_user = (AcOperator) request.getSession().getAttribute("loginUser");
        List<AcOrg> login_orgList = orgService.selectByUserid(login_user.getId());

        mv.addObject("login_user" ,login_user);
        mv.addObject("login_orgList" ,login_orgList);
        mv.addObject("login_orgList_size" ,( login_orgList == null || login_orgList.isEmpty() ) ? 0 : login_orgList.size());

        Officialdocument od= null;
        if(odid !=null ){
            od = officialdocumentService.selectByPrimaryKey(odid);
            if(od!=null && od.getLastdate() !=null ){
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                od.setLastdateStr( df.format( od.getLastdate() ));
            }

            // set userid and orgid
            if(OfficialdocumentConstant.DELIVERTYPE_ORG.equals(od.getDelivertype()) ){
                AcOrg org = orgService.selectByPrimaryKey(od.getDeliverid());
                mv.addObject("org", org );
            }else if(OfficialdocumentConstant.DELIVERTYPE_USER.equals(od.getDelivertype())){
                AcOperator user = operatorService.selectByPrimaryKey(od.getDeliverid());
                List<AcOrg> orgList = orgService.selectByUserid( user.getId() );
                mv.addObject("user" , user);
                mv.addObject("orgList" , orgList);
            }

            OfficialdocumentFile ofile = new OfficialdocumentFile();
            ofile.setOfficialdocumentid(odid);
            ofile.setSourcefileflag(OfficialdocumentConstant.FILE_SOURCE_FLAG_YES);
            ofile.setiDisplayLength(100);
            ofile.setiDisplayStart(0);
            List<OfficialdocumentFile> officialdocumentFileList = officialdocumentFileService.selectPage(ofile);
            mv.addObject("officialdocumentFileList" , officialdocumentFileList);
        }
        mv.addObject("officialdocument" , od);
        return mv;
    }

    /**
     * html : 处理公文页面
     * @return
     */
    @RequestMapping(value = "approve")
    public ModelAndView approveHtml (Integer odid ,Integer loadForm4Flag, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("oa/officialdocument/approve");

        Officialdocument od= officialdocumentService.selectByPrimaryKey(odid);

        if(od != null ){

            List<OfficialdocumentDeliver> deliverList = officialdocumentDeliverService.selectDeliverByOdId(od.getId());  // 流转记录
            mv.addObject("deliverList" , JSONArray.fromObject(deliverList, JsonConfigUtil.getJsonDateConfig("yyyy-MM-dd HH:mm:ss")));

            if( od != null && od.getLastdate() !=null ){
                SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
                od.setLastdateStr( df1.format( od.getLastdate() ));
            }
            if( od != null && od.getCommitdate() !=null){
                SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                od.setCommitdateStr( df2.format( od.getCommitdate() ));
            }

            // set userid and orgid 初次提交目标
            if(OfficialdocumentConstant.DELIVERTYPE_ORG.equals(od.getDelivertype())){
                AcOrg org = orgService.selectByPrimaryKey(od.getDeliverid());
                mv.addObject("org", org );
            }else if(OfficialdocumentConstant.DELIVERTYPE_USER.equals(od.getDelivertype())){
                AcOperator user = operatorService.selectByPrimaryKey(od.getDeliverid());
                List<AcOrg> orgList = orgService.selectByUserid( user.getId() );
                mv.addObject("user" , user);
                mv.addObject("orgList" , orgList);
            }

            // 公文附带文件
            OfficialdocumentFile ofile = new OfficialdocumentFile();
            ofile.setOfficialdocumentid(odid);
            ofile.setSourcefileflag(OfficialdocumentConstant.FILE_SOURCE_FLAG_YES);
            ofile.setiDisplayLength(100);
            ofile.setiDisplayStart(0);
            List<OfficialdocumentFile> officialdocumentFileList = officialdocumentFileService.selectPage(ofile);
            mv.addObject("officialdocumentFileList" , officialdocumentFileList);

            AcOperator login_user = (AcOperator) request.getSession().getAttribute("loginUser");
            List<AcOrg> login_orgList = orgService.selectByUserid(login_user.getId());

            // 是否加载 操作的表单
            Integer loadFormFlag = 0;
            if(od.getStatus().equals(OfficialDocumentStatusEnum.TOSIGNFORIT.getCode())){

                for (OfficialdocumentDeliver deliverItem : deliverList)
                    if (
                            deliverItem.getChangestatus().equals(OfficialDocumentStatusEnum.TOSIGNFORIT.getCode())
                                    && deliverItem.getDeliverid().equals(login_user.getId())) {
                        loadFormFlag = 1;  //  在签收列表里
                    }
                for (OfficialdocumentDeliver deliverItem : deliverList)
                    if (
                            deliverItem.getChangestatus().equals(OfficialDocumentStatusEnum.ATAO.getCode())
                                    && deliverItem.getUserid().equals(login_user.getId())) {

                        loadFormFlag = 0;  //   已经签收
                    }

            }else if( od.getStatus().equals(OfficialDocumentStatusEnum.ATAO.getCode()) ){
                if(loadForm4Flag == null || loadForm4Flag!=2){
                    mv.addObject("loadForm4Flag",1);
                }
            }else if(od.getStatus().equals(OfficialDocumentStatusEnum.PENDINGAPPROVAL.getCode())
                    || od.getStatus().equals(OfficialDocumentStatusEnum.TOBEISSUED.getCode())
                    || od.getStatus().equals(OfficialDocumentStatusEnum.REJECT.getCode()) ){

                if(od.getDelivertype().equals(OfficialdocumentConstant.DELIVERTYPE_USER)){
                    if(login_user.getId().equals(od.getDeliverid())){
                        loadFormFlag = 1;
                    }
                }else if(od.getDelivertype().equals(OfficialdocumentConstant.DELIVERTYPE_ORG)){
                    for(AcOrg orgitem : login_orgList) {
                        if(orgitem.getId().equals(od.getDeliverid())){
                            loadFormFlag = 1;
                            break;
                        }
                    }
                }
            }else if( od.getStatus().equals(OfficialDocumentStatusEnum.DRAFT.getCode()) ){

            }
            mv.addObject("loadFormFlag" ,loadFormFlag);
            if(loadFormFlag.equals(0)
                    && od.getDraftuserid().equals(login_user.getId())
                    && od.getStatus().equals(OfficialDocumentStatusEnum.TOSIGNFORIT.getCode()) ) mv.addObject("loadForm7Flag",1);

        }

        mv.addObject("officialdocument" , od);

        return mv;
    }

    /**
     * html load : 加载处理公文页面的表单
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "loadapprovefrom")
    public ModelAndView loadApproveFrom (Integer type, Integer officialDocumentId ,HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        switch (type) {
            case 1:
                mv.setViewName("oa/officialdocument/forms/form1");

                OfficialdocumentFile ofile = new OfficialdocumentFile();
                ofile.setOfficialdocumentid(officialDocumentId);
                ofile.setSourcefileflag(OfficialdocumentConstant.FILE_SOURCE_FLAG_YES);
                ofile.setiDisplayLength(100);
                ofile.setiDisplayStart(0);
                List<OfficialdocumentFile> officialdocumentFileList = officialdocumentFileService.selectPage(ofile);
                mv.addObject("officialdocumentFileList" , officialdocumentFileList);
                mv.addObject("officialdocumentFileList_size" ,officialdocumentFileList == null ? 0:officialdocumentFileList.size());

                break;
            case 2:
                mv.setViewName("oa/officialdocument/forms/form2");
                break;
            case 3:
                mv.setViewName("oa/officialdocument/forms/form3");
                break;
            case 4:
                mv.setViewName("oa/officialdocument/forms/form4");
                break;
            case 5:
                mv.setViewName("oa/officialdocument/forms/form5");
                break;
            case 7:
                mv.setViewName("oa/officialdocument/forms/form7");
                break;
        }
        mv.addObject("officialDocumentId" ,officialDocumentId);

        AcOperator login_user = (AcOperator) request.getSession().getAttribute("loginUser");
        List<AcOrg> login_orgList = orgService.selectByUserid(login_user.getId());

        mv.addObject("login_user" ,login_user);
        mv.addObject("login_orgList" ,login_orgList);
        mv.addObject("login_orgList_size" ,( login_orgList == null || login_orgList.isEmpty() ) ? 0 : login_orgList.size());

        return mv;
    }

    /**
     * ajax : 保存草稿
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "savedraft")
    public Object saveDraft (OfficialDocumentDto dto ,HttpServletRequest request) throws Exception{

        Integer odid = officialdocumentService.save(dto, OfficialDocumentStatusEnum.DRAFT.getCode());

        Map<String ,Object> resultMap = getSuccessfulResultMap();
        if(odid != null && !odid.equals(0)){
            resultMap.put("odid" , odid);
        }

        return resultMap;
    }
    /**
     * ajax : 保存 正式提交
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "savepublic")
    public Object savePublic (OfficialDocumentDto dto ,HttpServletRequest request) throws Exception{

        officialdocumentService.save(dto, OfficialDocumentStatusEnum.PENDINGAPPROVAL.getCode());

        Map<String ,Object> resultMap = getSuccessfulResultMap();
        return resultMap;
    }

    /**
     *  ajax : 保存 审批： 移交、通过和驳回
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "saveapprove")
    public Object saveApprove (OfficialDocumentDto dto ,HttpServletRequest request) throws Exception {
        officialdocumentService.save_examine( dto.getFlag(), dto.getOfficialDocumentId(), dto.getUserid()
                , dto.getOrgid(), dto.getPostilContent()
                , dto.getOfficialdocumentFileList(), dto.getDeliverid(), dto.getDelivertype() ,dto.getRemindflag(),dto.getRemindtype());

        Map<String, Object> resultMap = getSuccessfulResultMap();
        return resultMap;
    }

    /** ajax : 保存 签发**/
    @ResponseBody
    @RequestMapping(value = "savebeissued")
    public Object saveBeissued ( OfficialDocumentDto dto ,HttpServletRequest request) throws Exception{
        officialdocumentService.save_beissued(dto.getOfficialDocumentId() , dto.getUserid(), dto.getOrgid()
                ,dto.getUseridList() ,dto.getOrgidList() ,dto.getRemindflag(),dto.getRemindtype());
        return getSuccessfulResultMap();
    }
    /**  ajax : 保存 签收 **/
    @ResponseBody
    @RequestMapping(value = "savesign")
    public Object saveSign (Integer odid ,Integer userid, Integer orgid,Integer remindflag ,Integer remindtype, HttpServletRequest request) throws Exception {

        officialdocumentService.save_sign(odid,userid,orgid ,remindflag ,remindtype);
        return getSuccessfulResultMap();
    }
    /**  ajax : 保存 强制签收 **/
    @ResponseBody
    @RequestMapping(value = "savesignforce")
    public Object saveSignForce (Integer odid ,Integer remindflag ,Integer remindtype) throws Exception {
        officialdocumentService.save_sign_force(odid , remindflag , remindtype);
        return getSuccessfulResultMap();
    }

    /**  ajax : 保存 归档 **/
    @ResponseBody
    @RequestMapping(value = "saveinrecord")
    public Object saveInRecord(Integer odid ,Integer orgid ,HttpServletRequest request) throws Exception{
        AcOperator login_user = (AcOperator) request.getSession().getAttribute("loginUser");
        Integer type = 0;
        if(orgid == null ){
            // 不保存
        }else if (orgid.equals(-1)){
            // user
            type = OfficialdocumentConstant.DELIVERTYPE_USER;
        }else{
            // org
            type = OfficialdocumentConstant.DELIVERTYPE_ORG;
        }
        officialdocumentService.save_in_record(odid , login_user.getId() ,orgid ,type);
        return getSuccessfulResultMap();
    }

    /**
     * ajax:删除草稿
     * @param id
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "deletedraft")
    public Object deleteOfficialDocument (Integer id) throws Exception {
        officialdocumentService.deleteByPrimaryKey(id);
        Map<String ,Object> resultMap = getSuccessfulResultMap();
        return resultMap;
    }
    /**
     * ajax:批量删除草稿
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "deletedraftlist")
    public Object deleteOfficialDocumentList (@RequestBody List<Integer> ids) throws Exception {
        officialdocumentService.deleteByIdList(ids);
        Map<String ,Object> resultMap = getSuccessfulResultMap();
        return resultMap;
    }

    /**
     * html : 草稿箱
     * @return
     */
    @RequestMapping(value = "draftlist")
    public Object draftList () throws Exception{
        ModelAndView mv = new ModelAndView("oa/officialdocument/list_draft");
        return mv;
    }

    /**
     * html : 跟踪
     * @return
     */
    @RequestMapping(value = "monitorlist")
    public Object monitorList () throws Exception{
        ModelAndView mv = new ModelAndView("oa/officialdocument/list_monitor");
        return mv;
    }

    /**
     * html : 档案柜
     * @return
     */
    @RequestMapping(value = "recordlist")
    public Object recordList (Integer targetid, Integer type) throws Exception{
        ModelAndView mv = new ModelAndView("oa/officialdocument/list_record");

        mv.addObject("targetid" , targetid);
        mv.addObject("type" , type);

        if(type.equals(OfficialdocumentConstant.DELIVERTYPE_ORG)){
            AcOrg org = orgService.selectByPrimaryKey(targetid);
            mv.addObject("org" ,org);
        }

        return mv;
    }

    /**
     * html : 批阅
     * @return
     */
    @RequestMapping(value = "activitylist")
    public Object activityList (Integer deliverid, Integer delivertype) throws Exception{
        ModelAndView mv = new ModelAndView("oa/officialdocument/list_activity");

        mv.addObject("deliverid" , deliverid);
        mv.addObject("delivertype" , delivertype);

        if(delivertype.equals(OfficialdocumentConstant.DELIVERTYPE_ORG)){
            AcOrg org = orgService.selectByPrimaryKey(deliverid);
            mv.addObject("org" ,org);
        }

        return mv;
    }

    /**
     * ajax : 草稿箱data table 分页数据
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "draftlistdata")
    public Object draftData(Officialdocument od ,HttpServletRequest request) throws Exception {
        AcOperator user = (AcOperator) request.getSession().getAttribute("loginUser");
        od.setDraftuserid(user.getId()); // 需本人

        od.setStatus( OfficialDocumentStatusEnum.DRAFT.getCode() );   // 草稿状态

        List<Officialdocument> list = officialdocumentService.selectPage(od);
        return getSuccessResultMap4DataTable(JSONArray.fromObject(list
                , JsonConfigUtil.getJsonDateConfig("yyyy-MM-dd")), od);
    }


    /**
     * ajax : 跟踪 data table 分页数据
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "monitorlistdata")
    public Object monitorData (OfficialdocumentMonitor monitor ,HttpServletRequest request) throws Exception{
        AcOperator user = (AcOperator) request.getSession().getAttribute("loginUser");
        monitor.setUserid(user.getId());
        List<Officialdocument> list = officialdocumentMonitorService.selectOfficialdocumentByMonitor( monitor );
        return getSuccessResultMap4DataTable(JSONArray.fromObject(list
                , JsonConfigUtil.getJsonDateConfig("yyyy-MM-dd HH:mm:ss")), monitor);
    }

    /**
     * ajax : 档案柜 data table 分页数据
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "recordlistdata")
    public Object recordData (OfficialdocumentRecord record) throws Exception {

        List<Officialdocument> list = null;

        if(record !=null && record.getType() !=null){
            if( record.getType().equals(OfficialdocumentConstant.DELIVERTYPE_USER) ){
                record.setUserid( record.getTargetid() );
                list = officialdocumentRecordService.selectOfficialdocumentByRecordForUser(record);

            }else if( record.getType().equals(OfficialdocumentConstant.DELIVERTYPE_ORG) ){
                record.setOrgid( record.getTargetid() );
                list = officialdocumentRecordService.selectOfficialdocumentByRecordForOrg(record);

            }
        }
        return getSuccessResultMap4DataTable(JSONArray.fromObject(list
                , JsonConfigUtil.getJsonDateConfig("yyyy-MM-dd HH:mm:ss")), record);
    }

    /**
     * ajax : 批阅
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "approveuserlistdata")
    public Object approveUserListData (Officialdocument od) throws Exception {
        List<Officialdocument> list = null;
        if(od !=null && od.getDelivertype() !=null) {
            if(od.getDelivertype().equals(OfficialdocumentConstant.DELIVERTYPE_USER)){
                od.setUserid(od.getDeliverid());
                list = officialdocumentService.selectApproveForUser( od );

            }else if(od.getDelivertype().equals(OfficialdocumentConstant.DELIVERTYPE_ORG)){
                od.setOrgid(od.getDeliverid());
                list = officialdocumentService.selectApproveForOrg(od);
            }
        }
        return getSuccessResultMap4DataTable(JSONArray.fromObject(list
                , JsonConfigUtil.getJsonDateConfig("yyyy-MM-dd HH:mm:ss")), od);
    }

    /**
     * HTML : 公文文件预览
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "fileView")
    public ModelAndView fileViewHtml( Integer fileid) throws Exception{
        ModelAndView mv = new ModelAndView("oa/officialdocument/fileView");
//        fileid =18;
        OfficialdocumentFile file = officialdocumentFileService.selectByPrimaryKey(fileid);
        if (file != null) {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            file.setUploaddateStr( df.format(file.getUploaddate()));

            AcOperator user = operatorService.selectByPrimaryKey(file.getUserid());
            AcOrg org = orgService.selectByPrimaryKey(file.getOrgid());
            if (user != null) mv.addObject("username", user.getUsername());
            if (org != null) mv.addObject("orgname", org.getOrgname());
        }

        mv.addObject("file" ,file);
        return mv;
    }

    /**
     * HTML : 公文文件预览 (未保存)
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "fileView_unsaved")
    public ModelAndView fileViewHtml_unsaved(String filepath ,String filename,String filesize) throws Exception{
        ModelAndView mv = new ModelAndView("oa/officialdocument/fileView");
        mv.addObject("filepath",filepath);
        mv.addObject("filename",filename);
        mv.addObject("filesize",filesize);
        return mv;
    }
}
