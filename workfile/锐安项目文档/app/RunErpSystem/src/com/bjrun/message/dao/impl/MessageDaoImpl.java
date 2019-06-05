package com.bjrun.message.dao.impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.bjrun.message.dao.MessageDao;
import com.bjrun.message.entity.Message;
/**
 * @Desc   消息推送接口Dao层实现类
 * @author Administrator
 * @Date   2019-05-28 21：00
 */
public class MessageDaoImpl extends HibernateDaoSupport implements MessageDao{

	@Override
	public void saveOrUpdateMessage(Message message) {
		getHibernateTemplate().saveOrUpdate(message);
	}

}
