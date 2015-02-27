package net.sjin.smvc.api.sys.vo;

import java.io.Serializable;
import net.sjin.smvc.api.sys.AcRole;

public class AcRoleVo extends AcRole implements Serializable {
	private String checked;
	private String belongorgname;

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getBelongorgname() {
		return belongorgname;
	}

	public void setBelongorgname(String belongorgname) {
		this.belongorgname = belongorgname;
	}

}