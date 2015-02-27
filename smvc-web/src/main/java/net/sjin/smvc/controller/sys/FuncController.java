package net.sjin.smvc.controller.sys;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import net.sjin.smvc.api.sys.AcFunc;
import net.sjin.smvc.api.sys.AcOperator;
import net.sjin.smvc.service.sys.AcFuncService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import net.sjin.smvc.enumeration.ResponseCodeEnum;
import net.sjin.smvc.api.sys.AcApp;
import net.sjin.smvc.controller.BaseController;
import net.sjin.smvc.service.sys.AcAppService;

@Controller
@RequestMapping("sys/func")
@SuppressWarnings({"rawtypes", "unchecked"})
public class FuncController extends BaseController {

	@Autowired
	private AcFuncService acFuncService;
    @Autowired
    private AcAppService acAppService;

    @RequestMapping(value = "")
    public String index(Map modelMap) {
    	List<AcApp> list = acAppService.selectAll();
    	modelMap.put("apps", list);
        return "sys/func/index";
    }
    
    @RequestMapping(value = "detail")
    public String detail(Map modelMap, AcFunc vo, @RequestParam int appid) {
    	modelMap.put("appid", appid);
    	if("insert".equals(dual.getOperationtype())){
    		modelMap.put("parent", acFuncService.selectByPrimaryKey(vo.getParentid()));
    	}else if("update".equals(dual.getOperationtype())){
    		modelMap.put("child", acFuncService.selectByPrimaryKey(vo.getId()));
    		modelMap.put("parent", acFuncService.selectByPrimaryKey(vo.getParentid()));
    	}
        return "sys/func/detail";
    }

    @RequestMapping(value = "list")
    @ResponseBody
    public List<AcFunc> list() {
    	List<AcFunc> list = acFuncService.selectAll();
        return list;
    }
    
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Map save(AcFunc vo, HttpServletRequest request) {
    	int result = 0;
    	try {
			if(StringUtils.isEmpty(vo.getFuncicon())) vo.setFuncicon("fa fa-caret-right");
			if(vo.getId()==null || vo.getId()<1){
				result = acFuncService.insertAndUpateSeq(vo);
			}else{
				result = acFuncService.updateByPrimaryKeySelective(vo);
			}
			if(result>0){
	    		this.resetUserFunc(request, vo.getFunctype());
	    	}
		} catch (DuplicateKeyException e) {
			e.printStackTrace();
			return getFailedResultMap(ResponseCodeEnum.AJAX_FAILURE_UNIQUE_KEY_CONFLICT);
		}
    	return getSuccessfulResultMap(result);
    }
    
    @RequestMapping(value = "/deletes", method = RequestMethod.POST)
    @ResponseBody
    public Map deletes(AcFunc vo, HttpServletRequest request) {
    	int result = acFuncService.deleteAndChildren(vo);
    	if(result>0){
    		this.resetUserFunc(request, vo.getFunctype());
    	}
        return getSuccessfulResultMap(result);
    }
    
    private void resetUserFunc(HttpServletRequest request, String functype){
		AcOperator loginuser = (AcOperator)request.getSession().getAttribute("loginUser");
		ServletContext context = request.getSession().getServletContext();
		
		if("admin".equals(loginuser.getUsercode())){
			List<AcFunc> authfuncs = acFuncService.selectAll();
			request.getSession().setAttribute("authfuncs", authfuncs);
			
			List<String> funcactions = new ArrayList<String>();
			for (AcFunc acFunc : authfuncs) {
				if(!"0".equals(acFunc.getFunctype()) && acFunc.getFuncaction()!=null && !acFunc.getFuncaction().equals("")){
					funcactions.add(context.getContextPath()+acFunc.getFuncaction());
				}
			}
			request.getSession().getServletContext().setAttribute("allfuncactions", funcactions);
		}else{
			List<AcFunc> funcs = acFuncService.selectFuncByOperid(loginuser.getId());
			Set<String> funcset = new HashSet<String>();
			for (AcFunc acFunc : funcs) {
				CollectionUtils.addAll(funcset, acFunc.getFuncseq().split("-"));
			}
			List<String> funcids = new ArrayList<String>(funcset);
			List<AcFunc> authfuncs = acFuncService.selectFuncTreeByIds(funcids);
			request.getSession().setAttribute("authfuncs", authfuncs);
			
			List<AcFunc> allfuncs = acFuncService.selectAll();
			List<String> funcactions = new ArrayList<String>();
			for (AcFunc acFunc : allfuncs) {
				if(!"0".equals(acFunc.getFunctype()) && acFunc.getFuncaction()!=null && !acFunc.getFuncaction().equals("")){
					funcactions.add(context.getContextPath()+acFunc.getFuncaction());
				}
			}
			request.getSession().getServletContext().setAttribute("allfuncactions", funcactions);
		}
    }
}
