package net.sjin.smvc.service.sys;

import java.util.List;

import net.sjin.smvc.api.sys.AcRoleFunc;
import net.sjin.smvc.service.BaseService;

public interface AcRoleFuncService extends BaseService<AcRoleFunc> {

	List<AcRoleFunc> selectByRole(int roleid);

	int savefuncrelation(List<AcRoleFunc> list);

	/**
	 * 批量保存角色和功能的关系
	 * @param deletelist 要删除的角色id（不是主键id） 的list
	 * @param insertlist 要保存的 AcRoleFunc 实体类的list
	 * @return
	 */
	int saveByBatch(List<Integer> deletelist, List<AcRoleFunc> insertlist);
    
}