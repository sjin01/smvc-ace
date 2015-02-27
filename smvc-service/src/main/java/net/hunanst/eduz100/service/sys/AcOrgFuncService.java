package net.hunanst.eduz100.service.sys;

import java.util.List;

import net.hunanst.eduz100.api.sys.AcOrg;
import net.hunanst.eduz100.api.sys.AcOrgFunc;
import net.hunanst.eduz100.service.BaseService;

public interface AcOrgFuncService extends BaseService<AcOrgFunc> {

	List<AcOrgFunc> selectByOrgid(int orgid);

	int savefuncrelation(List<AcOrgFunc> list);

	/**
	 * 批量设计机构与功能的关系
	 * @param deletelist 要删除的机构的list（不是主键的list）
	 * @param insertlist 要保存的AcOrgFunc实体类的list
	 * @return
	 */
	int saveByBatch(List<Integer> deletelist, List<AcOrgFunc> insertlist);

	int insertAuthByParentOrg(AcOrg vo);
    
}