package com.bjrun.acceptanceForm.action;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;

import net.sf.json.JSONObject;

import com.bjrun.base.BaseAction;
import com.bjrun.clientQuestion.entity.AppMsdLog;
import com.bjrun.clientQuestion.service.AppMsdLogService;
import com.bjrun.mobile.entity.user.User;
import com.bjrun.mobile.service.user.UserService;
import com.bjrun.mobile.service.wxApp.WxAppService;
/**
 * @Desc   9999手机端各列表和提交相关
 * @author Administrator
 * @Date   2019-05-25 13：00
 */
public class AcceptanceFormAction extends BaseAction{

	private static final long serialVersionUID = 5743559144700439185L;
	private WxAppService wxAppService;
	private String result;
	private AppMsdLogService appMsdLogService;
	private UserService userService;
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public AppMsdLogService getAppMsdLogService() {
		return appMsdLogService;
	}

	public void setAppMsdLogService(AppMsdLogService appMsdLogService) {
		this.appMsdLogService = appMsdLogService;
	}

	public String getResult(){
	   return this.result;
    }
		  
	public void setResult(String result){
	   this.result = result;
	}
    public WxAppService getWxAppService() {
			return wxAppService;
    }
	
	public void setWxAppService(WxAppService wxAppService) {
			this.wxAppService = wxAppService;
    }
	/**
	 * 9999获取标题列表数据
	 * @return
	 * @throws Exception
	 */
	 public String clientInfo()throws Exception{
		    Date date = new Date();
		    JSONObject json = new JSONObject();
		    InputStream inputStream = null;
		    //参数：申请人姓名、条件、结尾Id、分页页面数据
		    String userName = "";
		    String condition ="";
		    String lastId = "";
		    String pageSize="";
		    if(request.getParameter("name")!=null){
		    	userName = request.getParameter("name");
		    }
			if(request.getParameter("condition")!=null){
				condition =request.getParameter("condition");  	
					    }
			if(request.getParameter("lastId")!=null){
				 lastId =request.getParameter("lastId");
			}
			if(request.getParameter("pageSize")!=null){
				 pageSize=request.getParameter("pageSize");
			}
 
			StringBuffer sb = new StringBuffer();
		  	URL url;
			HttpURLConnection postConnection;
			String oldRunUrl = wxAppService.getUserByKey("Get_Acceptance_To_Mobile");
			try {
			    url = new URL(oldRunUrl+"name="+URLEncoder.encode(userName, "UTF-8")+"&condition="+URLEncoder.encode(condition, "UTF-8")+"&lastId="+lastId+"&pageSize="+pageSize);
			    postConnection = (HttpURLConnection) url.openConnection();
			    postConnection.setRequestMethod("POST");
			    postConnection.setDoOutput(true);
			    postConnection.setDoInput(true);
			    postConnection.setRequestProperty("Content-Type","application/json");
				postConnection.connect();
				inputStream = postConnection.getInputStream();
				String result = "";
				byte[] bs =new byte[1024];
				int len=0;
				while((len=inputStream.read(bs))!=-1){
					result+=new String(bs,"UTF-8");
				}
				String message = result;
				//保存原始数据
				AppMsdLog oldLog = new AppMsdLog();
				oldLog.setToUser(userName);
				oldLog.setType("1");
				oldLog.setTitle("移动端9999");
				oldLog.setContent(message);
				oldLog.setSendTime(new Date());
				if(!"".equals(userName) && userName != null){
					User user=  userService.getUserByUserName(userName);
					if(user!=null){
						oldLog.setWxUserId(user.getWxUserId());
					}
				}
				appMsdLogService.saveOrUpdateAppMsdLog(oldLog);
				System.out.println("--------9999-------"+message);
				if(message!=null && message!="" && message.length()>14){
					message=message.substring(14,message.length()-1);
				}
				json=JSONObject.fromObject(message);
				//保存数据
				AppMsdLog newLog = new AppMsdLog();
				newLog.setToUser(userName);
				newLog.setType("2");
				newLog.setTitle("移动端9999");
				newLog.setContent(json.toString());
				newLog.setSendTime(new Date());
				if(!"".equals(userName) && userName != null){
					User user=  userService.getUserByUserName(userName);
					if(user!=null){
						newLog.setWxUserId(user.getWxUserId());
					}
				}
				appMsdLogService.saveOrUpdateAppMsdLog(newLog);
				System.out.println("--------9999json-------"+json);
				
				postConnection.disconnect();
			} catch (Exception e) {
				e.printStackTrace();
				json.put("resultType", "submit");
				json.put("msg", "操作失败！");
			}finally {
	            try {
	            	inputStream.close();
	            }
	            catch (Exception e) {
	            }
	        }
			this.result=json.toString();
			return "success";
		  }
	 /**
	  * 9999添加问题
	  * @return
	  * @throws Exception
	  */
	 public String addQuestion()throws Exception{
		    Date date = new Date();
		    JSONObject json = new JSONObject();
		    InputStream inputStream = null;
		    String applyUser = request.getParameter("applyUser");
		    //参数：申请人名称、电话、标题、详情描述、附件名称
		    String phone = "";
		    String title = "";
		    String desc = "";
		    String files = "";
		    

			if(request.getParameter("phone")!=null){
				phone = request.getParameter("phone");
			}
			if(request.getParameter("title")!=null){
				title = request.getParameter("title");
			}
			if(request.getParameter("desc")!=null){
				desc = request.getParameter("desc");
			}
			if(request.getParameter("files")!=null){
				files = request.getParameter("files");
			}
				    
			StringBuffer sb = new StringBuffer();
		  	URL url;
			HttpURLConnection postConnection;
			String oldRunUrl = wxAppService.getUserByKey("Accept_Add_Question_From_Mobile");
			try {
			    url = new URL(oldRunUrl+"applyUser="+URLEncoder.encode(applyUser, "UTF-8")+"&title="+URLEncoder.encode(title, "UTF-8")+"&phoneNo="+URLEncoder.encode(phone, "UTF-8")+"&queContent="+URLEncoder.encode(desc, "UTF-8")+"&fileName="+URLEncoder.encode(files, "UTF-8"));
			    postConnection = (HttpURLConnection) url.openConnection();
			    postConnection.setRequestMethod("POST");
			    postConnection.setDoOutput(true);
			    postConnection.setDoInput(true);
			    postConnection.setRequestProperty("Content-Type","application/json");
				postConnection.connect();
				inputStream = postConnection.getInputStream();
				int size =inputStream.available();
				byte[] bs =new byte[size];
				inputStream.read(bs);
				String message=new String(bs,"UTF-8");
				System.out.println("--------9999-------"+message);
				if(message!=null && message!="" && message.length()>14){
					message=message.substring(14,message.length()-1);
				}
				json=JSONObject.fromObject(message);
				System.out.println("--------9999json-------"+json);
				
				postConnection.disconnect();
			} catch (Exception e) {
				e.printStackTrace();
				json.put("msg", "操作失败！");
			}finally {
	            try {
	            	inputStream.close();
	            }
	            catch (Exception e) {
	            }
	        }
			this.result=json.toString();
			return "success";
		  }
	 /**
	  * 9999提交评价
	  * @return
	  * @throws Exception
	  */
	 public String addEstimate()throws Exception{
		    Date date = new Date();
		    JSONObject json = new JSONObject();
		    InputStream inputStream = null;
		    //参数：问题id，受理结果，提交人名称，受理态度
		    String id = request.getParameter("id");
		    String result =request.getParameter("result");
		    String name = request.getParameter("name");
		    String taidu = request.getParameter("taidu");

		    
			StringBuffer sb = new StringBuffer();
		  	URL url;
			HttpURLConnection postConnection;
			String oldRunUrl = wxAppService.getUserByKey("Accept_Add_Estimate_From_Mobile");
			try {
			    url = new URL(oldRunUrl+"id="+id+"&result="+result+"&name="+name+"&taidu="+taidu);
			    postConnection = (HttpURLConnection) url.openConnection();
			    postConnection.setRequestMethod("POST");
			    postConnection.setDoOutput(true);
			    postConnection.setDoInput(true);
			    postConnection.setRequestProperty("Content-Type","application/json");
				postConnection.connect();
				inputStream = postConnection.getInputStream();
				int size =inputStream.available();
				byte[] bs =new byte[size];
				inputStream.read(bs);
				String message=new String(bs,"UTF-8");
				System.out.println("--------9999-------"+message);
				if(message!=null && message!="" && message.length()>14){
					message=message.substring(14,message.length()-1);
				}
				json=JSONObject.fromObject(message);
				System.out.println("--------9999json-------"+json);
				
				postConnection.disconnect();
			} catch (Exception e) {
				e.printStackTrace();
				json.put("msg", "操作失败！");
			}finally {
	            try {
	            	inputStream.close();
	            }
	            catch (Exception e) {
	            }
	        }
			this.result=json.toString();
			return "success";
		  }
	 /**
	  * 9999提交反馈结果
	  * @return
	  * @throws Exception
	  */
	 public String addResult()throws Exception{
		    Date date = new Date();
		    JSONObject json = new JSONObject();
		    InputStream inputStream = null;
		    //参数：问题Id，反馈结果，反馈人名称
		    String id = request.getParameter("id");
		    String result =request.getParameter("result");
		    String name =request.getParameter("name");
		    
			StringBuffer sb = new StringBuffer();
		  	URL url;
			HttpURLConnection postConnection;
			String oldRunUrl = wxAppService.getUserByKey("Accept_Add_Result_From_Mobile");
			try {
			    url = new URL(oldRunUrl+"id="+id+"&name="+name+"&result="+result);
			    postConnection = (HttpURLConnection) url.openConnection();
			    postConnection.setRequestMethod("POST");
			    postConnection.setDoOutput(true);
			    postConnection.setDoInput(true);
			    postConnection.setRequestProperty("Content-Type","application/json");
				postConnection.connect();
				inputStream = postConnection.getInputStream();
				int size =inputStream.available();
				byte[] bs =new byte[size];
				inputStream.read(bs);
				String message=new String(bs,"UTF-8");
				System.out.println("--------9999-------"+message);
				if(message!=null && message!="" && message.length()>14){
					message=message.substring(14,message.length()-1);
				}
				json=JSONObject.fromObject(message);
				System.out.println("--------9999json-------"+json);
				
				//access_token
				postConnection.disconnect();
			} catch (Exception e) {
				e.printStackTrace();
				json.put("msg", "操作失败！");
			}finally {
	            try {
	            	inputStream.close();
	            }
	            catch (Exception e) {
	            }
	        }
			this.result=json.toString();
			return "success";
		  }
	 /**
	  * 9999获取进度列表详情
	  * @return
	  * @throws Exception
	  */
	 public String getClientList()throws Exception{
		    Date date = new Date();
		    JSONObject json = new JSONObject();
		    InputStream inputStream = null;
		    //参数：问题Id
		    String id = request.getParameter("id");
		    
			StringBuffer sb = new StringBuffer();
		  	URL url;
			HttpURLConnection postConnection;
			String oldRunUrl = wxAppService.getUserByKey("Accept_Get_ClientList_To_Mobile");
			try {
			    url = new URL(oldRunUrl+"id="+id);
			    postConnection = (HttpURLConnection) url.openConnection();
			    postConnection.setRequestMethod("POST");
			    postConnection.setDoOutput(true);
			    postConnection.setDoInput(true);
			    postConnection.setRequestProperty("Content-Type","application/json");
				postConnection.connect();
				inputStream = postConnection.getInputStream();
				String result = "";
				byte[] bs =new byte[1024];
				int len=0;
				while((len=inputStream.read(bs))!=-1){					
					result+=new String(bs,"UTF-8");										
				}
				String message = result;
				//保存原始数据
				
				AppMsdLog oldLog = new AppMsdLog();
				oldLog.setToUser(id);
				oldLog.setType("1");
				oldLog.setTitle("移动端9999进度");
				oldLog.setContent(message);
				oldLog.setSendTime(new Date());
				
				appMsdLogService.saveOrUpdateAppMsdLog(oldLog);
				System.out.println("--------9999-------"+message);
				if(message!=null && message!="" && message.length()>14){
					message=message.substring(14,message.length()-1);
				}
				
				json=JSONObject.fromObject(message);
				//保存数据
				AppMsdLog newLog = new AppMsdLog();
				newLog.setToUser(id);
				newLog.setType("2");
				newLog.setTitle("移动端9999进度");
				newLog.setContent(json.toString());
				newLog.setSendTime(new Date());
			
				appMsdLogService.saveOrUpdateAppMsdLog(newLog);
				System.out.println("--------9999json-------"+json);
				
				//access_token
				postConnection.disconnect();
			} catch (Exception e) {
				e.printStackTrace();
				json.put("resultType", "submit");
				json.put("msg", "操作失败！");
			}finally {
	            try {
	            	inputStream.close();
	            }
	            catch (Exception e) {
	            }
	        }
			this.result=json.toString();
			return "success";
		  }

}
