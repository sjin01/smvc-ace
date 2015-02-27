package net.hunanst.eduz100.controller.sys;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.hunanst.eduz100.controller.BaseController;

@Controller
@RequestMapping("sys/dict")
public class DictController extends BaseController {
	
	@RequestMapping(value = "")
	public String index(HttpServletRequest request, HttpServletResponse response, Map modelMap) throws Exception {
		
		return "sys/dict";
	}
	
}
