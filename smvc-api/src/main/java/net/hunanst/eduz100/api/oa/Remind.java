package net.hunanst.eduz100.api.oa;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:  提醒记录表  model
 * 创建日期: 1/19  10:23
 *
 * @author: guanshj QQ: 928990049
 */
public class Remind implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 1：手机短信；2：系统短消息；3：两者都发
     */
    private Integer remindtype;

    private Integer operatoruserid;

    private Integer recipientuserid;

    private String content;

    /**
     * 1：发送成功；2：发送失败
     */
    private Integer status;

    /**
     * 数据类型：1：公文提醒；2：通知提醒
     */
    private Integer type;

    /**
     * 发送时间
     */
    private Date senddate;

    //param
    private String userids;

    //接受者姓名
    private String names;


    private String telnumber;

    private String smsid;

    public String getUserids() {
        return userids;
    }

    public void setUserids(String userids) {
        this.userids = userids;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRemindtype() {
        return remindtype;
    }

    public void setRemindtype(Integer remindtype) {
        this.remindtype = remindtype;
    }

    public Integer getOperatoruserid() {
        return operatoruserid;
    }

    public void setOperatoruserid(Integer operatoruserid) {
        this.operatoruserid = operatoruserid;
    }

    public Integer getRecipientuserid() {
        return recipientuserid;
    }

    public void setRecipientuserid(Integer recipientuserid) {
        this.recipientuserid = recipientuserid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getSenddate() {
        return senddate;
    }

    public void setSenddate(Date senddate) {
        this.senddate = senddate;
    }

    public String getTelnumber() {
        return telnumber;
    }

    public void setTelnumber(String telnumber) {
        this.telnumber = telnumber;
    }

    public String getSmsid() {
        return smsid;
    }

    public void setSmsid(String smsid) {
        this.smsid = smsid;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }
}
