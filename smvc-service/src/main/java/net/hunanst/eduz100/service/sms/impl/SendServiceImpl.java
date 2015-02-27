package net.hunanst.eduz100.service.sms.impl;

import net.hunanst.eduz100.api.sms.Sms;
import net.hunanst.eduz100.service.sms.SendService;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 1/20  15:59
 *
 * @author: guanshj QQ: 928990049
 */
@Service("sendService")
public class SendServiceImpl implements SendService{
    private final String smsURL = "http://175.6.1.152:38080/stweb/sms";

    @Override
    public void sendSms(String smsContent, String phoneNo) throws Exception {
        List<Sms> smsList = new ArrayList<Sms>();

        Sms sms= new Sms();
        sms.setPhone(phoneNo);
        sms.setSmsContent(smsContent);
        sms.setSmsId("00001");

        smsList.add(sms);
        this.sendXML4sms(smsList);
    }

    @Override
    public void sendSmsList(List<Sms> smsList) throws Exception {
        this.sendXML4sms(smsList);
    }

    /**
     * 调用之前  insert send record
     * @param smsList
     */
    private void sendXML4sms(final List<Sms> smsList) {
        new Thread(new Runnable() {
            public void run() {
                int size = smsList.size();
                int num = 50;
                int score = size % num == 0 ? size / num : size / num + 1;
//                SmsProjectMessage vo = smsProjectMessageService.getProjectMessageById(1);
                /** sned username and pwd **/
                String projectId = "LlJyj"; // 公司内部测试
//                String projectId = "LlJyj@2015";  //  提交到 临澧服务器
                String password = "^@L~!Jj.[sT]";
                for (int i = 0; i < score; i++) {
                    Document document = DocumentHelper.createDocument();
                    Element pkg = document.addElement("package"); // 根节点

                    pkg.addElement("projectId").setText(projectId);
                    pkg.addElement("password").setText(password);
                    Element msgs = pkg.addElement("messages");

                    int start = num * i;
                    int end = num * (i + 1) > size ? size : num * (i + 1);
                    for (int j = start; j < end; j++) {
                        Sms sms = smsList.get(j);
                        Element msg = msgs.addElement("message");
                        /*try {
							msg.addElement("smsContebt").setText(URLDecoder.decode(sms.getSms(),"UTF-8"));
						} catch (UnsupportedEncodingException e) {
							e.printStackTrace();
						}*/
                        msg.addElement("smsContebt").setText(sms.getSmsContent());
                        msg.addElement("phone").setText(sms.getPhone());
                        msg.addElement("smsId").setText(sms.getSmsId());
                    }

                    try {
                        URL url = new URL(smsURL);
                        HttpURLConnection conn = (HttpURLConnection) url
                                .openConnection();
                        conn.setRequestMethod("POST"); // 采用post方法发送
                        byte[] contentbyte = document.asXML().getBytes("UTF-8"); // 内容转变成byte数组
                        conn.setRequestProperty("Content-Type",
                                "text/xml;charset=UTF-8");
                        conn.setRequestProperty("Content-Length", ""
                                + contentbyte.length);
                        conn.setConnectTimeout(30000);
                        conn.setReadTimeout(30000);
                        conn.setUseCaches(false);
                        conn.setDoInput(true);
                        conn.setDoOutput(true);
                        OutputStream out = conn.getOutputStream();
                        out.write(contentbyte);
                        out.flush();
                        out.close();

                        InputStream in = conn.getInputStream(); // 取返回值
                        SAXReader saxReader = new SAXReader();
                        Document respDocument = saxReader.read(in);
                        List<Element> messages = respDocument.getRootElement()
                                .element("messages").elements();

                        /*//  update record status
                        stuScoreSmsSendService.updateSmsStatusBySmsId(messages);*/
                        in.close();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }

            }
        }).start();
    }

    public static void main(String[] args) {
        List<Sms> smsList = new ArrayList<Sms>();
        Sms sms= new Sms();
        sms.setPhone("15576652266");
        sms.setSmsContent("测试短信接口");
        sms.setSmsId("00001");

        smsList.add(sms);

        SendServiceImpl test = new SendServiceImpl();
        test.sendXML4sms(smsList);
    }
}
