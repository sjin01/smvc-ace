package net.hunanst.eduz100.controller.oa.message;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.hunanst.eduz100.api.oa.Message;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.controller.BaseController;
import net.hunanst.eduz100.dto.MessageVo;
import net.hunanst.eduz100.service.oa.MessageService;
import net.hunanst.eduz100.service.sys.AcOperatorService;

@Controller
@RequestMapping("oa/message")
public class OnLineMessageController extends BaseController {
	@Autowired
	private AcOperatorService acOperatorService;
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value = "/getMessageMembers")
    @ResponseBody
    public List getMessageMembers (Integer receiveId,HttpServletRequest request){
		AcOperator vo= (AcOperator) request.getSession().getAttribute("loginUser");

        return acOperatorService.getMessageMembers(vo.getId());
    }
	
	@RequestMapping(value = "/getMessageByID")
    @ResponseBody
	public List<MessageVo> getMessageByID(Integer id,HttpServletRequest request){
		AcOperator vo= (AcOperator) request.getSession().getAttribute("loginUser");
		return messageService.getMessageByID(id,vo.getId());
	}
	
	@RequestMapping(value = "/getUnreadMessageByID")
	@ResponseBody
	public List<MessageVo> getUnreadMessageByID(Integer id,HttpServletRequest request){
		AcOperator vo= (AcOperator) request.getSession().getAttribute("loginUser");
		return messageService.getUnreadMessageByID(id,vo.getId());
	}
	
	@RequestMapping(value = "/saveMessage")
    @ResponseBody
	public int saveMessage(Message vo,HttpServletRequest request){
		AcOperator ac= (AcOperator) request.getSession().getAttribute("loginUser");
		vo.setAddresser(ac.getId());
		vo.setDate(new Date());
		vo.setName(ac.getUsername());
		vo.setReadflag(0);
		return messageService.saveMessage(vo);
	}
	
}
