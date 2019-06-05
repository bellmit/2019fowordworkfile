package com.bjrun.message.service;

import com.bjrun.message.entity.Message;

/**
 * @Desc   消息接口service层
 * @author Administrator
 * @Date   2019-05-28 21：00
 */
public interface MessageService {
	/**
	 * 消息存储
	 * @param paramUser
	 */
	public  void saveOrUpdateMessage(Message message);
}
