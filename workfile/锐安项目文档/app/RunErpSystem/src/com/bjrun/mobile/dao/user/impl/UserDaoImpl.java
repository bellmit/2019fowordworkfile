 package com.bjrun.mobile.dao.user.impl;
 
 import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bjrun.mobile.dao.user.UserDao;
import com.bjrun.mobile.entity.autoPunch.AutoPunchLog;
import com.bjrun.mobile.entity.declare.Declare;
import com.bjrun.mobile.entity.user.User;
import com.bjrun.mobile.entity.workCalendar.WorkCalendar;
 
 public class UserDaoImpl extends HibernateDaoSupport implements UserDao{
	   public User userLogin(String userName, String passWord){
	     List<User> list = getHibernateTemplate().find("from User t where t.userName = ? and t.passWord = ? ", new Object[] { userName, passWord });
	     if (list.size() > 0) {
	       return (User)list.get(0);
	     }
	     return null;
	   }
   
	   public User getUserById(String userId){
	     List<User> list = getHibernateTemplate().find("from User t where t.id = ?", new Object[] { userId });
	     if (list.size() > 0) {
	       return (User)list.get(0);
	     }
	     return null;
	   }
   
	   public User getUserByRunId(Integer runId){
	     List<User> list = getHibernateTemplate().find("from User t where t.runId = ?", new Object[] { runId });
	     if (list.size() > 0) {
	       return (User)list.get(0);
	     }
	     return null;
	   }
   
	   public User getUserByUserName(String userName){
	     List<User> list = getHibernateTemplate().find("from User t where t.userName = ?", new Object[] { userName });
	     if (list.size() > 0) {
	       return (User)list.get(0);
	     }
	     return null;
	   }
   
	   public void saveOrUpdateUser(User user){
	     getHibernateTemplate().saveOrUpdate(user);
	   }
   
	   public void saveOrUpdateUserAll(List<User> userList){
	     getHibernateTemplate().saveOrUpdateAll(userList);
	   }

		public User userLoginApp(String userName)
		{
		  List<User> list = getHibernateTemplate().find("from User t where t.userName = ? ", new Object[] { userName });
		  if (list.size() > 0) {
		    return (User)list.get(0);
		  }
		  return null;
		}

		@Override
		public void saveDeclare(Declare declare) {
			getHibernateTemplate().saveOrUpdate(declare);
		}

		@Override
		public Declare getDeclareByUsername(String userName) {
			List<Declare> list = getHibernateTemplate().find("from Declare t where t.userName = ? ", new Object[] { userName });
			if (list.size() > 0) {
				return (Declare)list.get(0);
			}
			return null;
		}

		@Override
		public List<Declare> getDeclareList() {
			List<Declare> list = getHibernateTemplate().find("from Declare");
			return list;
		}

		@Override
		public List<User> getUserList() {
			List<User> list = getHibernateTemplate().find("from User ");
			return list;
		}

		@Override
		public List<User> getUserListByState(String punchState) {
			List<User> list = getHibernateTemplate().find("from User where auto_punch =  ? ", new Object[] { punchState });
			return list;
		}

		@Override
		public boolean getWorkCalendar(String currentDate) {
			 List<WorkCalendar> list = getHibernateTemplate().find("from WorkCalendar t where t.period = ? and work_type = 1 ", new Object[] {currentDate});
		     if (list.size() > 0) {
		       return true;
		     }
			return false;
		}

		@Override
		public void saveOrUpdateAutoPunchLog(AutoPunchLog log) {
			getHibernateTemplate().saveOrUpdate(log);
		}
		@Override
		public User getUserByWxUserId(String userId) {
			System.out.println("----------------------"+userId+"----------------------");
			List<User> list = getHibernateTemplate().find("from User t where t.wxUserId = ?", new Object[] { userId });
		    if (list.size() > 0) {
		       return (User)list.get(0);
		    }
		    return null;
		}

   }

