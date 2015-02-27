package net.sjin.smvc.api.oa;

import net.sjin.common.util.mybatis.pagination.AdvancedPage;

import java.io.Serializable;

/**
 * Title: 盛通-教育信息服务平台
 * Description:   公章
 * 创建日期:2015-01-22
 * @author guanshijing  QQ:928990049
 */
public class Seal extends AdvancedPage implements Serializable {
    private Integer id;

    /**
     * 文件保存服务器相对路径
     */
    private String filepath;

    /**
     * 文件名
     */
    private String filename;

    /**
     * 备忘或关键字
     */
    private String keytext;

    /**
     * 用户id
     */
    private Integer userid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getKeytext() {
        return keytext;
    }

    public void setKeytext(String keytext) {
        this.keytext = keytext;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}