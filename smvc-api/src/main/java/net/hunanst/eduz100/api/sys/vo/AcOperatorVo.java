package net.hunanst.eduz100.api.sys.vo;

import java.io.Serializable;
import net.hunanst.eduz100.api.sys.AcOperator;


public class AcOperatorVo extends AcOperator implements Serializable {
    private Integer orgid;
    private String belongorgname;

	public Integer getOrgid() {
		return orgid;
	}

	public void setOrgid(Integer orgid) {
		this.orgid = orgid;
	}

	public String getBelongorgname() {
		return belongorgname;
	}

	public void setBelongorgname(String belongorgname) {
		this.belongorgname = belongorgname;
	}
}