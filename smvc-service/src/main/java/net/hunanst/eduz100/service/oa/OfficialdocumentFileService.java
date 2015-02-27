package net.hunanst.eduz100.service.oa;

import net.hunanst.eduz100.api.oa.OfficialdocumentFile;
import net.hunanst.eduz100.service.BaseService;

import java.util.List;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:40
 *
 * @author: guanshj QQ: 928990049
 */
public interface OfficialdocumentFileService extends BaseService<OfficialdocumentFile> {

    int insertList (List<OfficialdocumentFile> list) throws Exception;

    int deleteList (List<Integer> list) throws Exception;
}
