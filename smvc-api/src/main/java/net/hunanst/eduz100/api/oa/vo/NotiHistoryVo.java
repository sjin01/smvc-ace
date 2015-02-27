package net.hunanst.eduz100.api.oa.vo;

import net.hunanst.eduz100.api.oa.NotificationHistory;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-20
 * Time: 下午2:35
 * To change this template use File | Settings | File Templates.
 */
public class NotiHistoryVo extends NotificationHistory implements Serializable {

    private String title;

    private Date notitimes;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getNotitimes() {
        return notitimes;
    }

    public void setNotitimes(Date notitimes) {
        this.notitimes = notitimes;
    }
}
