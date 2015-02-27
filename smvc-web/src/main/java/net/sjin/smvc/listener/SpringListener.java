package net.sjin.smvc.listener;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import net.sjin.smvc.api.sys.AcDictType;
import net.sjin.smvc.service.sys.AcDictTypeService;
import net.sjin.smvc.service.sys.impl.AcDictTypeServiceImpl;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.web.context.WebApplicationContext;

public class SpringListener implements ApplicationListener<ContextRefreshedEvent> {

	public void onApplicationEvent(ContextRefreshedEvent event) {
		
		WebApplicationContext applicationContext = (WebApplicationContext)event.getApplicationContext();
		ServletContext servletContext = applicationContext.getServletContext();
		
		if(servletContext.getAttribute("sysdicts")==null){
			AcDictTypeService bean = event.getApplicationContext().getBean(AcDictTypeServiceImpl.class);
			List<AcDictType> types = bean.getAllDictType();
			
			Map<String, AcDictType> sysdicts = new HashMap<String, AcDictType>();
			for (AcDictType acDictType : types) {
				sysdicts.put(acDictType.getTcode(), acDictType);
			}
			servletContext.setAttribute("sysdicts", sysdicts);
		}
		
	}
}
