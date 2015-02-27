package net.hunanst.common.api.constant;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 1/19  10:57
 *
 * @author: guanshj QQ: 928990049
 */
public interface RemindConstant {

    /**提醒开关（是否提醒）**/
    public static final Integer REMIND_ON = 1;
    public static final Integer REMIND_OFF = 0;

    /** 发送方式 1手机短信，2系统短消息；3都发 **/
    public static final Integer REMINDTYPE_PHONE = 1;
    public static final Integer REMINDTYPE_SYS = 2;
    public static final Integer REMINDTYPE_ALL = 3;

    /** 发送状态 1成功 2失败 **/
    public static final Integer STATUS_SUCCEED = 1;
    public static final Integer STATUS_FAILURE = 2;

    /** 提醒数据类型 1公文 2通知 **/
    public static final Integer TYPE_OD = 1;
    public static final Integer TYPE_NOTIFICATION = 2;

}
