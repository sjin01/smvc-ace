package net.hunanst.eduz100.dto;

import net.hunanst.eduz100.api.oa.OfficialdocumentDeliver;
import net.hunanst.eduz100.api.oa.OfficialdocumentFile;

import java.util.Date;
import java.util.List;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:  公文主体   dto: 数据传输对象(Data Transfer Object)
 * 创建日期: 12/11  10:22
 *
 * @author: guanshj QQ: 928990049
 */
public class OfficialDocumentDto {

    private Integer officialDocumentId;

    private String title;
    private String content;
    private Integer importantlevel;

    /**
     * 0：不具有时效性；1：具有时效性
     */
    private Integer timelinessflag;
    private Date lastdate;
    private String lastdateStr;

    /**
     * 起草人
     */
    private Integer userid;
    private Integer orgid;

    /**
     * 单位或人的id
     * 1：直接转交给人；2：转交给部门（组织机构）
     */
    private Integer deliverid;
    private Integer delivertype;

    /**
     * 文件
     */
    private List<OfficialdocumentFile> officialdocumentFileList;
    private List<Integer> fileIdList;

    /** 填写批注内容 **/
    private String postilContent;
    private Integer flag;

    private List<Integer> useridList;
    private List<Integer> orgidList;

    /** 是否 发送短信提醒 **/
    private Integer remindflag;
    private Integer remindtype;


    // --------------  get and set -----------------

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

    public List<OfficialdocumentFile> getOfficialdocumentFileList() {
        return officialdocumentFileList;
    }

    public void setOfficialdocumentFileList(List<OfficialdocumentFile> officialdocumentFileList) {
        this.officialdocumentFileList = officialdocumentFileList;
    }

    public String getLastdateStr() {
        return lastdateStr;
    }

    public void setLastdateStr(String lastdateStr) {
        this.lastdateStr = lastdateStr;
    }

    public Integer getOfficialDocumentId() {
        return officialDocumentId;
    }

    public void setOfficialDocumentId(Integer officialDocumentId) {
        this.officialDocumentId = officialDocumentId;
    }

/*    public OfficialdocumentDeliver getDeliver() {
        return deliver;
    }

    public void setDeliver(OfficialdocumentDeliver deliver) {
        this.deliver = deliver;
    }*/

    public String getPostilContent() {
        return postilContent;
    }

    public void setPostilContent(String postilContent) {
        this.postilContent = postilContent;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public List<Integer> getFileIdList() {
        return fileIdList;
    }

    public void setFileIdList(List<Integer> fileIdList) {
        this.fileIdList = fileIdList;
    }

    public List<Integer> getUseridList() {
        return useridList;
    }

    public void setUseridList(List<Integer> useridList) {
        this.useridList = useridList;
    }

    public List<Integer> getOrgidList() {
        return orgidList;
    }

    public void setOrgidList(List<Integer> orgidList) {
        this.orgidList = orgidList;
    }

    public Integer getRemindflag() {
        return remindflag;
    }

    public void setRemindflag(Integer remindflag) {
        this.remindflag = remindflag;
    }

    public Integer getRemindtype() {
        return remindtype;
    }

    public void setRemindtype(Integer remindtype) {
        this.remindtype = remindtype;
    }
}
