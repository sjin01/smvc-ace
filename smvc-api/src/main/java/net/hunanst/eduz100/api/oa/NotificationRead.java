package net.hunanst.eduz100.api.oa;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-2-2
 * Time: 上午8:43
 * To change this template use File | Settings | File Templates.
 */
public class NotificationRead implements Serializable {
    private Integer id;

    private Integer readuserid;

    private Integer notid;

    private Date readtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getReaduserid() {
        return readuserid;
    }

    public void setReaduserid(Integer readuserid) {
        this.readuserid = readuserid;
    }

    public Integer getNotid() {
        return notid;
    }

    public void setNotid(Integer notid) {
        this.notid = notid;
    }

    public Date getReadtime() {
        return readtime;
    }

    public void setReadtime(Date readtime) {
        this.readtime = readtime;
    }
}
