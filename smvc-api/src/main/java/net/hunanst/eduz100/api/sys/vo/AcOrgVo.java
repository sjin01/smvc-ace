package net.hunanst.eduz100.api.sys.vo;

import java.io.Serializable;
import java.util.List;
import net.hunanst.eduz100.api.sys.AcOrg;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author zhangcong
 */
@SuppressWarnings("serial")
public class AcOrgVo extends AcOrg implements Serializable {
	
	private List<AcOrg> childrenOrg;
	private AcOrg parentOrg;
	private String parentorgname;
	private Boolean schoolRoot;
	
	public List<AcOrg> getChildrenOrg() {
		return childrenOrg;
	}
	public void setChildrenOrg(List<AcOrg> childrenOrg) {
		this.childrenOrg = childrenOrg;
	}
	public AcOrg getParentOrg() {
		return parentOrg;
	}
	public void setParentOrg(AcOrg parentOrg) {
		this.parentOrg = parentOrg;
	}
	public String getParentorgname() {
		return parentorgname;
	}
	public void setParentorgname(String parentorgname) {
		this.parentorgname = parentorgname;
	}
	public Boolean getSchoolRoot() {
		return schoolRoot;
	}
	public void setSchoolRoot(Boolean schoolRoot) {
		this.schoolRoot = schoolRoot;
	}
	
}