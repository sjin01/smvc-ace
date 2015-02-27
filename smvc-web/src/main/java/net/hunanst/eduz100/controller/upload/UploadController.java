package net.hunanst.eduz100.controller.upload;

import net.hunanst.common.util.common.FileUtil;
import net.hunanst.common.util.common.SendFileHttp;
import net.hunanst.eduz100.controller.BaseController;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:  文件上传控制器
 * 创建日期: 12/23  12:42
 *
 * @author: guanshj QQ: 928990049
 */
@Controller
@RequestMapping("upload")
public class UploadController extends BaseController{

    @Autowired
    private CommonsMultipartResolver multipartResolver;

    /**
     *
     * 文件上传
     *
     * 步骤：
     * 1 从请求中 获取文件，存到 工程 upload 目录；
     * 2 从upload目录 通过http 访问 nginx 服务器 储存；
     * 3 返回 存储的 url 相对路径
     *
     * 要求和准备：工程中webapp目录下 需要有一个upload 的文件夹
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "main")
    public Object uploadMain (HttpServletRequest request,
                             HttpServletResponse response) throws Exception {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        String url = "";

        String nginxUploadPath = (String) request.getSession().getServletContext().getAttribute("nginx_upload4ck");

        if (multipartResolver.isMultipart(multipartRequest)) { // 判断 request
            // 是否有文件上传,即多部分请求...
            // srcfname 是指 文件上传标签的 name=值
            MultiValueMap<String, MultipartFile> multfiles = multipartRequest
                    .getMultiFileMap();
            for (String srcfname : multfiles.keySet()) {
                MultipartFile mfile = multfiles.getFirst(srcfname);
                try {
                    String filepath = request.getSession().getServletContext()
                            .getRealPath("/")
                            + File.separator
                            + "upload"
                            + File.separator
                            + (int) ((Math.random() * 9 + 1) * 100000)
                            + "_"
                            + mfile.getOriginalFilename();

                    mfile.transferTo(new File(filepath));

                    String ss = SendFileHttp.send( nginxUploadPath , new File(
                            filepath).getPath());

                    url = JSONObject.fromObject(ss).get("file_url") + "";

                    System.out.println(" url : " + url);
                    if (StringUtils.isNotBlank(url)) {
                        FileUtil.deleteFile(new File(filepath).getPath());
                    }
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } /*catch (IOException e) {
                    e.printStackTrace();
                }*/
            }
        }

        return url;
    }


    /**
     * 多文件动态上传
     */
    @RequestMapping(value = "/uploadimg", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String uploadimg(HttpServletRequest request,
                            HttpServletResponse response) throws Exception {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        String callback = request.getParameter("CKEditorFuncNum");
        String nginxUploadPath = (String) request.getSession().getServletContext().getAttribute("nginx_upload4ck");
        String nginxFilePath = (String) request.getSession().getServletContext().getAttribute("nginx_filepath");
        String url = "";
        StringBuffer sb = new StringBuffer("");
        if (multipartResolver.isMultipart(multipartRequest)) { // 判断 request
            // 是否有文件上传,即多部分请求...
            // srcfname 是指 文件上传标签的 name=值
            MultiValueMap<String, MultipartFile> multfiles = multipartRequest
                    .getMultiFileMap();
            for (String srcfname : multfiles.keySet()) {
                MultipartFile mfile = multfiles.getFirst(srcfname);
                Long fileSize = mfile.getSize();
                if (fileSize > 3000000) {
                    sb.append("<script type=\"text/javascript\">");
                    sb.append("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'文件格式不正确（必须为.jpg/.bmp/.png文件）','')");
                    sb.append("</script>");
                }

                String type = "type";
                if (mfile.getOriginalFilename() != null) {
                    type = mfile.getOriginalFilename().substring(mfile.getOriginalFilename().indexOf(".") + 1, mfile.getOriginalFilename().length());
                }
                if (type.equals("jpg") || type.equals("png") || type.equals("bmp")) {
                    try {
                        String filepath = request.getSession().getServletContext()
                                .getRealPath("/")
                                + File.separator
                                + "upload"
                                + File.separator
                                + (int) ((Math.random() * 9 + 1) * 100000)
                                + "_"
                                + mfile.getOriginalFilename();

                        mfile.transferTo(new File(filepath));
                        String ss = SendFileHttp.send( nginxUploadPath, new File(
                                filepath).getPath());
                        url = JSONObject.fromObject(ss).get("file_url") + "";

                        if (StringUtils.isNotBlank(url)) {
                            FileUtil.deleteFile(new File(filepath).getPath());
                        }
                    } catch (IllegalStateException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    sb.append("<script type=\"text/javascript\">");
                    sb.append("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + nginxFilePath + url + "','')");
                    sb.append("</script>");
                } else {
                    sb.append("<script type=\"text/javascript\">");
                    sb.append("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'文件格式不正确（必须为.jpg/.bmp/.png文件）','')");
                    sb.append("</script>");
                }
            }
        }
        return sb.toString();

    }
}
