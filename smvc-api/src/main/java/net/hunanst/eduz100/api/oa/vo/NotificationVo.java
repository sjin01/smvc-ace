package net.hunanst.eduz100.api.oa.vo;

import net.hunanst.eduz100.api.oa.Notification;
import net.hunanst.eduz100.api.oa.NotificationFile;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.api.sys.AcOrg;

import java.io.Serializable;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 14-12-24
 * Time: 下午2:20
 * To change this template use File | Settings | File Templates.
 */
public class NotificationVo extends Notification implements Serializable {

    private List<Integer> selectorg;

    private Integer recipient;

    private List<NotificationFileVo> notificationFile;

    private List<Integer> fileIdList;

    private List<AcOrg> receives;

    /**
     * 发送提醒时的提醒内容
     */
    private String extracontent;

    /**
     *发送提醒时的提醒前缀
     */
    private String head;

    private String username;

    private String orgname;

    private Integer isread;

    /**
     * 1 手机短信 2短消息 3 包括1和2
     */
    private Integer sendtype;

    /**
     *  1：公文提醒；2：通知提醒;3:未提交数据提醒
     * 提醒文件类型
     * @return
     */
    private Integer remindtype;

    /**
     * para
     * @return
     */
    private Integer limit;

    private String condition;

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public Integer getRemindtype() {
        return remindtype;
    }

    public void setRemindtype(Integer remindtype) {
        this.remindtype = remindtype;
    }

    public Integer getSendtype() {
        return sendtype;
    }

    public void setSendtype(Integer sendtype) {
        this.sendtype = sendtype;
    }

    public List<AcOrg> getReceives() {
        return receives;
    }

    public void setReceives(List<AcOrg> receives) {
        this.receives = receives;
    }

    public Integer getIsread() {
        return isread;
    }

    public void setIsread(Integer isread) {
        this.isread = isread;
    }

    public Integer getRecipient() {
        return recipient;
    }

    public void setRecipient(Integer recipient) {
        this.recipient = recipient;
    }

    public List<Integer> getSelectorg() {
        return selectorg;
    }

    public void setSelectorg(List<Integer> selectorg) {
        this.selectorg = selectorg;
    }


    public String getExtracontent() {
        return extracontent;
    }

    public void setExtracontent(String extracontent) {
        this.extracontent = extracontent;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOrgname() {
        return orgname;
    }

    public void setOrgname(String orgname) {
        this.orgname = orgname;
    }

    public List<NotificationFileVo> getNotificationFile() {
        return notificationFile;
    }

    public void setNotificationFile(List<NotificationFileVo> notificationFile) {
        this.notificationFile = notificationFile;
    }

    public List<Integer> getFileIdList() {
        return fileIdList;
    }

    public void setFileIdList(List<Integer> fileIdList) {
        this.fileIdList = fileIdList;
    }
}
