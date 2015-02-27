package net.sjin.smvc.controller.oa.AddressBook;

import net.sjin.common.util.json.JsonConfigUtil;
import net.sjin.smvc.api.oa.vo.Chat;
import net.sjin.smvc.api.sys.AcOperator;
import net.sjin.smvc.controller.BaseController;
import net.sjin.smvc.service.oa.MessageService;
import net.sjin.smvc.service.sys.AcOperatorService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-2-6
 * Time: 上午10:59
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("oa/chat")
public class ChatController extends BaseController {

    @Autowired
    private AcOperatorService acOperatorService;
    @Autowired
    private MessageService messageService;

    @RequestMapping(value = "")
    public ModelAndView index(HttpSession session){
        ModelAndView mv=new ModelAndView("/oa/addressBook/chatHistoryList");
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        mv.addObject("acOperator",acOperator);
        return mv;
    }

    @RequestMapping(value = "chatone")
    public ModelAndView chatone(HttpSession session,Integer recipient,HttpServletRequest request){
        ModelAndView mv=new ModelAndView("/oa/addressBook/chatHistoryByOne");
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        mv.addObject("userId",acOperator.getId());
        acOperator=acOperatorService.selectByPrimaryKey(recipient);
        mv.addObject("recipient",acOperator);
        return mv;
    }

    @RequestMapping("listByUserId")
    @ResponseBody
    public Object listByUserId(HttpSession session,Chat vo){
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        vo.setAddresser(acOperator.getId());
        List<Chat> list = messageService.listByUserId(vo);
        return getSuccessResultMap4DataTable(JSONArray.fromObject(list
                , JsonConfigUtil.getJsonDateConfig("yyyy-MM-dd HH:mm:ss")), vo);
    }


    @RequestMapping("chatonelist")
    @ResponseBody
    public Object chatonelist(HttpSession session,Chat vo){
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        vo.setAddresser(acOperator.getId());
        List<Chat> list = messageService.chatonelist(vo);
        return getSuccessResultMap4DataTable(JSONArray.fromObject(list
                , JsonConfigUtil.getJsonDateConfig("yyyy-MM-dd HH:mm:ss")), vo);
    }


    @RequestMapping("getUserInfoById")
    @ResponseBody
    public Object getUserInfoById(Integer userId){
        AcOperator acOperator=null;
        if(userId!=null){
            acOperator=acOperatorService.selectByPrimaryKey(userId);
        }
        return acOperator;
    }
}
