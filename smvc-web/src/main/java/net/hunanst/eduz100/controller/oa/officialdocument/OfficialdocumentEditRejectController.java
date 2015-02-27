package net.hunanst.eduz100.controller.oa.officialdocument;

import net.hunanst.common.api.constant.OfficialdocumentConstant;
import net.hunanst.common.api.enumeration.OfficialDocumentStatusEnum;
import net.hunanst.common.util.json.JsonConfigUtil;
import net.hunanst.eduz100.api.oa.Officialdocument;
import net.hunanst.eduz100.api.oa.OfficialdocumentDeliver;
import net.hunanst.eduz100.api.oa.OfficialdocumentFile;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.api.sys.AcOrg;
import net.hunanst.eduz100.controller.BaseController;
import net.hunanst.eduz100.dto.OfficialDocumentDto;
import net.hunanst.eduz100.service.oa.OfficialdocumentDeliverService;
import net.hunanst.eduz100.service.oa.OfficialdocumentFileService;
import net.hunanst.eduz100.service.oa.OfficialdocumentService;
import net.hunanst.eduz100.service.sys.AcOperatorService;
import net.hunanst.eduz100.service.sys.AcOrgService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Title :盛通-- 临澧教育局平台
 * Description: * 被驳回 公文修改 控制器
 * 创建日期: 1/5  10:59
 *
 * @author: guanshj QQ: 928990049
 */
@Controller
@RequestMapping("oa/officialdocument/editreject")
public class OfficialdocumentEditRejectController extends BaseController {

    @Autowired
    private OfficialdocumentService officialdocumentService;

    @Autowired
    private OfficialdocumentDeliverService officialdocumentDeliverService;

    @Autowired
    private OfficialdocumentFileService officialdocumentFileService;

    @Autowired
    private AcOrgService orgService;

    @Autowired
    private AcOperatorService operatorService;



    /**
     * html : 被驳回 公文修改 页面
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "")
    public ModelAndView editRejectHtml ( Integer odid , HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("oa/officialdocument/edit_reject");

        Officialdocument od= officialdocumentService.selectByPrimaryKey(odid);

        if(od != null ){

            List<OfficialdocumentDeliver> deliverList = officialdocumentDeliverService.selectDeliverByOdId(od.getId());  // 流转记录
            mv.addObject("deliverList" , JSONArray.fromObject(deliverList, JsonConfigUtil.getJsonDateConfig("yyyy-MM-dd HH:mm:ss")));

            if(deliverList!=null && !deliverList.isEmpty()){
                OfficialdocumentDeliver deliver = deliverList.get(deliverList.size()-1);
                mv.addObject("rejectuserid",deliver.getUserid());
            }

            if( od != null && od.getLastdate() !=null ){
                SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
                od.setLastdateStr( df1.format( od.getLastdate() ));
            }
            if( od != null && od.getCommitdate() !=null){
                SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                od.setCommitdateStr( df2.format( od.getCommitdate() ));
            }

            // set userid and orgid 初次提交目标
            if(OfficialdocumentConstant.DELIVERTYPE_ORG.equals(od.getDelivertype())){
                AcOrg org = orgService.selectByPrimaryKey(od.getDeliverid());
                mv.addObject("org", org );
            }else if(OfficialdocumentConstant.DELIVERTYPE_USER.equals(od.getDelivertype())){
                AcOperator user = operatorService.selectByPrimaryKey(od.getDeliverid());
                List<AcOrg> orgList = orgService.selectByUserid( user.getId() );
                mv.addObject("user" , user);
                mv.addObject("orgList" , orgList);
            }

            // 公文附带文件
            OfficialdocumentFile ofile = new OfficialdocumentFile();
            ofile.setOfficialdocumentid(odid);
            ofile.setSourcefileflag(OfficialdocumentConstant.FILE_SOURCE_FLAG_YES);
            ofile.setiDisplayLength(100);
            ofile.setiDisplayStart(0);
            List<OfficialdocumentFile> officialdocumentFileList = officialdocumentFileService.selectPage(ofile);
            mv.addObject("officialdocumentFileList" , officialdocumentFileList);

            AcOperator login_user = (AcOperator) request.getSession().getAttribute("loginUser");
            List<AcOrg> login_orgList = orgService.selectByUserid(login_user.getId());

        }

        mv.addObject("officialdocument" , od);

        return mv;
    }

    /**
     * ajax : 保存 驳回公文重新提交
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "saveresubmit")
    public Object save ( OfficialDocumentDto dto ) throws Exception{
        officialdocumentService.save_resubmit(dto,dto.getRemindflag() ,dto.getRemindtype());
        return getSuccessfulResultMap();
    }
}
