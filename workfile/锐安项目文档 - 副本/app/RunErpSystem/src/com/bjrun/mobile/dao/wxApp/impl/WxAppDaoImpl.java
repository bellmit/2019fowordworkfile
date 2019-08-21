package com.bjrun.mobile.dao.wxApp.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bjrun.mobile.dao.wxApp.WxAppDao;
import com.bjrun.mobile.entity.wxApp.WxAppConfig;

public class WxAppDaoImpl  extends HibernateDaoSupport implements WxAppDao {

	@Override
	public String getUserByKey(String wxAppKey) {
		List<WxAppConfig> list = getHibernateTemplate().find("from WxAppConfig t where t.wx_app_key = ? ", new Object[] { wxAppKey });
		if (list.size() > 0) {
			WxAppConfig wxAppConfig = list.get(0);
			if(wxAppConfig != null){
				return wxAppConfig.getWx_app_value();
			}
		}
		return "";
	}

}
