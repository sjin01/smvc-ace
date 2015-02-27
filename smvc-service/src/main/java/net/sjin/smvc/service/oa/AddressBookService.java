package net.sjin.smvc.service.oa;

import java.util.List;
import java.util.Map;

import net.sjin.smvc.api.oa.AddressBook;
import net.sjin.smvc.api.oa.vo.AddressBookVo;
import net.sjin.smvc.service.BaseService;

public interface AddressBookService extends BaseService<AddressBook> {
	
	/**
	 * 将系统用户加入到通讯录中
	 * @param owner  添加人（即操作人的操作员ID）
	 * @param operId   被添加人的操作员ID
	 * @return
	 */
	Integer addAddressBookByAcOperId(Integer owner,Integer operId);

	/**
	 * 删除通讯录中的多条记录
	 * @param ids 删除记录的id集合
	 * @return
	 */
	int deletes(List<Integer> ids);

    /**
     *
     * @param userId
     * @return
     * @throws Exception
     */
    List<AddressBookVo> getUsersByOwner(AddressBookVo vo) throws Exception;
    
    /**
     * 通讯录列表分页查询
     * @param vo
     * @return
     * @throws Exception
     */
    List<AddressBook> selectPojoListPage(AddressBook vo) throws Exception;
    
    /**
     * 根据输入的查找条件查找系统人员信息   匹配usercode username
     * @param map
     * @return
     * @throws Exception
     */
    List<AddressBookVo> findUser(Map<String, Object> map) throws Exception;
	
}