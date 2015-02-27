package net.sjin.smvc.service.sys.impl;

import java.util.List;

import net.sjin.smvc.api.sys.AcFunc;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.sys.AcFuncService;
import org.springframework.stereotype.Service;

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