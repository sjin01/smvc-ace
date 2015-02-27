package net.sjin.smvc.service.sys;

import java.util.List;

import net.sjin.smvc.api.sys.AcOperOrgRelation;
import net.sjin.smvc.service.BaseService;

public interface AcOperOrgRelationService extends BaseService<AcOperOrgRelation> {

	int saverelation(List<AcOperOrgRelation> list);

	List<AcOperOrgRelation> getrelation(int operid);
    
}