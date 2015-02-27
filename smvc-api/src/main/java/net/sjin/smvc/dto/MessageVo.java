package net.sjin.smvc.dto;

import java.util.Date;


/**
 * Title :盛通-- 教育信息服务平台
 * Description: 消息VO类
 * 创建日期: 2014-12-27  下午2:49:46
 *
 * @author: yangzg QQ: 313127650
 */
public class MessageVo {
	private Integer id;
	private Integer addresser;
	private String addressername;
	private Integer addresserorgid;
    private Integer recipient;
    private String recipientname;
    private Integer recipientorgid;
    private Date date;
    private String dateformat;
    private String content;
    private String state;//1 表示自己发给对方的   0 表示对方发给自己的
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAddresser() {
		return addresser;
	}
	public void setAddresser(Integer addresser) {
		this.addresser = addresser;
	}
	public String getAddressername() {
		return addressername;
	}
	public void setAddressername(String addressername) {
		this.addressername = addressername;
	}
	public Integer getAddresserorgid() {
		return addresserorgid;
	}
	public void setAddresserorgid(Integer addresserorgid) {
		this.addresserorgid = addresserorgid;
	}
	public Integer getRecipient() {
		return recipient;
	}
	public void setRecipient(Integer recipient) {
		this.recipient = recipient;
	}
	public String getRecipientname() {
		return recipientname;
	}
	public void setRecipientname(String recipientname) {
		this.recipientname = recipientname;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDateformat() {
		return dateformat;
	}
	public void setDateformat(String dateformat) {
		this.dateformat = dateformat;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
