package net.hunanst.eduz100.service.sys;

import java.util.List;

import net.hunanst.eduz100.api.sys.AcOrg;
import net.hunanst.eduz100.api.sys.vo.AcOrgVo;
import net.hunanst.eduz100.dto.FueluxTreeVo;
import net.hunanst.eduz100.service.BaseService;

public interface AcOrgService extends BaseService<AcOrg> {

	List<AcOrg> selectByParentid(Integer pid);

	List<AcOrg> selectAll(AcOrg vo);

	int deleteAndChildren(AcOrg vo);

	int insertAndUpdateSeq(AcOrg vo);

	/**
	 * 为 FueluxTree 组装 数据 (组织机构树型菜单)
	 * @return
	 * @throws Exception
	 */
	List<FueluxTreeVo> getFueluxTreeData (Integer pid) throws Exception;

	/**
	 * 为 FueluxTree 组装 数据 (组织机构树型菜单 包括下面的用户数据)
	 * @return
	 * @throws Exception
	 */
	List<FueluxTreeVo> getOrgUserFueluxTreeData ( Integer pid , Integer deliverid , Integer delivertype ) throws Exception;

	/**
	 * 根据用户ID 查询所属的 一个或多个部门
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	List<AcOrg> selectByUserid (Integer userId) throws Exception;

	List<AcOrg> selectAllSchoolOrg();

	List<AcOrg> selectBatchByPrimaryKey(List list);

	int insertByTree(AcOrg rootorg, List<AcOrg> importList);

	Boolean checkOrgNameExisted(AcOrg vo);
}