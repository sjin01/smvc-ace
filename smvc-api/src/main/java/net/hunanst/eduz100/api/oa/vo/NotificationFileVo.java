package net.hunanst.eduz100.api.oa.vo;

import net.hunanst.eduz100.api.oa.NotificationFile;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-13
 * Time: 上午9:50
 * To change this template use File | Settings | File Templates.
 */
public class NotificationFileVo extends NotificationFile implements Serializable {

    private Integer userid;

    private Integer orgid;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getOrgid() {
        return orgid;
    }

    public void setOrgid(Integer orgid) {
        this.orgid = orgid;
    }

}
