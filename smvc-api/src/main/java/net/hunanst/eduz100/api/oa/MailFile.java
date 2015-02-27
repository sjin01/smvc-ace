package net.hunanst.eduz100.api.oa;

import java.io.Serializable;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author guanshijing  QQ:928990049
 */
public class MailFile implements Serializable {
    private Integer id;

    private Integer mailid;

    private String filepath;

    private String suffix;

    private Double size;

    private String filename;

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
}