package net.sjin.smvc.api.sys;

import java.io.Serializable;
import java.util.Date;
import net.sjin.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author zhangcong
 */
public class AcLoginlog extends AdvancedPage implements Serializable {
    /**
     * 登录日志id
     */
    private Integer id;

    /**
     * 操作员姓名
     */
    private String username;

    /**
     * 登录帐号
     */
    private String usercode;

    /**
     * 操作员id
     */
    private Integer operid;

    /**
     * 登入时间
     */
    private Date logintime;

    /**
     * 登出时间
     */
    private Date logouttime;

    /**
     * 登录ip
     */
    private String logip;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode;
    }

    public Integer getOperid() {
        return operid;
    }

    public void setOperid(Integer operid) {
        this.operid = operid;
    }

    public Date getLogintime() {
        return logintime;
    }

    public void setLogintime(Date logintime) {
        this.logintime = logintime;
    }

    public Date getLogouttime() {
        return logouttime;
    }

    public void setLogouttime(Date logouttime) {
        this.logouttime = logouttime;
    }

    public String getLogip() {
        return logip;
    }

    public void setLogip(String logip) {
        this.logip = logip;
    }
}