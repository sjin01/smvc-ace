package net.sjin.smvc.service.oa.impl;

import net.sjin.smvc.api.oa.OfficialdocumentPostil;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.oa.OfficialdocumentPostilService;
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
