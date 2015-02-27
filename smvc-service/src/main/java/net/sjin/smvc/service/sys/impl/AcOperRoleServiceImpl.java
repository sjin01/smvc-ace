package net.sjin.smvc.service.sys.impl;

import java.util.List;

import net.sjin.smvc.api.sys.AcOperRole;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.sys.AcOperRoleService;
import org.springframework.stereotype.Service;

@Service
public class AcOperRoleServiceImpl extends BaseServiceImpl<AcOperRole> implements AcOperRoleService {

	@Override
	public int saverelation(List<AcOperRole> list) {
		int result = this.sqlSessionTemplate.delete(getNamespace()+".deleteByOperid", list.get(0));
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getRoleid()!=null){
				result += this.insert(list.get(i));
			}
		}
		return result;
	}

	@Override
	public List<AcOperRole> getrelation(int operid) {
		return (List<AcOperRole>)sqlSessionTemplate.selectList(getNamespace()+".getrelation", operid);
	}
	
}