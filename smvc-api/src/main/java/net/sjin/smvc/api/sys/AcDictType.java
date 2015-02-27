package net.sjin.smvc.api.sys;

import java.io.Serializable;
import java.util.List;
import net.sjin.common.util.mybatis.pagination.AdvancedPage;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author zhangcong
 */
public class AcDictType extends AdvancedPage implements Serializable {
    /**
     * 字典类别ID
     */
    private Integer id;

    /**
     * 字典类别名称
     */
    private String tname;

    /**
     * 字典类别代码
     */
    private String tcode;

    /**
     * 排序编号，即显示的顺序
     */
    private Integer sortid;

    /**
     * 备注说明
     */
    private String memo;
    
	private List<AcDict> dicts;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTcode() {
        return tcode;
    }

    public void setTcode(String tcode) {
        this.tcode = tcode;
    }

    public Integer getSortid() {
        return sortid;
    }

    public void setSortid(Integer sortid) {
        this.sortid = sortid;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
    
    public List<AcDict> getDicts() {
		return dicts;
	}

	public void setDicts(List<AcDict> dicts) {
		this.dicts = dicts;
	}
}