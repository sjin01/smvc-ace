package net.hunanst.eduz100.api.oa;

import net.hunanst.common.util.mybatis.pagination.AdvancedPage;

import java.io.Serializable;
import java.util.Date;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author guanshijing  QQ:928990049
 */
public class Officialdocument extends AdvancedPage implements Serializable {
    private Integer id;

    /**
     * 起草人
     */
    private Integer draftuserid;

    /**
     * 起草人组织机构
     */
    private Integer draftorgid;

    /**
     * 创建这个公文记录的时间， 或者第一次保存草稿的时间；
     */
    private Date createdate;

    /**
     * 流程正式开始的时间
     */
    private Date commitdate;

    /**
     * 主题
     */
    private String title;

    /**
     * 内容
     */
    private String content;

    /**
     * 重要等级 取值范围：1-5
     */
    private Integer importantlevel;

    /**
     * 0：不具有时效性；1：具有时效性
     */
    private Integer timelinessflag;

    /**
     * 最后时间：具有时效性的最后通牒
     */
    private Date lastdate;

    /**
     * 0：草稿；
            1：待审批；
            2：已审批；（待签发）
            3：已签发；（待签收）
            4：已签收；
            5：被打回；
            
     */
    private Integer status;

    // view
    private String lastdateStr;
    private String commitdateStr;

    private String username;
    private String orgname;

    private String deliverusername;
    private String deliverorgname;


    private Integer deliverid;    // 当前（最进流转到 ） 的 目标ID
    private Integer delivertype;  // 目标类型  1：人；2：部门

    private Date deliverdata;  // 最近流转时间 （到当前人上手的时间）
    private Date ataotime;   // 签收时间
    private Date recorddate;

    //  search params
    private Integer userid;
    private Integer orgid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDraftuserid() {
        return draftuserid;
    }

    public void setDraftuserid(Integer draftuserid) {
        this.draftuserid = draftuserid;
    }

    public Integer getDraftorgid() {
        return draftorgid;
    }

    public void setDraftorgid(Integer draftorgid) {
        this.draftorgid = draftorgid;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getCommitdate() {
        return commitdate;
    }

    public void setCommitdate(Date commitdate) {
        this.commitdate = commitdate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getImportantlevel() {
        return importantlevel;
    }

    public void setImportantlevel(Integer importantlevel) {
        this.importantlevel = importantlevel;
    }

    public Integer getTimelinessflag() {
        return timelinessflag;
    }

    public void setTimelinessflag(Integer timelinessflag) {
        this.timelinessflag = timelinessflag;
    }

    public Date getLastdate() {
        return lastdate;
    }

    public void setLastdate(Date lastdate) {
        this.lastdate = lastdate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public String getLastdateStr() {
        return lastdateStr;
    }

    public void setLastdateStr(String lastdateStr) {
        this.lastdateStr = lastdateStr;
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

    public String getCommitdateStr() {
        return commitdateStr;
    }

    public void setCommitdateStr(String commitdateStr) {
        this.commitdateStr = commitdateStr;
    }

    public Date getDeliverdata() {
        return deliverdata;
    }

    public void setDeliverdata(Date deliverdata) {
        this.deliverdata = deliverdata;
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

    public String getDeliverusername() {
        return deliverusername;
    }

    public void setDeliverusername(String deliverusername) {
        this.deliverusername = deliverusername;
    }

    public String getDeliverorgname() {
        return deliverorgname;
    }

    public void setDeliverorgname(String deliverorgname) {
        this.deliverorgname = deliverorgname;
    }

    public Date getAtaotime() {
        return ataotime;
    }

    public void setAtaotime(Date ataotime) {
        this.ataotime = ataotime;
    }

    public Date getRecorddate() {
        return recorddate;
    }

    public void setRecorddate(Date recorddate) {
        this.recorddate = recorddate;
    }
}