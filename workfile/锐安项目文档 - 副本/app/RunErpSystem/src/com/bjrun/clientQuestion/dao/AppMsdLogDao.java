package com.bjrun.clientQuestion.dao;

import com.bjrun.clientQuestion.entity.AppMsdLog;

public abstract interface AppMsdLogDao {
	/**
	 * 保存/更新数据日志信息
	 * @param log
	 */
	public void saveOrUpdateAppMsdLog(AppMsdLog log);

}
