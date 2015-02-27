package net.hunanst.eduz100.service.oa;

import net.hunanst.eduz100.api.oa.Remind;
import net.hunanst.eduz100.service.BaseService;

import java.util.List;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 1/19  10:49
 *
 * @author: guanshj QQ: 928990049
 */
public interface RemindService extends BaseService<Remind> {

    /**
     * 公文流转--消息提醒  : <br/>
     * step1：保存 公文数据 消息提醒记录 并根据具体 <br/>
     * step2：根据具体的指令，发送提醒 <br/>
     * @param remindtype 发送类型
     * @param operatoruserid 发送人
     * @param recipientuserid 接收人
     * @param odStatus  公文的状态
     * @throws Exception
     */
    void save_officialDocument_remind (Integer remindtype,Integer operatoruserid,Integer recipientuserid ,Integer odStatus ,String odName) throws Exception;
    /**
     * 公文流转-- 消息提醒 （批量处理）
     * @param list
     * @throws Exception
     */
    void save_officialDocument_remind (List<Remind> list) throws Exception;

    /**
     * 为批量组装对象
     * @param remindtype
     * @param operatoruserid
     * @param recipientuserid
     * @param odStatus
     * @param odName
     * @return
     * @throws Exception
     */
    Remind get_officialDocument_remind (Integer remindtype,Integer operatoruserid,Integer recipientuserid ,Integer odStatus ,String odName) throws Exception;

    /**
     * 批量插入
     * @param list
     * @return
     */
    Integer insertList(List<Remind> list);

    int inserRemind(Remind vo) throws Exception;
}
