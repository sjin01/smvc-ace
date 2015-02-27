package net.sjin.smvc.service.oa.impl;

import net.sjin.smvc.api.oa.OfficialdocumentDeliver;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.oa.OfficialdocumentDeliverService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:38
 *
 * @author: guanshj QQ: 928990049
 */
@Service("officialdocumentDeliverService")
public class OfficialdocumentDeliverServiceImpl extends BaseServiceImpl<OfficialdocumentDeliver> implements OfficialdocumentDeliverService {
    @Override
    public String getNamespace() {
        return "OfficialdocumentDeliver";
    }

    @Override
    public Integer insertResultId(OfficialdocumentDeliver record) throws Exception {
        int n = sqlSessionTemplate.insert(getNamespace() + ".insertSelective", record);
        if (n > 0) {
            return record.getId();
        } else {
            return null;
        }
    }

    @Override
    public List<OfficialdocumentDeliver> selectDeliverByOdId(Integer odid) throws Exception {
        return (List<OfficialdocumentDeliver>) sqlSessionTemplate.selectList(getNamespace() + ".selectDeliverByOdId" , odid);
    }

    @Override
    public int insertList(List<OfficialdocumentDeliver> list) throws Exception {
        return sqlSessionTemplate.insert( getNamespace() + ".insertList" , list);
    }
}
