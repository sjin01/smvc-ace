package net.hunanst.eduz100.service.sys.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import net.hunanst.eduz100.api.sys.AcOperRole;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.sys.AcOperRoleService;

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