package net.sjin.smvc.api.oa;

import java.io.Serializable;

import net.sjin.common.util.mybatis.pagination.AdvancedPage;

public class MailDetail extends AdvancedPage  implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4722268774572416603L;
	private Integer mailid;
	private Integer userid;
	private Integer boxtype;
	private String username;
	private String mailtitle;
	private String createdate;
	private String mailcontent;
	private String readstate;

	public Integer getMailid() {
		return mailid;
	}

	public void setMailid(Integer mailid) {
		this.mailid = mailid;
	}


	public Integer getBoxtype() {
		return boxtype;
	}

	public void setBoxtype(Integer boxtype) {
		this.boxtype = boxtype;
	}
	
	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMailtitle() {
		return mailtitle;
	}

	public void setMailtitle(String mailtitle) {
		this.mailtitle = mailtitle;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getMailcontent() {
		return mailcontent;
	}

	public void setMailcontent(String mailcontent) {
		this.mailcontent = mailcontent;
	}

	public String getReadstate() {
		return readstate;
	}

	public void setReadstate(String readstate) {
		this.readstate = readstate;
	}
	
}
