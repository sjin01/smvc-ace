package net.hunanst.eduz100.service.oa.impl;

import net.hunanst.eduz100.api.oa.OfficialdocumentPostil;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.oa.OfficialdocumentPostilService;
import org.springframework.stereotype.Service;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:41
 *
 * @author: guanshj QQ: 928990049
 */
@Service("officialdocumentPostilService")
public class OfficialdocumentPostilServiceImpl extends BaseServiceImpl<OfficialdocumentPostil> implements OfficialdocumentPostilService {
    @Override
    public String getNamespace() {
        return "OfficialdocumentPostil";
    }
}
