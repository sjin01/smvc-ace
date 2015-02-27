package net.sjin.smvc.service.oa.impl;

import net.sjin.smvc.api.oa.MailUser;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.oa.MailUserService;
import org.springframework.stereotype.Service;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:25
 *
 * @author: guanshj QQ: 928990049
 */
@Service("mailUserService")
public class MailUserServiceImpl extends BaseServiceImpl<MailUser> implements MailUserService {
    @Override
    public String getNamespace() {
        return "MailUser";
    }
}
