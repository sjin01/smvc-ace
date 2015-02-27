package net.sjin.smvc.api.oa;

import java.io.Serializable;

/**
 * 用于自动填充邮件用户名称
 * @author Administrator
 *
 */
public class AcOperatorIdAndName implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6448570253619750217L;
	private String id;  //userid
	private String label; //username;
	private String value;  //userid;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
}
