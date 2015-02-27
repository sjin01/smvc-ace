package net.sjin.smvc.api.sys;

import java.io.Serializable;
import net.sjin.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author zhangcong
 */
public class AcRole extends AdvancedPage implements Serializable {
    /**
     * 角色id
     */
    private Integer id;

    private String rolecode;

    /**
     * 角色名称
     */
    private String rolename;
    
    private Integer belongorgid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRolecode() {
        return rolecode;
    }

    public void setRolecode(String rolecode) {
        this.rolecode = rolecode;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

	public Integer getBelongorgid() {
		return belongorgid;
	}

	public void setBelongorgid(Integer belongorgid) {
		this.belongorgid = belongorgid;
	}
}