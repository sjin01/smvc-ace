package net.hunanst.eduz100.api.common;

import java.io.Serializable;

/**
 * 这是一个临时类，请不要做数据存储
 * 
 * @author zhangcong
 */
public class Dual implements Serializable {

	public static final String OPERATION_SELECT = "select";
	public static final String OPERATION_UPDATE = "update";
	public static final String OPERATION_INSERT = "insert";
	public static final String OPERATION_DELETE = "delete";

	/**
	 * 要查询的id
	 */
	private String id;

	/**
	 * 父页面的请求路径
	 */
	private String pathname;

	/**
	 * 操作类型，其值是上面定义的常量
	 */
	private String operationtype;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPathname() {
		return pathname;
	}

	public void setPathname(String pathname) {
		this.pathname = pathname;
	}

	public String getOperationtype() {
		return operationtype;
	}

	public void setOperationtype(String operationtype) {
		this.operationtype = operationtype;
	}

	/**
	 * 如果是查询操作，则在在表单控件上添加“readonly”属性
	 * 
	 * @return
	 */
	public String getReadonly() {
		return OPERATION_SELECT.equals(operationtype) ? "readonly" : "";
	}

	/**
	 * 如果是查询操作，则在在表单控件上添加“disabled”属性
	 * 
	 * @return
	 */
	public String getDisabled() {
		return OPERATION_SELECT.equals(operationtype) ? "disabled" : "";
	}

	/**
	 * 如果是查询操作，则在“保存”按钮上添加“hidden”样式
	 * 
	 * @return
	 */
	public String getHidden() {
		return OPERATION_SELECT.equals(operationtype) ? "hidden" : "";
	}

	/**
	 * 如果是查询操作，则在“保存”按钮上添加“hide”样式
	 * 
	 * @return
	 */
	public String getHide() {
		return OPERATION_SELECT.equals(operationtype) ? "hide" : "";
	}

	/**
	 * 如果不是查询操作，“取消”按钮的文字改变为“返回”
	 * 
	 * @return
	 */
	public String getGoback() {
		return OPERATION_SELECT.equals(operationtype) ? "返回" : "取消";
	}
	
	/**
	 * 得到操作类型的中文名称
	 * 
	 * @return
	 */
	public String getOperationname() {
		if (OPERATION_SELECT.equals(operationtype)) {
			return "查看";
		}else if(OPERATION_DELETE.equals(operationtype)){
			return "删除";
		}else if(OPERATION_INSERT.equals(operationtype)){
			return "添加";
		}else if(OPERATION_UPDATE.equals(operationtype)){
			return "修改";
		}else {
			return "";
		}
	}
}
