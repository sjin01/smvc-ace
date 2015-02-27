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
public class OfficialdocumentFile extends AdvancedPage implements Serializable {
    private Integer id;

    private Integer officialdocumentid;

    /**
     * 文件在服务器中的存储相对路径（带物理文件名）
     */
    private String filepath;

    private String sealpath;  // 盖了公章之后的 文件储存地址

    /**
     * 文件后缀
     */
    private String suffix;

    /**
     * 单位 字节（b）
     */
    private Double size;

    /**
     * 文件的逻辑文件名
     */
    private String filename;

    /**
     * 1：公文起草人 第一次发起时 提供的附件；
            0：公文在其他人经手或审批时提供的附件；
     */
    private Integer sourcefileflag;

    private Date uploaddate;

    private Integer userid;

    private Integer orgid;

    private Integer deliverid;

    //view
    private String uploaddateStr;

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

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public Double getSize() {
        return size;
    }

    public void setSize(Double size) {
        this.size = size;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Integer getSourcefileflag() {
        return sourcefileflag;
    }

    public void setSourcefileflag(Integer sourcefileflag) {
        this.sourcefileflag = sourcefileflag;
    }

    public Date getUploaddate() {
        return uploaddate;
    }

    public void setUploaddate(Date uploaddate) {
        this.uploaddate = uploaddate;
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

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getUploaddateStr() {
        return uploaddateStr;
    }

    public void setUploaddateStr(String uploaddateStr) {
        this.uploaddateStr = uploaddateStr;
    }

    public String getSealpath() {
        return sealpath;
    }

    public void setSealpath(String sealpath) {
        this.sealpath = sealpath;
    }
}