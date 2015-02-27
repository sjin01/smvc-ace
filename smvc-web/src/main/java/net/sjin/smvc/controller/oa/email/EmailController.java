package net.sjin.smvc.controller.oa.email;

import net.sjin.smvc.constant.MailConstant;
import net.sjin.smvc.api.oa.AcOperatorIdAndName;
import net.sjin.smvc.api.oa.MailBox;
import net.sjin.smvc.api.oa.MailDetail;
import net.sjin.smvc.api.oa.MailFile;
import net.sjin.smvc.api.sys.AcOperator;
import net.sjin.smvc.controller.BaseController;
import net.sjin.smvc.service.oa.AddressBookService;
import net.sjin.smvc.service.oa.MailBoxService;
import net.sjin.smvc.service.sys.AcOperatorService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("oa/email")
public class EmailController extends BaseController {
	
	private static Logger logger = Logger.getLogger(EmailController.class.getName());
	
	@Autowired
	private MailBoxService mailBoxService;


    @Autowired
    private AcOperatorService acOperatorService;

    @Autowired
    private AddressBookService addressBookService;

    /**
     * 邮箱页面
     * @return
     */
    @RequestMapping(value = "inbox")
    public ModelAndView inboxhtml () {
        ModelAndView mv = new ModelAndView("oa/email/inbox");
        return mv;
    }

//    @RequestMapping(value = "inbox")
//    public ModelAndView inboxhtml (Integer flag,HttpServletRequest request) {
//        ModelAndView mv = new ModelAndView("oa/email/inbox");
//        mv.addObject("flag" , (flag==null || flag.equals(0)) ? 2 :flag );
//        return mv;
//    }


//    @RequestMapping(value = "receiveBox")
//    public ModelAndView receiveBox ( HttpServletRequest request) throws Exception {
//        return this.inboxhtml(2,request);
//    }
//
//    @RequestMapping(value = "sendBox")
//    public ModelAndView sendBox ( HttpServletRequest request) throws Exception {
//        return this.inboxhtml(3,request);
//    }
//
//    @RequestMapping(value = "draftBox")
//    public ModelAndView draftBox ( HttpServletRequest request) throws Exception {
//        return this.inboxhtml(4,request);
//    }
//
//    @RequestMapping(value = "writeMail")
//    public ModelAndView writeMail ( HttpServletRequest request) throws Exception {
//        return this.inboxhtml(1,request);
//    }
    
    @RequestMapping(value = "queryEmailItems")
    @ResponseBody
    public Map<String, Object>  queryEmailItems(HttpServletRequest request, 
    		HttpServletResponse response,int boxtype,int startSize,int pageSize){
    	Map<String ,Object> m = new HashMap<String ,Object>();
    	AcOperator acOperator = (AcOperator) request.getSession().getAttribute("loginUser");
    	
    	MailBox vo = new MailBox();
    	vo.setUserid(acOperator.getId());
    	
    	vo.setBoxtype(boxtype);
    	vo.setiDisplayStart(startSize);
    	vo.setiDisplayLength(startSize+pageSize);
    	
    	List<MailDetail> result = null;
    	int totalSize = 0;
    	
    	 try {
			result = mailBoxService.selectByCondition(vo);
			 totalSize = mailBoxService.selectByConditionCount(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	m.put("data", result);
    	m.put("pageSize", pageSize);
    	m.put("totalSize", totalSize);
    	m.put("totalPage", totalSize%pageSize==0? totalSize/pageSize:totalSize/pageSize+1);
    	m.put("currentPage", startSize%pageSize==0? startSize/pageSize:startSize/pageSize+1);
		return m;
    }
    
    
    
    @RequestMapping(value = "queryMailContent")
    @ResponseBody
    public Map<String, Object>  queryMailContent(HttpServletRequest request, 
    		HttpServletResponse response,int mailid,int mailState){
    	Map<String ,Object> m = new HashMap<String ,Object>();
    	AcOperator acOperator = (AcOperator) request.getSession().getAttribute("loginUser");
    	
    	MailBox vo = new MailBox();
    	vo.setUserid(acOperator.getId());
    	
    	vo.setMailid(mailid);
    	vo.setReadstate(mailState);
    	vo.setBoxtype(2);
    	
    	List<MailDetail> result = null;
        List<MailFile> attachments = null;
    	int totalresult = 0;
    	
    	 try {
			result = mailBoxService.selectMailContent(vo);
             attachments = mailBoxService.selectMailFile(vo);
			 totalresult = mailBoxService.selectUnReadMailCountByCondition(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	
    	if(result!=null && result.size() > 0 ){
    		m.put("data", result.get(0));
    		m.put("totals", totalresult);
            m.put("attachments",attachments);
    	}
		return m;
    }
    
    
    @RequestMapping(value = "queryUnReadCountEmail")
    @ResponseBody
    public Map<String, Object>  queryUnReadCountEmail(HttpServletRequest request, 
    		HttpServletResponse response){
    	Map<String ,Object> m = new HashMap<String ,Object>();
    	AcOperator acOperator = (AcOperator) request.getSession().getAttribute("loginUser");
    	
    	MailBox vo = new MailBox();
    	vo.setUserid(acOperator.getId());
    	vo.setBoxtype(2);
    	
    	int result = 0;
    	
       try {
    	   result = mailBoxService.selectUnReadMailCountByCondition(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
       
    	m.put("totals", result);
		return m;
    }
    
    
    
    @RequestMapping(value = "queryEmailReceiveOperater")
    @ResponseBody
    public Map<String, Object>  queryEmailReceiveOperater(HttpServletRequest request, 
    		HttpServletResponse response,String username){
    	Map<String ,Object> m = new HashMap<String ,Object>();
    	AcOperator acOperator = new AcOperator();
    	acOperator.setUsername(username);
    	
    	List<AcOperatorIdAndName> result = null;
    	
    	
    	try {
			result = mailBoxService.selectEmailReceiveOperater(acOperator);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	m.put("data", result);
		return m;
    }
    
    
    @RequestMapping(value = "sendEmail")
    @ResponseBody
    public Map<String, Object>  sendEmail(HttpServletRequest request,
    		HttpServletResponse response,String userids,String title,String content,String attachmenturl){
    	Map<String ,Object> m = new HashMap<String ,Object>();
    	AcOperator acOperator = (AcOperator) request.getSession().getAttribute("loginUser");
    	
    	int flag = 0;
    	
    	if(StringUtils.hasText(userids)){
    		
    		logger.info("userids:"+userids);
    		
    		Map<String,Object> params = new HashMap<String,Object>();
    		params.put("userid", acOperator.getId());
    		params.put("userids", userids);
    		params.put("title", title);
    		params.put("content", content);
    		params.put("attachmenturl", attachmenturl);

            params.put("pathheader", request.getSession().getServletContext().getAttribute("nginx_filepath") );
    		
    		try {
				flag = mailBoxService.saveEmail(params);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    	
    	m.put("msg", flag);
		return m;
    }
    
    
    
    
    @RequestMapping(value = "saveDraftEmail")
    @ResponseBody
    public Map<String, Object>  saveDraftEmail(HttpServletRequest request, 
    		HttpServletResponse response,String title,String content){
    	Map<String ,Object> m = new HashMap<String ,Object>();
    	AcOperator acOperator = (AcOperator) request.getSession().getAttribute("loginUser");
    	
    	int flag = 0;
    	
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("userid", acOperator.getId());
		params.put("title", title);
		params.put("content", content);
		params.put("boxtype", MailConstant.MAIL_BOX_TYPE_DRAFT);
		
		try {
			flag = mailBoxService.saveDraftEmail(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	m.put("msg", flag);
		return m;
    }
    
    
    
    
    @RequestMapping(value = "delEmail")
    @ResponseBody
    public Map<String, Object>  delEmail(HttpServletRequest request, 
    		HttpServletResponse response,int mailid,int boxtype){
    	Map<String ,Object> m = new HashMap<String ,Object>();
    	AcOperator acOperator = (AcOperator) request.getSession().getAttribute("loginUser");
    	
    	int flag = 0;
    	
    	if(mailid!=0){
    		logger.info("mailid:"+mailid);
    		
    		MailBox vo = new MailBox();
    		vo.setUserid(acOperator.getId());
    		vo.setMailid(mailid);
    		vo.setBoxtype(boxtype);
    		try {
				flag = mailBoxService.delEmail(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    	
    	m.put("msg", flag);
		return m;
    }


    @RequestMapping(value = "getMessageMembers")
    @ResponseBody
    public List getMessageMembers (Integer receiveId,HttpServletRequest request){
        AcOperator vo= (AcOperator) request.getSession().getAttribute("loginUser");
        return mailBoxService.getMessageMembers(vo.getId());
    }

    @RequestMapping(value = "saveMemberToAddressBook")
    @ResponseBody
    public Map<String, Object>  saveMemberToAddressBook(HttpServletRequest request,
                                         HttpServletResponse response,int userid){
        Map<String ,Object> m = new HashMap<String ,Object>();
        AcOperator acOperator = (AcOperator) request.getSession().getAttribute("loginUser");

        int flag = -1;

        if(userid!=0){
            logger.info("userid:"+userid);
            try {
                flag = mailBoxService.addAddressBookByAcOperId(acOperator.getId(), userid);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        m.put("msg", flag);
        return m;
    }

    @RequestMapping(value = "downEmailFile")
    @ResponseBody
    public void downEmailFile (String emailFilePath,String emailFileName,HttpServletRequest request,HttpServletResponse response) throws IOException {
        AcOperator vo = (AcOperator) request.getSession().getAttribute("loginUser");

        if (vo != null) {
            // 建立链接
            URL url = new URL(emailFilePath);
            HttpURLConnection httpUrl = (HttpURLConnection) url.openConnection();
            // 连接指定的资源
            httpUrl.connect();
            // 获取网络输入流
            BufferedInputStream bis = new BufferedInputStream(httpUrl.getInputStream());

            response.setContentType("application/octet-stream");
            emailFileName = new String(emailFileName.getBytes(), "ISO-8859-1");
            response.setHeader("Content-Disposition", "attachment; filename=" + emailFileName);
            OutputStream out = response.getOutputStream();
            byte[] buf = new byte[1024];
            if (emailFilePath != null) {
                BufferedInputStream br = bis;
                int len = 0;
                while ((len = br.read(buf)) > 0){
                    out.write(buf, 0, len);
                }
                br.close();
            }
            out.flush();
            out.close();

        }
    }


    @RequestMapping(value = "delAllCheckMails")
    @ResponseBody
    public Map<String, Object>  delAllCheckMails(HttpServletRequest request,
                                                        HttpServletResponse response,MailBox mailBox){
        Map<String ,Object> m = new HashMap<String ,Object>();
        AcOperator acOperator = (AcOperator) request.getSession().getAttribute("loginUser");
        int flag = -1;
        if(mailBox!=null){
            try {
                mailBox.setUserid(acOperator.getId());
                flag = mailBoxService.delAllCheckMails(mailBox);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        m.put("msg", flag);
        return m;
    }


}
