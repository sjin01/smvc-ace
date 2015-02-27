package net.sjin.smvc.controller.sys;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sjin.smvc.api.sys.AcOperator;
import net.sjin.smvc.api.sys.vo.AcRoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import net.sjin.smvc.enumeration.ResponseCodeEnum;
import net.sjin.common.util.encryption.AESUtils;
import net.sjin.smvc.api.sys.AcOperOrgRelation;
import net.sjin.smvc.api.sys.AcOperRole;
import net.sjin.smvc.api.sys.vo.AcOperatorVo;
import net.sjin.smvc.controller.BaseController;
import net.sjin.smvc.service.oa.AddressBookService;
import net.sjin.smvc.service.sys.AcOperOrgRelationService;
import net.sjin.smvc.service.sys.AcOperRoleService;
import net.sjin.smvc.service.sys.AcOperatorService;
import net.sjin.smvc.service.sys.AcRoleService;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("sys/operator")
@SuppressWarnings({ "rawtypes", "unchecked" })
public class OperatorController extends BaseController {
	
	 @Autowired
	 private AcOperatorService acOperatorService;
	 @Autowired
	 private AcOperOrgRelationService acOperOrgRelationService;
	 @Autowired
	 private AcOperRoleService acOperRoleService;
	 @Autowired
	 private AcRoleService acRoleService;
	 @Autowired
	 private AddressBookService addressBookService;
	
	@RequestMapping(value = "")
	public String index() throws Exception {
		return "sys/operator/index";
	}
	
	@RequestMapping(value = "/list")
    @ResponseBody
    public Map list(HttpSession session, AcOperatorVo vo) {
		AcOperator loginuser = (AcOperator)session.getAttribute("loginUser");
		if(!"admin".equals(loginuser.getUsercode())){
    		vo.setBelongorgid(loginuser.getBelongorgid());
    	}
        List<AcOperator> list = acOperatorService.selectByConditionPage(vo);
        return getSuccessResultMap4DataTable(list, vo);
    }
	
	@RequestMapping(value = "/deletes", method = RequestMethod.POST)
    @ResponseBody
    public Map deletes(@RequestBody List<Integer> ids) {
        int result = acOperatorService.deletes(ids);
        return getSuccessfulResultMap(result);
    }
	
	@RequestMapping(value = "/detail")
    public String detail(HttpServletRequest request, HttpServletResponse response, Map modelMap, int id,String flag) {
        AcOperator model = acOperatorService.selectByPrimaryKey(id);
        modelMap.put("model", model);
        if(null != flag){
        	return "oa/addressBook/addUser";
        }
        return "sys/operator/detail";
    }
	
	@RequestMapping(value = "/orgrelation")
    public String orgrelation(HttpServletRequest request, HttpServletResponse response, Map modelMap, int id) {
        AcOperator model = acOperatorService.selectByPrimaryKey(id);
        modelMap.put("model", model);
        return "sys/operator/orgrelation";
    }
	
	@RequestMapping(value = "/getorgrelation", method = RequestMethod.POST)
    @ResponseBody
    public Map getorgrelation(int operid) {
		List<AcOperOrgRelation> list = acOperOrgRelationService.getrelation(operid);
    	return getSuccessfulResultMap(list);
    }
	
	@RequestMapping(value = "/saveorgrelation", method = RequestMethod.POST)
    @ResponseBody
    public Map saveorgrelation(@RequestBody List list) {
		List<AcOperOrgRelation> relations = (List<AcOperOrgRelation>)JSONArray.toCollection(JSONArray.fromObject(list), AcOperOrgRelation.class);
    	int result = acOperOrgRelationService.saverelation(relations);
    	return getSuccessfulResultMap(result);
    }
	
	@RequestMapping(value = "/rolerelation")
    public String rolerelation(HttpServletRequest request, HttpServletResponse response, Map modelMap, int id) {
        AcOperator model = acOperatorService.selectByPrimaryKey(id);
        modelMap.put("model", model);
        return "sys/operator/rolerelation";
    }
	
	@RequestMapping(value = "/getrolerelation", method = RequestMethod.POST)
    @ResponseBody
    public Map getrolerelation(int operid) {
		 List<AcRoleVo> list = acRoleService.selectAll(operid);
		 return getSuccessfulResultMap(list);
    }
	
	@RequestMapping(value = "/saverolerelation", method = RequestMethod.POST)
    @ResponseBody
    public Map saverolerelation(@RequestBody String list) {
		Gson gson = new Gson();
		List<AcOperRole> relations = gson.fromJson(list, new TypeToken<List<AcOperRole>>(){}.getType());
		int result = acOperRoleService.saverelation(relations);
    	return getSuccessfulResultMap(result);
    }
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Map save(HttpServletRequest request,AcOperator vo,String addUserType) {
    	int result = 0;
    	try {
			if(vo.getId()!=null && vo.getId()>0){
				result = acOperatorService.updateByPrimaryKeySelective(vo);
			}else{
				vo.setPassword(AESUtils.encrypt("123456"));
				result = acOperatorService.insert(vo);
				if(null != addUserType){
					AcOperator ac = (AcOperator) request.getSession().getAttribute("loginUser");
					addressBookService.addAddressBookByAcOperId(ac.getId(), vo.getId());
				}
			}
		} catch (DuplicateKeyException e) {
			e.printStackTrace();
			return getFailedResultMap(ResponseCodeEnum.AJAX_FAILURE_UNIQUE_KEY_CONFLICT);
		}
    	return getSuccessfulResultMap(result);
    }
	
	@RequestMapping(value = "/saveOrganizationRelation", method = RequestMethod.POST)
    @ResponseBody
    public Map saveOrganizationRelation(AcOperator vo) {
    	int result = 0;
    	try {
			if(vo.getId()!=null && vo.getId()>0){
				result = acOperatorService.updateByPrimaryKeySelective(vo);
			}else{
				result = acOperatorService.insert(vo);
			}
		} catch (DuplicateKeyException e) {
			e.printStackTrace();
			return getFailedResultMap(ResponseCodeEnum.AJAX_FAILURE_UNIQUE_KEY_CONFLICT);
		}
    	return getSuccessfulResultMap(result);
    }
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    @ResponseBody
    public Map changePassword(AcOperator vo) {
		vo.setPassword(AESUtils.encrypt(vo.getPassword()));
    	int result = acOperatorService.updateByPrimaryKeySelective(vo);
    	return getSuccessfulResultMap(result);
    }
}
