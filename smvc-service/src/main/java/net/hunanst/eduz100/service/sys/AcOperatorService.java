package net.hunanst.eduz100.service.sys;

import java.util.List;
import net.hunanst.eduz100.service.BaseService;
import net.hunanst.eduz100.api.sys.AcApp;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.api.sys.vo.AcOperatorVo;

public interface AcOperatorService extends BaseService<AcOperator> {
    
	List<AcOperator> selectByCondition(AcOperator vo);

	List<AcOperator> selectByConditionPage(AcOperatorVo vo);

	int deletes(List<Integer> ids);

	/**
	 * 获取成员列表
	 * @param id
	 * @return
	 */
	List<AcOperator> getMessageMembers(Integer id);

    /**
     * 根据通知id  通过部门 找到相关联的人员
     * @param notid
     * @return
     */
    List<AcOperator> selectByNotid(Integer notid) throws Exception;
	
}