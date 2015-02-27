package net.hunanst.eduz100.controller.oa.AddressBook;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.hunanst.common.api.enumeration.ResponseCodeEnum;
import net.hunanst.common.util.encryption.AESUtils;
import net.hunanst.eduz100.api.oa.AddressBook;
import net.hunanst.eduz100.api.oa.vo.AddressBookVo;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.controller.BaseController;
import net.hunanst.eduz100.service.oa.AddressBookService;
import net.hunanst.eduz100.service.sys.AcOperatorService;

@Controller
@RequestMapping("oa/addressBook")
public class AddressBookController extends BaseController {
	@Autowired
	private AddressBookService addressBookService;
	
	@RequestMapping(value = "")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("/oa/addressBook/addressBookList");
		return mv;
	}
	
	@RequestMapping(value = "/list")
	@ResponseBody
	public Object index(String name,String status, HttpServletRequest request) throws Exception {
		AcOperator ac = (AcOperator) request.getSession().getAttribute("loginUser");
		AddressBook vo = new AddressBook();
		vo.setName(name);
		vo.setiDisplayLength(25);
		vo.setOwner(ac.getId());
		vo.setStatus(status);
//		List<AddressBook> list = addressBookService.selectPage(vo);
		List<AddressBook> list = addressBookService.selectPojoListPage(vo);
		return getSuccessResultMap4DataTable(list,vo);
	}
	
	@RequestMapping(value = "/addOrEdit")
	public ModelAndView addOrEdit(Integer id) {
		ModelAndView mv = new ModelAndView("/oa/addressBook/addressBook");
//		ModelAndView mv = new ModelAndView("/oa/addressBook/addressBookEdit");
		AddressBook addressBook = null;
		if(null != id && !"".equals(id)){
			addressBook = addressBookService.selectByPrimaryKey(id);
		}
		mv.addObject("vo", addressBook);
		return mv;
	}
	
	
	@RequestMapping(value = "/saveOrUpdate")
	@ResponseBody
	public Object saveOrUpdate(HttpServletRequest request,AddressBook addressBook) throws Exception{
		AcOperator ac = (AcOperator) request.getSession().getAttribute("loginUser");
		addressBook.setOwner(ac.getId());
		if(!StringUtils.isEmpty(addressBook.getBirthdaystr())){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            addressBook.setBirthday( df.parse(addressBook.getBirthdaystr()) );
        }
		int i = 0;
		if(null == addressBook.getId()|| "".equals(addressBook.getId())){
			i = addressBookService.insert(addressBook);
		}else{
			i = addressBookService.updateByPrimaryKeySelective(addressBook);
		}
		return i;
	}
	
	@RequestMapping(value = "findUser")
    public ModelAndView addressBookIndex (HttpSession session,String name) throws Exception{
        ModelAndView mv = new ModelAndView("/oa/addressBook/findUser");
        AcOperator ac = (AcOperator)session.getAttribute("loginUser");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("operId", ac.getId());
        map.put("userName", name);
        mv.addObject("userList",addressBookService.findUser(map));
        return mv;
    }
	
	
	@RequestMapping(value = "/addUser")
	@ResponseBody
	public Object addUser(HttpServletRequest request,Integer id) throws Exception{
		AcOperator ac = (AcOperator) request.getSession().getAttribute("loginUser");
		Integer i = addressBookService.addAddressBookByAcOperId(ac.getId(), id);
		return i;
	}
	
	@Autowired
	private AcOperatorService acOperatorService;
	
	@RequestMapping(value = "/validateUser")
	@ResponseBody
	public Map validateUser(HttpServletRequest request,String usercode,String password) throws Exception{
		AcOperator ac = (AcOperator) request.getSession().getAttribute("loginUser");
		AcOperator operator = new AcOperator();
//		operator.setPassword(AESUtils.encrypt(password));
		operator.setUsercode(usercode);
		List<AcOperator> list = acOperatorService.selectByCondition(operator);

		if (list.size() == 1) {
			AcOperator loginuser = list.get(0);
			if(!loginuser.getPassword().equals(AESUtils.encrypt(password))){
				return getFailedResultMap(ResponseCodeEnum.AJAX_PASSWORD_ERROR);
			}
			if(loginuser.getId().equals(ac.getId())){
				return getFailedResultMap(ResponseCodeEnum.AJAX_FAILURE_REPECT);
			}
			AddressBook vo = new AddressBook();
			vo.setOwner(ac.getId());
			vo.setOperid(loginuser.getId());
			List<AddressBook> voList = addressBookService.selectPojoListPage(vo);
			if(voList.size()>0){
				return getFailedResultMap(ResponseCodeEnum.AJAX_FAILURE_EXIST);
			}
			return this.getSuccessfulResultMap(loginuser.getId());
		}
		return getFailedResultMap(ResponseCodeEnum.AJAX_USERNAME_ERROR);
	}
	
	@RequestMapping(value = "/deletes")
	@ResponseBody
	public Object deletes(@RequestBody List<Integer> ids) throws Exception{
		int i = addressBookService.deletes(ids);
		return i;
	}
}
