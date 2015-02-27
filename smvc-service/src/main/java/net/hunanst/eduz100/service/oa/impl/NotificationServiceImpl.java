package net.hunanst.eduz100.service.oa.impl;

import net.hunanst.eduz100.api.oa.*;
import net.hunanst.eduz100.api.oa.vo.NotiHistoryVo;
import net.hunanst.eduz100.api.oa.vo.NotificationFileVo;
import net.hunanst.eduz100.api.oa.vo.NotificationVo;
import net.hunanst.eduz100.api.sms.Sms;
import net.hunanst.eduz100.api.sys.AcOperator;
import net.hunanst.eduz100.api.sys.AcOrg;
import net.hunanst.eduz100.api.sys.vo.AcOperatorVo;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.oa.NotificationService;
import net.hunanst.eduz100.service.push.RedisUtil;
import net.hunanst.eduz100.service.sms.SendService;
import net.hunanst.eduz100.service.sys.AcOperatorService;
import net.hunanst.eduz100.service.sys.AcOrgService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:29
 *
 * @author: guanshj QQ: 928990049
 */
@Service("notificationService")
public class NotificationServiceImpl extends BaseServiceImpl<Notification> implements NotificationService {

    @Override
    public String getNamespace() {
        return "Notification";
    }


    @Autowired
    private SendService sendService;

    @Autowired
    private AcOperatorService acOperatorService;

    @Autowired
    private RedisUtil redisUtil ;

    @Override
    public int insert(Notification record) {
        Calendar c = Calendar.getInstance();
        record.setTimes(c.getTime());
        return sqlSessionTemplate.insert(getNamespace() + ".insert", record);
    }

    @Override
    public int insert(NotificationVo vo) throws Exception{
        Calendar c = Calendar.getInstance();
        vo.setTimes(c.getTime());
        int i = sqlSessionTemplate.insert(getNamespace() + ".insertSelective", vo);
        if (i > 0) {
            List<AcOrg> orgIds = vo.getReceives();
            if (orgIds != null && orgIds.size() > 0) {
                //根据部门  找到部门下的人员 统一插入到表
                Map<String,Object> map=new HashMap<String, Object>();
                map.put("notid",vo.getId());
                map.put("list",orgIds);
                sqlSessionTemplate.insert(getNamespace() + ".insertNotHisByBath", map);
            }
        }
        //附件
        if(vo.getNotificationFile()!=null&&!vo.getNotificationFile().isEmpty()){
            this.addNotiFile(vo.getNotificationFile(),vo.getId());
        }

        //提醒
        Integer type=vo.getSendtype();
        if(type!=null){
            vo.setRemindtype(2);

            StringBuilder extra=new StringBuilder("用户：您有新的通知:"+vo.getTitle());
            //extra.append(vo.getExtracontent());
            extra.append("【临澧县教育系统OA平台】");
            vo.setExtracontent(extra.toString());
            vo.setHead("尊敬的");
            if(type==1){//手机短信
                this.save_remind_phone(vo);
            }else if(type==2){//短消息
                this.insertRemindByBath(vo);
            }else if(type==3){//都发送
                this.insertRemindByBath(vo);
                this.save_remind_phone(vo);
            }
        }
        //利用redis进行推送
        List<AcOperator> acOperators=acOperatorService.selectByNotid(vo.getId());
        if(acOperators!=null&&!acOperators.isEmpty()){
            for(AcOperator ao:acOperators){
                this.saveRedisAndPub(ao.getId().toString(),vo.getId().toString(),vo.getTitle());
            }
        }

        return i;
    }

    @Override
    public int updateByPrimaryKey(NotificationVo record) {
        int a=0;
        //更新主表信息
        a=sqlSessionTemplate.update(getNamespace() + ".updateByPrimaryKeySelective", record);

        if(record.getFileIdList()!=null&&!record.getFileIdList().isEmpty()){
            //删除关联文件
            a=deleteNotFileById(record.getFileIdList());
        }
        if(record.getNotificationFile()!=null&&!record.getNotificationFile().isEmpty()){
            //把关联文件信息插入到文件表
            a=this.addNotiFile(record.getNotificationFile(),record.getId());
        }
        return a;
    }

    @Override
    public List<Notification> selectPage(Notification record) {
        return (List<Notification>) sqlSessionTemplate.selectList(getNamespace() + ".select_page", record);
    }


    @Override
    public NotificationVo selectByPrimaryKey(Integer id) {
        return (NotificationVo) sqlSessionTemplate.selectOne(getNamespace() + ".selectByPrimaryKey", id);
    }

    @Override
    public int updateByPrimaryKeySelective(Notification record) {
        return sqlSessionTemplate.update(getNamespace() + ".updateByPrimaryKeySelective", record);
    }

    @Override
    public int deletes(List ids) {

        int i=sqlSessionTemplate.delete(getNamespace() + ".deletes", ids);
        if(i>0){
            //删除关联文件
            deleteNotFileById(ids);
            //删除已经发送的人员
            sqlSessionTemplate.delete(getNamespace() + ".deleteByNotid", ids);
            //删除阅读表关联数据
            sqlSessionTemplate.delete(getNamespace() + ".deleteReadByNotid", ids);
        }
        return i;
    }

    @Override
    public List<NotificationVo> selectForDisplay(NotificationVo record) {
        return (List<NotificationVo>) sqlSessionTemplate.selectList(getNamespace() + ".selectForDisplay_page", record);
    }

    @Override
    public List<NotificationVo> notiViewById(NotificationVo vo) throws Exception {
        return (List<NotificationVo>) sqlSessionTemplate.selectList(getNamespace() + ".notiViewById", vo);
    }

    @Override
    public List<AcOperatorVo> selectPersonByOegId(Integer orgId) {
        return (List<AcOperatorVo>) sqlSessionTemplate.selectList(getNamespace() + ".selectPersonByOegId", orgId);
    }

    @Override
    public int addNotiFile(List<NotificationFileVo> notificationFile,int notId){
        for(NotificationFile nf:notificationFile){
            String fileType=nf.getFilename().substring(nf.getFilename().indexOf(".")+1,nf.getFilename().length());
            nf.setNotid(notId);
            nf.setFiletype(fileType);
            nf.setUploadtime(new Date());
            sqlSessionTemplate.insert(getNamespace() + ".insertFile",nf);
        }
        return 1;
    }


    public int deleteNotFileById(List<Integer> ids){
        return sqlSessionTemplate.insert(getNamespace() + ".delFileByNotId",ids);
    }

    @Override
    public NotificationFileVo selectFile(Integer fileId) {
        return (NotificationFileVo)sqlSessionTemplate.selectOne(getNamespace() + ".selectFile",fileId);
    }

    @Override
    public List<NotiHistoryVo> getNotiByuserid(NotiHistoryVo nv) throws Exception {
        return (List<NotiHistoryVo>)sqlSessionTemplate.selectList(getNamespace() + ".unReadNoti",nv);
    }

    @Override
    public int updateRead(NotificationRead vo) throws Exception {
        int i=sqlSessionTemplate.update(getNamespace() + ".updateRead",vo);
        if(1>0){
            this.modifyRedisNoticeRecordAndPub(vo.getReaduserid().toString(),vo.getNotid().toString());
        }
        return i;
    }

    @Override
    public void save_remind_phone(NotificationVo vo) throws Exception{

        List<Sms> smsList = new ArrayList<Sms>();
        Random random ;Date now ;
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");


        List<AcOperator> userList=(List<AcOperator>)sqlSessionTemplate.selectList(getNamespace() + ".getUserByorgId",vo);
        if(userList!=null&&!userList.isEmpty()){
            for(AcOperator user:userList){
                random = new Random();
                now = new Date();

                Sms sms= new Sms();
                sms.setPhone(user.getTelnumber());
                sms.setSmsContent("尊敬的"+user.getUsername()+vo.getExtracontent());
                sms.setSmsId(df.format(now) + String.valueOf(random.nextInt(9999)));
                smsList.add(sms);
            }
        }

        if(!smsList.isEmpty()) sendService.sendSmsList(smsList);
    }

    @Override
    public int insertRemindByBath(NotificationVo vo){
        return sqlSessionTemplate.insert(getNamespace() + ".insertRemindByBath", vo);
    }

    @Override
    public boolean saveRedisAndPub(String usercode,String noticeSeq,String title) throws IOException {
        boolean flag = false;
        if (org.springframework.util.StringUtils.hasText(usercode)) {

            Jedis jedis = redisUtil.getConnection();

            String pushObjectStr = jedis.get(PushConstant.Notice_Prefix+usercode);

            PushObject po = null;

            if(!org.springframework.util.StringUtils.hasText(pushObjectStr)){
                po = new PushObject();
            }
            else{
                ObjectMapper objectMapper = new ObjectMapper();
                po = objectMapper.readValue(pushObjectStr, PushObject.class);
            }

            List<Notification> lmd = po.getNotificationList();

            if(lmd==null){
                lmd = new ArrayList<Notification>();
            }

            Notification md = new Notification();
            md.setTimes(new Date());
            md.setNoticeSeq(noticeSeq);
            md.setReceiverSeq(usercode);
            md.setTitle(title);
            lmd.add(md);

            try {
                ObjectMapper mapper = new ObjectMapper();
                po.setNotificationList(lmd);
                po.setUserid(usercode);
                String json = mapper.writeValueAsString(po);
                jedis.set(PushConstant.Notice_Prefix+usercode, json);
                jedis.publish(PushConstant.PushObject_Pub,json);
                flag = true;
            }
            catch (JedisConnectionException e) {
                if (null != jedis) {
                    redisUtil.getJedisPool().returnBrokenResource(jedis);
                    jedis = null;
                }
            }
            catch (Exception e) {
                e.printStackTrace();
            }
            finally{
                if (null != jedis) {
                    redisUtil.closeConnection(jedis);
                    jedis = null;
                }

            }
        }
        return flag;
    }


    @Override
    public boolean modifyRedisNoticeRecordAndPub(String usercode,String noticeSeq) throws IOException {
        boolean flag = false;
        if (org.springframework.util.StringUtils.hasText(usercode)) {

            Jedis jedis = redisUtil.getConnection();

            String pushObjectStr = jedis.get(PushConstant.Notice_Prefix+usercode);

            PushObject po = null;

            if(!org.springframework.util.StringUtils.hasText(pushObjectStr)){
                po = new PushObject();
            }
            else{
                ObjectMapper objectMapper = new ObjectMapper();
                po = objectMapper.readValue(pushObjectStr, PushObject.class);
            }

            List<Notification> lmd = po.getNotificationList();


            if(lmd!=null){

                Iterator<Notification> iterator = lmd.iterator();
                while(iterator.hasNext()) {
                    Notification md = iterator.next();
                    if(md.getNoticeSeq().equals(noticeSeq)) {
                        iterator.remove();
                    }
                }
                ObjectMapper mapper = new ObjectMapper();
                po.setNotificationList(lmd);
                try {

                    String json = mapper.writeValueAsString(po);
                    jedis.set(PushConstant.Notice_Prefix+usercode, json);
                    jedis.publish(PushConstant.PushObject_Pub,json);
                }
                catch (JedisConnectionException e) {
                    if (null != jedis) {
                        redisUtil.getJedisPool().returnBrokenResource(jedis);
                        jedis = null;
                    }
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
                finally{
                    if (null != jedis) {
                        redisUtil.closeConnection(jedis);
                        jedis = null;
                    }

                }
            }
        }
        return flag;
    }


}
