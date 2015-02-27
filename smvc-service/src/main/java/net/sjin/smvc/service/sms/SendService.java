package net.sjin.smvc.service.sms;

import net.sjin.smvc.api.sms.Sms;

import java.util.List;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:     发送手机短信    接口
 * 创建日期: 1/20  15:59
 *
 * @author: guanshj QQ: 928990049
 */
public interface SendService {

    /**
     * 发送 单个 短信  , 且无需记录
     * @throws Exception
     */
    void sendSms (String smsContent , String phoneNo ) throws Exception;

    /**
     * 短信群发
     * @param smsList
     * @throws Exception
     */
    void sendSmsList (List<Sms> smsList) throws Exception;
}
