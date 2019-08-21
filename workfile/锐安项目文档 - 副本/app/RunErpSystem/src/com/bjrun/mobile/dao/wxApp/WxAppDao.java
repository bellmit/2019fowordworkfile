package com.bjrun.mobile.dao.wxApp;


public interface WxAppDao {
	/**
	 * 根据 wxAppKey 获取value
	 * @param wxAppKey
	 * @return
	 */
	public  String getUserByKey(String wxAppKey);
}
