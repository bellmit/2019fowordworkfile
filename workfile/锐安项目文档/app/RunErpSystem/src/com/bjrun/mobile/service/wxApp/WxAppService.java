package com.bjrun.mobile.service.wxApp;


public interface WxAppService {
	/**
	 * 根据 wxAppKey 获取value
	 * @param wxAppKey
	 * @return
	 */
	public  String getUserByKey(String wxAppKey);
}
