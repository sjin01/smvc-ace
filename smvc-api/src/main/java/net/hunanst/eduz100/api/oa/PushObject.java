package net.hunanst.eduz100.api.oa;

import java.io.Serializable;
import java.util.List;


/**
 * 
 * @author lenovo
 *构造推送对象--通过userid,关联此人的所有推送对象：比如：邮件、通知、短消息等
 */
public class PushObject implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -151992792656794668L;

	private String userid;
	
	private List<MailDetail>  mailDetailList;
	
	private List<Message> messageList;

    private List<Notification> NotificationList;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public List<MailDetail> getMailDetailList() {
		return mailDetailList;
	}

	public void setMailDetailList(List<MailDetail> mailDetailList) {
		this.mailDetailList = mailDetailList;
	}

    public List<Notification> getNotificationList() {
        return NotificationList;
    }

    public void setNotificationList(List<Notification> notificationList) {
        NotificationList = notificationList;
    }

	public List<Message> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}
	
}
