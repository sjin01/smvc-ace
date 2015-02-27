package net.hunanst.eduz100.service.sys.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import net.hunanst.eduz100.api.sys.AcRole;
import net.hunanst.eduz100.api.sys.vo.AcRoleVo;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.sys.AcRoleService;

@Service
@SuppressWarnings("unchecked")
public class AcRoleServiceImpl extends BaseServiceImpl<AcRole> implements AcRoleService {

	@Override
	public List<AcRoleVo> selectByConditionPage(AcRole vo) {
		return (List<AcRoleVo>)sqlSessionTemplate.selectList(getNamespace()+".selectCondition_page", vo);
	}

	@Override
	public int deletes(List<Integer> ids) {
		int result = sqlSessionTemplate.delete(getNamespace()+".deletes", ids);
		if(result>0) sqlSessionTemplate.delete(getNamespace()+".deleteRelationWithFunc", ids);
		return result;
	}

	@Override
	public List<AcRoleVo> selectAll(int operid) {
		return (List<AcRoleVo>)sqlSessionTemplate.selectList(getNamespace()+".selectAll", operid);
	}

	@Override
	public List<AcRole> selectBatchByPrimaryKey(List list) {
		return (List<AcRole>)sqlSessionTemplate.selectList(getNamespace()+".selectBatchByPrimaryKey", list);
	}
	
}