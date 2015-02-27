package net.hunanst.eduz100.api.sys;

import java.io.Serializable;
import net.hunanst.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author zhangcong
 */
public class AcOperOrg extends AdvancedPage implements Serializable {
    /**
     * 管理机构ID
     */
    private Integer id;

    /**
     * 所属机构ID
     */
    private Integer orgid;

    /**
     * 操作员id
     */
    private Integer operid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrgid() {
        return orgid;
    }

    public void setOrgid(Integer orgid) {
        this.orgid = orgid;
    }

    public Integer getOperid() {
        return operid;
    }

    public void setOperid(Integer operid) {
        this.operid = operid;
    }
}