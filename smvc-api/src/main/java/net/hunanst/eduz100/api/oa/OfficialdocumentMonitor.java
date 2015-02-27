package net.hunanst.eduz100.api.oa;

import net.hunanst.common.util.mybatis.pagination.AdvancedPage;

import java.io.Serializable;

/**
 * Title: 盛通-教育信息服务平台
 * Description:  公文流程 跟踪监视
 * 创建日期:2014-12-18
 * @author guanshijing  QQ:928990049
 */
public class OfficialdocumentMonitor extends AdvancedPage implements Serializable {
    private Integer id;

    private Integer officialdocumentid;

    private Integer userid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOfficialdocumentid() {
        return officialdocumentid;
    }

    public void setOfficialdocumentid(Integer officialdocumentid) {
        this.officialdocumentid = officialdocumentid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}