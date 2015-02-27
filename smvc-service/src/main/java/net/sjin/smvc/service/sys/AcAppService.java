package net.sjin.smvc.service.sys;

import java.util.List;
import net.sjin.smvc.api.sys.AcApp;
import net.sjin.smvc.service.BaseService;

public interface AcAppService extends BaseService<AcApp> {
    
	List<AcApp> selectByConditionPage(AcApp vo);

	int deletes(List ids);

	List<AcApp> selectAll();
}