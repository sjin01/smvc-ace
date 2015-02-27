package net.hunanst.eduz100.service.oa;

import java.util.List;

import net.hunanst.common.util.mybatis.pagination.Page;
import net.hunanst.eduz100.api.oa.Message;
import net.hunanst.eduz100.api.oa.vo.Chat;
import net.hunanst.eduz100.dto.MessageVo;
import net.hunanst.eduz100.service.BaseService;

/**
 * Title :盛通-- 教育信息服务平台
 * Description:
 * 创建日期: 14-12-9  下午5:26
 *
 * @author: guanshj QQ: 928990049
 */
public interface MessageService extends BaseService<Message> {

	/**
	 * 查找对方发给自己的所有未读记录 
	 * @param recipient 对方ID
	 * @param addresser 登录人ID
	 * @return
	 */
	List<MessageVo> getUnreadMessageByID(Integer recipient, Integer addresser);
	
	
	/**
	 * 查找对方发给自己未读记录的最小ID 返回0时表示没有找到记录
	* @param recipient 对方ID
	 * @param addresser 登录人ID
	 * @return
	 */
	Integer getUnreadMessageMinId(Integer recipient, Integer addresser);
	
	/**
	 * 查找对方所有未读留言或最近5条聊天记录
	 * @param recipient 对方ID
	 * @param addresser 登录人ID
	 * @return
	 */
	List<MessageVo> getMessageByID(Integer recipient, Integer addresser);
	
	/**
	 * 更改消息的阅读状态
	 * @param list
	 * @return
	 */
	Integer updateReadFlag(List<MessageVo> list);

	Integer insertList(List<Message> list) ;

	/**
	 * 聊天记录保存送存入到jedis服务器上
	 * @param vo
	 * @return
	 */
	Integer saveMessage(Message vo);

    List<Chat> listByUserId(Chat vo);

    List<Chat> chatonelist(Chat vo);
}
