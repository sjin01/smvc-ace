package net.hunanst.eduz100.service.oa;

import net.hunanst.eduz100.api.oa.OfficialdocumentDeliver;
import net.hunanst.eduz100.service.BaseService;

import java.util.List;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:37
 *
 * @author: guanshj QQ: 928990049
 */
public interface OfficialdocumentDeliverService extends BaseService<OfficialdocumentDeliver> {


    /**
     * 返回id的插入
     * @return
     * @throws Exception
     */
    Integer insertResultId(OfficialdocumentDeliver record) throws Exception;

    /**
     * 根据公文ID 查询 流转记录
     * @param odid
     * @return
     * @throws Exception
     */
    List<OfficialdocumentDeliver> selectDeliverByOdId (Integer odid) throws Exception ;

    /**
     * 批量
     * @return
     * @throws Exception
     */
    int insertList (List<OfficialdocumentDeliver> list) throws Exception ;
}
