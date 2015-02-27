package net.hunanst.eduz100.service.sys;

import java.util.List;
import net.hunanst.eduz100.api.sys.AcDictType;
import net.hunanst.eduz100.service.BaseService;

public interface AcDictTypeService extends BaseService<AcDictType> {
	
    List<AcDictType> getAllDictType();
    
}