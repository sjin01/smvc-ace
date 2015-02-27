package net.hunanst.eduz100.service.sys.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import net.hunanst.eduz100.api.sys.AcApp;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.sys.AcAppService;

@Service
public class AcAppServiceImpl extends BaseServiceImpl<AcApp> implements AcAppService {

	@Override
	public List<AcApp> selectByConditionPage(AcApp vo) {
		return (List<AcApp>)sqlSessionTemplate.selectList(getNamespace()+".selectCondition_page", vo);
	}

	@Override
	public int deletes(List ids) {
		return sqlSessionTemplate.delete(getNamespace()+".deletes", ids);
	}

	@Override
	public List<AcApp> selectAll() {
		return (List<AcApp>)sqlSessionTemplate.selectList(getNamespace()+".selectAll");
	}
	
}