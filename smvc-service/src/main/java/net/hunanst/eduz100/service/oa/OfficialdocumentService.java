package net.hunanst.eduz100.service.oa;

import net.hunanst.eduz100.api.oa.Officialdocument;
import net.hunanst.eduz100.api.oa.OfficialdocumentFile;
import net.hunanst.eduz100.dto.OfficialDocumentDto;
import net.hunanst.eduz100.service.BaseService;

import java.util.List;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:31
 *
 * @author: guanshj QQ: 928990049
 */
public interface OfficialdocumentService extends BaseService<Officialdocument> {

    /**
     * 新增，并且返回 插入ID
     * @param record
     * @return
     */
    Integer insertResultId (Officialdocument record);

    /**
     * 批量删除
     * @param idArr
     * @return
     * @throws Exception
     */
    int deleteByIdList (List<Integer> idArr) throws Exception;

    /**
     * 可批阅 根据 个人
     * @param  record  : userid
     * @return
     * @throws Exception
     */
    List<Officialdocument> selectApproveForUser(Officialdocument record) throws Exception;

    /**
     * 可批阅 根据 部门
     * @param record
     * @return
     * @throws Exception
     */
    List<Officialdocument> selectApproveForOrg(Officialdocument record) throws Exception;

    /**
     * 最新， （提交到您或您所属部门 ）
     * @param record
     * @return
     * @throws Exception
     */
    List<Officialdocument> selectNewestPage (Officialdocument record) throws Exception;

    /*
     * 活动中，且最近流转到本人手上的  （有权利操作的）
     * @param record :userid,orgid
     * @return
     * @throws Exception
     */
//    List<Officialdocument> selectActivityRights(Officialdocument record) throws Exception;

    /*
     * 与我相关：档案柜
     * @param record :userid
     * @return
     * @throws Exception
     */
    //List<Officialdocument> selectRecord(Officialdocument record) throws Exception;

    /**
     * 保存
     * @param dto 对数传输对象
     * @param flag 标识： 0：保存草稿 ；1：正式提交（公文流转启动）   (根据OfficialDocumentStatusEnum.java 来的)
     * @return 记录的ID    -1表示 失败
     * @throws Exception
     */
    Integer save (OfficialDocumentDto dto , int flag) throws Exception;

    /**
     *  处理 移交、审批通过、驳回 公文 的逻辑操作
     * @param flag CODE：处理（状态） ---------  1：移交（待审批） ； 2：通过（待签发）；5：驳回（驳回）
     * @param odid  公文主表ID
     * @param userid 操作人ID
     * @param orgid  操作人组织机构ID
     * @param postilContent 批注内容
     * @param fileList  文件集合
     * @param moveid,moveType 当flag == 1时必填
     * @throws Exception
     */
    void save_examine(int flag, Integer odid, Integer userid, Integer orgid
            , String postilContent, List<OfficialdocumentFile> fileList, Integer moveid, Integer moveType ,Integer remindflag,Integer remindtype) throws Exception;

    //  签发 和 签收
    void save_beissued (Integer odid ,Integer userid, Integer orgid ,List<Integer> useridList ,List<Integer> orgidList ,Integer remindflag,Integer remindtype) throws Exception ;
    void save_sign (Integer odid , Integer userid ,Integer orgid ,Integer remindflag,Integer remindtype) throws Exception;
    void save_sign_force(Integer odid ,Integer remindflag,Integer remindtype) throws Exception;  // 强制签收

    // 归档
    void save_in_record (Integer odid ,Integer userid, Integer orgid , Integer type) throws Exception;

    /**
     * 重新提交
     */
    void save_resubmit (OfficialDocumentDto dto ,Integer remindflag,Integer remindtype)  throws Exception ;
}
