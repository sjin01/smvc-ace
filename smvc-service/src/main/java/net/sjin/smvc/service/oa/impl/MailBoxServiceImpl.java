package net.sjin.smvc.service.oa.impl;

import net.sjin.smvc.constant.MailConstant;
import net.sjin.smvc.api.oa.*;
import net.sjin.smvc.api.oa.vo.AddressBookVo;
import net.sjin.smvc.api.sys.AcOperator;
import net.sjin.smvc.service.impl.BaseServiceImpl;
import net.sjin.smvc.service.oa.MailBoxService;
import net.sjin.smvc.service.push.RedisUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.util.*;

/**
 * Title :盛通-- 教育信息服务平台 Description: 创建日期: 14-12-9 下午5:21
 *
 * @author: guanshj QQ: 928990049
 */
@Service("mailBoxService")
public class MailBoxServiceImpl extends BaseServiceImpl<MailBox> implements
		MailBoxService {
	
	@Autowired
	private RedisUtil redisUtil ;
	
	private static Logger logger = Logger.getLogger(MailBoxServiceImpl.class
			.getName());

	@Override
	public String getNamespace() {
		return "MailBox";
	}
	
	@SuppressWarnings("unchecked")
	public List<MailDetail> selectByCondition(MailBox vo) throws Exception {
		if (vo != null) {
			if (vo.getBoxtype() == 1) {
				return (List<MailDetail>) this.sqlSessionTemplate.selectList(
						getNamespace() + ".selectSentBoxByCondition", vo);
			} else if (vo.getBoxtype() == 2) {
				return (List<MailDetail>) this.sqlSessionTemplate.selectList(
						getNamespace() + ".selectInboxByCondition", vo);
			} else if (vo.getBoxtype() == 0) {
				return (List<MailDetail>) this.sqlSessionTemplate.selectList(
						getNamespace() + ".selectDraftBoxByCondition", vo);
			} else {
				return null;
			}
		}
		return null;
	}

	public int selectUnReadMailCountByCondition(MailBox vo) throws Exception {
		if (vo != null) {
			if (vo.getBoxtype() == 2) {
				return (Integer) this.sqlSessionTemplate.selectOne(
						getNamespace() + ".selectUnReadMailCountByCondition",
						vo);
			} else {
				return 0;
			}
		}
		return 0;
	}

	@Override
	public List<AcOperatorIdAndName> selectEmailReceiveOperater(AcOperator vo)
			throws Exception {
		if (vo != null) {
			if (StringUtils.hasText(vo.getUsername())) {
				return (List<AcOperatorIdAndName>) this.sqlSessionTemplate
						.selectList(getNamespace()
								+ ".selectEmailReceiveOperaterByCondition", vo);
			} else {
				return null;
			}
		}
		return null;
	}

	@Override
	public int saveEmail(Map<String, Object> params) throws Exception {

		if (params != null) {
			String userids = String.valueOf(params.get("userids"));

			String[] useridsarray = null;
			int flag = 0;
			if (StringUtils.hasText(userids)) {
				try {
					useridsarray = userids.split(",");

					Mail mail = new Mail();
					Date createdate = new Date();

					mail.setContent(String.valueOf(params.get("content")));

					mail.setCreatedate(createdate);
					// mail.setOrgid(Integer.valueOf(params.get("orgid").toString())
					// );
					mail.setSenddate(createdate);
					mail.setSendstatus(0);
					mail.setTitle(String.valueOf(params.get("title")));
					mail.setUserid(Integer.valueOf(params.get("userid")
							.toString()));
					this.sqlSessionTemplate.insert("Mail.insert", mail);

					int mailid = mail.getId();

					if (mailid != 0) {

						MailBox mailbox_myself = new MailBox();
						mailbox_myself.setMailid(mailid);
						mailbox_myself.setUserid(Integer
								.valueOf((Integer) params.get("userid")));
						mailbox_myself
								.setBoxtype(MailConstant.MAIL_BOX_TYPE_SEND);

						this.sqlSessionTemplate.insert(getNamespace()
								+ ".insert", mailbox_myself);

                        if(params.get("attachmenturl")!=null&&!params.get("attachmenturl").toString().trim().equals("")){
                            String attachmenturl = String.valueOf(params.get("attachmenturl"));
                            if(StringUtils.hasText(attachmenturl)){
                                ObjectMapper objectMapper = new ObjectMapper();
                                JSONArray[] arr = objectMapper.readValue(attachmenturl, JSONArray[].class);
                                for(JSONArray jsonArray : arr){
                                    JSONObject jsonObject = (JSONObject) jsonArray.get(0);
                                    System.out.println(jsonObject.get("filename"));

                                    MailFile mailFile = new MailFile();
                                    mailFile.setMailid(mailid);
                                    if(jsonObject.has("filename")){
                                        mailFile.setFilename(jsonObject.get("filename").toString());
                                    }
                                    if(jsonObject.has("fileurl")){
                                        mailFile.setFilepath(params.get("pathheader")+jsonObject.get("fileurl").toString());
                                    }
                                    if(jsonObject.has("size")){
                                        mailFile.setSize(Double.parseDouble(jsonObject.get("size").toString()));
                                    }
                                    if(jsonObject.has("suffix")){
                                        mailFile.setSuffix(jsonObject.get("suffix").toString());
                                    }
                                    this.sqlSessionTemplate.insert("MailFile.insert", mailFile);

                                }
                            }
                        }


						// 插入mail_box
						if (useridsarray != null && useridsarray.length > 0) {
							for (String userid : useridsarray) {
								if (StringUtils.hasText(userid)) {
									
									Jedis jedis = redisUtil.getConnection();
									
									String pushObjectStr = jedis.get(PushConstant.Mail_Prefix+userid);
									
									PushObject po = null;
									
									if(!StringUtils.hasText(pushObjectStr)){
										 po = new PushObject();
									}
									else{
										ObjectMapper objectMapper = new ObjectMapper();
										
										po = objectMapper.readValue(pushObjectStr, PushObject.class);
									}
									
									List<MailDetail> lmd = po.getMailDetailList();
									
									if(lmd==null){
										lmd = new ArrayList<MailDetail>();
									}
									
									MailDetail md = new MailDetail();
									md.setMailid(mailid);
									md.setUserid(Integer.valueOf(userid));
									md.setMailtitle(mail.getTitle());
									md.setBoxtype(MailConstant.MAIL_BOX_TYPE_RECEIVE);
									lmd.add(md);
									
								    try {
								    	
								    	ObjectMapper mapper = new ObjectMapper();
								    	
								    	po.setMailDetailList(lmd);
								    	po.setUserid(userid);
								    	
								        String json = mapper.writeValueAsString(po);
								    	
								        jedis.set(PushConstant.Mail_Prefix+userid, json);
										
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
									
									MailBox mailbox = new MailBox();
									mailbox.setMailid(mailid);
									mailbox.setUserid(Integer.valueOf(userid));
									mailbox.setBoxtype(MailConstant.MAIL_BOX_TYPE_RECEIVE);
									this.sqlSessionTemplate
											.insert(getNamespace() + ".insert",
													mailbox);

									MailUser mailuser = new MailUser();
									mailuser.setMailid(mailid);
									mailuser.setUserid(Integer.valueOf(userid));
									mailuser.setType(MailConstant.MAIL_USER_TYPE_RECEIVE);
									this.sqlSessionTemplate.insert(
											"MailUser.insert", mailuser);
								}
							}
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					logger.error("新增邮件异常", e);
					return -1;
				}

			}
		}
		return 0;
	}

	@Override
	public int selectByConditionCount(MailBox vo) throws Exception {
		if (vo != null) {
			if (vo.getBoxtype() == 1) {
				return (Integer) this.sqlSessionTemplate.selectOne(
						getNamespace() + ".selectSentBoxCountByCondition", vo);
			} else if (vo.getBoxtype() == 2) {
				return (Integer) this.sqlSessionTemplate.selectOne(
						getNamespace() + ".selectInboxCountByCondition", vo);
			} else if (vo.getBoxtype() == 0) {
				return (Integer) this.sqlSessionTemplate.selectOne(
						getNamespace() + ".selectDraftBoxCountByCondition", vo);
			} else {
				return 0;
			}
		}
		return 0;
	}

	@Override
	public List<MailDetail> selectMailContent(MailBox vo) throws Exception {
		List<MailDetail> l = null;
		if (vo != null) {
			if (vo.getMailid() != null) {

				Map map = (Map) this.sqlSessionTemplate.selectOne(
						getNamespace() + ".selectMailContent", vo);

				if (map != null) {
					if (map.get("mailcontent") != null) {
						MailDetail md = new MailDetail();

						String mailcontent = (String) map.get("mailcontent");
						md.setMailcontent(mailcontent);
						l = new ArrayList<MailDetail>();
						l.add(md);

					}
				}

				if (vo.getReadstate() == 0) {
					this.sqlSessionTemplate.update(getNamespace()
							+ ".updateMailState", vo);
				}
				
				
				if(redisUtil!=null){
					
					try {
						Jedis jedis = redisUtil.getConnection();
						
						String pushObjectStr = jedis.get(PushConstant.Mail_Prefix+String.valueOf(vo.getUserid()));
						
						if(StringUtils.hasText(pushObjectStr)){
							ObjectMapper objectMapper = new ObjectMapper();
							
							PushObject po = objectMapper.readValue(pushObjectStr, PushObject.class);
							
							List<MailDetail> lmd = po.getMailDetailList();
							
							if(lmd!=null && lmd.size() > 0){
								
								Iterator<MailDetail> iterator = lmd.iterator();
								 while(iterator.hasNext()) {
									 MailDetail md = iterator.next();
									 if(md.getMailid()-vo.getMailid()==0) {
										 iterator.remove();
									 }
								 }
								
								
								ObjectMapper mapper = new ObjectMapper();
							     
								po.setMailDetailList(lmd);
								
							
								
							    try {
							    	
							    	   String json = mapper.writeValueAsString(po);
							    	   jedis.set(PushConstant.Mail_Prefix+String.valueOf(vo.getUserid()), json);
									   
//							    	   jedis.publish("eduz_push_msg",json);
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
					} catch (Exception e) {
						e.printStackTrace();
						logger.error("redis服务器出错:", e);
					}
					
				}

			}

		}
		return l;
	}

	@Override
	public int delEmail(MailBox vo) throws Exception {
		int flag = 0;
		if (vo != null) {
			flag = this.sqlSessionTemplate.update(getNamespace() + ".delEmail",vo);
		}

        if(redisUtil!=null){
            try {
                Jedis jedis = redisUtil.getConnection();

                String pushObjectStr = jedis.get(PushConstant.Mail_Prefix+String.valueOf(vo.getUserid()));

                if(StringUtils.hasText(pushObjectStr)){
                    ObjectMapper objectMapper = new ObjectMapper();

                    PushObject po = objectMapper.readValue(pushObjectStr, PushObject.class);

                    List<MailDetail> lmd = po.getMailDetailList();


                    if(lmd!=null && lmd.size() > 0){

                        Iterator<MailDetail> iterator = lmd.iterator();
                        while(iterator.hasNext()) {
                            MailDetail md = iterator.next();
                            if(md.getMailid()-vo.getMailid()==0) {
                                iterator.remove();
                            }
                        }

                        ObjectMapper mapper = new ObjectMapper();

                        po.setMailDetailList(lmd);
                        try {
                            String json = mapper.writeValueAsString(po);
                            jedis.set(PushConstant.Mail_Prefix+String.valueOf(vo.getUserid()), json);
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
            } catch (Exception e) {
                e.printStackTrace();
                logger.error("redis服务器出错:", e);
            }

        }
		return flag;
	}

	@Override
	public int saveDraftEmail(Map<String, Object> params) throws Exception {
		if (params != null) {
			try {
				Mail mail = new Mail();
				Date createdate = new Date();

				mail.setContent(String.valueOf(params.get("content")));

				mail.setCreatedate(createdate);
				mail.setSenddate(null);
				mail.setSendstatus(0);
				mail.setTitle(String.valueOf(params.get("title")));
				mail.setUserid(Integer.valueOf(params.get("userid").toString()));
				this.sqlSessionTemplate.insert("Mail.insert", mail);

				int mailid = mail.getId();

				if (mailid != 0) {
					MailBox mailbox_myself = new MailBox();
					mailbox_myself.setMailid(mailid);
					mailbox_myself.setUserid(Integer.valueOf((Integer) params
							.get("userid")));
					mailbox_myself.setBoxtype(MailConstant.MAIL_BOX_TYPE_DRAFT);

					this.sqlSessionTemplate.insert(getNamespace() + ".insert",
							mailbox_myself);
				}
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("保存草稿邮件异常", e);
				return -1;
			}

		}
		return 0;
	}

    @Override
    public List<MailFile> selectMailFile(MailBox vo) throws Exception {
        List<MailFile> mailFiles = null;
        if (vo != null) {
            if (vo.getMailid()!=0) {
                return (List<MailFile>) this.sqlSessionTemplate
                        .selectList(getNamespace() + ".selectMailFile", vo);
            } else {
                return null;
            }
        }
        return null;

    }

    @Override
    public List getMessageMembers(Integer id) {
        List result = null;
        if (id > 0) {
            try {
                result = (List<AddressBookVo>) this.sqlSessionTemplate.selectList(getNamespace() + ".selectMessageMembers", id);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    @Override
    public int addAddressBookByAcOperId(Integer id, int userid) {
        AddressBook addressBook = new AddressBook();
        addressBook.setOwner(id);
        addressBook.setOperid(userid);
        return sqlSessionTemplate.insert(getNamespace()+".addAddressBookByAcOperId", addressBook);
    }

    @Override
    public int delAllCheckMails(MailBox mailBox) throws Exception {
        int flag = -1;
        if(mailBox!=null && mailBox.getsSearch().length() > 0){
            String[] arr = mailBox.getsSearch().split(",");

            for(String mailid:arr){
                MailBox mailBox1 = new MailBox();
                mailBox1.setUserid(mailBox.getUserid());
                mailBox1.setBoxtype(mailBox.getBoxtype());
                mailBox1.setMailid(Integer.parseInt(mailid));
                flag = this.delEmail(mailBox1);
            }
        }
        return flag;
    }

}
