package net.sjin.smvc.api.data.vo;

import net.sjin.common.util.mybatis.pagination.AdvancedPage;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-14
 * Time: 下午4:27
 * To change this template use File | Settings | File Templates.
 */
public class PersonView extends AdvancedPage implements Serializable {
    private Integer id;

    private Integer tempinfoid;

    private String title;

    private Integer userid;

    private String username;

    private Integer orgid;

    private String orgname;

    private Date createdate;

    private Date subdate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTempinfoid() {
        return tempinfoid;
    }

    public void setTempinfoid(Integer tempinfoid) {
        this.tempinfoid = tempinfoid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getOrgid() {
        return orgid;
    }

    public void setOrgid(Integer orgid) {
        this.orgid = orgid;
    }

    public String getOrgname() {
        return orgname;
    }

    public void setOrgname(String orgname) {
        this.orgname = orgname;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getSubdate() {
        return subdate;
    }

    public void setSubdate(Date subdate) {
        this.subdate = subdate;
    }
}
