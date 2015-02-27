package net.hunanst.eduz100.service.oa;

import java.util.List;
import java.util.Map;

import net.hunanst.eduz100.api.oa.AcOperatorIdAndName;
import net.hunanst.eduz100.api.oa.MailBox;
import net.hunanst.eduz100.api.oa.MailDetail;
import net.hunanst.eduz100.api.oa.MailFile;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.service.BaseService;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:21
 *
 * @author: guanshj QQ: 928990049
 */
public interface MailBoxService extends BaseService<MailBox> {
	
	public List<MailDetail> selectByCondition(MailBox vo) throws Exception;

	public int selectUnReadMailCountByCondition(MailBox vo) throws Exception;

	public List<AcOperatorIdAndName> selectEmailReceiveOperater(
			AcOperator acOperator) throws Exception;

	public int saveEmail(Map<String, Object> params) throws Exception;

	public int selectByConditionCount(MailBox vo) throws Exception;

	public List<MailDetail> selectMailContent(MailBox vo) throws Exception;

	public int delEmail(MailBox vo) throws Exception;

	public int saveDraftEmail(Map<String, Object> params)throws Exception;

	public List<MailFile> selectMailFile(MailBox vo)throws Exception;

    List getMessageMembers(Integer id);

    int addAddressBookByAcOperId(Integer id, int userid);

    int delAllCheckMails(MailBox mailBox) throws Exception;
}
