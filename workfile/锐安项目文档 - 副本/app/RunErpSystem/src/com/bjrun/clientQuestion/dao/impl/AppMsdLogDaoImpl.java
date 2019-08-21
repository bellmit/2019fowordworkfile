package com.bjrun.clientQuestion.dao.impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bjrun.clientQuestion.entity.AppMsdLog;
import com.bjrun.clientQuestion.dao.AppMsdLogDao;

public class AppMsdLogDaoImpl extends HibernateDaoSupport implements AppMsdLogDao{
	/**
	 * 保存/更新数据日志信息
	 * @param log
	 */
	@Override
	public void saveOrUpdateAppMsdLog(AppMsdLog log) {
		getHibernateTemplate().saveOrUpdate(log);
	}
	

}
