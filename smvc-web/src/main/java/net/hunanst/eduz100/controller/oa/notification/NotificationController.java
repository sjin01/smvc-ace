package net.hunanst.eduz100.controller.oa.notification;

import net.hunanst.common.util.json.JsonConfigUtil;
import net.hunanst.eduz100.api.oa.Notification;
import net.hunanst.eduz100.api.oa.NotificationRead;
import net.hunanst.eduz100.api.oa.OfficialdocumentFile;
import net.hunanst.eduz100.api.oa.vo.NotiHistoryVo;
import net.hunanst.eduz100.api.oa.vo.NotificationFileVo;
import net.hunanst.eduz100.api.oa.vo.NotificationVo;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.api.sys.AcOrg;
import net.hunanst.eduz100.api.sys.vo.AcOperatorVo;
import net.hunanst.eduz100.controller.BaseController;
import net.hunanst.eduz100.service.dataCollect.DataCollectService;
import net.hunanst.eduz100.service.oa.NotificationService;
import net.hunanst.eduz100.service.oa.OfficialdocumentFileService;
import net.hunanst.eduz100.service.sys.AcOperatorService;
import net.hunanst.eduz100.service.sys.AcOrgService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * Description:通知 对通知的控制层
 * User: Creek
 * Date: 14-12-18
 * Time: 上午10:57
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("oa/notification")
public class NotificationController extends BaseController {

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private AcOrgService acOrgService;

    @Autowired
    private OfficialdocumentFileService officialdocumentFileService;

    @Autowired
    private AcOrgService orgService;

    @Autowired
    private AcOperatorService operatorService;

    @Autowired
    private DataCollectService dataCollectService;
  /**
     *
     * @return
     */
    @RequestMapping(value = "")
    public ModelAndView index (HttpSession session){
        ModelAndView mv = new ModelAndView("oa/notification/notificationList");
        return mv;
    }

    /**
     * 页面展示
     * @param session
     * @param record
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "display")
    public ModelAndView display ()throws Exception{
        ModelAndView mv = new ModelAndView("oa/notification/notiDisplay");
        return mv;
    }

    /**
     * 页面展示
     * @param session
     * @param record
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "displayNoti")
    @ResponseBody
    public Object displayNoti (HttpSession session,NotificationVo record)throws Exception{
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        record.setRecipient(acOperator.getId());
        List<NotificationVo> list=notificationService.selectForDisplay(record);
        return getSuccessResultMap4DataTable(JSONArray.fromObject(list
                , JsonConfigUtil.getJsonDateConfig("yyyy-MM-dd HH:mm:ss")), record);
    }

    /**
     * 获取通知公告的分页数据
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "list")
    public Object list (NotificationVo vo,HttpSession session) throws Exception{
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        vo.setUserid(acOperator.getId());
        List<Notification> list=notificationService.selectPage(vo);
        return getSuccessResultMap4DataTable(JSONArray.fromObject(list
                , JsonConfigUtil.getJsonDateConfig("yyyy-MM-dd HH:mm:ss")), vo);
    }


    /**
     * 跳转到通知公告的页面进行添加或者修改
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "toNoti")
    public ModelAndView notification (HttpSession session,Integer id) throws Exception{
        ModelAndView mav=new ModelAndView("oa/notification/notification");
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        NotificationVo nf=new NotificationVo();
        if(id!=null&&id>0){
            nf=notificationService.selectByPrimaryKey(id);
        }
        mav.addObject("notification",nf);

        List<AcOrg> orgs=acOrgService.selectByUserid(acOperator.getId());

        mav.addObject("orgs",orgs);
        //在进入页面之前 判断身份是属于教育局还是学校  教育局大于学校
        //如果返回的是0  代表是教育局 而且是pid  大于0  则是学校而且是id
        int flagId=dataCollectService.userRole(session);
        mav.addObject("flagId",flagId);
        return mav;
    }


    /**
     * 对通知公告的新增或者修改
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "addOrUpdate")
    public int addOrUpdate (HttpSession session,NotificationVo vo) throws Exception{
        AcOperator ao=(AcOperator)session.getAttribute("loginUser");
        vo.setUserid(ao.getId());
        int i=0;
        if(vo.getId()==null||vo.getId()<0){
            i=notificationService.insert(vo);
        }else{
           i= notificationService.updateByPrimaryKey(vo);
        }

        return i;
    }

    /**
     * 获取单条通知信息
     * @param id
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "getNotification")
    public Object getNotification(Integer id) throws Exception{
        if(id!=null){
            Notification nf=notificationService.selectByPrimaryKey(id);
            return nf;
        }else{
            return null;
        }
    }

    /**
     * 更新通知的是否首页展示
     * @param vo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "updateViewFlag")
    public boolean updateViewFlag(Notification vo){
        int i=0;
        if(vo.getId()!=null&&vo.getViewflag()!=null){
            i=notificationService.updateByPrimaryKey(vo);
        }
        return i>0;
    }

    /**
     * 批量删除通知
     * @param ids
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deletes", method = RequestMethod.POST)
    @ResponseBody
    public Map deletes(@RequestParam List<Integer> ids) throws Exception{
        int result = notificationService.deletes(ids);
        return getSuccessfulResultMap(result);
    }

    /**
     * 获取机构人员
     * @param orgId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/person")
    @ResponseBody
    public List person(Integer orgId) throws Exception{
        List<AcOperatorVo> persons=new ArrayList<AcOperatorVo>();
        if(null!=orgId){
            persons=notificationService.selectPersonByOegId(orgId);
        }
        return persons;
    }

    /**
     * 获取未读通知
     * @param nv
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/unRead")
    @ResponseBody
    public List<NotiHistoryVo> unRead(NotiHistoryVo nv,HttpSession session) throws Exception{
        AcOperator ao=(AcOperator)session.getAttribute("loginUser");
        nv.setRecipient(ao.getId());
        nv.setIsread(0);
        List<NotiHistoryVo> notiHistoryVos=notificationService.getNotiByuserid(nv);
        return notiHistoryVos;
    }


    /**
     * HTML : 公文文件预览
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "fileView")
    public ModelAndView fileViewHtml(@RequestParam Integer fileid) throws Exception{
        ModelAndView mv = new ModelAndView("oa/notification/fileView");
        NotificationFileVo nfv=notificationService.selectFile(fileid);
        if (nfv != null) {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            nfv.setUploadtimeStr(df.format(nfv.getUploadtime()));

            AcOperator user = operatorService.selectByPrimaryKey(nfv.getUserid());
            AcOrg org = orgService.selectByPrimaryKey(nfv.getOrgid());
            if (user != null) mv.addObject("username", user.getUsername());
            if (org != null) mv.addObject("orgname", org.getOrgname());
        }

        mv.addObject("file" ,nfv);
        return mv;
    }

    /**
     * 更新是否已读
     * @param vo
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value="updateRead")
    @ResponseBody
    public int updateRead(NotificationRead vo,HttpSession session) throws Exception{
        int i=0;
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        vo.setReaduserid(acOperator.getId());
        vo.setReadtime(new Date());
        if(null!=vo.getNotid()&&vo.getNotid()>0){
            i=notificationService.updateRead(vo);
        }
        return i;
    }

    /**
     *
     * @param session
     * @param record
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "notiById")
    public ModelAndView notiById (HttpSession session,NotificationVo record) throws Exception{
        ModelAndView mv = new ModelAndView("oa/notification/oneNotification");
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        record.setRecipient(acOperator.getId());
        List<NotificationVo> list=notificationService.selectForDisplay(record);
        mv.addObject("list",list);
        //根据通知id和用户id  将该通知从redis移除
        notificationService.modifyRedisNoticeRecordAndPub(acOperator.getId().toString(),record.getId().toString());
        return mv;
    }

    @RequestMapping(value = "notiByIdForIndex")
    @ResponseBody
    public Object notiByIdForIndex (HttpSession session,NotificationVo record) throws Exception{
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        record.setRecipient(acOperator.getId());
        List<NotificationVo> list=notificationService.selectForDisplay(record);
        return list;
    }


    /**
     *
     * @param session
     * @param record
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "notiViewById")
    public ModelAndView notiViewById (HttpSession session,NotificationVo record) throws Exception{
        ModelAndView mv = new ModelAndView("oa/notification/oneNotification");
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        record.setRecipient(acOperator.getId());
        List<NotificationVo> list=notificationService.notiViewById(record);
        mv.addObject("list",list);
        return mv;
    }
}
