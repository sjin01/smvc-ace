package net.hunanst.eduz100.service.dataCollect;

import net.hunanst.eduz100.api.data.DataCollectInfo;
import net.hunanst.eduz100.api.data.DataCollectInfoDetail;
import net.hunanst.eduz100.api.data.DataInfoUser;
import net.hunanst.eduz100.api.data.vo.PersonView;
import net.hunanst.eduz100.api.data.vo.TempInfoVo;
import net.hunanst.eduz100.api.data.vo.TreeData;
import net.hunanst.eduz100.api.oa.Remind;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.api.sys.vo.AcOperatorVo;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-13
 * Time: 下午2:33
 * To change this template use File | Settings | File Templates.
 */
public interface DataCollectService {

    /**
     * 分页查询
     * @param vo
     * @return
     */
    List<TempInfoVo> selectList(TempInfoVo vo)throws Exception;

    /**
     * 查找属性结构数据
     * @param vo
     * @return
     */
    List<TreeData> getTreeByPid(TreeData vo)throws Exception;
    /**
     * 查找属性结构数据
     * @param vo
     * @return
     */
    List<TreeData> selectZtreeOrgs(TreeData vo)throws Exception;

    /**
     * 查找属性结构数据
     * @param vo
     * @return
     */
    List<TreeData> selectZtreeOnlySchools(TreeData vo)throws Exception;

    /**
     * 更新或者插入
     * @param vo
     * @return
     */
    int addOrUpdate(TempInfoVo vo)throws Exception;

    /**
     * 插入到主表
     * @param vo
     * @return
     */
    int add(TempInfoVo vo)throws Exception;

    /**
     * 插入到定义的内容表
     * @param tempInfoId
     * @param details
     * @return
     */
    int insertInfoDetail(Integer tempInfoId,String[] details)throws Exception;

    /**
     * 插入到需要填写信息的用户
     * @param tempInfoId
     * @param list
     * @return
     */
    int insertInfoUser(Integer tempInfoId, List<DataInfoUser> list)  throws Exception;

    int deleteById(Integer id)  throws Exception;

    int deletes(List<Integer> ids)  throws Exception;

    List<PersonView> getPersonList(PersonView vo)  throws Exception;

    TempInfoVo selectById(Integer tempId) throws Exception;

    int submitData(DataCollectInfo vo) throws Exception;

    List<DataCollectInfoDetail> getDataByTempId(DataCollectInfo vo) throws Exception;

    List<DataInfoUser> getInfoUser(Integer tempId) throws Exception;

    List<AcOperator> getsubDataUsers(Integer tempId) throws Exception;

    List<AcOperatorVo> undoneUsers(Integer tempId) throws Exception;

    void export(Integer tempInfoId,HttpServletResponse response) throws Exception;

    int addRemind(Remind remind) throws Exception;

    int userRole(HttpSession session) throws Exception;
}
