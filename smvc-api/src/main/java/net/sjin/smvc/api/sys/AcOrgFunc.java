package net.sjin.smvc.api.sys;

import java.io.Serializable;
import net.sjin.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author zhangcong
 */
public class AcOrgFunc extends AdvancedPage implements Serializable {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 机构ID
     */
    private Integer orgid;

    /**
     * FUNCID
     */
    private Integer funcid;

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

    public Integer getFuncid() {
        return funcid;
    }

    public void setFuncid(Integer funcid) {
        this.funcid = funcid;
    }
}