package net.hunanst.eduz100.service.sys;

import java.util.List;

import net.hunanst.eduz100.api.sys.AcOperOrgRelation;
import net.hunanst.eduz100.service.BaseService;

public interface AcOperOrgRelationService extends BaseService<AcOperOrgRelation> {

	int saverelation(List<AcOperOrgRelation> list);

	List<AcOperOrgRelation> getrelation(int operid);
    
}