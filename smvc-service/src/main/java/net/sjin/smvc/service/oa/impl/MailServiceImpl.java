package net.sjin.smvc.service.oa.impl;

import net.sjin.smvc.api.oa.Mail;
import net.sjin.smvc.api.oa.vo.MailForIndex;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.oa.MailService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:19
 *
 * @author: guanshj QQ: 928990049
 */
@Service("mailService")
public class MailServiceImpl extends BaseServiceImpl<Mail> implements MailService {

    @Override
    public String getNamespace() {
        return "Mail";
    }

    @Override
    public List<MailForIndex> selectMailsByUserId(MailForIndex vo) throws Exception {
        return (List<MailForIndex>)sqlSessionTemplate.selectList(getNamespace()+".selectForIndex",vo);
    }
}
