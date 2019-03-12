package com.fr.function;

import java.text.ParseException;
import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.fr.script.AbstractFunction;


public class test {
	public static void main(String[] args) throws ParseException {

	 ExecutorService executor = Executors.newCachedThreadPool();

	    int returnVal;
	    
	    SSHCommandExecutor tester = new SSHCommandExecutor("82.211.13.98","oracle","qwert123","ls "+"/oracle/test1.sh");
	    returnVal=tester.testcaller();
        if(returnVal==0) {
	    SSHCommandExecutor sshExecutor = new SSHCommandExecutor("82.211.13.98","oracle","qwert123","/oracle/test1.sh","2019-02-01","2019-02-03");
		//sshExecutor.execute(cmds);
		executor.submit(sshExecutor);
		//executor.shutdown();		
		
		System.out.println( "shell脚本已提交到后台运行。");
	    }
	    else if(returnVal==1){
	    	System.out.println( "服务器IP地址或远程机器用户名或登录密码有误。");
	    }
	    else if(returnVal==2){
	    	System.out.println( "脚本路径或脚本名称有误。");
	    
	    }
	    else {
	    	System.out.println( "发生其他未知错误。");
	    }
	}
	
}
