package net.hunanst.eduz100.service.sys.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import net.hunanst.eduz100.api.sys.AcOrg;
import net.hunanst.eduz100.api.sys.AcOrgFunc;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.sys.AcOrgFuncService;

@Service
@SuppressWarnings("unchecked")
public class AcOrgFuncServiceImpl extends BaseServiceImpl<AcOrgFunc> implements AcOrgFuncService {

	@Override
	public List<AcOrgFunc> selectByOrgid(int orgid) {
		return (List<AcOrgFunc>)sqlSessionTemplate.selectList(getNamespace()+".selectByOrgid", orgid);
	}

	@Override
	public int savefuncrelation(List<AcOrgFunc> list) {
		int result = this.sqlSessionTemplate.delete(getNamespace()+".deleteByOrgid", list.get(0));
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getFuncid()!=null){
				result += this.insert(list.get(i));
			}
		}
		return result;
	}

	@Override
	public int saveByBatch(List<Integer> deletelist, List<AcOrgFunc> insertlist) {
		if(deletelist.size()>0)
			this.sqlSessionTemplate.delete(getNamespace()+".deleteByOrgids", deletelist);
		if(insertlist.size()>0)
			return this.sqlSessionTemplate.insert(getNamespace()+".insertByBatch", insertlist);
		return 1;
	}

	@Override
	public int insertAuthByParentOrg(AcOrg vo) {
		return this.sqlSessionTemplate.insert(getNamespace()+".insertAuthByParentOrg", vo);
	}
	
}