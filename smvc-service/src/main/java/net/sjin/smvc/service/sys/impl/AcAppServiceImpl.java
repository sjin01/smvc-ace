package net.sjin.smvc.service.sys.impl;

import java.util.List;

import net.sjin.smvc.api.sys.AcApp;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.sys.AcAppService;
import org.springframework.stereotype.Service;

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