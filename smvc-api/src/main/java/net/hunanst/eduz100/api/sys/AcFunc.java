package net.hunanst.eduz100.api.sys;

import java.io.Serializable;
import net.hunanst.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-24
 * @author zhangcong
 */
public class AcFunc extends AdvancedPage implements Serializable {
    /**
     * 功能id
     */
    private Integer id;

    /**
     * 功能名称
     */
    private String funcname;

    /**
     * 功能代码 ，用于识别一个功能
     */
    private String funccode;

    /**
     * 功能动作，对应URL
     */
    private String funcaction;

    /**
     * 功能图标
     */
    private String funcicon;

    /**
     * 功能类型：0 普通节点 ， 1 菜单， 2 功能
     */
    private String functype;

    /**
     * 功能序列，如1-2-3
     */
    private String funcseq;

    /**
     * 排序编号，即显示的顺序
     */
    private Integer sortid;

    /**
     * 父功能ID
     */
    private Integer parentid;

    /**
     * 应用系统id
     */
    private Integer appid;
    
    private Boolean allowable;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFuncname() {
        return funcname;
    }

    public void setFuncname(String funcname) {
        this.funcname = funcname;
    }

    public String getFunccode() {
        return funccode;
    }

    public void setFunccode(String funccode) {
        this.funccode = funccode;
    }

    public String getFuncaction() {
        return funcaction;
    }

    public void setFuncaction(String funcaction) {
        this.funcaction = funcaction;
    }

    public String getFuncicon() {
        return funcicon;
    }

    public void setFuncicon(String funcicon) {
        this.funcicon = funcicon;
    }

    public String getFunctype() {
        return functype;
    }

    public void setFunctype(String functype) {
        this.functype = functype;
    }

    public String getFuncseq() {
        return funcseq;
    }

    public void setFuncseq(String funcseq) {
        this.funcseq = funcseq;
    }

    public Integer getSortid() {
        return sortid;
    }

    public void setSortid(Integer sortid) {
        this.sortid = sortid;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public Integer getAppid() {
        return appid;
    }

    public void setAppid(Integer appid) {
        this.appid = appid;
    }

	public Boolean getAllowable() {
		return allowable;
	}

	public void setAllowable(Boolean allowable) {
		this.allowable = allowable;
	}
}