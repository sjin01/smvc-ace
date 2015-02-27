package net.sjin.smvc.controller.userprofile;

import net.sjin.common.util.encryption.AESUtils;
import net.sjin.smvc.api.sys.AcOperator;
import net.sjin.smvc.api.sys.AcOrg;
import net.sjin.smvc.controller.BaseController;
import net.sjin.smvc.service.sys.AcOperatorService;
import net.sjin.smvc.service.sys.AcOrgService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 1/21  10:57
 *
 * @author: guanshj QQ: 928990049
 */

@Controller
@RequestMapping("/userprofile")
public class UserProfileController extends BaseController {

    @Autowired
    private AcOrgService acOrgService;

    @Autowired
    private AcOperatorService acOperatorService;

    @RequestMapping(value = "")
    public ModelAndView main (Integer flag,HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView("userprofile/userprofile_main");
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        mv.addObject("userInfo",acOperator);
        mv.addObject("flag" , (flag==null || flag.equals(0)) ? 1 :flag );
        return mv;
    }

    /**
     * TAB HTML --- ajax load     ##  个人信息
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "tab_info")
    public ModelAndView tab_info (HttpSession session) throws Exception{
        return this.main(1,session);
    }

    /**
     * TAB HTML --- ajax load     ##  个人信息
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "tab_info_active")
    public ModelAndView tab_info_active (HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView("userprofile/tab_info");
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        mv.addObject("userInfo",acOperator);
        return mv;

    }

    /**
     * TAB HTML --- ajax load     ##  公章管理
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "tab_sealmanager")
    public ModelAndView tab_sealmanager (HttpSession session) throws Exception{
        return this.main(2,session);
    }

    /**
     * TAB HTML --- ajax load     ##  公章管理
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "tab_sealmanager_active")
    public ModelAndView tab_sealmanager_active (HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView("userprofile/tab_sealmanager");
        return mv;

    }
    /**
     * TAB HTML --- ajax load     ##  设置
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "tab_settings")
    public ModelAndView tab_settings (HttpSession session) throws Exception{
        return this.main(3,session);

    }

    /**
     * TAB HTML --- ajax load     ##  设置
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "tab_settings_active")
    public ModelAndView tab_settings_active (HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView("userprofile/tab_settings");
        return mv;

    }


    @RequestMapping(value = "tab_settings_form")
    public ModelAndView tab_settings_form (int flag,HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView();
        switch (flag){
            case 1:mv.setViewName("userprofile/forms/form_info");
                break;

            case 2:mv.setViewName("userprofile/forms/form_pwd");
                break;
        }
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        mv.addObject("userInfo",acOperator);

        return mv;
    }

    @RequestMapping(value="userOrgs")
    @ResponseBody
    public List getUserOrgs(HttpSession session) throws Exception{
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        List<AcOrg> orgs=acOrgService.selectByUserid(acOperator.getId());
        return  orgs;
    }

    /**
     *
     * @param session
     * @param newPwd
     * @param oldPwd
     * @return -1根据原来的密码和当前用户id找不到数据  0 更新失败 1更新成功
     * @throws Exception
     */
    @RequestMapping(value="savePwd")
    @ResponseBody
    public Integer savePwd(HttpSession session,String newPwd,String oldPwd) throws Exception{
        int a=0;
        AcOperator vo=new AcOperator();

        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        vo.setId(acOperator.getId());
        vo.setUsercode(acOperator.getUsercode());
        /**
         * 对旧密码进行验证 是否存在
         */
        oldPwd=AESUtils.encrypt(oldPwd);
        vo.setPassword(oldPwd);
        List<AcOperator> list=acOperatorService.selectPage(vo);

        if(list!=null&&!list.isEmpty()){
            vo.setPassword("");
            if(newPwd!=null&&StringUtils.isNotEmpty(newPwd)){
                newPwd= AESUtils.encrypt(newPwd.trim());
                vo.setPassword(newPwd);
                vo.setId(acOperator.getId());
                a=acOperatorService.updateByPrimaryKeySelective(vo);
                acOperator.setPassword(newPwd);
                session.setAttribute("loginUser",acOperator);
            }
        }else{
            a=-1;
        }
        return  a;
    }


    @RequestMapping("saveInfo")
    @ResponseBody
    public int saveInfo(AcOperator vo,HttpSession session){
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        vo.setId(acOperator.getId());
        int a=acOperatorService.updateByPrimaryKeySelective(vo);
        //将最新数据更新到session
        if(a>0){
            acOperator=acOperatorService.selectByPrimaryKey(acOperator.getId());
            session.setAttribute("loginUser",acOperator);
        }
        return a;
    }
}
