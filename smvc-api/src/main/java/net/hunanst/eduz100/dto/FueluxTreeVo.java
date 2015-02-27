package net.hunanst.eduz100.dto;

import com.sun.org.apache.xpath.internal.operations.Bool;

import java.io.Serializable;
import java.util.Map;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:  组织机构 对应  Fuelux Tree js 的 VO 类
 * 创建日期: 12/24  11:34
 *
 * @author: guanshj QQ: 928990049
 */
public class FueluxTreeVo implements Serializable {

    private Integer id;
    private String name;

    /**
     * folder / item
     */
    private String type;

    private Integer childcount;
    private String datatype;
    private Integer sort;

    /**
     * item-selected true/false 选中
     */
    private Boolean itemSelected ;

    /**
     * children  true/false 是否有子节点
     */
    private Boolean children ;

    private Boolean isRoot;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }



    public Integer getChildcount() {
        return childcount;
    }

    public void setChildcount(Integer childcount) {
        this.childcount = childcount;
    }

    public String getDatatype() {
        return datatype;
    }

    public void setDatatype(String datatype) {
        this.datatype = datatype;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Boolean getChildren() {
        return children;
    }

    public void setChildren(Boolean children) {
        this.children = children;
    }

    public Boolean getItemSelected() {
        return itemSelected;
    }

    public void setItemSelected(Boolean itemSelected) {
        this.itemSelected = itemSelected;
    }

    public Boolean getIsRoot() {
        return isRoot;
    }

    public void setIsRoot(Boolean isRoot) {
        this.isRoot = isRoot;
    }
}
