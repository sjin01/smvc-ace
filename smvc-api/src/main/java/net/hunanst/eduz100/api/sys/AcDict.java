package net.hunanst.eduz100.api.sys;

import java.io.Serializable;
import net.hunanst.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author zhangcong
 */
public class AcDict extends AdvancedPage implements Serializable {
    /**
     * 字典ID
     */
    private Integer id;

    /**
     * 字典类别ID
     */
    private Integer typeid;

    /**
     * 字典项名称
     */
    private String tname;

    /**
     * 字典项目值
     */
    private String tvalue;

    /**
     * 排序编号，即显示的顺序
     */
    private Integer sortid;

    /**
     * 备注说明
     */
    private String memo;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTvalue() {
        return tvalue;
    }

    public void setTvalue(String tvalue) {
        this.tvalue = tvalue;
    }

    public Integer getSortid() {
        return sortid;
    }

    public void setSortid(Integer sortid) {
        this.sortid = sortid;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
}