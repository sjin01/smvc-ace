package net.hunanst.eduz100.service.sys.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import net.hunanst.eduz100.api.sys.AcFunc;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.sys.AcFuncService;

@Service
public class AcFuncServiceImpl extends BaseServiceImpl<AcFunc> implements AcFuncService {

	@Override
	public List<AcFunc> selectAll() {
		return (List<AcFunc>)this.sqlSessionTemplate.selectList(getNamespace()+".selectAll");
	}

	@Override
	public int insertAndUpateSeq(AcFunc vo) {
		int result = this.insert(vo);
		if(result > 0){
			sqlSessionTemplate.update(getNamespace()+".updateSeq", vo);
		}
		return result;
	}

	@Override
	public int deleteAndChildren(AcFunc vo) {
		return sqlSessionTemplate.delete(getNamespace()+".deleteAndChildren", vo);
	}

	@Override
	public List<AcFunc> selectFuncByOperid(Integer operid) {
		return (List<AcFunc>)this.sqlSessionTemplate.selectList(getNamespace()+".selectFuncByOperid", operid);
	}

	@Override
	public List<AcFunc> selectFuncTreeByIds(List<String> funcids) {
		return (List<AcFunc>)this.sqlSessionTemplate.selectList(getNamespace()+".selectFuncTreeByIds", funcids);
	}

	@Override
	public List<AcFunc> selectByBelongOrg(int belongorgid) {
		return (List<AcFunc>)this.sqlSessionTemplate.selectList(getNamespace()+".selectByBelongOrg", belongorgid);
	}
}