package net.sjin.smvc.service.oa.impl;

import net.sjin.smvc.api.oa.MailFile;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.oa.MailFileService;
import org.springframework.stereotype.Service;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:23
 *
 * @author: guanshj QQ: 928990049
 */
@Service("mailFileService")
public class MailFileServiceImpl extends BaseServiceImpl<MailFile> implements MailFileService {
    @Override
    public String getNamespace() {
        return "MailFile";
    }
}
