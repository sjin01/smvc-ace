package net.hunanst.eduz100.api.sys;

import java.io.Serializable;
import net.hunanst.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author zhangcong
 */
public class AcFuncGroup extends AdvancedPage implements Serializable {
    /**
     * 功能分组id
     */
    private Integer id;

    /**
     * 功能分组名称
     */
    private String funcgroupname;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFuncgroupname() {
        return funcgroupname;
    }

    public void setFuncgroupname(String funcgroupname) {
        this.funcgroupname = funcgroupname;
    }
}