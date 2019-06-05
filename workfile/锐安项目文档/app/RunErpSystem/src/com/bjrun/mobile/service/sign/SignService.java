package com.bjrun.mobile.service.sign;

import com.bjrun.mobile.entity.sign.SignInfo;
import com.bjrun.mobile.entity.user.User;
import com.bjrun.mobile.entity.wxApp.WxAppInfo;

import java.util.Date;
import java.util.List;

public abstract interface SignService{
	
  public abstract SignInfo getSignInfoByUserNameAndDate(String paramString1, String paramString2);
  
  public abstract void saveOrUpdateSignInfo(SignInfo paramSignInfo);
  
  public abstract SignInfo initSignInfoForUserAndDate(User paramUser, Date paramDate);
  
  public abstract List<SignInfo> queryForList(String paramString);
  
	/**
	* 根据政务微信userId获取家园用户名
	* @param userId
	* @return
	*/
	public User getUserByWxUserId(String userId);
	/**
	 * 根据key获取value
	 * @param key
	 * @return
	 */
	public abstract WxAppInfo getWxAppInfoByKey(String key,String appId);
	/**
	 * 插入更新
	 */
	public abstract void saveOrUpdateWxAppInfo(WxAppInfo wxAppInfo);
	
	
	/**
	 * 自动打卡定时任务逻辑
	 */
	public void autoPunch();

}

