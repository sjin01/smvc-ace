package net.sjin.smvc.api.oa;

import java.io.Serializable;
import java.util.Date;

/**
 * Title: 盛通-教育信息服务平台
 * Description: 公文批注
 * 创建日期:2014-12-09
 * @author guanshijing  QQ:928990049
 */
public class OfficialdocumentPostil implements Serializable {
    private Integer id;

    private Integer officialdocumentid;

    /**
     * 批注人
     */
    private Integer userid;

    /**
     * 批注人组织机构
     */
    private Integer orgid;

    private Date date;

    /**
     * 批注内容
     */
    private String content;

    /**
     * 记录流转 id
     */
    private Integer deliverid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOfficialdocumentid() {
        return officialdocumentid;
    }

    public void setOfficialdocumentid(Integer officialdocumentid) {
        this.officialdocumentid = officialdocumentid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getOrgid() {
        return orgid;
    }

    public void setOrgid(Integer orgid) {
        this.orgid = orgid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getDeliverid() {
        return deliverid;
    }

    public void setDeliverid(Integer deliverid) {
        this.deliverid = deliverid;
    }
}