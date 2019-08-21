package com.bjrun.clientQuestion.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
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
 * @Desc   400移动端各列表和提交相关
 * @author Administrator
 * @Date   2019-05-25 13：00
 */
public class MobileGetClientAction extends BaseAction{
	
	private static final long serialVersionUID = -4420439024398536544L;
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
	 * 400获取标题主列表数据
	 * @return
	 * @throws Exception
	 */
	 public String clientInfo()throws Exception{
		    Date date = new Date();
		    JSONObject json = new JSONObject();
		    InputStream inputStream = null;
		    //参数：登陆人，条件，结尾Id，分页中数据数量
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
    
//		    String wxUserId = "Run.$*!(@._wanglin";
			StringBuffer sb = new StringBuffer();
		  	URL url;
			HttpURLConnection postConnection;
			String oldRunUrl = wxAppService.getUserByKey("Get_ClientInfo_To_Mobile");
//			String oldRunUrl="http://10.200.200.39/getClientInfoToMobile.do?";
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
					result+=new String(bs,"GBK");
				}
				String message = result;
				//保存原始数据
				AppMsdLog oldLog = new AppMsdLog();
				oldLog.setToUser(userName);
				oldLog.setType("1");
				oldLog.setTitle("移动端400");
				oldLog.setContent(message);
				oldLog.setSendTime(new Date());
				if(!"".equals(userName) && userName != null){
					User user=  userService.getUserByUserName(userName);
					if(user!=null){
						oldLog.setWxUserId(user.getWxUserId());
					}
				}
				appMsdLogService.saveOrUpdateAppMsdLog(oldLog);
				System.out.println("--------400-------"+message);
				if(message!=null && message!="" && message.length()>14){
					message=message.substring(14,message.length()-1);
				}
				json=JSONObject.fromObject(message);
				//保存数据
				AppMsdLog newLog = new AppMsdLog();
				newLog.setToUser(userName);
				newLog.setType("2");
				newLog.setTitle("移动端400");
				newLog.setContent(json.toString());
				newLog.setSendTime(new Date());
				if(!"".equals(userName) && userName != null){
					User user=  userService.getUserByUserName(userName);
					if(user!=null){
						newLog.setWxUserId(user.getWxUserId());
					}
				}
				appMsdLogService.saveOrUpdateAppMsdLog(newLog);
				System.out.println("--------400json-------"+json);
				
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
	  * 400提交新增问题
	  * @return
	  * @throws Exception
	  */
	 public String addQuestion()throws Exception{
		    Date date = new Date();
		    JSONObject json = new JSONObject();
		    InputStream inputStream = null;
		    String applyUser = request.getParameter("applyUser");
		    //参数 用户公司、手机、标题、问题类型、问题描述、文件名称
		    String company ="";
		    String phone = "";
		    String title = "";
		    String type = "";
		    String desc = "";
		    String files = "";
		    
	
			if(request.getParameter("company")!=null){
				company =request.getParameter("company");	    	
		    }
			if(request.getParameter("phone")!=null){
				phone = request.getParameter("phone");
			}
			if(request.getParameter("title")!=null){
				title = request.getParameter("title");
			}
			if(request.getParameter("type")!=null){
				type = request.getParameter("type");
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
			String oldRunUrl = wxAppService.getUserByKey("Add_Question_From_Mobile");
			try {	
			    url = new URL(oldRunUrl+"applyUser="+URLEncoder.encode(applyUser, "UTF-8")+"&company="+URLEncoder.encode(company, "UTF-8")+"&phone="+URLEncoder.encode(phone, "UTF-8")+"&title="+URLEncoder.encode(title, "UTF-8")+"&type="+URLEncoder.encode(type, "UTF-8")+"&desc="+URLEncoder.encode(desc, "UTF-8")+"&files="+URLEncoder.encode(files, "UTF-8"));
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
				String message=new String(bs,"GBK");
				System.out.println("--------400-------"+message);
				if(message!=null && message!="" && message.length()>14){
					message=message.substring(14,message.length()-1);
				}
				json=JSONObject.fromObject(message);
				System.out.println("--------400json-------"+json);
				
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
	  * 400提交评价
	  * @return
	  * @throws Exception
	  */
	 public String addEstimate()throws Exception{
		    Date date = new Date();
		    JSONObject json = new JSONObject();
		    InputStream inputStream = null;
		    //参数:效率评分、态度评分、专业性评分
		    String id = request.getParameter("id");
		    String xiaolv =request.getParameter("xiaolv");
		    String taidu = request.getParameter("taidu");
		    String zhuanye = request.getParameter("zhuanye");

		    
			StringBuffer sb = new StringBuffer();
		  	URL url;
			HttpURLConnection postConnection;
			String oldRunUrl = wxAppService.getUserByKey("Add_Estimate_From_Mobile");
			try {
			    url = new URL(oldRunUrl+"id="+id+"&xiaolv="+xiaolv+"&taidu="+taidu+"&zhuanye="+zhuanye);
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
				String message=new String(bs,"GBK");
				System.out.println("--------400-------"+message);
				if(message!=null && message!="" && message.length()>14){
					message=message.substring(14,message.length()-1);
				}
				json=JSONObject.fromObject(message);
				System.out.println("--------400json-------"+json);
				
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
	  * 400提交反馈结果
	  * @return
	  * @throws Exception
	  */
	 public String addResult()throws Exception{
		    Date date = new Date();
		    JSONObject json = new JSONObject();
		    InputStream inputStream = null;
		    //参数：问题id、是否解决
		    String id = request.getParameter("id");
		    String result =request.getParameter("result");

		    
			StringBuffer sb = new StringBuffer();
		  	URL url;
			HttpURLConnection postConnection;
			String oldRunUrl = wxAppService.getUserByKey("Add_Result_From_Mobile");
			try {
			    url = new URL(oldRunUrl+"id="+id+"&result="+result);
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
				String message=new String(bs,"GBK");
				System.out.println("--------400-------"+message);
				if(message!=null && message!="" && message.length()>14){
					message=message.substring(14,message.length()-1);
				}
				json=JSONObject.fromObject(message);
				System.out.println("--------400json-------"+json);
				
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
	  * 400获取进度详情列表
	  * @return
	  * @throws Exception
	  */
	 public String getClientList()throws Exception{
		    Date date = new Date();
		    JSONObject json = new JSONObject();
		    InputStream inputStream = null;
		    //参数：问题id
		    String id = request.getParameter("id");
	    
			StringBuffer sb = new StringBuffer();
		  	URL url;
			HttpURLConnection postConnection;
			String oldRunUrl = wxAppService.getUserByKey("Get_ClientList_To_Mobile");
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
					
						result+=new String(bs,"GBK");
					
					
				}
				String message = result;
				//保存原始数据
				AppMsdLog oldLog = new AppMsdLog();
				oldLog.setToUser(id);
				oldLog.setType("1");
				oldLog.setTitle("移动端400进度");
				oldLog.setContent(message);
				oldLog.setSendTime(new Date());
				
				appMsdLogService.saveOrUpdateAppMsdLog(oldLog);
				System.out.println("--------400-------"+message);
				if(message!=null && message!="" && message.length()>14){
					message=message.substring(14,message.length()-1);
				}
				
				json=JSONObject.fromObject(message);
				//保存数据
				AppMsdLog newLog = new AppMsdLog();
				newLog.setToUser(id);
				newLog.setType("2");
				newLog.setTitle("移动端400进度");
				newLog.setContent(json.toString());
				newLog.setSendTime(new Date());
			
				appMsdLogService.saveOrUpdateAppMsdLog(newLog);
				System.out.println("--------400json-------"+json);
				
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
	 	
	
	 public String clientQueFileMobile()throws Exception{//测试流
		    JSONObject json = new JSONObject();
		    String uploadPath =request.getSession().getServletContext().getRealPath("/upload/");
		    File file = new File (uploadPath);
		    if(!file.exists()){
		    	file.mkdir();
		    }
		    OutputStream os = new FileOutputStream(file);
		    InputStream  stream =request.getInputStream();
		    byte[] byteStr = new byte[1024];  
            int len = 0;  
            while ((len = stream.read(byteStr)) > 0) {  
            	os.write(byteStr,0,len);  
            }  
            stream.close();  
              
            os.flush();  
            os.close(); 

//		    out.write(request.getInputStream());
//            out.flush();
//            out.close();
			this.result=json.toString();
			return "success";
		  }

}
