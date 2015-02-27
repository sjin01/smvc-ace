package net.hunanst.eduz100.service.sys;

import java.util.List;

import net.hunanst.eduz100.api.sys.AcOperRole;
import net.hunanst.eduz100.service.BaseService;

public interface AcOperRoleService extends BaseService<AcOperRole> {

	int saverelation(List<AcOperRole> list);

	List<AcOperRole> getrelation(int operid);
    
}