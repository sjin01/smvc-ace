package net.sjin.smvc.service.sys;

import java.util.List;
import net.sjin.smvc.api.sys.AcRole;
import net.sjin.smvc.api.sys.vo.AcRoleVo;
import net.sjin.smvc.service.BaseService;

public interface AcRoleService extends BaseService<AcRole> {

	List<AcRoleVo> selectByConditionPage(AcRole vo);

	int deletes(List<Integer> ids);

	List<AcRoleVo> selectAll(int operid);

	List<AcRole> selectBatchByPrimaryKey(List list);
    
}