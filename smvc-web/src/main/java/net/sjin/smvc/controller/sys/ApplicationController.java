package net.sjin.smvc.controller.sys;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sjin.smvc.enumeration.ResponseCodeEnum;
import net.sjin.smvc.api.sys.AcApp;
import net.sjin.smvc.controller.BaseController;
import net.sjin.smvc.service.sys.AcAppService;

@Controller
@RequestMapping("sys/application")
@SuppressWarnings({"rawtypes", "unchecked"})
public class ApplicationController extends BaseController {

    @Autowired
    private AcAppService acAppService;

    @RequestMapping(value = "")
    public String index(HttpServletRequest request, HttpServletResponse response, Map modelMap) {
        return "sys/application/index";
    }

	@RequestMapping(value = "/list")
    @ResponseBody
    public Map list(AcApp vo) {
        List<AcApp> list = acAppService.selectByConditionPage(vo);
        return getSuccessResultMap4DataTable(list, vo);
    }

    @RequestMapping(value = "/detail")
    public String detail(HttpServletRequest request, HttpServletResponse response, Map modelMap, int id) {
        AcApp model = acAppService.selectByPrimaryKey(id);
        modelMap.put("model", model);
        return "sys/application/detail";
    }

    @RequestMapping(value = "/deletes", method = RequestMethod.POST)
    @ResponseBody
    public Map deletes(@RequestBody List<Integer> ids) {
        int result = acAppService.deletes(ids);
        return getSuccessfulResultMap(result);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Map save(AcApp vo) {
    	int result = 0;
    	try {
			if(vo.getId()==null || vo.getId()==0){
				result = acAppService.insert(vo);
			}else{
				result = acAppService.updateByPrimaryKeySelective(vo);
			}
		} catch (DuplicateKeyException e) {
			e.printStackTrace();
			return getFailedResultMap(ResponseCodeEnum.AJAX_FAILURE_UNIQUE_KEY_CONFLICT);
		}
    	return getSuccessfulResultMap(result);
    }
}
