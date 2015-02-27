package net.sjin.smvc.api.sys;

import java.io.Serializable;
import net.sjin.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author zhangcong
 */
public class AcApp extends AdvancedPage implements Serializable {
    /**
     * 应用系统id
     */
    private Integer id;

    /**
     * 应用系统名称
     */
    private String appname;

    /**
     * 应用系统代码
     */
    private String appcode;

    /**
     * 应用系统状态
     */
    private String status;

    /**
     * app对应服务器的URL
     */
    private String appurl;

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

    public String getAppname() {
        return appname;
    }

    public void setAppname(String appname) {
        this.appname = appname;
    }

    public String getAppcode() {
        return appcode;
    }

    public void setAppcode(String appcode) {
        this.appcode = appcode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAppurl() {
        return appurl;
    }

    public void setAppurl(String appurl) {
        this.appurl = appurl;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
}