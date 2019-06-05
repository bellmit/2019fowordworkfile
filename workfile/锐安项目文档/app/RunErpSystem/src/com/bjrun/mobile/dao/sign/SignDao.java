package com.bjrun.mobile.dao.sign;

import com.bjrun.mobile.entity.sign.SignInfo;
import com.bjrun.mobile.entity.user.User;
import com.bjrun.mobile.entity.wxApp.WxAppInfo;

import java.util.List;

public abstract interface SignDao{
  public  SignInfo getSignInfoByUserNameAndDate(String paramString1, String paramString2);
  
  public  void saveOrUpdateSignInfo(SignInfo paramSignInfo);
  
  public  List<SignInfo> queryForList(String paramString);
  
  /**
	 * 根据政务微信userId获取家园用户名
	 * @param userId
	 * @return
	 */
	 public User getUserByWxUserId(String userId);
     /**
      * 
      * @param key
      * @return
      */
	public WxAppInfo getWxAppInfoByKey(String key,String appId);

	public void saveOrUpdateWxAppInfo(WxAppInfo wxAppInfo);
	
	void deleteWxAppInfo(String appKey,String appId);
}

