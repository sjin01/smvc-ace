package net.sjin.smvc.api.data;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-14
 * Time: 下午2:28
 * To change this template use File | Settings | File Templates.
 */
public class TempInfoDetail implements Serializable {
    private Integer id;

    private Integer tempinfoid;

    private String detail;

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

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
