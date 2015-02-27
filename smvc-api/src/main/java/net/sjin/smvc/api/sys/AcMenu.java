package net.sjin.smvc.api.sys;

import java.io.Serializable;
import net.sjin.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-10
 * @author zhangcong
 */
public class AcMenu extends AdvancedPage implements Serializable {
    /**
     * 菜单 id
     */
    private Integer id;

    /**
     * 应用系统id
     */
    private Integer appid;

    /**
     * 菜单名称
     */
    private String menuname;

    /**
     * 父菜单id, 根菜单的父菜单id为 0
     */
    private Integer parentid;

    /**
     * 菜单序号   各级父菜单编号 通过 - 连接起来
            比如   0-111-3332
            根菜单序号就是自己的id号 
     */
    private String menuseq;

    /**
     * 排序编号，即显示的顺序
     */
    private Integer sortid;

    /**
     * 对应功能id  可以为null ，表示未挂钩功能
     */
    private Integer funcid;

    /**
     * 菜单图标
     */
    private String menuicon;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAppid() {
        return appid;
    }

    public void setAppid(Integer appid) {
        this.appid = appid;
    }

    public String getMenuname() {
        return menuname;
    }

    public void setMenuname(String menuname) {
        this.menuname = menuname;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getMenuseq() {
        return menuseq;
    }

    public void setMenuseq(String menuseq) {
        this.menuseq = menuseq;
    }

    public Integer getSortid() {
        return sortid;
    }

    public void setSortid(Integer sortid) {
        this.sortid = sortid;
    }

    public Integer getFuncid() {
        return funcid;
    }

    public void setFuncid(Integer funcid) {
        this.funcid = funcid;
    }

    public String getMenuicon() {
        return menuicon;
    }

    public void setMenuicon(String menuicon) {
        this.menuicon = menuicon;
    }
}