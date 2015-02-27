package net.sjin.smvc.controller.sys;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sjin.smvc.api.sys.AcFunc;
import net.sjin.smvc.api.sys.AcOperator;
import net.sjin.smvc.api.sys.AcOrg;
import net.sjin.smvc.api.sys.AcOrgFunc;
import net.sjin.smvc.api.sys.vo.AcOrgVo;
import net.sjin.smvc.controller.BaseController;
import net.sjin.smvc.controller.util.excel.ExcelUtil;
import net.sjin.smvc.dto.FueluxTreeVo;
import net.sjin.smvc.service.sys.AcFuncService;
import net.sjin.smvc.service.sys.AcOrgFuncService;
import net.sjin.smvc.service.sys.AcOrgService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
@RequestMapping("sys/organization")
@SuppressWarnings({"rawtypes", "unchecked"})
public class OrgController extends BaseController {

    @Autowired
    private AcOrgService acOrgService;
    @Autowired
    private AcOrgFuncService acOrgFuncService;
    @Autowired
	private AcFuncService acFuncService;
    @Autowired
    private CommonsMultipartResolver multipartResolver;

    @RequestMapping(value = "")
    public String index(Map modelMap) {
        return "sys/organization/index";
    }
    
    @RequestMapping(value = "detail")
    public String detail(Map modelMap, AcOrg vo) {
    	if("insert".equals(dual.getOperationtype())){
    		modelMap.put("porg", acOrgService.selectByPrimaryKey(vo.getParentid()));
    	}else if("update".equals(dual.getOperationtype())){
    		modelMap.put("corg", acOrgService.selectByPrimaryKey(vo.getId()));
    		modelMap.put("porg", acOrgService.selectByPrimaryKey(vo.getParentid()));
    	}
        return "sys/organization/detail";
    }
    
    @RequestMapping(value = "/list")
    @ResponseBody
    public List<AcOrg> list(HttpSession session) {
    	AcOrg vo = new AcOrg();
    	AcOperator loginuser = (AcOperator)session.getAttribute("loginUser");
    	if(!"admin".equals(loginuser.getUsercode()) && loginuser.getBelongorgid()>0){
    		vo.setBelongorgid(loginuser.getBelongorgid());
    	}
    	List<AcOrg> list = acOrgService.selectAll(vo);
        return list;
    }
    
    @RequestMapping(value = "/tree")
    @ResponseBody
    public List<AcOrg> tree(int parentid) {
    	List<AcOrg> list = acOrgService.selectByParentid(parentid);
        return list;
    }
    
    @RequestMapping(value = "/deletes", method = RequestMethod.POST)
    @ResponseBody
    public Map deletes(AcOrg vo) {
    	int result = acOrgService.deleteAndChildren(vo);
        return getSuccessfulResultMap(result);
    }
    
    @RequestMapping(value = "/checkOrgName", method = RequestMethod.POST)
    @ResponseBody
    public Boolean checkOrgName(AcOrg vo) {
    	if(vo.getParentid()==null) return true;
        return acOrgService.checkOrgNameExisted(vo);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Map save(final AcOrg vo, HttpServletRequest request) {
    	int result = 0;
    	if (vo.getId()!=null && vo.getId()>0) {
    		result =  acOrgService.updateByPrimaryKeySelective(vo);
		} else {
			result = acOrgService.insertAndUpdateSeq(vo);
			if (Boolean.parseBoolean(request.getParameter("extending")))
					new Thread(new Runnable() {
						@Override
						public void run() {
							acOrgFuncService.insertAuthByParentOrg(vo);
						}
					}).start();
		}
    	return getSuccessfulResultMap(result);
    }

    /**
     *  FueluxTree  数据
     * @param pid
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/orgFueluxTreeData")
    public Object getFueluxTreeData(Integer pid) throws Exception{
        List<FueluxTreeVo> treeData = acOrgService.getFueluxTreeData(pid);
        return getSuccessfulResultMap(treeData);
    }

    /**
     * 包括 user item 的树
     * @param pid
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/orgUserTreeData")
    public Object getFueluxTreeData_includeUser(Integer pid ,Integer deliverid , Integer delivertype) throws Exception{
        List<FueluxTreeVo> treeData = acOrgService.getOrgUserFueluxTreeData(pid ,deliverid , delivertype);
        return getSuccessfulResultMap(treeData);
    }

    /**
     * ajax : 根据 userid 获取其 org list
     * @param userid
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/getOrgByUserid")
    public Object getOrgByUserid (Integer userid ) throws Exception{
        return getSuccessfulResultMap(acOrgService.selectByUserid(userid));
    }
    
    @RequestMapping(value = "funcrelation")
    public String funcrelation(HttpSession session, Map modelMap, @RequestParam int orgid) {
    	/*
    	AcOrg vo = new AcOrg();
    	AcOperator loginuser = (AcOperator)session.getAttribute("loginUser");
    	if(!"admin".equals(loginuser.getUsercode()) && loginuser.getBelongorgid()>0){
    		vo.setBelongorgid(loginuser.getBelongorgid());
    	}
    	*/
    	AcOrg model = acOrgService.selectByPrimaryKey(orgid);
    	modelMap.put("model", model);
        return "sys/organization/funcrelation";
    }

    @RequestMapping(value = "getfuncrelation")
    @ResponseBody
    public Map getfuncrelation(int orgid){
    	List<AcOrgFunc> list = acOrgFuncService.selectByOrgid(orgid);
    	return getSuccessfulResultMap(list);
    }
    
    @RequestMapping(value = "savefuncrelation")
    @ResponseBody
    public Map savefuncrelation(@RequestBody String listString){
    	Gson gson = new Gson();
    	List<AcOrgFunc> list = gson.fromJson(listString, new TypeToken<List<AcOrgFunc>>(){}.getType());
    	int result = acOrgFuncService.savefuncrelation(list);
        return getSuccessfulResultMap(result);
    }
    
    @RequestMapping(value = "/schoolOrg")
    @ResponseBody
    public Map getSchoolOrg() {
    	List<AcOrg> list = acOrgService.selectAllSchoolOrg();
    	AcOrg org = new AcOrg();
    	org.setId(0);
    	org.setOrgname("临澧教育局");
    	org.setBelongorgid(0);
    	list.add(0, org);
    	return getSuccessfulResultMap(list);
    }
    
    @RequestMapping(value = "listAuth")
    @ResponseBody
    public List<AcFunc> listByBelongOrg(HttpSession session, int orgid, int belongorgid) {
    	AcOperator loginuser = (AcOperator)session.getAttribute("loginUser");
    	if(loginuser.getBelongorgid()!=null && loginuser.getBelongorgid()>0){ // 学校操作员
    		return acFuncService.selectByBelongOrg(belongorgid);
    	}else { // 教育局操作员
    		/*if(belongorgid==0 || orgid==belongorgid)
    			return acFuncService.selectAll();
    		else
    			return acFuncService.selectByBelongOrg(belongorgid);*/
    		return acFuncService.selectAll();
    	}
    }
    
    @RequestMapping(value = "funcbatch")
    public String funcbatch(Map modelMap, @ModelAttribute("orgids") String orgids) {
    	List idList = Arrays.asList(orgids.split(","));
    	List<AcOrg> models = acOrgService.selectBatchByPrimaryKey(idList);
        modelMap.put("models", models);
        return "sys/organization/funcbatchrelation";
    }
    
    @RequestMapping(value = "savefuncbatchrelation")
    @ResponseBody
    public Map savefuncbatchrelation(@RequestBody String relations){
    	JSONObject json = JSONObject.fromObject(relations);
    	List<Integer> deletelist = (List<Integer>)JSONArray.toCollection(
    			(JSONArray)json.get("deletelist"), Integer.class);
    	List<AcOrgFunc> insertlist = (List<AcOrgFunc>)JSONArray.toCollection(
    			(JSONArray)json.get("insertlist"), AcOrgFunc.class);
    	int result = acOrgFuncService.saveByBatch(deletelist, insertlist);
        return getSuccessfulResultMap(result);
    }
    
    /**
     * excel表格导入机构
     * @param importMethod 导入方式：覆盖导入discover， 新增导入add
     * @param rootorgid 要导入机构的节点id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "upload/{importMethod}/{rootorgid}")
    @ResponseBody
    public Map upload (HttpServletRequest request, HttpServletResponse response, 
    		@PathVariable String importMethod, @PathVariable int rootorgid) throws Exception {
    	AcOperator loginuser = (AcOperator)request.getSession().getAttribute("loginUser");
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        if (multipartResolver.isMultipart(multipartRequest)) { // 判断 request
           
            AcOrg rootorg = acOrgService.selectByPrimaryKey(rootorgid);
            MultiValueMap<String, MultipartFile> multfiles = multipartRequest.getMultiFileMap();
            
            for (String srcfname : multfiles.keySet()) {
                MultipartFile mfile = multfiles.getFirst(srcfname);
                InputStream is = mfile.getInputStream();
                
                List<AcOrg> importList = new ArrayList<AcOrg>();
                String parseResult = parseExcel(is, importList, rootorg.getOrgname());
                if(parseResult!=null) { // 说明上传的文件格式、内容等存在异常
                	return getSuccessfulResultMap(parseResult);
                }
                
                
                AcOrg temp = new AcOrg();
                temp.setOrgseq(rootorg.getOrgseq());
				if("discover".equals(importMethod)){ // 覆盖导入前必须删除原有机构
					acOrgService.deleteAndChildren(temp);
				}
				
                acOrgService.insertByTree(rootorg, importList);
            }
        }

        return getSuccessfulResultMap();
    }

    /**
     * 解析excel，并检验数据， 返回检验的结果
     * @param is
     * @param importList
     * @return 返回null表示解析成功；否则返回错误原因
     */
	private String parseExcel(InputStream is, List<AcOrg> importList, String rootOrgName) {
		try {
			POIFSFileSystem fs = new POIFSFileSystem(is);
			HSSFWorkbook wb = new HSSFWorkbook(fs);
			HSSFSheet sheet = wb.getSheetAt(0);
			
			HSSFRow row; 
			String orgname, parentorgname, isSchoolRoot;
			Map<String, AcOrgVo> map = new HashMap<String, AcOrgVo>();
			
			// 第一次遍历，取得所有机构数据， 同时验证机构名是否为空，是否重复
			for (int i = 3; i <= sheet.getLastRowNum(); i++) {
				row = sheet.getRow(i);
				if(row==null) continue;
				orgname = ExcelUtil.getCellFormatValue(row.getCell(0));
				parentorgname = ExcelUtil.getCellFormatValue(row.getCell(1));
				isSchoolRoot = ExcelUtil.getCellFormatValue(row.getCell(2));
				
				if(orgname==null || "".equals(orgname)){ // 机构名为空
					return "第"+(i+1)+"行机构名为空值！";
				}
				if(map.get(orgname)!=null){ // 机构名称重复
					return "第"+(i+1)+"行机构名已经存在！";
				}
				
				AcOrgVo org = new AcOrgVo();
				org.setOrgname(orgname);
				org.setOrgfullname(orgname);
				org.setParentorgname(parentorgname);
				org.setSortid(i-2);
				org.setBelongorgid(0);
				org.setSchoolRoot("是".equals(isSchoolRoot));
				map.put(orgname, org);
			}
			
			
			// 第二次遍历，建立机构的树形结构关系，同时验证父机构是否存在
			for (Iterator<Entry<String, AcOrgVo>> iterator = map.entrySet().iterator(); iterator.hasNext();) {
				AcOrgVo org = iterator.next().getValue();
				if(org.getParentorgname()!=null && !"".equals(org.getParentorgname())){ // 父机构不为空
					
					if(rootOrgName.equals(org.getParentorgname())){ // 父机构是根机构
						importList.add(org);
					}else{ // 父机构不是根机构
						AcOrgVo parentorg = map.get(org.getParentorgname());
						
						if(parentorg==null){ // 找不到对应的父机构
							return "第"+(org.getSortid()+3)+"行父机构名不存在！";
						}
						
						if(parentorg.getChildrenOrg()==null){
							parentorg.setChildrenOrg(new ArrayList<AcOrg>());
						}
						parentorg.getChildrenOrg().add(org);
					}
				}else{ // 父机构为空，表示父机构是根机构
					importList.add(org);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "文件格式错误！";
		}
		
		return null;
	}
}
