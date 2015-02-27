package net.hunanst.eduz100.api.sys;

import java.io.Serializable;
import net.hunanst.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author zhangcong
 */
public class AcOperRole extends AdvancedPage implements Serializable {
    /**
     * 主键ID
     */
    private Integer id;

    /**
     * 操作员id
     */
    private Integer operid;

    /**
     * 角色id
     */
    private Integer roleid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOperid() {
        return operid;
    }

    public void setOperid(Integer operid) {
        this.operid = operid;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }
}