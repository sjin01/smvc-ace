package net.hunanst.common.api.constant;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 12/11  15:01
 *
 * @author: guanshj QQ: 928990049
 */
public interface OfficialdocumentConstant {

    /**
     * 1：直接转交给人；2：转交给部门（组织机构）
     */
    public static final Integer DELIVERTYPE_USER = 1;
    public static final Integer DELIVERTYPE_ORG = 2;

    /**
     * 0：未变更状态（操作人认为无权处理，直接转手）；
       1：变更了状态（操作人已对公文进行了某种处理）；
     */
    public static final Integer CHANGEFLAG_OFF = 0;
    public static final Integer CHANGEFLAG_ON = 1;

    /**
     * 1：公文起草人 第一次发起时 提供的附件；
       0：公文在其他人经手或审批时提供的附件；
     */
    public static final Integer SOURCEFILEFLAG_YES = 1;
    public static final Integer SOURCEFILEFLAG_NO = 0;

    /**
     * 文件 是源文件
     */
    public static final Integer FILE_SOURCE_FLAG_YES = 1;
    public static final Integer FILE_SOURCE_FLAG_NO = 0;
}
