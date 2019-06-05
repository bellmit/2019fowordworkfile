package com.bjrun.mobile.dao.sign.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bjrun.mobile.dao.sign.SignDao;
import com.bjrun.mobile.entity.sign.SignInfo;
import com.bjrun.mobile.entity.user.User;
import com.bjrun.mobile.entity.wxApp.WxAppInfo;
  
  public class SignDaoImpl extends HibernateDaoSupport implements SignDao {
	  
    public SignInfo getSignInfoByUserNameAndDate(String userName, String signDate){
    	
      try{
        List<SignInfo> list = getHibernateTemplate().find("from SignInfo t where t.userName = ? and t.signDate = '" + signDate + "' ", new Object[] { userName });
        if (list.size() > 0) {
          return (SignInfo)list.get(0);
        }
        return null;
      }catch (Exception e){
        e.printStackTrace();
      }
      return null;
    }
    
    public List<SignInfo> queryForList(String date){
      List<SignInfo> list = getHibernateTemplate().find("from SignInfo t where t.signDate='" + date + "'");
      return list;
    }
    
    public void saveOrUpdateSignInfo(SignInfo signInfo){
      getHibernateTemplate().saveOrUpdate(signInfo);
    }

	public User getUserByWxUserId(String userId) {
		
		List<User> list = getHibernateTemplate().find("from User t where t.wxUserId = ?", new Object[] { userId });
	    if (list.size() > 0) {
	       return (User)list.get(0);
	    }
	    return null;
	}

	public WxAppInfo getWxAppInfoByKey(String key,String appId) {
		
		List<WxAppInfo> list = getHibernateTemplate().find("from WxAppInfo t where t.appKey = ?  and t.appId = '" + appId + "' order by id desc", new Object[] { key });
	    if (list.size() > 0) {
	       return (WxAppInfo)list.get(0);
	    }
	    return null;
	}
	
	public void saveOrUpdateWxAppInfo(WxAppInfo wxAppInfo) {
		getHibernateTemplate().saveOrUpdate(wxAppInfo);
	}

	@Override
	public void deleteWxAppInfo(String appKey,String appId) {
		final String appKeys = appKey;
		final String appIds = appId;
		getHibernateTemplate().execute(new HibernateCallback(){

			@Override
			public Object doInHibernate(Session arg0)
					throws HibernateException, SQLException {
				System.out.println("----"+appKeys);
				System.out.println("====="+appIds);
				arg0.createQuery(" delete from WxAppInfo t where t.appKey= '"+appKeys +"' and t.appId ="+appIds);
				return null;
			}
			
		});
	}

}

