package net.sjin.smvc.service.sys.impl;

import java.util.List;

import net.sjin.smvc.api.sys.AcOrg;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.sys.AcOrgFuncService;
import org.springframework.stereotype.Service;

import net.sjin.smvc.api.sys.AcOrgFunc;

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