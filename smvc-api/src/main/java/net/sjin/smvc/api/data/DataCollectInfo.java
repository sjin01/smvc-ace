package net.sjin.smvc.api.data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-15
 * Time: 上午11:22
 * To change this template use File | Settings | File Templates.
 */
public class DataCollectInfo implements Serializable {

    private Integer id;

    private Integer tempinfoid;

    private Integer userid;

    private Integer orgid;

    private Date createdate;

    private List<DataCollectInfoDetail> dataCollectInfoDetailList;

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

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public List<DataCollectInfoDetail> getDataCollectInfoDetailList() {
        return dataCollectInfoDetailList;
    }

    public void setDataCollectInfoDetailList(List<DataCollectInfoDetail> dataCollectInfoDetailList) {
        this.dataCollectInfoDetailList = dataCollectInfoDetailList;
    }
}
