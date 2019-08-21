package com.bjrun.mobile.service.user;

import com.bjrun.mobile.entity.autoPunch.AutoPunchLog;
import com.bjrun.mobile.entity.declare.Declare;
import com.bjrun.mobile.entity.user.User;
import java.util.List;

public abstract interface UserService
{
  public  User userLogin(String paramString1, String paramString2);
  
  public  User getUserById(String paramString);
  
  public  User getUserByRunId(Integer paramInteger);
  
  public  User getUserByUserName(String paramString);
  
  public  void saveUserInfo(User paramUser);
  
  public  void saveBatchUsers(List<User> paramList);
  
  public  User userLoginApp(String paramString);

  public void saveDeclare(Declare declare);

  public boolean isExsitDeclare(String userName);

  
  public void saveUserInfoAuto(User user);

  public void saveOrUpdateAutoPunchLog(AutoPunchLog log);
	/**
	 * 根据政务微信userId获取家园用户名
	 * @param userId
	 * @return
	 */
  public User getUserByWxUserId(String userId);
}

