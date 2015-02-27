package net.sjin.smvc.service.dataCollect.impl;

import net.sjin.smvc.api.data.DataCollectInfo;
import net.sjin.smvc.api.data.DataCollectInfoDetail;
import net.sjin.smvc.api.data.DataInfoUser;
import net.sjin.smvc.api.data.TempInfoDetail;
import net.sjin.smvc.api.data.vo.PersonView;
import net.sjin.smvc.api.data.vo.TempInfoVo;
import net.sjin.smvc.api.data.vo.TreeData;
import net.sjin.smvc.api.oa.Message;
import net.sjin.smvc.api.oa.Remind;
import net.sjin.smvc.api.sms.Sms;
import net.sjin.smvc.api.sys.AcOperator;
import net.sjin.smvc.api.sys.vo.AcOperOrgRelationVo;
import net.sjin.smvc.api.sys.vo.AcOperatorVo;
import net.sjin.smvc.service.dataCollect.DataCollectService;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.oa.MessageService;
import net.sjin.smvc.service.sms.SendService;
import net.sjin.smvc.service.sys.AcOperatorService;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-13
 * Time: 下午2:34
 * To change this template use File | Settings | File Templates.
 */
@Service("dataCollectService")
public class DataCollectServiceImpl extends BaseServiceImpl<TempInfoVo> implements DataCollectService {

    @Autowired
    private SendService sendService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private AcOperatorService acOperatorService;

    @Override
    public String getNamespace() {
        return "TempInfo";
    }

    @Override
    public List<TempInfoVo> selectList(TempInfoVo vo) {
        return (List<TempInfoVo>) sqlSessionTemplate.selectList(getNamespace() + ".select_page", vo);
    }

    @Override
    public List<TreeData> getTreeByPid(TreeData vo) {
        return (List<TreeData>) sqlSessionTemplate.selectList(getNamespace() + ".selectZtree", vo);
    }

    @Override
    public List<TreeData> selectZtreeOrgs(TreeData vo) throws Exception {
        return (List<TreeData>) sqlSessionTemplate.selectList(getNamespace() + ".selectZtreeOrgs", vo);
    }

    @Override
    public List<TreeData> selectZtreeOnlySchools(TreeData vo) throws Exception {
        return (List<TreeData>) sqlSessionTemplate.selectList(getNamespace() + ".selectZtreeSchools", vo);
    }

    @Override
    public int userRole(HttpSession session) throws Exception {
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        int flagId=0;
        //获取用户的blongorgid
        List<AcOperOrgRelationVo> belongs=( List<AcOperOrgRelationVo>)sqlSessionTemplate.selectList(getNamespace() + ".selectBelongsByUserId", acOperator.getId());
        for(AcOperOrgRelationVo bolong:belongs){
            if(bolong.getBelongorgid()==0){
                flagId=bolong.getBelongorgid();
                break;
            }else{
                int flag=(Integer)sqlSessionTemplate.selectOne(getNamespace() + ".rootNode", bolong.getBelongorgid());
                if(flag>0){
                    flagId=bolong.getBelongorgid();
                    break;
                }
            }
        }
        return flagId;
    }

    @Override
    public int addOrUpdate(TempInfoVo vo) {
        int i = 0;
        //主表的数据插入并返回id
        if (vo.getId() == null || vo.getId() < 0) {
            i = this.add(vo);

            //删除之前定义好的内容
            //sqlSessionTemplate.delete(getNamespace() + ".deleteInfoDetailByPId",vo.getId());

            //把定义的内容插入到t_data_temp_info_detail内容表
            if(i>0&&vo.getDetails().length>0){
                this.insertInfoDetail(vo.getId(),vo.getDetails());
            }
        }else{
            //更新主表说明
            i=sqlSessionTemplate.update(getNamespace() + ".updateTempInfo",vo);
        }

        if(i>0){
            //删除之前分配好的用户
            sqlSessionTemplate.delete(getNamespace() + ".deleteInfoUserByPId",vo.getId());

            if(vo.getReceives()!=null&&!vo.getReceives().isEmpty()){
                this.insertInfoUser(vo.getId(),vo.getReceives());
            }
        }
        return i;
    }

    @Override
    public int add(TempInfoVo vo) {
        if (vo != null){
            vo.setCreatedate(new Date());
        }

        if(vo.getOrgid()==null){
            vo.setOrgid(-1);
        }
        sqlSessionTemplate.insert(getNamespace() + ".insertSelective", vo);
        return vo.getId();
    }

    @Override
    public int insertInfoDetail(Integer tempInfoId,String[] details){
            for(String str:details){
                TempInfoDetail tie=new TempInfoDetail();
                tie.setTempinfoid(tempInfoId);
                tie.setDetail(str);
                sqlSessionTemplate.insert(getNamespace() + ".insertTempDetal", tie);
            }
        return 1;
    }
    @Override
    public int insertInfoUser(Integer tempInfoId, List<DataInfoUser> list){
        for(DataInfoUser diu:list){
            diu.setTempinfoid(tempInfoId);
            sqlSessionTemplate.insert(getNamespace() + ".insertInfouser", diu);
        }
        return 1;
    }

    @Override
    public int deleteById(Integer id) {
        //先删除从表相关信息
        //删除人员
        sqlSessionTemplate.delete(getNamespace() + ".deleteInfoUserByPId",id);
        //删除内容
        sqlSessionTemplate.delete(getNamespace() + ".deleteInfoDetailByPId",id);

        return sqlSessionTemplate.delete(getNamespace() + ".deleteByPrimaryKey",id);
    }

    @Override
    public int deletes(List<Integer> ids) throws Exception {
        int a=0;
        for(Integer id:ids){
            this.deleteById(id);
        }
        return a;
    }

    @Override
    public List<PersonView> getPersonList(PersonView vo) {
        return (List<PersonView>) sqlSessionTemplate.selectList(getNamespace() + ".person_page", vo);
    }

    @Override
    public TempInfoVo selectById(Integer tempId) throws Exception {
        return (TempInfoVo)sqlSessionTemplate.selectOne(getNamespace() + ".selectById",tempId);
    }

    @Override
    public int submitData(DataCollectInfo vo) throws Exception {
        int i=0;
        //Integer flagId=vo.getId();
        vo.setCreatedate(new Date());
        //更新
        if(vo.getId()!=null&&vo.getId()>0){
            i=sqlSessionTemplate.update(getNamespace() + ".updateDataInfo",vo);
            //删除从表的记录
            sqlSessionTemplate.insert(getNamespace() + ".deleteDataByPid",vo.getId());

            if(i>0){
                for(DataCollectInfoDetail dcid:vo.getDataCollectInfoDetailList()){
                    dcid.setInfoid(vo.getId());
                    sqlSessionTemplate.insert(getNamespace() + ".insertDataInfoDetail",dcid);
                }
            }

        }else{//vo.getId()为空 新增
            //step1:先判断提交的数据是否是空格
            if(vo.getDataCollectInfoDetailList()!=null&&!vo.getDataCollectInfoDetailList().isEmpty()){
                boolean flag=false;
                //判断提交数据是否为空
                for(DataCollectInfoDetail dcid:vo.getDataCollectInfoDetailList()){
                    if(dcid.getDetail()!=null&&dcid.getDetail().trim().length()>0){
                        flag=true;
                        break;
                    }
                }
                if(flag){
                    i=sqlSessionTemplate.insert(getNamespace() + ".insertDataInfo",vo);

                    if(i>0){
                        for(DataCollectInfoDetail dcid:vo.getDataCollectInfoDetailList()){
                            if(dcid.getDetail()!=null&&dcid.getDetail().trim().length()>0){
                                dcid.setInfoid(vo.getId());
                                sqlSessionTemplate.insert(getNamespace() + ".insertDataInfoDetail",dcid);
                            }
                        }
                    }
                }
            }

        }
        return i;
    }

    @Override
    public List<DataCollectInfoDetail> getDataByTempId(DataCollectInfo vo) throws Exception {
        return (List<DataCollectInfoDetail>)sqlSessionTemplate.selectList(getNamespace() + ".getDataByTempId",vo);
    }

    @Override
    public List<DataInfoUser> getInfoUser(Integer tempId) throws Exception {
        return (List<DataInfoUser>)sqlSessionTemplate.selectList(getNamespace() + ".selectInfoUserByPid",tempId);
    }

    @Override
    public List<AcOperator> getsubDataUsers(Integer tempId) throws Exception {
        return (List<AcOperator>)sqlSessionTemplate.selectList(getNamespace() + ".getsubDataUsers",tempId);
    }

    @Override
    public List<AcOperatorVo> undoneUsers(Integer tempId) throws Exception {
        return (List<AcOperatorVo>)sqlSessionTemplate.selectList(getNamespace() + ".undoneUsers",tempId);
    }

    @Override
    public void export(Integer tempInfoId,HttpServletResponse response) throws Exception {
        HSSFWorkbook wb = new HSSFWorkbook();
        TempInfoVo tv=(TempInfoVo)sqlSessionTemplate.selectOne(getNamespace() + ".selectById",tempInfoId);

        HSSFSheet sheet = wb.createSheet(tv.getTitle());

        //列数
        int cells=tv.getTempInfoDetails().size();
        //第一行 表头
        HSSFRow  headRow = sheet.createRow(0);//表头
        HSSFCell headCell=headRow.createCell(0);
        headCell.setCellValue(tv.getTitle());
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, cells));
        //样式设置
        HSSFFont titleFont = wb.createFont();
        titleFont.setFontHeightInPoints((short) 18);
        titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        HSSFCellStyle titleStyle = wb.createCellStyle();
        // 水平,垂直居中
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        titleStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        titleStyle.setFont(titleFont);
        headRow.setHeight((short) 1000);
        headCell.setCellStyle(titleStyle);


        //第二行  定义的标准
        HSSFRow  nameRow = sheet.createRow(1);

        HSSFCellStyle centerStyle = wb.createCellStyle();
        // 水平,垂直居中
        centerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        centerStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

        HSSFCell nameCell = nameRow.createCell(0);

        nameCell.setCellStyle(centerStyle);
        nameCell.setCellValue("姓名");
        for (int i = 0; i < cells; i++) {
            HSSFCell cell = nameRow.createCell(i+1);
            cell.setCellValue(tv.getTempInfoDetails().get(i).getDetail());
            cell.setCellStyle(centerStyle);
        }
        //excel的表头已经完成

        /**
         * 取出指定用户提交的数据
         */
        //取出所有已经提交数据的用户
        List<AcOperator> acOperatorList=this.getsubDataUsers(tempInfoId);
        if(acOperatorList!=null&&!acOperatorList.isEmpty()&&acOperatorList.size()>0){
            int a=2;
            for(AcOperator ao:acOperatorList){
                HSSFRow  row = sheet.createRow(a);
                HSSFCell userCell = row.createCell(0);
                userCell.setCellStyle(centerStyle);
                userCell.setCellValue(ao.getUsername());

                DataCollectInfo dci=new DataCollectInfo();
                dci.setUserid(ao.getId());
                dci.setTempinfoid(tempInfoId);
                List<DataCollectInfoDetail> dcid=this.getDataByTempId(dci);
                if(dcid!=null&&!dcid.isEmpty()&&dcid.size()>0){
                    for(int cel=0;cel<dcid.size();cel++){
                        HSSFCell cell=row.createCell(cel+1);
                        cell.setCellValue(dcid.get(cel).getDetail());
                        cell.setCellStyle(centerStyle);
                    }
                }
                a++;
            }
        }
        //说明
        if(tv.getRemark()!=null&&!tv.getRemark().trim().equals("")){
            int lastRow=sheet.getLastRowNum()+2;
            HSSFRow remarkRow=sheet.createRow(lastRow);
            HSSFCell remarkCell = remarkRow.createCell(0);
            remarkCell.setCellValue("说明:"+tv.getRemark());
            sheet.addMergedRegion(new CellRangeAddress(lastRow, lastRow, 0, cells));
            remarkRow.setHeight((short) 300);
            //字体样式
            HSSFFont remarkFont = wb.createFont();
            remarkFont.setColor(Font.COLOR_RED);
            //样式设置
            HSSFCellStyle remarkStyle = wb.createCellStyle();
            remarkStyle.setFont(remarkFont);
            // 水平,垂直居中
            //remarkStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);  //填充单元格
            //remarkStyle.setFillForegroundColor(HSSFColor.RED.index);    //填红色
            remarkCell.setCellStyle(remarkStyle);
        }

        OutputStream out = response.getOutputStream();
        response.setContentType("application/x-msdownload");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String((tv.getTitle()).getBytes("gb2312"), "iso8859-1")
                + ".xls");

        out.flush();
        wb.write(out);
        out.flush();
        out.close();
    }


    @Override
    public int addRemind(Remind remind) throws Exception {

        if(remind.getRemindtype()==1){//手机短信
            this.sendByPnone(remind);
        }else if(remind.getRemindtype()==2){
            this.sendByMessage(remind);
        }else{
            this.sendByMessage(remind);
            this.sendByPnone(remind);
        }
        return 1;
    }


    //发送手机短信
    private int sendByPnone(Remind remind){
        List<Sms> smsList = new ArrayList<Sms>();
        Random random ;Date now ;
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        if(remind.getUserids()!=null&&remind.getUserids().length()>0){
            String[] userids=remind.getUserids().split(",");
            for(String userId:userids){
                remind.setRecipientuserid(Integer.parseInt(userId));
                remind.setStatus(1);
                sqlSessionTemplate.insert(getNamespace() + ".addRemind",remind);

                AcOperator acOperators=
                        (AcOperator)sqlSessionTemplate.selectOne(getNamespace() + ".getUserByorgIds",userId);
                if(acOperators!=null){
                    random = new Random();
                    now = new Date();
                    Sms sms= new Sms();
                    sms.setPhone(acOperators.getTelnumber());
                    sms.setSmsContent("尊敬的"+acOperators.getUsername()+":"+remind.getContent());
                    sms.setSmsId(df.format(now) + String.valueOf(random.nextInt(9999)));
                    smsList.add(sms);
                }
            }
        }
        return 1;
    }

    private int sendByMessage(Remind remind){
        int i=0;
        if(null!=remind.getUserids()&&remind.getUserids().length()>0){
            String[] userIds=remind.getUserids().split(",");

            for(int a=0;a<userIds.length;a++){
                Message message=new Message();
                message.setRecipient(Integer.parseInt(userIds[a]));
                message.setAddresser(remind.getOperatoruserid());
                message.setDate(new Date());
                message.setReadflag(0);
                message.setContent(remind.getContent());

                AcOperator acOperator=acOperatorService.selectByPrimaryKey(Integer.parseInt(userIds[a]));

                message.setName(acOperator.getUsername());
                acOperator.setImgurl(acOperator.getImgurl());
                i=messageService.saveMessage(message);
            }

        }
        return i;
    }
}
