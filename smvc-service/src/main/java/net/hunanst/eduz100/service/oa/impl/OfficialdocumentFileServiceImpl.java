package net.hunanst.eduz100.service.oa.impl;

import net.hunanst.eduz100.api.oa.OfficialdocumentFile;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.oa.OfficialdocumentFileService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:40
 *
 * @author: guanshj QQ: 928990049
 */
@Service("officialdocumentFileService")
public class OfficialdocumentFileServiceImpl extends BaseServiceImpl<OfficialdocumentFile> implements OfficialdocumentFileService {
    @Override
    public String getNamespace() {
        return "OfficialdocumentFile";
    }

    @Override
    public int insertList(List<OfficialdocumentFile> list) throws Exception {
        return sqlSessionTemplate.insert( getNamespace() + ".insertList" , list);
    }

    @Override
    public int deleteList(List<Integer> list) throws Exception {
        return sqlSessionTemplate.delete( getNamespace() + ".deleteByIdList" , list);
    }
}
