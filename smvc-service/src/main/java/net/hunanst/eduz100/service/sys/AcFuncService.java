package net.hunanst.eduz100.service.sys;

import java.util.List;
import net.hunanst.eduz100.api.sys.AcFunc;
import net.hunanst.eduz100.service.BaseService;

public interface AcFuncService extends BaseService<AcFunc> {

	List<AcFunc> selectAll();

	int insertAndUpateSeq(AcFunc vo);

	int deleteAndChildren(AcFunc vo);

	List<AcFunc> selectFuncByOperid(Integer operid);

	List<AcFunc> selectFuncTreeByIds(List<String> funcids);

	List<AcFunc> selectByBelongOrg(int belongorgid);
}