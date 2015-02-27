package net.hunanst.eduz100.service.sys.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import net.hunanst.eduz100.api.sys.AcOperOrgRelation;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.sys.AcOperOrgRelationService;

@Service
public class AcOperOrgRelationServiceImpl extends BaseServiceImpl<AcOperOrgRelation> implements AcOperOrgRelationService {

	@Override
	public int saverelation(List<AcOperOrgRelation> list) {
		int result = this.sqlSessionTemplate.delete(getNamespace()+".deleteByOperid", list.get(0));
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getOrgid()!=null){
				result += this.insert(list.get(i));
			}
		}
		return result;
	}

	@Override
	public List<AcOperOrgRelation> getrelation(int operid) {
		return (List<AcOperOrgRelation>)sqlSessionTemplate.selectList(getNamespace()+".getrelation", operid);
	}
}