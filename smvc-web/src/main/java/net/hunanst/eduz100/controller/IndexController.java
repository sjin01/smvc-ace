package net.hunanst.eduz100.controller;

import net.hunanst.eduz100.api.oa.Message;
import net.hunanst.eduz100.api.oa.Remind;
import net.hunanst.common.api.constant.OfficialdocumentConstant;
import net.hunanst.eduz100.api.oa.Officialdocument;
import net.hunanst.eduz100.api.oa.OfficialdocumentMonitor;
import net.hunanst.eduz100.api.oa.vo.AddressBookVo;
import net.hunanst.eduz100.api.oa.vo.MailForIndex;
import net.hunanst.eduz100.api.oa.vo.NotificationVo;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.api.sys.AcOrg;
import net.hunanst.eduz100.service.oa.*;
import net.hunanst.eduz100.service.sms.SendService;
import net.hunanst.eduz100.service.sys.AcOperatorService;
import net.hunanst.eduz100.service.sys.AcOrgService;
import net.hunanst.eduz100.service.oa.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 1/27  10:36
 *
 * @author: guanshj QQ: 928990049
 */
@Controller
@RequestMapping("index")
public class IndexController extends BaseController{

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private MailService mailService;

    @Autowired
    private AddressBookService addressBookService;

    @Autowired
    private AcOperatorService acOperatorService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private SendService sendService;

    @Autowired
    private OfficialdocumentMonitorService officialdocumentMonitorService;

    @Autowired
    private OfficialdocumentService officialdocumentService;

    @Autowired
    private MailBoxService mailBoxService;

    /**
     * ajax load HTML ## 首页 工作台 通知模块
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "notify")
    @ResponseBody
    public List notify (HttpSession session,NotificationVo record)throws Exception{
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        record.setRecipient(acOperator.getId());
        List<NotificationVo> list=notificationService.selectForDisplay(record);
        return list;
    }

    /**
     * ajax load HTML ## 首页 工作台 公文模块
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "officialdocument")
    public ModelAndView officialdocumentIndex (Integer limit  ,HttpServletRequest request) throws Exception{
        ModelAndView mv =new ModelAndView("indexload/officialdocument");

        AcOperator user = (AcOperator) request.getSession().getAttribute("loginUser");

        OfficialdocumentMonitor monitor = new OfficialdocumentMonitor();
        monitor.setUserid(user.getId());
        monitor.setiDisplayStart(0);
        monitor.setiDisplayLength(limit);
        List<Officialdocument> monitorList = officialdocumentMonitorService.selectOfficialdocumentByMonitor( monitor );

        mv.addObject("monitorList" ,monitorList);

        Officialdocument od = new Officialdocument();
        od.setUserid(user.getId());
        od.setiDisplayStart(0);
        od.setiDisplayLength(limit);
        List<Officialdocument> newestList = officialdocumentService.selectNewestPage(od);

        mv.addObject("newestList" ,newestList);

        return mv;
    }

    /**
     * ajax load HTML ## 首页 工作台 邮件模块
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "email")
    public ModelAndView emailIndex (HttpSession session,MailForIndex vo) throws Exception{
        ModelAndView mv =new ModelAndView("indexload/email");
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        vo.setUserid(acOperator.getId());
        List<MailForIndex> mails=mailService.selectMailsByUserId(vo);
        mv.addObject("mails",mails);
        return mv;
    }

    /**
     * ajax load HTML ## 首页 工作台 通讯录
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "addressBook")
    public ModelAndView addressBookIndex (HttpSession session,AddressBookVo vo) throws Exception{
        ModelAndView mv = new ModelAndView("indexload/addressbook");
        AcOperator acOperator = (AcOperator)session.getAttribute("loginUser");
        vo.setOwner(acOperator.getId());
        List<AddressBookVo> ab = addressBookService.getUsersByOwner(vo);
        mv.addObject("abs",ab);
        return mv;
    }

    @RequestMapping("send")
    @ResponseBody
    public int send(Message vo,HttpSession session) throws Exception{
        AcOperator acOperator = (AcOperator)session.getAttribute("loginUser");

        Calendar c = Calendar.getInstance();
        vo.setAddresser(acOperator.getId());
        vo.setDate(c.getTime());
        vo.setReadflag(0);

        int d = messageService.saveMessage(vo);
        return d;
    }

    @RequestMapping(value = "messageDialog")
    public ModelAndView messageDialog (Integer receiveId ,String img,String name) throws Exception{
        ModelAndView mv =new ModelAndView("common/message_dialog");
        mv.addObject("receiveId" ,receiveId);
        mv.addObject("img" ,img);
        mv.addObject("name" ,name);
        return mv;
    }


    @RequestMapping("sendMail")
    @ResponseBody
    public int sendMail(HttpServletRequest request,HttpSession session,
                        String userids,String title,String content,String attachmenturl) throws Exception{

        AcOperator acOperator = (AcOperator)session.getAttribute("loginUser");

        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userid", acOperator.getId());
        params.put("userids", userids);
        params.put("title", title);
        params.put("content", content);
        params.put("attachmenturl", attachmenturl);

        params.put("pathheader", request.getSession().getServletContext().getAttribute("nginx_filepath") );
        int d =mailBoxService.saveEmail(params);
        return d;
    }
}
