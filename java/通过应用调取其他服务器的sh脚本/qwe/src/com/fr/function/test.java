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
		
		System.out.println( "shell�ű����ύ����̨���С�");
	    }
	    else if(returnVal==1){
	    	System.out.println( "������IP��ַ��Զ�̻����û������¼��������");
	    }
	    else if(returnVal==2){
	    	System.out.println( "�ű�·����ű���������");
	    
	    }
	    else {
	    	System.out.println( "��������δ֪����");
	    }
	}
	
}
