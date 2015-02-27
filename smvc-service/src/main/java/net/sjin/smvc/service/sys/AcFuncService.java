package net.sjin.smvc.service.sys;

import java.util.List;
import net.sjin.smvc.api.sys.AcFunc;
import net.sjin.smvc.service.BaseService;

public interface AcFuncService extends BaseService<AcFunc> {

	List<AcFunc> selectAll();

	int insertAndUpateSeq(AcFunc vo);

	int deleteAndChildren(AcFunc vo);

	List<AcFunc> selectFuncByOperid(Integer operid);

	List<AcFunc> selectFuncTreeByIds(List<String> funcids);

	List<AcFunc> selectByBelongOrg(int belongorgid);
}