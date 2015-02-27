package net.sjin.smvc.api.oa;

import net.sjin.common.util.mybatis.pagination.AdvancedPage;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Title: 盛通-教育信息服务平台
 * Description:
 * 创建日期:2014-12-09
 * @author guanshijing  QQ:928990049
 */
public class Notification extends AdvancedPage implements Serializable {
    private Integer id;

    private Integer userid;

    private Integer orgid;

    private String content;

    /**
     * 0：不展示到门户；1：展示到门户
     */
    private Integer viewflag;

    private Date times;

    private String timeStr;

    private String title;


    /**
     * jedis推送服务用到的参数
     */
    //外键  其实就是表主键
    private String noticeSeq;
    //接收信息者id
    private String receiverSeq;

    private static final long serialVersionUID = 1L;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getId() {
        if(id!=null&&id<0){
            id=null;
        }
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getOrgid() {
        return orgid;
    }

    public void setOrgid(Integer orgid) {
        this.orgid = orgid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getViewflag() {
        return viewflag;
    }

    public void setViewflag(Integer viewflag) {
        this.viewflag = viewflag;
    }

    public Date getTimes() {
        return times;
    }

    public void setTimes(Date times) {
        this.times = times;
    }


    public String getTimeStr() {

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        timeStr=sdf.format(times);
        return timeStr;
    }

    public void setTimeStr(String timeStr) {
        this.timeStr = timeStr;
    }

    public String getNoticeSeq() {
        return noticeSeq;
    }

    public void setNoticeSeq(String noticeSeq) {
        this.noticeSeq = noticeSeq;
    }

    public String getReceiverSeq() {
        return receiverSeq;
    }

    public void setReceiverSeq(String receiverSeq) {
        this.receiverSeq = receiverSeq;
    }
}