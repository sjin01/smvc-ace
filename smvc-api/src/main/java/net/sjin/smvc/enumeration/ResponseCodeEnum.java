package net.sjin.smvc.enumeration;

public enum ResponseCodeEnum {
	
	AJAX_SUCCESS(200, "请求成功"),
	AJAX_NO_AUTH(405, "没有访问权限"),
	AJAX_FAILURE(500, "请求失败"),
	AJAX_USERNAME_PASSWORD_ERROR(510, "用户名密码错误"),
	AJAX_USERNAME_ERROR(511, "用户不存在"),
	AJAX_PASSWORD_ERROR(512, "密码错误"),
	AJAX_FAILURE_REPECT(513, "不能添加自己到通讯录中"),
	AJAX_FAILURE_EXIST(514,"该用户已存在通讯录中"),
	AJAX_FAILURE_UNIQUE_KEY_CONFLICT(530, "数据库键值冲突");
	
	private int code;
    private String message;
	
	private ResponseCodeEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }

	public int getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}
	
}
