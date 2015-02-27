package net.sjin.smvc.api.data.vo;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-14
 * Time: 上午11:10
 * To change this template use File | Settings | File Templates.
 */
public class TreeData implements Serializable {
    private String id;

    private String name;

    private Integer pid;

    private String type;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
