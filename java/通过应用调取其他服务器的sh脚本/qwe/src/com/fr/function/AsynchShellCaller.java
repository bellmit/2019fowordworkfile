package com.fr.function;

import java.text.ParseException;
import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.fr.script.AbstractFunction;


public class AsynchShellCaller extends AbstractFunction{
  ExecutorService executor = Executors.newCachedThreadPool();
	@Override
	public Object run(Object[] arg0) {
		
	    String ip=(String) arg0[0];
	    String username =(String) arg0[1];
	    String password=(String) arg0[2];
	    String cmds =(String) arg0[3];
	    String cmdArgStart=(String) arg0[4];
	    String cmdArgEnd=(String) arg0[5];

	    int returnVal;
	    
	    SSHCommandExecutor tester = new SSHCommandExecutor(ip,username,password,"ls "+cmds);
	    
	    returnVal=tester.testcaller();
        if(returnVal==0) {
	    SSHCommandExecutor sshExecutor;
		try {
			sshExecutor = new SSHCommandExecutor(ip,username,password,cmds,cmdArgStart,cmdArgEnd);
			executor.submit(sshExecutor);	
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "shell脚本已提交到后台运行。";
	    }
	    else if(returnVal==1){
	    	return "服务器IP地址或远程机器用户名或登录密码有误。";
	    }
	    else if(returnVal==2){
	    	return "脚本路径或脚本名称有误。";
	    
	    }
	    else {
	    	return "发生其他未知错误。";
	    }
	}
	
}
