package net.sjin.smvc.service.sys.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import net.sjin.smvc.api.sys.AcOperOrgRelation;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.sys.AcOperOrgRelationService;

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