package com.bjrun.mobile.service.sign.impl;

import com.bjrun.mobile.dao.sign.SignDao;
import com.bjrun.mobile.dao.user.UserDao;
import com.bjrun.mobile.entity.sign.SignInfo;
import com.bjrun.mobile.entity.user.User;
import com.bjrun.mobile.entity.wxApp.WxAppInfo;
import com.bjrun.mobile.service.sign.SignService;
import com.bjrun.util.DateUtil;
import java.util.Date;
import java.util.List;
public class SignServiceImpl implements SignService{
	private SignDao signDao;
	private UserDao userDao;
	public SignDao getSignDao(){
	  return this.signDao;
	}
	
	public void setSignDao(SignDao signDao){
	  this.signDao = signDao;
	}
    public UserDao getUserDao() {
    	return userDao;
    }
    public void setUserDao(UserDao userDao) {
    	this.userDao = userDao;
    } 
    public SignInfo getSignInfoByUserNameAndDate(String userName, String signDate){
    	return this.signDao.getSignInfoByUserNameAndDate(userName, signDate);
    }
  
    public void saveOrUpdateSignInfo(SignInfo signInfo){
    	this.signDao.saveOrUpdateSignInfo(signInfo);
    }
  
    public SignInfo initSignInfoForUserAndDate(User user, Date signDate){
    	
	    SignInfo signInfo = new SignInfo();
	    signInfo.setRunId(user.getRunId());
	    signInfo.setUserName(user.getUserName());
	    signInfo.setSignDate(signDate);
	    signInfo.setMsStatus("未打卡");
	    signInfo.setMsoStatus("未打卡");
	    signInfo.setAsStatus("未打卡");
	    signInfo.setAsoStatus("未打卡");
	    signInfo.setCreateDate(new Date());
	    this.signDao.saveOrUpdateSignInfo(signInfo);
	    return signInfo;
    }
  
    public List<SignInfo> queryForList(String date){
    	return this.signDao.queryForList(date);
    }

	@Override
	public User getUserByWxUserId(String userId) {
		return this.signDao.getUserByWxUserId(userId);
	}

	@Override
	public WxAppInfo getWxAppInfoByKey(String key,String appId) {
		return signDao.getWxAppInfoByKey(key,appId);
	}
	@Override
	public void saveOrUpdateWxAppInfo(WxAppInfo wxAppInfo) {
		if("access_token".equals(wxAppInfo.getAppKey())){
			signDao.deleteWxAppInfo("access_token",wxAppInfo.getAppId());
		}else{
			signDao.deleteWxAppInfo("jsapi_ticket",wxAppInfo.getAppId());
		}
		signDao.saveOrUpdateWxAppInfo(wxAppInfo);
	}
	
	@Override
	public void autoPunch() {
		
		System.out.println("--------------------------------");
		Date signTime = new Date();
		User user = new User();
		String currentDate = DateUtil.format(new Date());
		boolean isWorkDay = false;
		isWorkDay = userDao.getWorkCalendar(currentDate);//currrentDate 根据当前日期判断是否是工作日
		if(isWorkDay){
			System.out.println("------1111-------------");
			List<User> userList = userDao.getUserListByState("1");
			if(userList != null){
				for(User u:userList){
					//由于目前使用自动打卡的人数较少，采用for循环中嵌套数据库相关操作
					SignInfo signInfo = this.getSignInfoByUserNameAndDate(u.getUserName(),currentDate);//获取当前人对应日期的考勤
					if(signInfo == null){
						user=userDao.getUserByUserName(u.getUserName());
						signInfo = this.initSignInfoForUserAndDate(user, signTime);
					}
					
					String msStatus = signInfo.getMsStatus();
					String msoStatus = signInfo.getMsoStatus();
					String asStatus = signInfo.getAsStatus();
					String asoStatus = signInfo.getAsoStatus();
					
					//上午上班打卡-auto
					if(!"已打卡".equals(signInfo.getMsStatus())){
						signInfo.setMsTime(DateUtil.parseDateTime(currentDate+" 09:00:00"));
						signInfo.setMsStatus("已打卡");
					}
					
					//上午下班打卡-auto
					if(!"已打卡".equals(signInfo.getMsoStatus())){
						signInfo.setMsoTime(DateUtil.parseDateTime(currentDate+" 12:00:00"));
						signInfo.setMsoStatus("已打卡");
					}
					
					//下午上班打卡-auto
					if(!"已打卡".equals(signInfo.getAsStatus())){
						signInfo.setAsTime(DateUtil.parseDateTime(currentDate+" 13:00:00"));
						signInfo.setAsStatus("已打卡");
					}
					
					//下午下班打卡-auto
					if(!"已打卡".equals(signInfo.getAsoStatus())){
						signInfo.setAsoTime(DateUtil.parseDateTime(currentDate+" 18:00:00"));
						signInfo.setAsoStatus("已打卡");
					}
					
					if("未打卡".equals(msStatus) || "未打卡".equals(msoStatus) || "未打卡".equals(asStatus) || "未打卡".equals(asoStatus)){
						this.saveOrUpdateSignInfo(signInfo);
					}
				}
			}
		}
	}		
}

