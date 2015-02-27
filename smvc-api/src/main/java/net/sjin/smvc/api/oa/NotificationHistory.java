package net.sjin.smvc.api.oa;

import net.sjin.common.util.mybatis.pagination.AdvancedPage;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 14-12-24
 * Time: 下午4:17
 * To change this template use File | Settings | File Templates.
 */
public class NotificationHistory extends AdvancedPage implements Serializable {
    private Integer id;

    /**
     * 接受者id
     */
    private Integer recipient;
    /**
     * 接受者机构id
     */
    private Integer recipientorgid;
    /**
     * 接收日期
     */
    private Date date;
    /**
     * 通知id
     */
    private Integer notificationid;
    /**
     * 发送类型 (0:手机短信  1:短消息)
     */
    private Integer sendtype;
    /**
     * 发送内容(除了通知内容外,额外的留言)
     */
    private String content;

    /**
     * 是否已读
     * @return
     */
    private int isread;

    public int getIsread() {
        return isread;
    }

    public void setIsread(int isread) {
        this.isread = isread;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRecipient() {
        return recipient;
    }

    public void setRecipient(Integer recipient) {
        this.recipient = recipient;
    }

    public Integer getRecipientorgid() {
        return recipientorgid;
    }

    public void setRecipientorgid(Integer recipientorgid) {
        this.recipientorgid = recipientorgid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getNotificationid() {
        return notificationid;
    }

    public void setNotificationid(Integer notificationid) {
        this.notificationid = notificationid;
    }

    public Integer getSendtype() {
        return sendtype;
    }

    public void setSendtype(Integer sendtype) {
        this.sendtype = sendtype;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
