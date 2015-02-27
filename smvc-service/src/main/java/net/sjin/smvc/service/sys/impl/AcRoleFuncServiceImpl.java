package net.sjin.smvc.service.sys.impl;

import java.util.List;

import net.sjin.smvc.api.sys.AcRoleFunc;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import net.sjin.smvc.service.sys.AcRoleFuncService;

@Service
@SuppressWarnings("unchecked")
public class AcRoleFuncServiceImpl extends BaseServiceImpl<AcRoleFunc> implements AcRoleFuncService {

	@Override
	public List<AcRoleFunc> selectByRole(int roleid) {
		return (List<AcRoleFunc>)sqlSessionTemplate.selectList(getNamespace()+".selectByRole", roleid);
	}

	@Override
	public int savefuncrelation(List<AcRoleFunc> list) {
		int result = this.sqlSessionTemplate.delete(getNamespace()+".deleteByRoleid", list.get(0));
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getFuncid()!=null){
				result += this.insert(list.get(i));
			}
		}
		return result;
	}

	@Override
	public int saveByBatch(List<Integer> deletelist, List<AcRoleFunc> insertlist) {
		if(deletelist.size()>0)
			this.sqlSessionTemplate.delete(getNamespace()+".deleteByRoleids", deletelist);
		if(insertlist.size()>0)
			return this.sqlSessionTemplate.insert(getNamespace()+".insertByBatch", insertlist);
		return 1;
	}
	
}