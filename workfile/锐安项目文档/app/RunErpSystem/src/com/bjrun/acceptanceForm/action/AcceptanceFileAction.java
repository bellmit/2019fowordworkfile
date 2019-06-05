package com.bjrun.acceptanceForm.action;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.bjrun.mobile.service.wxApp.WxAppService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @Desc   9999附件存储
 * @author Administrator
 * @Date   2019-05-25 13：00
 */
public class AcceptanceFileAction extends ActionSupport{
	private File businessFile;
	private String businessFileFileName;
	
	private String result;
	private WxAppService wxAppService;
	 public WxAppService getWxAppService() {
			return wxAppService;
 }
	
	public void setWxAppService(WxAppService wxAppService) {
			this.wxAppService = wxAppService;
 }
	public String getResult(){
	   return this.result;
    }
		  
	public void setResult(String result){
	   this.result = result;
	}
	
	public File getBusinessFile() {
		return businessFile;
	}



	public void setBusinessFile(File businessFile) {
		this.businessFile = businessFile;
	}



	public String getBusinessFileFileName() {
		return businessFileFileName;
	}



	public void setBusinessFileFileName(String businessFileFileName) {
		this.businessFileFileName = businessFileFileName;
	}


	/**
	 * 9999上传附件
	 * @return
	 * @throws Exception
	 */
	public String clientQueFileMobile() throws Exception {
		JSONObject json = new JSONObject();
         String path = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/upload");  
         //查看是否存在目录 不存在则创建
         File file = new File(path);
         //如果目录不存在
         if(!file.exists()){
            file.mkdirs();
         }
         //文件不为空 则上传
         if(businessFile!=null){
             //输出流  
             OutputStream os = new FileOutputStream(new File(path,businessFileFileName));  
             //输入流  
            InputStream is = new FileInputStream(businessFile);  
               
             byte[] buf = new byte[1024];  
             int length = 0 ;  
               
             while(-1 != (length = is.read(buf) ) )  
             {  
                 os.write(buf, 0, length) ;  
             }  
             is.close();  
             os.close();  
        
         
         DataInputStream in = null; 
         OutputStream out = null; 
         HttpURLConnection conn = null; 
         JSONObject resposeTxt = null; 
         InputStream ins = null; 
         ByteArrayOutputStream outStream = null; 
         try { 
          String oldRunUrl = wxAppService.getUserByKey("Accept_ClientQueFile_Mobile");
          URL url = new URL(oldRunUrl+"fileName="+URLEncoder.encode(businessFileFileName, "UTF-8")); 
          conn = (HttpURLConnection) url.openConnection(); 
          // 发送POST请求必须设置如下两行 
          conn.setDoOutput(true); 
          conn.setUseCaches(false); 
          conn.setRequestMethod("POST"); 
          conn.setRequestProperty("Content-Type", "text/html"); 
          conn.setRequestProperty("Cache-Control", "no-cache"); 
//          conn.setRequestProperty("Charsert", "UTF-8"); 
          conn.connect(); 
          conn.setConnectTimeout(10000); 
          out = conn.getOutputStream(); 
          
          in = new DataInputStream(new FileInputStream(businessFile)); 
          
          int bytes = 0; 
          byte[] buffer = new byte[1024]; 
          while ((bytes = in.read(buffer)) != -1) { 
          out.write(buffer, 0, bytes); 
          } 
          out.flush(); 
          
          // 返回流 
          if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) { 
          ins = conn.getInputStream(); 
          outStream = new ByteArrayOutputStream(); 
          byte[] data = new byte[1024]; 
          int count = -1; 
          while ((count = ins.read(data, 0, 1024)) != -1) { 
           outStream.write(data, 0, count); 
          } 
          data = null; 
          resposeTxt = JSONObject.fromObject(new String(outStream 
           .toByteArray(), "UTF-8")); 
          } 
         } catch (Exception e) { 
          e.printStackTrace(); 
         } finally { 
          if (in != null) { 
          in.close(); 
          } 
          if (out != null) { 
          out.close(); 
          } 
          if (ins != null) { 
          ins.close(); 
          } 
          if (outStream != null) { 
          outStream.close(); 
          } 
          if (conn != null) { 
          conn.disconnect(); 
          } 
         } 
         }
         
         json.put("msg", "操作成功");
         this.result=json.toString();
         return "success";  
	}
		
	


}
