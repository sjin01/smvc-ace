package net.sjin.smvc.controller.userprofile;

import net.sjin.smvc.api.oa.Seal;
import net.sjin.smvc.api.sys.AcOperator;
import net.sjin.smvc.controller.BaseController;
import net.sjin.smvc.service.oa.SealService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 1/22  9:39
 *
 * @author: guanshj QQ: 928990049
 */
@Controller
@RequestMapping("/sealManager")
public class SealManagerController extends BaseController {

    @Autowired
    private SealService sealService;

    /**
     * Ajax 保存上传的公文
     * @param seal
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "saveseal")
    public Object saveSeal (Seal seal ,HttpServletRequest request) throws Exception {
        AcOperator login_user = (AcOperator) request.getSession().getAttribute("loginUser");
        seal.setUserid(login_user.getId());
        if(!StringUtils.isEmpty(seal.getKeytext())) seal.setFilename(seal.getKeytext());   // 如果用户自定义命名
        sealService.insertSelective(seal);
        return getSuccessfulResultMap();
    }

    /**
     * Ajax 删除上传的公文
     * @param id
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "delseal")
    public Object delSeal (Integer id) throws Exception {
        sealService.deleteByPrimaryKey(id);
        return getSuccessfulResultMap();
    }

    /**
     * LOAD HTML  公章列表
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "loadSealList")
    public ModelAndView loadSealList (HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("userprofile/loadhtml/seallist");

        AcOperator login_user = (AcOperator) request.getSession().getAttribute("loginUser");
        mv.addObject("sealList" ,sealService.selectSealByUserid(login_user.getId()) );

        return mv;
    }

    /**
     * LOAD HTML  上传 公章 表单
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "loadUploadseal")
    public ModelAndView loadUploadseal (HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("userprofile/loadhtml/uploadseal");
        return mv;
    }

}
