package net.hunanst.eduz100.interceptor;

import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.hunanst.eduz100.api.sys.AcFunc;
import net.hunanst.eduz100.api.sys.AcOperator;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * @see spring mvc 的拦截器：
 * 1. preHandle方法最先被执行，return true 则继续往下执行， 否则直接返回。
 * 2. 业务处理完成后，执行postHandle方法
 * 3. 最后执行afterCompletion方法
 * 
 * @author zhangcong
 */
public class SecurityInterceptor implements HandlerInterceptor {

	private final String X_REQUESTED_WITH = "X-Requested-With";
	private Logger log = Logger.getLogger(this.getClass());

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		String contextPath = request.getContextPath();
		String uri = request.getRequestURI();
		System.err.println(contextPath);
		System.err.println(uri);
		
		// 登录、登出、首页、静态资源直接放行
		if(uri.matches(contextPath+"/static/?(/.*)?")
				|| uri.equals(contextPath+"/")
				|| uri.equals(contextPath+"/index")
				|| uri.equals(contextPath+"/login")
				|| uri.equals(contextPath+"/logout")){
			return true;
		}
		
		HttpSession session = request.getSession();
		ServletContext context = session.getServletContext();
		AcOperator loginuser = (AcOperator)session.getAttribute("loginUser");
		
		// 用户未登录，禁止访问
		if(loginuser==null){
			if( request.getHeader(X_REQUESTED_WITH) != null || request.getParameter(X_REQUESTED_WITH) != null ){
				// 异步请求
				response.setStatus(301);
				PrintWriter out = response.getWriter();
	    		out.write("登录超时；请重新登录！");
	    		out.flush();
	    		out.close();
			}else{
				// 同步请求
	    		response.sendRedirect(contextPath+"/index");
			}
			return false;
		}
		
		// 超级管理员直接放行
		if("admin".equals(loginuser.getUsercode())){
			return true;
		}
		
		// 普通用户登录后，已配置为功能菜单
		List<AcFunc> authfuncs = (List<AcFunc>)session.getAttribute("authfuncs");
		for (AcFunc acFunc : authfuncs) {
			if(uri.equals(contextPath + acFunc.getFuncaction())){
				if(acFunc.getAllowable()){ // 有权限访问的请求直接放行
					return true;
				}else{
					if( request.getHeader(X_REQUESTED_WITH) != null || request.getParameter(X_REQUESTED_WITH) != null ){
						// 异步请求
						response.setStatus(405);
						PrintWriter out = response.getWriter();
			    		out.write("您无权访问该页面！");
			    		out.flush();
			    		out.close();
					}else{
						// 同步请求
						response.sendRedirect(contextPath+"/error-405.html");
					}
					return false;
				}
			}
		}
		
		return true;
	}
}