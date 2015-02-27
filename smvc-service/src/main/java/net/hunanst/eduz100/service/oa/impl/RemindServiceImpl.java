package net.hunanst.eduz100.service.oa.impl;

import net.hunanst.common.api.constant.RemindConstant;
import net.hunanst.common.api.enumeration.OfficialDocumentStatusEnum;
import net.hunanst.eduz100.api.oa.Message;
import net.hunanst.eduz100.api.oa.Remind;
import net.hunanst.eduz100.api.sms.Sms;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.oa.MessageService;
import net.hunanst.eduz100.service.oa.RemindService;
import net.hunanst.eduz100.service.sms.SendService;
import net.hunanst.eduz100.service.sys.AcOperatorService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 1/19  10:51
 *
 * @author: guanshj QQ: 928990049
 */
@Service("remindService")
public class RemindServiceImpl extends BaseServiceImpl<Remind> implements RemindService {

    @Override
    public String getNamespace() {
        return "Remind";
    }

    @Autowired
    private AcOperatorService acOperatorService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private SendService sendService;

    @Override
    public void save_officialDocument_remind(Integer remindtype, Integer operatoruserid, Integer recipientuserid
            , Integer odStatus,String odName) throws Exception {
        // step1 判断参数
        if(remindtype == null || operatoruserid == null || recipientuserid==null || odStatus==null || StringUtils.isEmpty(odName)){
            System.out.println("参数不正确");
            throw new Exception();
        }

        // step2 根据公文状态 组装 提示文字信息
        AcOperator recipientuser = acOperatorService.selectByPrimaryKey(recipientuserid);
        StringBuilder sb = new StringBuilder("");
        sb.append("尊敬的");
        sb.append(recipientuser.getUsername());
        sb.append("用户：");

        if( odStatus.equals( OfficialDocumentStatusEnum.PENDINGAPPROVAL.getCode() )){
            // 需处理
            sb.append("有新的公文：");
            sb.append(odName);
            sb.append("，提交给您等待审批。");
        } else if ( odStatus.equals(OfficialDocumentStatusEnum.TOBEISSUED.getCode()) ){
            // 通过 审批 可以操作
            sb.append("您发起的公文：");
            sb.append(odName);
            sb.append("，已经通过审批。可以进行下一步操作啦！");
        } else if ( odStatus.equals(OfficialDocumentStatusEnum.TOSIGNFORIT.getCode()) ){
            // 有公文需要签收
            sb.append("有公文：");
            sb.append(odName);
            sb.append("，签发至您，需要您签收。");
        } else if ( odStatus.equals(OfficialDocumentStatusEnum.ATAO.getCode()) ){
            // 已签收 ，不发送
            sb.append("您签发的公文：");
            sb.append(odName);
            sb.append("，已经全部签收。");
        } else if ( odStatus.equals(OfficialDocumentStatusEnum.REJECT.getCode()) ){
            // 您的公文，被驳回
            sb.append("您的公文：");
            sb.append(odName);
            sb.append("，已被驳回，请登录系统查看。");
        } else if ( odStatus.equals(OfficialDocumentStatusEnum.RESUBMIT.getCode()) ){
            // 被驳回公文 已经过修改并重新提交， 等待您的处理
            sb.append("公文：");
            sb.append(odName);
            sb.append("，已经过修改，并重新提交，等待您审批。");
        } else if ( odStatus.equals(OfficialDocumentStatusEnum.ATAOFORCE.getCode()) ){
            // 需要您签收的公文，或因为您长时间没有响应，发起人已经强制签收
            sb.append("公文：");
            sb.append(odName);
            sb.append("，需要您签收，或因为您长时间没有响应，发起人已经强制签收。");
        }
        sb.append("【临澧县教育系统OA平台】");

        // step3 根据提醒类型，发送提醒信息
        if(remindtype.equals(RemindConstant.REMINDTYPE_ALL)){
            sendService.sendSms(sb.toString() , recipientuser.getTelnumber());

            Message message = new Message();
            message.setAddresser(operatoruserid);
            message.setRecipient(recipientuserid);
            message.setContent(sb.toString());
            message.setDate(new Date());
            message.setReadflag(0);
            messageService.insertSelective(message);   // send：Sys 短消息

        }else if(remindtype.equals(RemindConstant.REMINDTYPE_PHONE)){
            sendService.sendSms(sb.toString() , recipientuser.getTelnumber());
        }else if(remindtype.equals(RemindConstant.REMINDTYPE_SYS)){
            Message message = new Message();
            message.setAddresser(operatoruserid);
            message.setRecipient(recipientuserid);
            message.setContent(sb.toString());
            message.setDate(new Date());
            message.setReadflag(0);
            messageService.insertSelective(message);   // send：Sys 短消息
        }

        // step4 保存 提醒记录
        Remind record = new Remind();
        record.setRemindtype(remindtype);
        record.setOperatoruserid(operatoruserid);
        record.setRecipientuserid(recipientuserid);
        record.setContent(sb.toString());
        record.setStatus(RemindConstant.STATUS_SUCCEED);
        record.setType(RemindConstant.TYPE_OD);
        record.setSenddate(new Date());

        this.insertSelective(record);
    }

    @Override
    public Remind get_officialDocument_remind(Integer remindtype, Integer operatoruserid, Integer recipientuserid, Integer odStatus, String odName) throws Exception {
        // step1 判断参数
        if(remindtype == null || operatoruserid == null || recipientuserid==null || odStatus==null || StringUtils.isEmpty(odName)){
            return null;
        }

        // step2 根据公文状态 组装 提示文字信息
        AcOperator recipientuser = acOperatorService.selectByPrimaryKey(recipientuserid);
        StringBuilder sb = new StringBuilder("");
        sb.append("尊敬的");
        sb.append(recipientuser.getUsername());
        sb.append("用户：");

        if( odStatus.equals( OfficialDocumentStatusEnum.PENDINGAPPROVAL.getCode() )){
            // 需处理
            sb.append("有新的公文：");
            sb.append(odName);
            sb.append("，提交给您等待审批。");
        } else if ( odStatus.equals(OfficialDocumentStatusEnum.TOBEISSUED.getCode()) ){
            // 通过 审批 可以操作
            sb.append("您发起的公文：");
            sb.append(odName);
            sb.append("，已经通过审批。可以进行下一步操作啦！");
        } else if ( odStatus.equals(OfficialDocumentStatusEnum.TOSIGNFORIT.getCode()) ){
            // 有公文需要签收
            sb.append("有公文：");
            sb.append(odName);
            sb.append("，签发至您，需要您签收。");
        } else if ( odStatus.equals(OfficialDocumentStatusEnum.ATAO.getCode()) ){
            // 已签收 ，不发送
            sb.append("您签发的公文：");
            sb.append(odName);
            sb.append("，已经全部签收。");
        } else if ( odStatus.equals(OfficialDocumentStatusEnum.REJECT.getCode()) ){
            // 您的公文，被驳回
            sb.append("您的公文：");
            sb.append(odName);
            sb.append("，已被驳回，请登录系统查看。");
        } else if ( odStatus.equals(OfficialDocumentStatusEnum.RESUBMIT.getCode()) ){
            // 被驳回公文 已经过修改并重新提交， 等待您的处理
            sb.append("公文：");
            sb.append(odName);
            sb.append("，已经过修改，并重新提交，等待您审批。");
        } else if ( odStatus.equals(OfficialDocumentStatusEnum.ATAOFORCE.getCode()) ){
            // 需要您签收的公文，或因为您长时间没有响应，发起人已经强制签收
            sb.append("公文：");
            sb.append(odName);
            sb.append("，需要您签收，或因为您长时间没有响应，发起人已经强制签收。");
        }
        sb.append("【临澧县教育系统OA平台】");

        // step3 提醒记录
        Remind record = new Remind();
        record.setRemindtype(remindtype);
        record.setOperatoruserid(operatoruserid);
        record.setRecipientuserid(recipientuserid);
        record.setContent(sb.toString());
        record.setStatus(RemindConstant.STATUS_SUCCEED);
        record.setType(RemindConstant.TYPE_OD);
        record.setSenddate(new Date());

        record.setTelnumber(recipientuser.getTelnumber());

        return record;
    }

    @Override
    public void save_officialDocument_remind(List<Remind> list) throws Exception {
        List<Sms> smsList = new ArrayList<Sms>();
        List<Message> messageList = new ArrayList<Message>();

        Random random ;
        Date now ;
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        for(Remind remind : list){
            random = new Random();
            now = new Date();
            remind.setSmsid(df.format(now) + String.valueOf(random.nextInt(9999)));

            if(remind.getRemindtype().equals(RemindConstant.REMINDTYPE_ALL)){
                Sms sms= new Sms();
                sms.setPhone(remind.getTelnumber());
                sms.setSmsContent(remind.getContent());
                sms.setSmsId(remind.getSmsid());
                smsList.add(sms);

                Message message = new Message();
                message.setAddresser(remind.getOperatoruserid());
                message.setRecipient(remind.getRecipientuserid());
                message.setContent(remind.getContent());
                message.setDate(new Date());
                message.setReadflag(0);
                messageList.add(message);
            }else if(remind.getRemindtype().equals(RemindConstant.REMINDTYPE_PHONE)){
                Sms sms= new Sms();
                sms.setPhone(remind.getTelnumber());
                sms.setSmsContent(remind.getContent());
                sms.setSmsId(remind.getSmsid());
                smsList.add(sms);
            }else if(remind.getRemindtype().equals(RemindConstant.REMINDTYPE_SYS)){
                Message message = new Message();
                message.setAddresser(remind.getOperatoruserid());
                message.setRecipient(remind.getRecipientuserid());
                message.setContent(remind.getContent());
                message.setDate(new Date());
                message.setReadflag(0);
                messageList.add(message);
            }
        }

        if(!smsList.isEmpty()) sendService.sendSmsList(smsList);
        if(!messageList.isEmpty())  messageService.insertList(messageList);

        /**
         * TODO 如果要记录 短信接口发送状态
         * 那么，数据库应加上 smsid 和 smsstatus 字段 分别表示 唯一标识和状态；
         * smsid 在此时 批量insert 已经可以入库，mapper.sql中加上即可
         * smsstatus 则需要在 调用短信接口，根据返回信息来修改
         * **/
        if(!list.isEmpty()) this.insertList(list) ;
    }

    @Override
    public Integer insertList(List<Remind> list) {
        return sqlSessionTemplate.insert( getNamespace()+".insertList" , list);
    }

    @Override
    public int inserRemind(Remind vo) throws Exception {
        return sqlSessionTemplate.insert(getNamespace()+".insertSelective",vo);
    }
}
