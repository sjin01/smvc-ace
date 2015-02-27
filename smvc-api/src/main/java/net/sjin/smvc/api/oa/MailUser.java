package net.sjin.smvc.api.oa;

import java.io.Serializable;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author guanshijing  QQ:928990049
 */
public class MailUser implements Serializable {
    private Integer id;

    /**
     * 邮件关联属性
     */
    private Integer mailid;

    /**
     * 用户关联属性
     */
    private Integer userid;

    /**
     * 1：接收人（发送给）；2：被抄送人（抄送给）
     */
    private Integer type;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMailid() {
        return mailid;
    }

    public void setMailid(Integer mailid) {
        this.mailid = mailid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}