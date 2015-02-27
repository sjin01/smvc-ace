package net.hunanst.eduz100.controller.example;

import net.hunanst.eduz100.controller.BaseController;
import net.hunanst.eduz100.dto.FueluxTreeVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:   示例
 * 创建日期: 12/22  17:15
 *
 * @author: guanshj QQ: 928990049
 */
@Controller
@RequestMapping("example")
public class TestController extends BaseController{


    @RequestMapping(value = "fileupload")
    public ModelAndView fileupload () throws Exception {
        ModelAndView mv = new ModelAndView("/example/test_file");
        return mv;
    }


    @RequestMapping(value = "testTree")
    public ModelAndView testTree(){
        ModelAndView mv = new ModelAndView("example/test_tree");

//        List<AcOrg> list = new ArrayList<AcOrg>();
        return mv;
    }

    @RequestMapping(value = "/treedata")
    @ResponseBody
    public Object treedata() {
        Map<String , Object> result = new HashMap<String, Object>();

        Map<String ,Object> additionalParameters_itemSelected_true = new HashMap<String, Object>();
        additionalParameters_itemSelected_true.put("item-selected" , true);
        Map<String ,Object> additionalParameters_itemSelected_false = new HashMap<String, Object>();
        additionalParameters_itemSelected_false.put("item-selected" , false);

        List<FueluxTreeVo> treeData = new ArrayList<FueluxTreeVo>();
        FueluxTreeVo item1 = new FueluxTreeVo();
        item1.setName("跟节点1");
        item1.setType("item");
        item1.setId(1);
//        item1.setAdditionalParameters(additionalParameters_itemSelected_true);
        treeData.add(item1);

        FueluxTreeVo item2 = new FueluxTreeVo();
        item2.setName("跟节点112");
        item2.setType("item");
        item2.setId(2);
//        item2.setAdditionalParameters(additionalParameters_itemSelected_false);
        treeData.add(item2);

        result.put("status","OK");
        result.put("data", treeData );

        return result;
    }
}
