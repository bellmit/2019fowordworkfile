package com.bjrun.message.dao;

import com.bjrun.message.entity.Message;
/**
 * @Desc   消息推送接口Dao层
 * @author Administrator
 * @Date   2019-05-28 21：00
 */
public interface MessageDao {
	/**
	 * 消息存储
	 * @param paramUser
	 */
	public  void saveOrUpdateMessage(Message message);
}
