package net.hunanst.eduz100.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.hunanst.common.api.enumeration.ResponseCodeEnum;
import net.hunanst.common.util.encryption.AESUtils;
import net.hunanst.eduz100.api.sys.AcFunc;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.api.sys.AcOrg;
import net.hunanst.eduz100.service.sys.AcFuncService;
import net.hunanst.eduz100.service.sys.AcOperatorService;
import net.hunanst.eduz100.service.sys.AcOrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("")
@SuppressWarnings("unchecked")
public class LoginController extends BaseController {

	@Autowired
	private AcOperatorService acOperatorService;
	@Autowired
	private AcFuncService acFuncService;
	@Autowired
	private AcOrgService acOrgService;

	@RequestMapping(value = { "", "index" })
	public String index(HttpServletRequest request, HttpServletResponse response, Map modelMap) {
		if (request.getSession().getAttribute("loginUser") != null) {
			modelMap.put("rightMenuVisiable", false);
			return "index";
		}
		return "login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	@ResponseBody
	public Map login(HttpServletRequest request, HttpServletResponse response, AcOperator operator) {

		operator.setPassword(AESUtils.encrypt(operator.getPassword()));

		List<AcOperator> list = acOperatorService.selectByCondition(operator);

		if (list.size() == 1) {
			AcOperator loginuser = list.get(0);
			request.getSession().setAttribute("loginUser", loginuser);
			try {
				this.setUserFunc(request, loginuser);
				this.setUserOtherInfoByNewThread(request, loginuser);
			} catch (Exception e) {
				e.printStackTrace();
				return this.getFailedResultMap(ResponseCodeEnum.AJAX_NO_AUTH);
			}
			return this.getSuccessfulResultMap();
		}
		return getFailedResultMap(ResponseCodeEnum.AJAX_USERNAME_PASSWORD_ERROR);
	}

	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, AcOperator operator) {
		request.getSession().setAttribute("loginUser", null);
		return "login";
	}

	private void setUserFunc(HttpServletRequest request, AcOperator loginuser) {
		if ("admin".equals(loginuser.getUsercode())) {
			List<AcFunc> authfuncs = acFuncService.selectAll();
			request.getSession().setAttribute("authfuncs", authfuncs);
		} else {
			List<AcFunc> authfuncs = acFuncService.selectFuncByOperid(loginuser.getId());
			request.getSession().setAttribute("authfuncs", authfuncs);
		}
	}

	private void setUserOtherInfoByNewThread(HttpServletRequest request, final AcOperator loginuser) {
		final HttpSession session = request.getSession();
		new Thread(new Runnable() {
			@Override
			public void run() {
				if (loginuser.getBelongorgid() != null
						&& loginuser.getBelongorgid() > 0) {
					AcOrg org = acOrgService.selectByPrimaryKey(loginuser.getBelongorgid());
					session.setAttribute("loginOrg", org);
				}
			}
		}).start();
	}

	@RequestMapping(value = "/download/{filePath}/{fileName:[\\w\\.\\-]+}")
	public ModelAndView downloadFile(HttpServletRequest request, HttpServletResponse response,
			@PathVariable String filePath, @PathVariable String fileName) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-disposition", 
				"attachment; filename=" + new String(fileName.getBytes("utf-8"), "ISO8859-1"));
		
		InputStream is = Thread.currentThread().getContextClassLoader()
				.getResourceAsStream("files/"+filePath+"/"+fileName);
		
		BufferedInputStream bis = new BufferedInputStream(is);
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		byte[] buff = new byte[2048];
		int bytesRead;
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);
		}
		bis.close();
		bos.close();
		
		return null;
	}
}
