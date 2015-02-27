package net.sjin.smvc.service.sys.impl;

import java.util.List;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.api.sys.AcOperator;
import org.springframework.stereotype.Service;
import net.sjin.smvc.api.sys.vo.AcOperatorVo;
import net.sjin.smvc.service.sys.AcOperatorService;

@Service
public class AcOperatorServiceImpl extends BaseServiceImpl<AcOperator>
		implements AcOperatorService {

	public List<AcOperator> selectByCondition(AcOperator vo) {
		return (List<AcOperator>)this.sqlSessionTemplate.selectList(getNamespace()
				+ ".selectByCondition", vo);
	}

	@Override
	public List<AcOperator> selectByConditionPage(AcOperatorVo vo) {
		return (List<AcOperator>)sqlSessionTemplate.selectList(getNamespace()+".selectCondition_page", vo);
	}

	@Override
	public int deletes(List<Integer> ids) {
		return sqlSessionTemplate.delete(getNamespace()+".deletes", ids);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AcOperator> getMessageMembers(Integer id) {
		return (List<AcOperator>) sqlSessionTemplate.selectList(getNamespace()+".getMessageMembers", id);
	}


    @Override
    public List<AcOperator> selectByNotid(Integer notid) throws Exception {
        return (List<AcOperator>)sqlSessionTemplate.selectList(getNamespace()+".selectByNotid",notid);
    }
}
