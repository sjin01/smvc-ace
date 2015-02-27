package net.sjin.smvc.service.sys;

import java.util.List;

import net.sjin.smvc.api.sys.AcOperRole;
import net.sjin.smvc.service.BaseService;

public interface AcOperRoleService extends BaseService<AcOperRole> {

	int saverelation(List<AcOperRole> list);

	List<AcOperRole> getrelation(int operid);
    
}