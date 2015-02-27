package net.sjin.smvc.controller;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import net.sjin.smvc.api.common.Dual;
import org.springframework.web.bind.annotation.ModelAttribute;
import net.sjin.smvc.enumeration.ResponseCodeEnum;
import net.sjin.common.util.mybatis.pagination.AdvancedPage;

public abstract class BaseController {

	protected Dual dual;
	
	@ModelAttribute
	public Dual setDual(HttpServletRequest request, Dual dual) {
		//String cp = request.getContextPath();
		//String preUrl = request.getHeader("referer");
		//dual.setPathname(preUrl.substring(preUrl.indexOf(cp)));
		return this.dual = dual;
	}

	/**
	 * ajax请求成功
	 * 
	 * @return
	 */
	protected Map<String, Object> getSuccessfulResultMap() {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", ResponseCodeEnum.AJAX_SUCCESS.getCode());
		return resultMap;
	}

	/**
	 * ajax请求成功
	 * 
	 * @param data
	 *            返回的数据
	 * @return
	 */
	protected Map<String, Object> getSuccessfulResultMap(Object data) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", ResponseCodeEnum.AJAX_SUCCESS.getCode());
		resultMap.put("data", data);
		return resultMap;
	}

	/**
	 * ajax请求成功
	 * 
	 * @param page
	 *            分页的信息
	 * @param data
	 *            返回的数据
	 * @return
	 */
	protected Map<String, Object> getSuccessfulResultMap(Object page,
			Object data) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", ResponseCodeEnum.AJAX_SUCCESS.getCode());
		resultMap.put("data", data);
		resultMap.put("page", page);
		return resultMap;
	}

	/**
	 * ajax请求失败
	 * 
	 * @param enumeration
	 *            错误码的枚举类
	 * @return
	 */
	protected Map<String, Object> getFailedResultMap(
			ResponseCodeEnum enumeration) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", enumeration.getCode());
		resultMap.put("data", enumeration.getMessage());
		return resultMap;
	}

	/**
	 * ajax请求失败
	 * 
	 * @param enumeration
	 *            错误码的枚举类
	 * @param message
	 *            错误信息
	 * @return
	 */
	protected Map<String, Object> getFailedResultMap(
			ResponseCodeEnum enumeration, Object message) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", enumeration.getCode());
		resultMap.put("data", message);
		return resultMap;
	}

	/**
	 * ajax请求成功：为jquery datatable分页设置信息
	 * 
	 * @param data
	 *            返回的数据集合
	 * @param page
	 *            分页的信息
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map<String, Object> getSuccessResultMap4DataTable(Object data,
			Object page) {

		AdvancedPage advancedPage = null;
		if (page instanceof AdvancedPage) {
			advancedPage = (AdvancedPage) page;
		} else if (page instanceof Map) {
			Object realObj = ((Map) page).get("page");
			if (realObj == null) {
				throw new RuntimeException("map中没有page对象！");
			}
			if (!(realObj instanceof AdvancedPage)) {
				throw new RuntimeException("map中的page对象不是AdvancedPage类的实例！");
			}
			advancedPage = (AdvancedPage) realObj;
		} else {
			Class clazz = page.getClass();
			try {
				Method method = clazz.getMethod("getPage");
				Object realObj = method.invoke(page);
				if (!(realObj instanceof AdvancedPage)) {
					throw new RuntimeException(
							"getPage()方法的返回值不是AdvancedPage类的实例！");
				}
				advancedPage = (AdvancedPage) method.invoke(page);
			} catch (Exception e) {
				throw new RuntimeException("对象中没有getPage()方法！");
			}
		}

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("aaData", data);
		resultMap.put("sEcho", advancedPage.getsEcho());
		resultMap.put("iTotalRecords", advancedPage.getiTotalRecords());
		resultMap.put("iTotalDisplayRecords",
				advancedPage.getiTotalDisplayRecords());
		return resultMap;
	}
	
}