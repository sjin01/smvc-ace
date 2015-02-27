package net.hunanst.eduz100.service.oa.impl;

import net.hunanst.eduz100.api.oa.Officialdocument;
import net.hunanst.eduz100.api.oa.OfficialdocumentRecord;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.oa.OfficialdocumentRecordService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 12/18  11:56
 *
 * @author: guanshj QQ: 928990049
 */
@Service("officialdocumentRecordService")
public class OfficialdocumentRecordServiceImpl extends BaseServiceImpl<OfficialdocumentRecord> implements OfficialdocumentRecordService {

    @Override
    public String getNamespace() {
        return "OfficialdocumentRecord";
    }

    @Override
    public List<Officialdocument> selectOfficialdocumentByRecordForUser(OfficialdocumentRecord record) throws Exception {
        return (List<Officialdocument>) sqlSessionTemplate.selectList( getNamespace() + ".selectOfficialdocumentByRecordForUser_page" , record);
    }

    @Override
    public List<Officialdocument> selectOfficialdocumentByRecordForOrg(OfficialdocumentRecord record) throws Exception {
        return (List<Officialdocument>) sqlSessionTemplate.selectList( getNamespace() + ".selectOfficialdocumentByRecordForOrg_page" , record);
    }
}
