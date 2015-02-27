package net.sjin.smvc.service.oa.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sjin.smvc.api.oa.vo.AddressBookVo;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.oa.AddressBookService;
import org.springframework.stereotype.Service;

import net.sjin.smvc.api.oa.AddressBook;

@Service("addressBookService")
public class AddressBookServiceImpl extends BaseServiceImpl<AddressBook> implements AddressBookService {
	@Override
	protected String getNamespace() {
		return "addressBook";
	}

	@Override
	public Integer addAddressBookByAcOperId(Integer owner, Integer operId) {
		if(null == owner || "".equals(owner)){
			return 0;
		}
		if(null == operId || "".equals(operId)){
			return 0;
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("owner", owner);
		map.put("operId", operId);
		return sqlSessionTemplate.insert(getNamespace()+".addAddressBookByAcOperId", map);
	}

	@Override
	public int deletes(List<Integer> ids) {
		return sqlSessionTemplate.delete(getNamespace()+".deletes", ids);
	}

    @Override
    public List<AddressBookVo> getUsersByOwner(AddressBookVo vo) throws Exception {
        return (List<AddressBookVo>)sqlSessionTemplate.selectList(getNamespace()+".selectByowner", vo);
    }

	@SuppressWarnings("unchecked")
	@Override
	public List<AddressBook> selectPojoListPage(AddressBook vo)
			throws Exception {
		return (List<AddressBook>)sqlSessionTemplate.selectList(getNamespace()+".selectPojoList_page", vo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AddressBookVo> findUser(Map<String, Object> map)
			throws Exception {
		return  (List<AddressBookVo>)sqlSessionTemplate.selectList(getNamespace()+".findUser", map);
	}
}