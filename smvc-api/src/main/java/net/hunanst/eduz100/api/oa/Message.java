package net.hunanst.eduz100.api.oa;

import java.io.Serializable;
import java.util.Date;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author guanshijing  QQ:928990049
 */
public class Message implements Serializable {
    private Integer id;

    private Integer addresser;

    private Integer addresserorgid;

    private Integer recipient;

    private Integer recipientorgid;

    private Date date;

    private String content;
    
    private String name;
    
    private String img;
    
    private Integer number;

    /**
     * 0：未读；1：已读
     */
    private Integer readflag;

    private static final long serialVersionUID = 1L;

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

    public Integer getReadflag() {
        return readflag;
    }

    public void setReadflag(Integer readflag) {
        this.readflag = readflag;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}
}