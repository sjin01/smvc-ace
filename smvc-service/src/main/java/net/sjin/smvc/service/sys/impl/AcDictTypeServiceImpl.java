package net.sjin.smvc.service.sys.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import net.sjin.smvc.api.sys.AcDictType;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.sys.AcDictTypeService;

@Service
public class AcDictTypeServiceImpl extends BaseServiceImpl<AcDictType> implements AcDictTypeService {

	@Override
	public List<AcDictType> getAllDictType() {
		return (List<AcDictType>)sqlSessionTemplate.selectList(getNamespace()+".getAllDictType");
	}
	
}