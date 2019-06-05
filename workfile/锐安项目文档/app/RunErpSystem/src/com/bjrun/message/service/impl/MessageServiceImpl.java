package com.bjrun.message.service.impl;

import com.bjrun.message.dao.MessageDao;
import com.bjrun.message.entity.Message;
import com.bjrun.message.service.MessageService;
/**
 * @Desc   消息接口service层实现类
 * @author Administrator
 * @Date   2019-05-28 21：00
 */
public class MessageServiceImpl implements MessageService{
	
	private MessageDao msgDao;
	
	public MessageDao getMsgDao() {
		return msgDao;
	}

	public void setMsgDao(MessageDao msgDao) {
		this.msgDao = msgDao;
	}

	@Override
	public void saveOrUpdateMessage(Message message) {
		msgDao.saveOrUpdateMessage(message);
	}

}
