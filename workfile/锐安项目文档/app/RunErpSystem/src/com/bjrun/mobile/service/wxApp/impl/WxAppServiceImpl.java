package com.bjrun.mobile.service.wxApp.impl;

import com.bjrun.mobile.dao.wxApp.WxAppDao;
import com.bjrun.mobile.service.wxApp.WxAppService;

public class WxAppServiceImpl implements WxAppService {
	private WxAppDao wxAppDao;
	
	public WxAppDao getWxAppDao() {
		return wxAppDao;
	}

	public void setWxAppDao(WxAppDao wxAppDao) {
		this.wxAppDao = wxAppDao;
	}

	@Override
	public String getUserByKey(String wxAppKey) {
		
		return wxAppDao.getUserByKey(wxAppKey);
	}

}
