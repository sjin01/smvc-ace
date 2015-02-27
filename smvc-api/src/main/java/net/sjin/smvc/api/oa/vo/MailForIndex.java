package net.sjin.smvc.api.oa.vo;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-27
 * Time: 下午2:24
 * To change this template use File | Settings | File Templates.
 */
public class MailForIndex implements Serializable {
    /**
     * 邮件id
     */
    private Integer id;

    /**
     * 邮件title
     */
    private String title;

    /**
     * 邮件发送者id
     */
    private Integer sender;

    /**
     *邮件发送者
     */
    private String sendername;

    /**
     * 头像地址
     */
    private String imgurl;

    /**
     * 邮件内容
     */
    private String content;

    /**
     * 接收者姓名
     */
    private String username;

    /**
     * 发送日期
     */
    private Date senddate;

    private String senddateStr;

    /**
     * 创建日期
     */
    private Date createdate;

    private String createdateStr;

    //param
    private Integer limit;
    /**
     * 接受者id
     */
    private Integer userid;


    public Integer getSender() {
        return sender;
    }

    public void setSender(Integer sender) {
        this.sender = sender;
    }

    public String getSendername() {
        return sendername;
    }

    public void setSendername(String sendername) {
        this.sendername = sendername;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getSenddate() {
        return senddate;
    }

    public void setSenddate(Date senddate) {
        this.senddate = senddate;
    }

    public String getSenddateStr() {
        if(senddate!=null){
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            senddateStr=sdf.format(senddate);
        }
        return senddateStr;
    }

    public void setSenddateStr(String senddateStr) {
        this.senddateStr = senddateStr;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getCreatedateStr() {
        if(createdate!=null){
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            createdateStr=sdf.format(createdate);
        }
        return createdateStr;
    }

    public void setCreatedateStr(String createdateStr) {
        this.createdateStr = createdateStr;
    }
}
