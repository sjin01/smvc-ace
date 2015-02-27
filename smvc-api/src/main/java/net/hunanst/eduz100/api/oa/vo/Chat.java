package net.hunanst.eduz100.api.oa.vo;

import net.hunanst.common.util.mybatis.pagination.AdvancedPage;
import net.hunanst.eduz100.api.oa.AddressBook;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-2-6
 * Time: 上午11:05
 * To change this template use File | Settings | File Templates.
 */
public class Chat extends AdvancedPage implements Serializable {
    /**
     * message id
     */
    private Integer id;

    private Integer addresser;

    private String addressername;

    private Integer recipient;

    private String recipientname;

    private String content;

    private java.util.Date date;

    private String dateStr;

    //param
    private String condition;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAddresser() {
        return addresser;
    }

    public void setAddresser(Integer addresser) {
        this.addresser = addresser;
    }

    public String getAddressername() {
        return addressername;
    }

    public void setAddressername(String addressername) {
        this.addressername = addressername;
    }

    public Integer getRecipient() {
        return recipient;
    }

    public void setRecipient(Integer recipient) {
        this.recipient = recipient;
    }

    public String getRecipientname() {
        return recipientname;
    }

    public void setRecipientname(String recipientname) {
        this.recipientname = recipientname;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDateStr() {
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }
}
