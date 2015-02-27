package net.sjin.smvc.api.sys;

import java.io.Serializable;
import net.sjin.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author zhangcong
 */
public class AcOperFunc extends AdvancedPage implements Serializable {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 操作员id
     */
    private Integer operid;

    /**
     * 对应功能id  可以为null ，表示未挂钩功能
     */
    private Integer funcid;

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

    public Integer getFuncid() {
        return funcid;
    }

    public void setFuncid(Integer funcid) {
        this.funcid = funcid;
    }
}