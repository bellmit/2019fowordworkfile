package com.bjrun.util.timer;

import java.util.TimerTask;

import javax.servlet.ServletContext;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.bjrun.mobile.service.sign.SignService;

public class AutoPunchTask extends TimerTask{

	private WebApplicationContext applicationContext;
	private ServletContext context = null;
	private SignService signService;
    public AutoPunchTask(){
		
	}
	public AutoPunchTask(ServletContext context){
		this.context = context;
	    this.applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(context);
	}
	
	public void run(){
	  this.signService = ((SignService)this.applicationContext.getBean("signService"));
	  this.signService.autoPunch();
	}
	
}
