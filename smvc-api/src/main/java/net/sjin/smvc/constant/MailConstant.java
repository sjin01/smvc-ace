package net.sjin.smvc.constant;

public interface MailConstant {
	
	/**
	 * 0：草稿箱；
	 */
	public static final Integer MAIL_BOX_TYPE_DRAFT = 0;
	
	/**
	 *1：发件箱；
	 */
    public static final Integer MAIL_BOX_TYPE_SEND = 1;
    
	/**
	 * 2：收件箱
	 */
    public static final Integer MAIL_BOX_TYPE_RECEIVE = 2;
    
    
	/**
	 *1：接收人（发送给）
	 */
    public static final Integer MAIL_USER_TYPE_RECEIVE = 1;
    
    /**
     * ；2：被抄送人（抄送给）
     */
    public static final Integer MAIL_USER_TYPE_RECEIVE_COPY = 2;
    
}
