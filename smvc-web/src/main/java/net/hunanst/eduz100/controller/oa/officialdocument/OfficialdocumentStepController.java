package net.hunanst.eduz100.controller.oa.officialdocument;

import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.api.sys.AcOrg;
import net.hunanst.eduz100.controller.BaseController;
import net.hunanst.eduz100.service.oa.SealService;
import net.hunanst.eduz100.service.sys.AcOrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 12/26  16:09
 *
 * @author: guanshj QQ: 928990049
 */
@Controller
@RequestMapping("oa/officialdocument/step")
public class OfficialdocumentStepController extends BaseController{

    @Autowired
    private SealService sealService;

    @Autowired
    private AcOrgService orgService;

    /**
     * 审批通过 step 1
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "approvalPass")
    public ModelAndView approvalPass ( Integer odid ) throws Exception {
        ModelAndView mv = new ModelAndView("oa/officialdocument/step/approval_pass1");
        mv.addObject("odid" , odid);
        return mv;
    }

    /**
     * Ajax load HTML  选择公章弹窗
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "chooseSealDialog")
    public ModelAndView chooseSealDialog (HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("oa/officialdocument/step/chooseSeal_dialogHtml");

        AcOperator login_user = (AcOperator) request.getSession().getAttribute("loginUser");
        mv.addObject("sealList" ,sealService.selectSealByUserid(login_user.getId()) );

        return mv;
    }

    /**
     * Ajax load HTML   归档弹窗
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "toRecordDialog")
    public ModelAndView toRecordDialog (Integer officialDocumentId ,HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("oa/officialdocument/step/torecord_dialog");

        AcOperator login_user = (AcOperator) request.getSession().getAttribute("loginUser");
        List<AcOrg> login_orgList = orgService.selectByUserid(login_user.getId());

        mv.addObject("officialDocumentId" ,officialDocumentId);

        mv.addObject("login_user" ,login_user);
        mv.addObject("login_orgList" ,login_orgList);
        mv.addObject("login_orgList_size" ,( login_orgList == null || login_orgList.isEmpty() ) ? 0 : login_orgList.size());
        return mv;
    }
}
