package net.hunanst.eduz100.api.data.vo;

import net.hunanst.eduz100.api.data.DataInfoUser;
import net.hunanst.eduz100.api.data.TempInfo;
import net.hunanst.eduz100.api.data.TempInfoDetail;

import java.io.Serializable;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-13
 * Time: 下午2:40
 * To change this template use File | Settings | File Templates.
 */
public class TempInfoVo extends TempInfo implements Serializable{

    private String username;

    private String orgname;

    private String timeStr;
    /**
     * 完成人员数量
     */
    private Integer finish;

    private Integer unfinish;

    /**
     * param
     */
    private String[] details;

    private List<DataInfoUser> receives;

    private List<TempInfoDetail> tempInfoDetails;

    private String condition;

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public List<TempInfoDetail> getTempInfoDetails() {
        return tempInfoDetails;
    }

    public void setTempInfoDetails(List<TempInfoDetail> tempInfoDetails) {
        this.tempInfoDetails = tempInfoDetails;
    }

    public String[] getDetails() {
        return details;
    }

    public void setDetails(String[] details) {
        this.details = details;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOrgname() {
        return orgname;
    }

    public void setOrgname(String orgname) {
        this.orgname = orgname;
    }

    public String getTimeStr() {
        return timeStr;
    }

    public void setTimeStr(String timeStr) {
        this.timeStr = timeStr;
    }

    public Integer getFinish() {
        return finish;
    }

    public void setFinish(Integer finish) {
        this.finish = finish;
    }

    public Integer getUnfinish() {
        return unfinish;
    }

    public void setUnfinish(Integer unfinish) {
        this.unfinish = unfinish;
    }

    public List<DataInfoUser> getReceives() {
        return receives;
    }

    public void setReceives(List<DataInfoUser> receives) {
        this.receives = receives;
    }
}
