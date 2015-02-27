package net.sjin.smvc.api.oa;

import net.sjin.common.util.mybatis.pagination.AdvancedPage;

import java.io.Serializable;
import java.util.Date;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author guanshijing  QQ:928990049
 */
public class OfficialdocumentDeliver extends AdvancedPage implements Serializable {
    private Integer id;

    /**
     * 公文关联属性
     */
    private Integer officialdocumentid;

    /**
     * 操作人
     */
    private Integer userid;

    /**
     * 操作人组织机构
     */
    private Integer orgid;

    /**
     * 单位或人的id
     */
    private Integer deliverid;

    /**
     * 1：直接转交给人；2：转交给部门（组织机构）
     */
    private Integer delivertype;

    private Date deliverdate;

    /**
     * 0：未变更状态（操作人认为无权处理，直接转手）；
            1：变更了状态（操作人已对公文进行了某种处理）；
     */
    private Integer changeflag;

    /**
     * 0：草稿；
            1：待审批；
            2：已审批；
            3：已签发；
            4：已签收；
            5：被打回；
            6：重新提交
            7: 强制签收
     */
    private Integer changestatus;

    /*view */
    private String postildate;
    private String postilcontent;

    private String username;
    private String orgname;
    private String deliverorgname;
    private String deliverusername;

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

    public Integer getDeliverid() {
        return deliverid;
    }

    public void setDeliverid(Integer deliverid) {
        this.deliverid = deliverid;
    }

    public Integer getDelivertype() {
        return delivertype;
    }

    public void setDelivertype(Integer delivertype) {
        this.delivertype = delivertype;
    }

    public Date getDeliverdate() {
        return deliverdate;
    }

    public void setDeliverdate(Date deliverdate) {
        this.deliverdate = deliverdate;
    }

    public Integer getChangeflag() {
        return changeflag;
    }

    public void setChangeflag(Integer changeflag) {
        this.changeflag = changeflag;
    }

    public Integer getChangestatus() {
        return changestatus;
    }

    public void setChangestatus(Integer changestatus) {
        this.changestatus = changestatus;
    }

    public String getPostildate() {
        return postildate;
    }

    public void setPostildate(String postildate) {
        this.postildate = postildate;
    }

    public String getPostilcontent() {
        return postilcontent;
    }

    public void setPostilcontent(String postilcontent) {
        this.postilcontent = postilcontent;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOrgname() {
        return orgname;
    }

    public void setOrgname(String orgname) {
        this.orgname = orgname;
    }

    public String getDeliverorgname() {
        return deliverorgname;
    }

    public void setDeliverorgname(String deliverorgname) {
        this.deliverorgname = deliverorgname;
    }

    public String getDeliverusername() {
        return deliverusername;
    }

    public void setDeliverusername(String deliverusername) {
        this.deliverusername = deliverusername;
    }
}