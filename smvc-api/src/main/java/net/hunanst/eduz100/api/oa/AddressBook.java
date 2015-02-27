package net.hunanst.eduz100.api.oa;

import java.io.Serializable;
import java.util.Date;
import net.hunanst.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-30
 * @author zhangcong
 */
public class AddressBook extends AdvancedPage implements Serializable {
    /**
     * 主键（ID）
     */
    private Integer id;
    
    /**
     * 拥有者   操作员表ID
     */
    private Integer owner;

    /**
     * 操作员表ID
     */
    private Integer operid;
    
    private String imgurl;

    /**
     * 姓名
     */
    private String name;

    /**
     * 个人邮箱
     */
    private String email;

    /**
     * 个人电话
     */
    private String phone;

    /**
     * 办公电话
     */
    private String officephone;

    /**
     * QQ帐号
     */
    private String qq;

    /**
     * 生日
     */
    private Date birthday;
    private String birthdaystr;

    /**
     * 组织机构ID
     */
    private Integer orgid;

    /**
     * 公司
     */
    private String company;

    /**
     * 部门
     */
    private String department;

    /**
     * 职位
     */
    private String position;
    
    /**
     * 备注
     */
    private String remark;
    
    private String status;

    private static final long serialVersionUID = 1L;

    public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOwner() {
		return owner;
	}

	public void setOwner(Integer owner) {
		this.owner = owner;
	}

	public Integer getOperid() {
        return operid;
    }

    public void setOperid(Integer operid) {
        this.operid = operid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOfficephone() {
        return officephone;
    }

    public void setOfficephone(String officephone) {
        this.officephone = officephone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getBirthdaystr() {
		return birthdaystr;
	}

	public void setBirthdaystr(String birthdaystr) {
		this.birthdaystr = birthdaystr;
	}

	public Integer getOrgid() {
        return orgid;
    }

    public void setOrgid(Integer orgid) {
        this.orgid = orgid;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}