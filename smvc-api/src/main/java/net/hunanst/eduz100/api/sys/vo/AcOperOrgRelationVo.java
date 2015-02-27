package net.hunanst.eduz100.api.sys.vo;

import net.hunanst.eduz100.api.sys.AcOperOrgRelation;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-21
 * Time: 下午3:10
 * To change this template use File | Settings | File Templates.
 */
public class AcOperOrgRelationVo extends AcOperOrgRelation  {
    private Integer belongorgid;

    public Integer getBelongorgid() {
        return belongorgid;
    }

    public void setBelongorgid(Integer belongorgid) {
        this.belongorgid = belongorgid;
    }
}
