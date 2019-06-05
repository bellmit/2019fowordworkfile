package com.bjrun.mobile.dao.user;

import java.util.List;

import com.bjrun.mobile.entity.autoPunch.AutoPunchLog;
import com.bjrun.mobile.entity.declare.Declare;
import com.bjrun.mobile.entity.user.User;

public abstract interface UserDao
{
	  public  User userLogin(String paramString1, String paramString2);
	  
	  public  User getUserById(String paramString);
	  
	  public  User getUserByRunId(Integer paramInteger);
	  
	  public  User getUserByUserName(String paramString);
	  
	  public  void saveOrUpdateUser(User paramUser);
	  
	  public  void saveOrUpdateUserAll(List<User> paramList);
	  
	  public  User userLoginApp(String paramString);

	  public void saveDeclare(Declare declare);

	  public Declare getDeclareByUsername(String userName);

	  public List<User> getUserList();

	  public List<Declare> getDeclareList();
	  /**
	   * 获取设置了自动打卡功能的用户信息
	   * @return
	   */
	  public List<User> getUserListByState(String punchState);
	  
	  /**
	   * 获取当前日期是否是工作日
	   * @param currentDate
	   * @return
	   */
	  public boolean getWorkCalendar(String currentDate);
	  
	  /**
	   * 保存日志信息
	   * @param log
	   */
	  public void saveOrUpdateAutoPunchLog(AutoPunchLog log);
	  
	 /**
	 * 根据政务微信userId获取用户信息
	 * @param userId
	 * @return
	 */
	 public User getUserByWxUserId(String userId);
}


