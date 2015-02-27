package net.sjin.smvc.api.oa;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-7
 * Time: 下午3:55
 * To change this template use File | Settings | File Templates.
 */
public class NotificationFile implements Serializable {
    private int id;

    private int notid;

    private String fileurl;

    private String filename;

    private Double filesize;

    private String filetype;

    private Date uploadtime;

    private String uploadtimeStr;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNotid() {
        return notid;
    }

    public void setNotid(int notid) {
        this.notid = notid;
    }

    public String getFileurl() {
        return fileurl;
    }

    public void setFileurl(String fileurl) {
        this.fileurl = fileurl;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Double getFilesize() {
        return filesize;
    }

    public void setFilesize(Double filesize) {
        this.filesize = filesize;
    }

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype;
    }

    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

    public String getUploadtimeStr() {
        return uploadtimeStr;
    }

    public void setUploadtimeStr(String uploadtimeStr) {
        this.uploadtimeStr = uploadtimeStr;
    }
}
