package net.hunanst.eduz100.service.sys;

import java.util.List;
import net.hunanst.eduz100.api.sys.AcRole;
import net.hunanst.eduz100.api.sys.vo.AcRoleVo;
import net.hunanst.eduz100.service.BaseService;

public interface AcRoleService extends BaseService<AcRole> {

	List<AcRoleVo> selectByConditionPage(AcRole vo);

	int deletes(List<Integer> ids);

	List<AcRoleVo> selectAll(int operid);

	List<AcRole> selectBatchByPrimaryKey(List list);
    
}