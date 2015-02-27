package net.sjin.smvc.controller.sys;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sjin.smvc.enumeration.ResponseCodeEnum;
import net.sjin.smvc.api.sys.AcFunc;
import net.sjin.smvc.api.sys.AcOperator;
import net.sjin.smvc.api.sys.AcRole;
import net.sjin.smvc.api.sys.AcRoleFunc;
import net.sjin.smvc.api.sys.vo.AcRoleVo;
import net.sjin.smvc.controller.BaseController;
import net.sjin.smvc.service.sys.AcFuncService;
import net.sjin.smvc.service.sys.AcRoleFuncService;
import net.sjin.smvc.service.sys.AcRoleService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
@RequestMapping("sys/role")
@SuppressWarnings({"rawtypes", "unchecked"})
public class RoleController extends BaseController {

    @Autowired
    private AcRoleService acRoleService;
    @Autowired
    private AcRoleFuncService acRoleFuncService;
    @Autowired
   	private AcFuncService acFuncService;
    
    @RequestMapping(value = "")
    public String index(HttpServletRequest request, HttpServletResponse response, Map modelMap) {
        return "sys/role/index";
    }

	@RequestMapping(value = "/list")
    @ResponseBody
    public Map list(HttpSession session, AcRole vo) {
		AcOperator loginuser = (AcOperator)session.getAttribute("loginUser");
		if(!"admin".equals(loginuser.getUsercode())){
    		vo.setBelongorgid(loginuser.getBelongorgid());
    	}
        List<AcRoleVo> list = acRoleService.selectByConditionPage(vo);
        return getSuccessResultMap4DataTable(list, vo);
    }

    @RequestMapping(value = "/detail")
    public String detail(HttpServletRequest request, HttpServletResponse response, Map modelMap, int id) {
    	AcRole model = acRoleService.selectByPrimaryKey(id);
        modelMap.put("model", model);
        return "sys/role/detail";
    }

    @RequestMapping(value = "/deletes", method = RequestMethod.POST)
    @ResponseBody
    public Map deletes(@RequestBody List<Integer> ids) {
        int result = acRoleService.deletes(ids);
        return getSuccessfulResultMap(result);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Map save(AcRole vo) {
    	int result = 0;
    	try {
			if(vo.getId()==null || vo.getId()==0){
				result = acRoleService.insert(vo);
			}else{
				result = acRoleService.updateByPrimaryKeySelective(vo);
			}
		} catch (DuplicateKeyException e) {
			e.printStackTrace();
			return getFailedResultMap(ResponseCodeEnum.AJAX_FAILURE_UNIQUE_KEY_CONFLICT);
		}
    	return getSuccessfulResultMap(result);
    }
    
    @RequestMapping(value = "funcrelation")
    public String funcrelation(Map modelMap, @RequestParam int roleid) {
    	AcRole model = acRoleService.selectByPrimaryKey(roleid);
        modelMap.put("model", model);
        return "sys/role/funcrelation";
    }
    
    @RequestMapping(value = "/getfuncrelation")
    @ResponseBody
    public Map getfuncrelation(int roleid){
    	List<AcRoleFunc> list = acRoleFuncService.selectByRole(roleid);
        return getSuccessfulResultMap(list);
    }
    
    @RequestMapping(value = "/savefuncrelation")
    @ResponseBody
    public Map savefuncrelation(@RequestBody String listString){
    	Gson gson = new Gson();
    	List<AcRoleFunc> list = gson.fromJson(listString, new TypeToken<List<AcRoleFunc>>(){}.getType());
    	int result = acRoleFuncService.savefuncrelation(list);
        return getSuccessfulResultMap(result);
    }
    
    @RequestMapping(value = "listAuth")
    @ResponseBody
    public List<AcFunc> listByBelongOrg(HttpSession session, int belongorgid) {
    	AcOperator loginuser = (AcOperator)session.getAttribute("loginUser");
    	if(loginuser.getBelongorgid()!=null && loginuser.getBelongorgid()>0){ // 学校操作员
    		return acFuncService.selectByBelongOrg(belongorgid);
    	}else { // 教育局操作员
    		if(belongorgid>0){
    			return acFuncService.selectByBelongOrg(belongorgid);
    		}else{
    			return acFuncService.selectAll();
    		}
    		
    	}
    }
    
    @RequestMapping(value = "funcbatch")
    public String funcbatch(Map modelMap, @ModelAttribute("roleids") String roleids) {
    	List idList = Arrays.asList(roleids.split(","));
    	List<AcRole> models = acRoleService.selectBatchByPrimaryKey(idList);
        modelMap.put("models", models);
        return "sys/role/funcbatchrelation";
    }
    
    @RequestMapping(value = "/savefuncbatchrelation")
    @ResponseBody
    public Map savefuncbatchrelation(@RequestBody String relations){
    	JSONObject json = JSONObject.fromObject(relations);
    	List<Integer> deletelist = (List<Integer>)JSONArray.toCollection(
    			(JSONArray)json.get("deletelist"), Integer.class);
    	List<AcRoleFunc> insertlist = (List<AcRoleFunc>)JSONArray.toCollection(
    			(JSONArray)json.get("insertlist"), AcRoleFunc.class);
    	int result = acRoleFuncService.saveByBatch(deletelist, insertlist);
        return getSuccessfulResultMap(result);
    }
}
