package net.hunanst.eduz100.service.sys.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import net.hunanst.eduz100.api.sys.AcDictType;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.sys.AcDictTypeService;

@Service
public class AcDictTypeServiceImpl extends BaseServiceImpl<AcDictType> implements AcDictTypeService {

	@Override
	public List<AcDictType> getAllDictType() {
		return (List<AcDictType>)sqlSessionTemplate.selectList(getNamespace()+".getAllDictType");
	}
	
}