package net.hunanst.eduz100.service.oa;

import net.hunanst.eduz100.api.oa.Notification;
import net.hunanst.eduz100.api.oa.NotificationFile;
import net.hunanst.eduz100.api.oa.NotificationRead;
import net.hunanst.eduz100.api.oa.vo.NotiHistoryVo;
import net.hunanst.eduz100.api.oa.vo.NotificationFileVo;
import net.hunanst.eduz100.api.oa.vo.NotificationVo;
import net.hunanst.eduz100.api.sys.AcOrg;
import net.hunanst.eduz100.api.sys.vo.AcOperatorVo;
import net.hunanst.eduz100.service.BaseService;

import java.io.IOException;
import java.util.List;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:28
 *
 * @author: guanshj QQ: 928990049
 */
public interface NotificationService extends BaseService<Notification> {
    /**
     * 批量删除
     * @param ids
     * @return
     * @throws Exception
     */
    int deletes(List<Integer> ids) throws Exception;

    /**
     * 新增
     * @param vo
     * @return
     * @throws Exception
     */
    int insert(NotificationVo vo) throws Exception;

    int updateByPrimaryKey(NotificationVo record) throws Exception;

    /**
     * 已查看者的身份查看的列表  根据用户查找
     * @param vo
     * @return
     * @throws Exception
     */
    List<NotificationVo> selectForDisplay(NotificationVo vo) throws Exception;

    /**
     * 主页的弹出框查看  根据id查找
     * @param vo
     * @return
     * @throws Exception
     */
    List<NotificationVo> notiViewById(NotificationVo vo) throws Exception;

    /**
     *
     * @param orgId
     * @return
     * @throws Exception
     */
    List<AcOperatorVo> selectPersonByOegId(Integer orgId) throws Exception;

    int addNotiFile(List<NotificationFileVo> notificationFile,int notId) throws Exception;

    /**
     * 根据主键查找
     * @param id
     * @return
     */
    NotificationVo selectByPrimaryKey(Integer id);

    NotificationFileVo selectFile(Integer fileId) throws Exception;

    /**
     * 根据接受者id查找通知
     * @param nv
     * @return
     * @throws Exception
     */
    List<NotiHistoryVo> getNotiByuserid(NotiHistoryVo nv) throws Exception;

    /**
     * 更新已读状态
     * @param vo
     * @return
     * @throws Exception
     */
    int updateRead(NotificationRead vo) throws Exception;

    /**
     * 手机短信提醒
     * @param vo
     * @throws Exception
     */
    void save_remind_phone(NotificationVo vo) throws Exception;

    /**
     * 插入提醒记录
     * @param vo
     * @return
     * @throws Exception
     */
    int insertRemindByBath(NotificationVo vo) throws Exception;

    /**
     * 移除redis数据
     * @param usercode
     * @param noticeSeq
     * @return
     * @throws IOException
     */
    boolean modifyRedisNoticeRecordAndPub(String usercode,String noticeSeq) throws IOException;

    /**
     * 新增数据到redis服务
     * @param usercode
     * @param noticeSeq
     * @param title
     * @return
     * @throws IOException
     */
    boolean saveRedisAndPub(String usercode,String noticeSeq,String title) throws IOException;

}
