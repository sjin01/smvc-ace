package net.sjin.smvc.service.sys;

import java.util.List;
import net.sjin.smvc.api.sys.AcDictType;
import net.sjin.smvc.service.BaseService;

public interface AcDictTypeService extends BaseService<AcDictType> {
	
    List<AcDictType> getAllDictType();
    
}