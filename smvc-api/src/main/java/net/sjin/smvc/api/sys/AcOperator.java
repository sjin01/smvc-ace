package net.sjin.smvc.api.sys;

import java.io.Serializable;
import java.util.Date;
import net.sjin.common.util.mybatis.pagination.AdvancedPage;
import org.apache.commons.lang.StringUtils;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author zhangcong
 */
public class AcOperator extends AdvancedPage implements Serializable {
    /**
     * 操作员id
     */
    private Integer id;

    /**
     * 登录帐号
     */
    private String usercode;

    /**
     * 操作员姓名
     */
    private String username;

    /**
     * 密码, 加密后的
     */
    private String password;

    /**
     * 操作员状态 1 正常  2 冻结
     */
    private String status;

    /**
     * 认证模式 1： 本地认证  2：LDAP
     */
    private String authmode;

    /**
     * 绑定用户代码，用于LDAP模式，使用另外的代码登录LDAP
     */
    private String bindusercode;

    /**
     * 联系电话
     */
    private String telnumber;

    /**
     * 电子邮件
     */
    private String email;

    /**
     * 创建者姓名
     */
    private String creater;

    /**
     * 创建时间
     */
    private Date createtime;
    
    private Integer belongorgid;

    /**
     * 个人头像地址
     */
    private String imgurl;

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAuthmode() {
        return authmode;
    }

    public void setAuthmode(String authmode) {
        this.authmode = authmode;
    }

    public String getBindusercode() {
        return bindusercode;
    }

    public void setBindusercode(String bindusercode) {
        this.bindusercode = bindusercode;
    }

    public String getTelnumber() {
        if(!StringUtils.isEmpty(telnumber)) return telnumber.replace(" ","");
        return telnumber;
    }

    public void setTelnumber(String telnumber) {
        if(!StringUtils.isEmpty(telnumber)){
            this.telnumber = telnumber.replace(" ","");
        }else{
            this.telnumber = telnumber;
        }
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

	public Integer getBelongorgid() {
		return belongorgid;
	}

	public void setBelongorgid(Integer belongorgid) {
		this.belongorgid = belongorgid;
	}
}