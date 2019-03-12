package com.fr.function;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

/**
 * This class provide interface to execute command on remote Linux.
 */

public class SSHCommandExecutor implements Runnable {
	private String ipAddress;

	private String username;

	private String password;
	
	private String command;
	
	private Date startRunDate;
	
	private Date endRunDate;

	public static final int DEFAULT_SSH_PORT = 22;

	private Vector<String> stdout;

	public SSHCommandExecutor(String ipAddress, String username, String password, String command) {
		this.ipAddress = ipAddress;
		this.username = username;
		this.password = password;
		this.command=command;
		stdout = new Vector<String>();
	}

	public SSHCommandExecutor(String ipAddress, String username, String password) {
		this.ipAddress = ipAddress;
		this.username = username;
		this.password = password;
		//this.command=command;
		stdout = new Vector<String>();
	}
	
	public SSHCommandExecutor(String ipAddress, String username, String password, String command,String startRunDate,String endRunDate) throws ParseException {
		SimpleDateFormat a=new SimpleDateFormat("yyyy-MM-dd");
		this.ipAddress = ipAddress;
		this.username = username;
		this.password = password;
		this.command=command;
		this.startRunDate=a.parse(startRunDate);
		this.endRunDate=a.parse(endRunDate);
		stdout = new Vector<String>();
	}
	
	public void run() {
		//int returnCode = 0;
 		JSch jsch = new JSch();
		SimpleDateFormat a=new SimpleDateFormat("yyyy-MM-dd");
		MyUserInfo userInfo = new MyUserInfo();
		Date curRunDate=startRunDate;
		Calendar rightNow=Calendar.getInstance();
        while(curRunDate.getTime()<= endRunDate.getTime()){
 
		    try {
		    	
			    // Create and connect session.
			    Session session = jsch.getSession(username, ipAddress, DEFAULT_SSH_PORT);
			    session.setPassword(password);
			    session.setUserInfo(userInfo);
			    session.connect();

			    // Create and connect channel.
			    Channel channel = session.openChannel("exec");
			    ((ChannelExec) channel).setCommand(command+" "+a.format(curRunDate));
               System.out.println(curRunDate);
			    channel.setInputStream(null);
			    BufferedReader input = new BufferedReader(new InputStreamReader(channel.getInputStream()));

			    channel.connect();
			    System.out.println("The remote command is: " + command+" "+a.format(curRunDate));

			    // Get the output of remote command.
			    String line;
			    while ((line = input.readLine()) != null) {
				    stdout.add(line);
			    }
			    input.close();

			    // Disconnect the channel and session.
			    channel.disconnect();
			    session.disconnect();
		    } catch (JSchException e) {
			    // TODO Auto-generated catch block
			    e.printStackTrace();
		    } catch (Exception e) {
			    e.printStackTrace();
		    }
		    //return returnCode;
		    rightNow.setTime(curRunDate);
		    rightNow.add(Calendar.DAY_OF_YEAR,1);
	        curRunDate=rightNow.getTime();
        }
	}

	public int testcaller() {
		int returnCode = 0;
		JSch jsch = new JSch();
		MyUserInfo userInfo = new MyUserInfo();
		
		try {
			// Create and connect session.
			Session session = jsch.getSession(username, ipAddress, DEFAULT_SSH_PORT);
			session.setPassword(password);
			session.setUserInfo(userInfo);
			session.connect();

			// Create and connect channel.
			Channel channel = session.openChannel("exec");
			((ChannelExec) channel).setCommand(command);

			channel.setInputStream(null);
			BufferedReader input = new BufferedReader(new InputStreamReader(channel.getInputStream()));

			channel.connect();
			System.out.println("The remote command is: " + command);

			// Get the output of remote command.
			String line = input.readLine();

			input.close();

			// Get the return code only after the channel is closed.
			if (channel.isClosed()) {
				returnCode = channel.getExitStatus();
			}

			// Disconnect the channel and session.
			channel.disconnect();
			session.disconnect();
			if(line!=null) {
				return 0;
			}
			else {
			return 2;
		    }
		}
			catch (JSchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 3;
		}
		

	}
	
	public Vector<String> getStandardOutput() {
		return stdout;
	}
	
	public static void main(String[] args) {
		ExecutorService executor = Executors.newCachedThreadPool();
		int returnVal;
        SSHCommandExecutor tester = new SSHCommandExecutor("82.211.13.98","oracle","qwert123","ls /oracle/test1.sh");
	    
	    returnVal=tester.testcaller();
	    System.out.println(returnVal);
	    
	    Vector<String> stdout = tester.getStandardOutput();
		for (String str : stdout) {
			
			System.out.println(str);
		}
		System.out.println("end");
	}
}
