package com.bjrun.clientQuestion.service.impl;

import org.springframework.stereotype.Service;

import com.bjrun.clientQuestion.entity.AppMsdLog;
import com.bjrun.clientQuestion.dao.AppMsdLogDao;
import com.bjrun.clientQuestion.service.AppMsdLogService;

@Service
public class AppMsdLogServiceImpl implements AppMsdLogService{
	private AppMsdLogDao appMsdLogDao;
	
	
	public AppMsdLogDao getAppMsdLogDao() {
		return appMsdLogDao;
	}


	public void setAppMsdLogDao(AppMsdLogDao appMsdLogDao) {
		this.appMsdLogDao = appMsdLogDao;
	}

	/**
	 * 保存/更新数据日志信息
	 * @param log
	 */
	@Override
	public void saveOrUpdateAppMsdLog(AppMsdLog log) {
		// TODO Auto-generated method stub
		appMsdLogDao.saveOrUpdateAppMsdLog(log);
	}

}
