package net.sjin.smvc.listener;

import java.io.InputStream;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class CustomerServletContextListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		ServletContext context = arg0.getServletContext();
		context.setAttribute("contextPath", context.getContextPath());
		
		try {
			InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("conf/globe.properties");
			
			Properties prop = new Properties();
			prop.load(is);
			Set<Entry<Object, Object>> iterator = prop.entrySet();
            for (Entry<Object, Object> entry : iterator) {
                context.setAttribute(entry.getKey().toString(), entry.getValue().toString());
			}
			
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("conf/nginx.properties");

			Properties prop = new Properties();
			prop.load(is);
			Set<Entry<Object, Object>> iterator = prop.entrySet();
			for (Entry<Object, Object> entry : iterator) {
				context.setAttribute(entry.getKey().toString(), entry.getValue().toString());
			}

			is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
