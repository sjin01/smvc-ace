package net.sjin.smvc.api.data;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-15
 * Time: 上午11:23
 * To change this template use File | Settings | File Templates.
 */
public class DataCollectInfoDetail implements Serializable {

    private Integer id;

    private Integer infoid;

    private Integer tempdetailid;

    private String detail;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInfoid() {
        return infoid;
    }

    public void setInfoid(Integer infoid) {
        this.infoid = infoid;
    }

    public Integer getTempdetailid() {
        return tempdetailid;
    }

    public void setTempdetailid(Integer tempdetailid) {
        this.tempdetailid = tempdetailid;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
