package net.sjin.smvc.api.sys;

import java.io.Serializable;
import net.sjin.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author zhangcong
 */
public class AcOrg extends AdvancedPage implements Serializable {
    /**
     * 组织机构ID
     */
    private Integer id;

    /**
     * 组织机构名称
     */
    private String orgname;

    /**
     * 机构全程 各级父机构名称拼接
            长沙-岳麓区-拓维
            根机构就是自己的名称
     */
    private String orgfullname;

    /**
     * 父机构ID 0 表示自己是根机构
     */
    private Integer parentid;

    /**
     * 机构id序号 是各级父节点ID+横杆拼接的字符串
            0-12-333
            根机构本字段为0
     */
    private String orgseq;

    /**
     * 排序编号，即显示的顺序
     */
    private Integer sortid;

    private Integer belongorgid;

    /* view s */
    private Integer childcount;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrgname() {
        return orgname;
    }

    public void setOrgname(String orgname) {
        this.orgname = orgname;
    }

    public String getOrgfullname() {
        return orgfullname;
    }

    public void setOrgfullname(String orgfullname) {
        this.orgfullname = orgfullname;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getOrgseq() {
        return orgseq;
    }

    public void setOrgseq(String orgseq) {
        this.orgseq = orgseq;
    }

    public Integer getSortid() {
        return sortid;
    }

    public void setSortid(Integer sortid) {
        this.sortid = sortid;
    }

    public Integer getChildcount() {
        return childcount;
    }

    public void setChildcount(Integer childcount) {
        this.childcount = childcount;
    }

	public Integer getBelongorgid() {
		return belongorgid;
	}

	public void setBelongorgid(Integer belongorgid) {
		this.belongorgid = belongorgid;
	}
}