package com.bjrun.clientQuestion.service;

import com.bjrun.clientQuestion.entity.AppMsdLog;

public abstract interface AppMsdLogService {
	/**
	 * 保存/更新数据日志
	 * @param log
	 */
	public void saveOrUpdateAppMsdLog(AppMsdLog log);

}
