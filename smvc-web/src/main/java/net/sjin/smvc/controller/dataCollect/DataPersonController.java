package net.sjin.smvc.controller.dataCollect;

import net.sjin.common.util.json.JsonConfigUtil;
import net.sjin.smvc.api.data.DataCollectInfo;
import net.sjin.smvc.api.data.vo.PersonView;
import net.sjin.smvc.api.data.vo.TempInfoVo;
import net.sjin.smvc.api.sys.AcOperator;
import net.sjin.smvc.controller.BaseController;
import net.sjin.smvc.service.dataCollect.DataCollectService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-2-5
 * Time: 下午2:21
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value="data/person")
public class DataPersonController extends BaseController {
    @Autowired
    private DataCollectService dataCollectService;


    @RequestMapping(value="")
    public ModelAndView toPersonList(){
        ModelAndView mav=new ModelAndView("datas/data/personal");
        return mav;
    }

    @RequestMapping(value="personList")
    @ResponseBody
    public Object personList(PersonView vo,HttpSession session) throws Exception{
        AcOperator ao=(AcOperator)session.getAttribute("loginUser");
        vo.setUserid(ao.getId());
        List<PersonView> list=dataCollectService.getPersonList(vo);
        return getSuccessResultMap4DataTable(JSONArray.fromObject(list
                , JsonConfigUtil.getJsonDateConfig("yyyy-MM-dd HH:mm:ss")), vo);
    }


    @RequestMapping(value="contents")
    public ModelAndView contents(@RequestParam Integer tempId,HttpSession session) throws Exception{
        ModelAndView mav=new ModelAndView("datas/data/dataContent");
        TempInfoVo tempInfoVo=dataCollectService.selectById(tempId);
        mav.addObject("temp",tempInfoVo);
        return mav;
    }

    @RequestMapping(value="preview")
    @ResponseBody
    public ModelAndView preview(@RequestParam Integer dataInfoId,HttpSession session) throws Exception{
        ModelAndView mav=new ModelAndView("datas/data/view");
        TempInfoVo tempInfoVo=dataCollectService.selectById(dataInfoId);
        mav.addObject("temp",tempInfoVo);

        return mav;
    }

    @RequestMapping(value="subDetail")
    @ResponseBody
    public Object subDetail(DataCollectInfo vo,HttpSession session) throws Exception{
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        vo.setUserid(acOperator.getId());
        int a=dataCollectService.submitData(vo);
        //return new ModelAndView("datas/data/personal");
        return  a;
    }

}
