package net.sjin.smvc.api.oa;

import net.sjin.common.util.mybatis.pagination.AdvancedPage;

import java.io.Serializable;
import java.util.Date;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-18
 * @author guanshijing  QQ:928990049
 */
public class OfficialdocumentRecord extends AdvancedPage implements Serializable {

    private Integer id;

    private Integer officialdocumentid;

    private Integer userid;

    private Integer orgid;

    /**
     * 1：个人档案；2：部门档案
     */
    private Integer type;

    private Date date;

    // view params
    private Integer targetid;

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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getTargetid() {
        return targetid;
    }

    public void setTargetid(Integer targetid) {
        this.targetid = targetid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}