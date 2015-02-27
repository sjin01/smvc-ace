package net.hunanst.eduz100.listener;

import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * @author zhangcong
 */
public class CustomerHttpSessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// session超时后，向登录日志表里面插入用户登出的时间
		/*HttpSession session = arg0.getSession();
		if(session.getAttribute("loginlog_id")==null){
			return;
		}
		Integer loginlog_id = (Integer)session.getAttribute("loginlog_id");
		
		ServletContext servletContext = session.getServletContext();
		ApplicationContext applicationContext =  WebApplicationContextUtils.getWebApplicationContext(servletContext, "org.springframework.web.servlet.FrameworkServlet.CONTEXT.springmvc");
		LoginlogService loginlogService = (LoginlogService)applicationContext.getBean("loginlogServiceImpl");
		
		AcLoginlog acLoginlog = new AcLoginlog();
		acLoginlog.setId(loginlog_id);
		acLoginlog.setLogouttime(new Date());
		loginlogService.updateByPrimaryKeySelective(acLoginlog);*/
	}

}
