package net.hunanst.eduz100.controller.dataCollect;

import net.hunanst.common.util.json.JsonConfigUtil;
import net.hunanst.eduz100.api.data.DataCollectInfo;
import net.hunanst.eduz100.api.data.DataCollectInfoDetail;
import net.hunanst.eduz100.api.data.DataInfoUser;
import net.hunanst.eduz100.api.data.vo.PersonView;
import net.hunanst.eduz100.api.data.vo.TempInfoVo;
import net.hunanst.eduz100.api.data.vo.TreeData;
import net.hunanst.eduz100.api.oa.Remind;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.api.sys.AcOrg;
import net.hunanst.eduz100.api.sys.vo.AcOperatorVo;
import net.hunanst.eduz100.controller.BaseController;
import net.hunanst.eduz100.service.dataCollect.DataCollectService;
import net.hunanst.eduz100.service.sys.AcOrgService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:类说明
 * User: Creek
 * Date: 15-1-13
 * Time: 下午2:25
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value="data/collect")
public class DataCollect extends BaseController{

    @Autowired
    private DataCollectService dataCollectService;

    @Autowired
    private AcOrgService acOrgService;

    @RequestMapping(value = "")
    public ModelAndView index () throws Exception {
        ModelAndView mv = new ModelAndView("/datas/temp/tempList");
        return mv;
    }

    @RequestMapping(value = "list")
    @ResponseBody
    public Object getList (TempInfoVo vo,HttpSession session) throws Exception {
        AcOperator ao=(AcOperator)session.getAttribute("loginUser");
        vo.setUserid(ao.getId());
        List<TempInfoVo> list=dataCollectService.selectList(vo);
        return getSuccessResultMap4DataTable(JSONArray.fromObject(list
                , JsonConfigUtil.getJsonDateConfig("yyyy-MM-dd HH:mm:ss")), vo);
    }

    @RequestMapping(value="tempCollect")
    public ModelAndView toDataCollect(@RequestParam Integer id,HttpSession session) throws Exception{
        AcOperator ao=(AcOperator)session.getAttribute("loginUser");
        ModelAndView mv=new ModelAndView("datas/temp/tempCollect");
        TempInfoVo tv=dataCollectService.selectById(id);
        mv.addObject("tempInfoVo",tv);

        /*TreeData vo =new TreeData();
        vo.setPid(0);
        List<TreeData> list=dataCollectService.getTreeByPid(vo);
        mv.addObject("treelist",JSONArray.fromObject(list));*/
        List<AcOrg>  orgList=acOrgService.selectByUserid(ao.getId());
        mv.addObject("orgList",orgList);
        //在进入页面之前 判断身份是属于教育局还是学校  教育局大于学校
        //如果返回的是0  代表是教育局 而且是pid  大于0  则是学校而且是id
        int flagId=dataCollectService.userRole(session);
        mv.addObject("flagId",flagId);

        return mv;
    }

    @RequestMapping(value="getInfoUser")
    @ResponseBody
    public List<DataInfoUser> getInfoUser(@RequestParam Integer tempId) throws Exception{
        List<DataInfoUser> dataInfoUsers=dataCollectService.getInfoUser(tempId);
        return dataInfoUsers;
    }

    @RequestMapping(value="addOrUpdate")
    @ResponseBody
    public ModelAndView addOrUpdate(TempInfoVo vo,HttpSession session) throws Exception{
        AcOperator ao=(AcOperator)session.getAttribute("loginUser");
        vo.setUserid(ao.getId());
        dataCollectService.addOrUpdate(vo);
        return new ModelAndView("redirect:");
    }


    @RequestMapping(value="getTreeByPid")
    @ResponseBody
    public List<TreeData> getSchoolTreeByPid(TreeData vo,HttpSession session) throws Exception{
        List<TreeData> list=dataCollectService.getTreeByPid(vo);
        return list;
    }

    @RequestMapping(value="getOrgsTreeByPid")
    @ResponseBody
    public List<TreeData> getOrgsTree(TreeData vo,HttpSession session) throws Exception{
        List<TreeData> list=null;
        if(vo.getType()!=null&&vo.getType().equals("org")){
            list=dataCollectService.selectZtreeOrgs(vo);
        }
        return list;
    }

    @RequestMapping(value="getTree")
    @ResponseBody
    public List<TreeData> getTree(TreeData vo) throws Exception{
        List<TreeData> list=dataCollectService.selectZtreeOrgs(vo);
        /*if(vo.getPid()!=null&&vo.getPid()==0){
            //教育局
            list=dataCollectService.selectZtreeOrgs(vo);
        }else{
            list=dataCollectService.selectZtreeOnlySchools(vo);
        }*/
        return list;
    }

    @RequestMapping(value="del")
    @ResponseBody
    public int del(@RequestParam Integer id) throws Exception{
        int i=dataCollectService.deleteById(id);
        return i;
    }

    @RequestMapping(value="deletes")
    @ResponseBody
    public int deletes(List<Integer> ids) throws Exception{
        int result =0;
        if(ids!=null&&ids.size()>0){
            result = dataCollectService.deletes(ids);
        }
        return result;
    }


   /* @RequestMapping(value="toperson")
    public ModelAndView toPersonList(){
        ModelAndView mav=new ModelAndView("datas/data/personal");
        return mav;
    }*/


    /*@RequestMapping(value="personList")
    @ResponseBody
    public Object personList(PersonView vo,HttpSession session) throws Exception{
        AcOperator ao=(AcOperator)session.getAttribute("loginUser");
        vo.setUserid(ao.getId());
        List<PersonView> list=dataCollectService.getPersonList(vo);
        return getSuccessResultMap4DataTable(JSONArray.fromObject(list
                , JsonConfigUtil.getJsonDateConfig("yyyy-MM-dd HH:mm:ss")), vo);
    }*/


    /*@RequestMapping(value="contents")
    public ModelAndView contents(@RequestParam Integer tempId,HttpSession session) throws Exception{
        ModelAndView mav=new ModelAndView("datas/data/dataContent");
        TempInfoVo tempInfoVo=dataCollectService.selectById(tempId);
        mav.addObject("temp",tempInfoVo);
        return mav;
    }*/


    /*@RequestMapping(value="subDetail")
    @ResponseBody
    public ModelAndView subDetail(DataCollectInfo vo,HttpSession session) throws Exception{
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        vo.setUserid(acOperator.getId());
        dataCollectService.submitData(vo);
        return new ModelAndView("datas/data/personal");
    }*/

    /*@RequestMapping(value="preview")
    @ResponseBody
    public ModelAndView preview(@RequestParam Integer dataInfoId,HttpSession session) throws Exception{
        ModelAndView mav=new ModelAndView("datas/data/view");
        TempInfoVo tempInfoVo=dataCollectService.selectById(dataInfoId);
        mav.addObject("temp",tempInfoVo);

        return mav;
    }*/

    /**
     *
     * @param type 1:个人查看自己提交的数据;  其他:以任务发起者的身份 查看数据提交情况
     * @param vo
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value="getSubmitData")
    @ResponseBody
    public List<DataCollectInfoDetail> getSubmitData(Integer type,DataCollectInfo vo,HttpSession session) throws Exception{
        if(type==1){
            AcOperator ao=(AcOperator)session.getAttribute("loginUser");
            vo.setUserid(ao.getId());
        }

        List<DataCollectInfoDetail> dataCollectInfoDetails=dataCollectService.getDataByTempId(vo);
        return dataCollectInfoDetails;
    }


    @RequestMapping(value="getDatas")
    public ModelAndView getDatas(@RequestParam Integer tempInfoId) throws Exception{
        ModelAndView mav=new ModelAndView("datas/data/tempData");
        TempInfoVo tempInfoVo=dataCollectService.selectById(tempInfoId);
        mav.addObject("temp",tempInfoVo);
        List<AcOperator> acOperatorList=dataCollectService.getsubDataUsers(tempInfoId);
        mav.addObject("users",acOperatorList);

        List<AcOperatorVo> undone=dataCollectService.undoneUsers(tempInfoId);
        mav.addObject("persons",undone);
        return mav;
    }

    @RequestMapping(value="export")
    public void export(@RequestParam Integer tempInfoId,HttpServletResponse response) throws Exception{
        dataCollectService.export(tempInfoId,response);
    }

    @RequestMapping(value="remind")
    @ResponseBody
    public int remind(Remind remind,HttpSession session) throws Exception{
        AcOperator acOperator=(AcOperator)session.getAttribute("loginUser");
        remind.setOperatoruserid(acOperator.getId());
        remind.setType(3);
        remind.setSenddate(new Date());
        int i=dataCollectService.addRemind(remind);
        return i;
    }
}
