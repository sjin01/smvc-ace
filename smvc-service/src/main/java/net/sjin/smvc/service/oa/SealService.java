package net.sjin.smvc.service.oa;

import net.sjin.smvc.api.oa.Seal;
import net.sjin.smvc.service.BaseService;

import java.util.List;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:         接口
 * 创建日期: 1/22  9:30
 *
 * @author: guanshj QQ: 928990049
 */
public interface SealService extends BaseService<Seal> {

    List<Seal> selectSealByUserid (Integer userid) throws Exception;
}
