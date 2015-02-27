package net.hunanst.eduz100.service.oa;

import net.hunanst.eduz100.api.oa.Mail;
import net.hunanst.eduz100.api.oa.vo.MailForIndex;
import net.hunanst.eduz100.service.BaseService;

import java.util.List;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:18
 *
 * @author: guanshj QQ: 928990049
 */
public interface MailService extends BaseService<Mail> {
    List<MailForIndex> selectMailsByUserId(MailForIndex vo) throws Exception;
}
