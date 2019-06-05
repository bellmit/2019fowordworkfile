package com.bjrun.mobile.service.user.impl;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bjrun.mobile.dao.user.UserDao;
import com.bjrun.mobile.entity.autoPunch.AutoPunchLog;
import com.bjrun.mobile.entity.declare.Declare;
import com.bjrun.mobile.entity.user.User;
import com.bjrun.mobile.service.user.UserService;
 
	@Service
 public class UserServiceImpl implements UserService
 {
	   private UserDao userDao;
	   
	   public UserDao getUserDao()
	   {
	     return this.userDao;
	   }
	   
	   public void setUserDao(UserDao userDao)
	   {
	     this.userDao = userDao;
	   }
	   
	   public User getUserById(String userId)
	   {
	     return this.userDao.getUserById(userId);
	   }
	   
	   public User getUserByRunId(Integer runId)
	   {
	     return this.userDao.getUserByRunId(runId);
	   }
	   
	   public User getUserByUserName(String userName)
	   {
	     return this.userDao.getUserByUserName(userName);
	   }
	   
	   public User userLogin(String userName, String passWord)
	   {
	     return this.userDao.userLogin(userName, passWord);
	   }
	   
	   public void saveUserInfo(User user)
	   {
	     this.userDao.saveOrUpdateUser(user);
	   }
	   
	   public void saveBatchUsers(List<User> userList)
	   {
	     this.userDao.saveOrUpdateUserAll(userList);
	   }
	
		public User userLoginApp(String userName)
		{
		  return this.userDao.userLoginApp(userName);
		}

		@Override
		public void saveDeclare(Declare declare) {
			this.userDao.saveDeclare(declare);
		}

		@Override
		public boolean isExsitDeclare(String userName) {
			Declare exsit = this.userDao.getDeclareByUsername(userName);
			if(exsit != null){
				return true;
			}else{
				return false;
			}
		}

		@Override
		public void saveUserInfoAuto(User user) {
			userDao.saveOrUpdateUser(user);
		}

		@Override
		public void saveOrUpdateAutoPunchLog(AutoPunchLog log) {
			userDao.saveOrUpdateAutoPunchLog(log);
		};

		@Override
		public User getUserByWxUserId(String userId) {
			return this.userDao.getUserByWxUserId(userId);
		}
	}


