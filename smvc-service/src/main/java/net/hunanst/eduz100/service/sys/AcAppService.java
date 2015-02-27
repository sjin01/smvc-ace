package net.hunanst.eduz100.service.sys;

import java.util.List;
import net.hunanst.eduz100.api.sys.AcApp;
import net.hunanst.eduz100.service.BaseService;

public interface AcAppService extends BaseService<AcApp> {
    
	List<AcApp> selectByConditionPage(AcApp vo);

	int deletes(List ids);

	List<AcApp> selectAll();
}