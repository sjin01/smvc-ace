package net.hunanst.eduz100.service.sys.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import net.hunanst.common.api.constant.OfficialdocumentConstant;
import net.hunanst.eduz100.api.oa.Notification;
import net.hunanst.eduz100.dto.FueluxTreeVo;
import net.hunanst.eduz100.service.oa.NotificationService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.hunanst.eduz100.api.sys.AcOrg;
import net.hunanst.eduz100.api.sys.vo.AcOrgVo;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.sys.AcOrgService;

@Service
@SuppressWarnings("unchecked")
public class AcOrgServiceImpl extends BaseServiceImpl<AcOrg> implements AcOrgService {

    @Autowired
    private NotificationService notificationService;

    @Override
    public List<AcOrg> selectByParentid(Integer pid) {
        return (List<AcOrg>) sqlSessionTemplate.selectList(getNamespace() + ".selectByParentid", pid);
    }

    @Override
    public List<AcOrg> selectAll(AcOrg vo) {
        return (List<AcOrg>) sqlSessionTemplate.selectList(getNamespace() + ".selectAll", vo);
    }

    @Override
    public int deleteAndChildren(AcOrg vo) {
        int result = sqlSessionTemplate.delete(getNamespace() + ".deleteAndChildren", vo);
        if (vo.getOrgseq() != null && !vo.getOrgseq().equals("") && result > 0) {
            sqlSessionTemplate.delete(getNamespace() + ".deleteRelationWithFunc", vo);
        }


        //step1：找到机构下的用户接受到的通知
        /**
         * 注意：在这里只用到Notification里面的id(通知id)和userid(接受者id)
         */
        List<Notification> notifications =
                (List<Notification>) sqlSessionTemplate.selectList(getNamespace() +
                        ".getDataByOrgId", vo.getId());

        //step2:删除已经接收通知的部门deleteNotiByOrgId
        sqlSessionTemplate.delete(getNamespace() + ".deleteNotiByOrgId", vo.getId());

        //step3:把已经发出去的通知从redis服务移除
        try {
            if (notifications != null && notifications.size() > 0) {
                for (Notification n : notifications) {
                    notificationService.modifyRedisNoticeRecordAndPub(n.getUserid().toString(), n.getId().toString());
                }
            }
        } catch (Exception e) {
            System.out.println("把通知从redis服务移除出错!!!");
        }

        return result;
    }

    @Override
    public int insertAndUpdateSeq(AcOrg vo) {
        if (vo.getParentid() == null) vo.setParentid(0);

        int result = this.insert(vo);
        if (result > 0) {
            sqlSessionTemplate.update(getNamespace() + ".updateSeq", vo);
            if (vo.getBelongorgid() == null)
                sqlSessionTemplate.update(getNamespace() + ".updateBelongOrg", vo);
        }
        return result;
    }

    @Override
    public List<FueluxTreeVo> getFueluxTreeData(Integer pid) throws Exception {
        List<AcOrg> orgList = this.selectByParentid(pid);

        List<FueluxTreeVo> treeData = new ArrayList<FueluxTreeVo>();
        for (AcOrg orgItem : orgList) {

            FueluxTreeVo item = new FueluxTreeVo();
            item.setName(orgItem.getOrgname());
            item.setId(orgItem.getId());

            item.setType("folder");

            item.setItemSelected(orgItem.getParentid().equals(0) ? true : false);
            item.setChildren(orgItem.getChildcount() > 0 ? true : false);

            if (orgItem.getParentid().equals(0)) item.setIsRoot(true);

            treeData.add(item);
        }

        return treeData;
    }

    @Override
    public List<FueluxTreeVo> getOrgUserFueluxTreeData(Integer pid, Integer deliverid, Integer delivertype) throws Exception {
        List<FueluxTreeVo> list = (List<FueluxTreeVo>) sqlSessionTemplate.selectList(
                getNamespace() + ".selectOrgAndUserForFueluxTreeByParentid", pid);

		/*
         * 如果要实现 初始化默认选中 的效果：
		 * 通过 deliverid  delivertype  需要得到 所有应该 选中的 节点id  以及item id 数组
		 * 然后判断 当前pid 查询出来的 数据 id 是否在 这个数组中  是的话， 设置其  itemSelected 属性
		 */
        String[] orgidArr = null;
        AcOrg orgitem = null;

        if (deliverid != null && delivertype != null) {
            if (OfficialdocumentConstant.DELIVERTYPE_USER.equals(delivertype)) {
                List<AcOrg> orgList = this.selectByUserid(deliverid);
                orgitem = orgList.get(0);
            } else if (OfficialdocumentConstant.DELIVERTYPE_ORG.equals(delivertype)) {
                orgitem = this.selectByPrimaryKey(deliverid);
            }
        }
        if (orgitem != null) {
            orgidArr = orgitem.getOrgseq().split("-");
        }

        for (FueluxTreeVo item : list) {
            if (item.getId() == null || StringUtils.isEmpty(item.getName())) {
                list.remove(item);
                continue;
            }
            item.setType(item.getDatatype().equals("org") ? "folder" : "item");

            item.setChildren(item.getChildcount() > 0 ? true : false);

            if (orgidArr != null && orgidArr.length > 0) {
                for (String openordid : orgidArr) {
                    if (item.getId().equals(Integer.valueOf(openordid))) {
                        item.setItemSelected(true);
                    }
                }
            }


            if (item.getDatatype().equals("user") && item.getId().equals(deliverid)) item.setItemSelected(true);
        }
        return list;
    }


    @Override
    public List<AcOrg> selectByUserid(Integer userId) throws Exception {
        return (List<AcOrg>) sqlSessionTemplate.selectList(getNamespace() + ".selectByUserid", userId);
    }

    @Override
    public List<AcOrg> selectAllSchoolOrg() {
        return (List<AcOrg>) sqlSessionTemplate.selectList(getNamespace() + ".selectAllSchoolOrg");
    }

    @Override
    public List<AcOrg> selectBatchByPrimaryKey(List list) {
        return (List<AcOrg>) sqlSessionTemplate.selectList(getNamespace() + ".selectBatchByPrimaryKey", list);
    }

    @Override
    public int insertByTree(AcOrg rootorg, List<AcOrg> importList) {
        for (AcOrg org : importList) {
            AcOrgVo vo = (AcOrgVo) org;

            vo.setParentid(rootorg.getId());
            vo.setBelongorgid(rootorg.getBelongorgid());
            vo.setOrgseq(rootorg.getOrgseq());
            this.insert(vo);
            this.sqlSessionTemplate.update(getNamespace() + ".updateSeq", vo);
            vo.setOrgseq(rootorg.getOrgseq() + "-" + vo.getId());

            if (vo.getSchoolRoot() && vo.getBelongorgid() == 0) {
                vo.setBelongorgid(vo.getId());
                this.sqlSessionTemplate.update(getNamespace() + ".updateBelongOrg", vo);
            }

            if (vo.getChildrenOrg() != null) {
                this.insertByTree(vo, vo.getChildrenOrg());
            }
        }
        return 1;
    }

    @Override
    public Boolean checkOrgNameExisted(AcOrg vo) {
        int count = (Integer) this.sqlSessionTemplate.selectOne(getNamespace() + ".checkOrgNameExisted", vo);
        return count > 0 ? false : true;
    }

}