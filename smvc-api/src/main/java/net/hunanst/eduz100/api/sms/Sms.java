package net.hunanst.eduz100.api.sms;

import java.io.Serializable;
import java.util.Date;

/**
 * Title :盛通-- 教育信息服务平台
 * Description: 
 * 创建日期: 2014-4-16  上午9:26:20
 *
 * @author: yangzg QQ: 313127650
 */
public class Sms implements Serializable {
	private static final long serialVersionUID = 5884353415549131155L;
	private Integer id ;
	private String phone;
	private String smsContent;
	private String smsId;
	private String status;

	/*private String type;
	private Date sendTime;
	private Integer operator;
	private String receiveType;
	private String sms;
	private String userId;
	private String grade;
	private String classes;
	private String schoolNo;
	private Date addTime;
	private String messageCode;//消息批次  生成方式   operator+时间戮（yyMMddHHmmss）
	private String picURL;*/

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSmsContent() {
		return smsContent;
	}

	public void setSmsContent(String smsContent) {
		this.smsContent = smsContent;
	}

	public String getSmsId() {
		return smsId;
	}

	public void setSmsId(String smsId) {
		this.smsId = smsId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
