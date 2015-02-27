package net.hunanst.eduz100.service.sys;

import java.util.List;

import net.hunanst.eduz100.api.sys.AcRoleFunc;
import net.hunanst.eduz100.service.BaseService;

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