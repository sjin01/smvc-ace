package net.hunanst.eduz100.service.oa.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.hunanst.eduz100.api.oa.Message;
import net.hunanst.eduz100.api.oa.PushConstant;
import net.hunanst.eduz100.api.oa.PushObject;
import net.hunanst.eduz100.api.oa.vo.Chat;
import net.hunanst.eduz100.dto.MessageVo;
import net.hunanst.eduz100.service.impl.BaseServiceImpl;
import net.hunanst.eduz100.service.oa.MessageService;
import net.hunanst.eduz100.service.push.RedisUtil;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.exceptions.JedisConnectionException;

/**
 * Title :盛通-- 教育信息服务平台 Description: 创建日期: 14-12-9 下午5:27
 * 
 * @author: guanshj QQ: 928990049
 */
@Service("messageService")
public class MessageServiceImpl extends BaseServiceImpl<Message> implements
		MessageService {
	@Override
	public String getNamespace() {
		return "Message";
	}

	@Autowired
	private RedisUtil redisUtil;

	@SuppressWarnings("unchecked")
	@Override
	public List<MessageVo> getUnreadMessageByID(Integer recipient,
			Integer addresser) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recipient", recipient);
		map.put("addresser", addresser);
		List<MessageVo> messageList = (List<MessageVo>) sqlSessionTemplate
				.selectList(getNamespace() + ".getUnreadMessageByID", map);
		if(null != messageList && messageList.size() > 0){
			updateReadFlag(messageList);
			Jedis jedis = redisUtil.getConnection();
			try {
				String pushObjectStr = jedis.get(PushConstant.Message_Prefix + addresser);
				
				PushObject po = null;
				
				if (!StringUtils.hasText(pushObjectStr)) {
					po = new PushObject();
				} else {
					ObjectMapper objectMapper = new ObjectMapper();
					po = objectMapper.readValue(pushObjectStr, PushObject.class);
				}
				List<Message> list = po.getMessageList();
				if (null != list && list.size() > 0) {
					for (Message message : list) {
						if(recipient.equals(message.getAddresser())){
							list.remove(message);
							break;
						}
					}
					po.setMessageList(list);
					ObjectMapper mapper = new ObjectMapper();
					String json = mapper.writeValueAsString(po);
					jedis.set(PushConstant.Message_Prefix + addresser, json);
					
					jedis.publish(PushConstant.PushObject_Pub, json);
				}
				
			} catch (JedisConnectionException e) {
				if (null != jedis) {
					redisUtil.getJedisPool().returnBrokenResource(jedis);
					jedis = null;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (null != jedis) {
					redisUtil.closeConnection(jedis);
					jedis = null;
				}
				
			}
		}
		return messageList;
	}

	@Override
	public Integer getUnreadMessageMinId(Integer recipient, Integer addresser) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recipient", recipient);
		map.put("addresser", addresser);
		Integer i = (Integer) sqlSessionTemplate.selectOne(getNamespace()
				+ ".getUnreadMessageMinId", map);
		if (null == i) {
			i = 0;
		}
		return i;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MessageVo> getMessageByID(Integer recipient, Integer addresser) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recipient", recipient);
		map.put("addresser", addresser);
		Integer minId = getUnreadMessageMinId(recipient, addresser);
		if (minId > 0) {
			return getUnreadMessageByID(recipient, addresser);
		} else {
			return (List<MessageVo>) sqlSessionTemplate.selectList(
					getNamespace() + ".getMessageByID", map);
		}
	}

	@Override
	public Integer updateReadFlag(List<MessageVo> list) {
		if (null != list && list.size() > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			return sqlSessionTemplate.update(
					getNamespace() + ".updateReadFlag", list);
		}
		return 0;
	}

	@Override
	public Integer insertList(List<Message> list) {
		return sqlSessionTemplate.insert(getNamespace() + ".insertList", list);
	}

	@Override
	public Integer saveMessage(Message vo) {
		Integer i = this.insertSelective(vo);
		// 存放到jedis服务器上

		Jedis jedis = redisUtil.getConnection();
		try {
			String pushObjectStr = jedis.get(PushConstant.Message_Prefix
					+ vo.getRecipient());

			PushObject po = null;

			if (!StringUtils.hasText(pushObjectStr)) {
				po = new PushObject();
			} else {
				ObjectMapper objectMapper = new ObjectMapper();
				po = objectMapper.readValue(pushObjectStr, PushObject.class);
			}
			List<Message> list = po.getMessageList();
			if (null == list) {
				list = new ArrayList<Message>();
			}
			boolean flag = false;
			for (Message message : list) {
				if(message.getAddresser().equals(vo.getAddresser())){
					list.remove(message);
					message.setNumber(message.getNumber()==null?1:message.getNumber()+1);
					list.add(message);
					flag = true;
				}
			}
			if(!flag){
				vo.setNumber(1);
				list.add(vo);
			}
			po.setMessageList(list);
			po.setUserid(vo.getRecipient().toString());
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(po);
			jedis.set(PushConstant.Message_Prefix + vo.getRecipient(), json);

			jedis.publish(PushConstant.PushObject_Pub, json);

		} catch (JedisConnectionException e) {
			if (null != jedis) {
				redisUtil.getJedisPool().returnBrokenResource(jedis);
				jedis = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != jedis) {
				redisUtil.closeConnection(jedis);
				jedis = null;
			}

		}
		return i;
	}


    @Override
    public List<Chat> listByUserId(Chat vo) {
        /**
         * 先调用存储过程生成数据
         */
        /*List<Integer> list=(List<Integer>)sqlSessionTemplate.selectList(getNamespace() + ".callChat",vo.getAddresser());*/

        //查询t_oa_message_one表返回数据
       /* if(list!=null&&list.size()>0)
            return (List<Chat>)sqlSessionTemplate.selectList(getNamespace() + ".listByUserId_page",vo);
        else*/
        return (List<Chat>)sqlSessionTemplate.selectList(getNamespace() + ".listByUserId_page",vo);

    }

    @Override
    public List<Chat> chatonelist(Chat vo) {
        return (List<Chat>)sqlSessionTemplate.selectList(getNamespace() + ".chatonelist_page",vo);
    }
}
