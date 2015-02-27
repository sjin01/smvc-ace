package net.sjin.smvc.enumeration;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 12/11  10:46
 *
 * @author: guanshj QQ: 928990049
 */
public enum OfficialDocumentStatusEnum {

    DRAFT(0, "草稿"),
    PENDINGAPPROVAL(1, "待审批"),
    TOBEISSUED(2, "待签发"),
    TOSIGNFORIT(3, "待签收"),
    ATAO(4, "已签收"),
    REJECT(5, "被驳回"),
    RESUBMIT(6, "重新提交"),
    ATAOFORCE(7,"强制签收");

    private int code;
    private String name;

    private OfficialDocumentStatusEnum(int code, String name) {
        this.code = code;
        this.name = name;
    }

    // 普通方法
    public static String getName(int code) {
        for (OfficialDocumentStatusEnum c : OfficialDocumentStatusEnum.values()) {
            if (c.getCode() == code) {
                return c.name;
            }
        }
        return null;
    }

    // get set 方法
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
