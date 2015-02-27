package net.hunanst.eduz100.api.oa;

import java.io.Serializable;

import net.hunanst.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author guanshijing  QQ:928990049
 */
public class MailBox extends AdvancedPage implements Serializable {
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
     * 0：草稿箱；
            1：发件箱；（可以重新发送）
            2：收件箱；（可以做回复的操作）
            3：已删除；（无法恢复，但可以查看）
            4：彻底删除；（用户在邮箱中看不到）
     */
    private Integer boxtype;

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

    public Integer getBoxtype() {
        return boxtype;
    }

    public void setBoxtype(Integer boxtype) {
        this.boxtype = boxtype;
    }
    
    /**
     * 是否被读  0：未读 1：已读
     */
    private int readstate;

	public int getReadstate() {
		return readstate;
	}

	public void setReadstate(int readstate) {
		this.readstate = readstate;
	}
    
}