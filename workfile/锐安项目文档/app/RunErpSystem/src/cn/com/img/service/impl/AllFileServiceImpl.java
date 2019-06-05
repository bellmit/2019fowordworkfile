// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   AllFileServiceImpl.java

package cn.com.img.service.impl;

import cn.com.img.service.AllFileService;
import com.bjrun.mobile.entity.sign.SignInfo;
import com.bjrun.mobile.service.sign.SignService;
import com.bjrun.util.*;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.SftpException;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import org.apache.log4j.Logger;

public class AllFileServiceImpl
    implements AllFileService
{

    public AllFileServiceImpl()
    {
    }

    public SignService getSignService()
    {
        return signService;
    }

    public void setSignService(SignService signService)
    {
        this.signService = signService;
    }

    public void saveAllfile()
    {
    	Map configMap = ConfigUtil.resolveProperties();
        SimpleDateFormat format1;
        List list;
        boolean moveFlag;
        String filePath;
        FileWriter fw;
        BufferedWriter writer;
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        int hour = DateUtil.getHourOfDate(date);
        if(hour == 0)
            date = DateUtil.getDayAfterToday(-1);
        String dateStr = format.format(date);
        list = signService.queryForList(dateStr);
        moveFlag = false;
        String local_sign_path = (String)configMap.get("local_sign_path");
        filePath = (new StringBuilder(local_sign_path)).append(format2.format(date)).append(".txt").toString();
        fw = null;
        writer = null;
        try{
	        fw = new FileWriter(filePath);
	        writer = new BufferedWriter(fw);
	        if(list != null && list.size() > 0){
	            String data;
	            for(Iterator iterator = list.iterator(); iterator.hasNext(); writer.write(data))
	            {
	                SignInfo signInfo = (SignInfo)iterator.next();
	                String runId = String.valueOf(signInfo.getRunId());
	                String userName = signInfo.getUserName() != null ? signInfo.getUserName() : "";
	                String msStatus = signInfo.getMsStatus() != null ? signInfo.getMsStatus() : "";
	                String msTime = signInfo.getMsTime() != null ? format1.format(signInfo.getMsTime()) : "";
	                String msLongitude = signInfo.getMsLongitude() != null ? signInfo.getMsLongitude() : "";
	                String msLatitude = signInfo.getMsLatitude() != null ? signInfo.getMsLatitude() : "";
	                String msAddress = signInfo.getMsAddress() != null ? signInfo.getMsAddress() : "";
	                String msuuId = signInfo.getMsdeviceUuid() != null ? signInfo.getMsdeviceUuid() : "";
	                String msosType = signInfo.getMsosType() != null ? signInfo.getMsosType() : "";
	                String msoAddress = signInfo.getMsoAddress() != null ? signInfo.getMsoAddress() : "";
	                String msoTime = signInfo.getMsoTime() != null ? format1.format(signInfo.getMsoTime()) : "";
	                String msoLongitude = signInfo.getMsoLongitude() != null ? signInfo.getMsoLongitude() : "";
	                String msoLatitude = signInfo.getMsoLatitude() != null ? signInfo.getMsoLatitude() : "";
	                String msoStatus = signInfo.getMsoStatus() != null ? signInfo.getMsoStatus() : "";
	                String msouuId = signInfo.getMsodeviceUuid() != null ? signInfo.getMsodeviceUuid() : "";
	                String msoosType = signInfo.getMsoosType() != null ? signInfo.getMsoosType() : "";
	                String asAddress = signInfo.getAsAddress() != null ? signInfo.getAsAddress() : "";
	                String asTime = signInfo.getAsTime() != null ? format1.format(signInfo.getAsTime()) : "";
	                String asLongitude = signInfo.getAsLongitude() != null ? signInfo.getAsLongitude() : "";
	                String asLatitude = signInfo.getAsLatitude() != null ? signInfo.getAsLatitude() : "";
	                String asStatus = signInfo.getAsStatus() != null ? signInfo.getAsStatus() : "";
	                String asuuId = signInfo.getAsdeviceUuid() != null ? signInfo.getAsdeviceUuid() : "";
	                String asType = signInfo.getAsosType() != null ? signInfo.getAsosType() : "";
	                String asoAddress = signInfo.getAsoAddress() != null ? signInfo.getAsoAddress() : "";
	                String asoTime = signInfo.getAsoTime() != null ? format1.format(signInfo.getAsoTime()) : "";
	                String asoLongitude = signInfo.getAsoLongitude() != null ? signInfo.getAsoLongitude() : "";
	                String asoLatitude = signInfo.getAsoLatitude() != null ? signInfo.getAsoLatitude() : "";
	                String asoStatus = signInfo.getAsoStatus() != null ? signInfo.getAsoStatus() : "";
	                String asouuId = signInfo.getAsodeviceUuid() != null ? signInfo.getAsodeviceUuid() : "";
	                String asoType = signInfo.getAsoosType() != null ? signInfo.getAsoosType() : "";
	                String createDate = signInfo.getCreateDate() != null ? format1.format(signInfo.getCreateDate()) : "";
	                String deviceUUID = signInfo.getDeviceUuid() != null ? signInfo.getDeviceUuid() : "";
	                String osType = signInfo.getOsType() != null ? signInfo.getOsType() : "";
	                data = "";
	                if(!msTime.equals(""))
	                    data = (new StringBuilder(String.valueOf(data))).append(runId).append("$").append(userName).append("$").append("m-sign").append("$").append(msStatus).append("$").append(msTime).append("$").append(msLongitude).append("$").append(msLatitude).append("$").append(msAddress).append("$").append(msuuId).append("$").append(msosType).append("$").append("\t\n").toString();
	                if(!msoTime.equals(""))
	                    data = (new StringBuilder(String.valueOf(data))).append(runId).append("$").append(userName).append("$").append("m-sign-out").append("$").append(msoStatus).append("$").append(msoTime).append("$").append(msoLongitude).append("$").append(msoLatitude).append("$").append(msoAddress).append("$").append(msouuId).append("$").append(msoosType).append("$").append("\t\n").toString();
	                if(!asTime.equals(""))
	                    data = (new StringBuilder(String.valueOf(data))).append(runId).append("$").append(userName).append("$").append("a-sign").append("$").append(asStatus).append("$").append(asTime).append("$").append(asLongitude).append("$").append(asLatitude).append("$").append(asAddress).append("$").append(asuuId).append("$").append(asType).append("$").append("\t\n").toString();
	                if(!asoTime.equals(""))
	                    data = (new StringBuilder(String.valueOf(data))).append(runId).append("$").append(userName).append("$").append("a-sign-out").append("$").append(asoStatus).append("$").append(asoTime).append("$").append(asoLongitude).append("$").append(asoLatitude).append("$").append(asoAddress).append("$").append(asouuId).append("$").append(asoType).append("$").append("\t\n").toString();
	            }
	
	        }
	        moveFlag = true;
     
            if(fw != null)
                fw.flush();
            if(writer != null)
                writer.flush();
            if(writer != null)
                writer.close();
            if(fw != null)
                fw.close();
            if(moveFlag)
                try
                {
                    moveSignFile(filePath);
                }
                catch(Exception e)
                {
                    logger.error((new StringBuilder("\u6253\u5361\u6587\u4EF6")).append(filePath).append("\u642C\u8FD0\u81F3\u5149\u95F8\u5931\u8D25\u3002").toString(), e);
                }
        }
        catch(Exception e)
        {
            logger.error((new StringBuilder("\u6253\u5361\u6587\u4EF6")).append(filePath).append("\u6D41\u5BF9\u8C61\u5173\u95ED\u5931\u8D25\u3002").toString(), e);
            e.printStackTrace();
        }
    }

    public void handAllFile(String dateStr)
    {
        SimpleDateFormat format1;
        List list;
        boolean moveFlag;
        String filePath;
        FileWriter fw;
        BufferedWriter writer;
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        SimpleDateFormat format3 = new SimpleDateFormat("HH-mm-ss");
        list = signService.queryForList(dateStr);
        moveFlag = false;
        filePath = (new StringBuilder("D:/home/sign/")).append(dateStr).append(format3.format(date)).append(".txt").toString();
        fw = null;
        writer = null;
        try{
	        fw = new FileWriter(filePath);
	        writer = new BufferedWriter(fw);
	        if(list != null && list.size() > 0){
	            String data;
	            for(Iterator iterator = list.iterator(); iterator.hasNext(); writer.write(data))
	            {
	                SignInfo signInfo = (SignInfo)iterator.next();
	                String runId = String.valueOf(signInfo.getRunId());
	                String userName = signInfo.getUserName() != null ? signInfo.getUserName() : "";
	                String msStatus = signInfo.getMsStatus() != null ? signInfo.getMsStatus() : "";
	                String msTime = signInfo.getMsTime() != null ? format1.format(signInfo.getMsTime()) : "";
	                String msLongitude = signInfo.getMsLongitude() != null ? signInfo.getMsLongitude() : "";
	                String msLatitude = signInfo.getMsLatitude() != null ? signInfo.getMsLatitude() : "";
	                String msAddress = signInfo.getMsAddress() != null ? signInfo.getMsAddress() : "";
	                String msuuId = signInfo.getMsdeviceUuid() != null ? signInfo.getMsdeviceUuid() : "";
	                String msosType = signInfo.getMsosType() != null ? signInfo.getMsosType() : "";
	                String msoAddress = signInfo.getMsoAddress() != null ? signInfo.getMsoAddress() : "";
	                String msoTime = signInfo.getMsoTime() != null ? format1.format(signInfo.getMsoTime()) : "";
	                String msoLongitude = signInfo.getMsoLongitude() != null ? signInfo.getMsoLongitude() : "";
	                String msoLatitude = signInfo.getMsoLatitude() != null ? signInfo.getMsoLatitude() : "";
	                String msoStatus = signInfo.getMsoStatus() != null ? signInfo.getMsoStatus() : "";
	                String msouuId = signInfo.getMsodeviceUuid() != null ? signInfo.getMsodeviceUuid() : "";
	                String msoosType = signInfo.getMsoosType() != null ? signInfo.getMsoosType() : "";
	                String asAddress = signInfo.getAsAddress() != null ? signInfo.getAsAddress() : "";
	                String asTime = signInfo.getAsTime() != null ? format1.format(signInfo.getAsTime()) : "";
	                String asLongitude = signInfo.getAsLongitude() != null ? signInfo.getAsLongitude() : "";
	                String asLatitude = signInfo.getAsLatitude() != null ? signInfo.getAsLatitude() : "";
	                String asStatus = signInfo.getAsStatus() != null ? signInfo.getAsStatus() : "";
	                String asuuId = signInfo.getAsdeviceUuid() != null ? signInfo.getAsdeviceUuid() : "";
	                String asType = signInfo.getAsosType() != null ? signInfo.getAsosType() : "";
	                String asoAddress = signInfo.getAsoAddress() != null ? signInfo.getAsoAddress() : "";
	                String asoTime = signInfo.getAsoTime() != null ? format1.format(signInfo.getAsoTime()) : "";
	                String asoLongitude = signInfo.getAsoLongitude() != null ? signInfo.getAsoLongitude() : "";
	                String asoLatitude = signInfo.getAsoLatitude() != null ? signInfo.getAsoLatitude() : "";
	                String asoStatus = signInfo.getAsoStatus() != null ? signInfo.getAsoStatus() : "";
	                String asouuId = signInfo.getAsodeviceUuid() != null ? signInfo.getAsodeviceUuid() : "";
	                String asoType = signInfo.getAsoosType() != null ? signInfo.getAsoosType() : "";
	                String createDate = signInfo.getCreateDate() != null ? format1.format(signInfo.getCreateDate()) : "";
	                String deviceUUID = signInfo.getDeviceUuid() != null ? signInfo.getDeviceUuid() : "";
	                String osType = signInfo.getOsType() != null ? signInfo.getOsType() : "";
	                data = "";
	                if(!msTime.equals(""))
	                    data = (new StringBuilder(String.valueOf(data))).append(runId).append("$").append(userName).append("$").append("m-sign").append("$").append(msStatus).append("$").append(msTime).append("$").append(msLongitude).append("$").append(msLatitude).append("$").append(msAddress).append("$").append(msuuId).append("$").append(msosType).append("$").append("\t\n").toString();
	                if(!msoTime.equals(""))
	                    data = (new StringBuilder(String.valueOf(data))).append(runId).append("$").append(userName).append("$").append("m-sign-out").append("$").append(msoStatus).append("$").append(msoTime).append("$").append(msoLongitude).append("$").append(msoLatitude).append("$").append(msoAddress).append("$").append(msouuId).append("$").append(msoosType).append("$").append("\t\n").toString();
	                if(!asTime.equals(""))
	                    data = (new StringBuilder(String.valueOf(data))).append(runId).append("$").append(userName).append("$").append("a-sign").append("$").append(asStatus).append("$").append(asTime).append("$").append(asLongitude).append("$").append(asLatitude).append("$").append(asAddress).append("$").append(asuuId).append("$").append(asType).append("$").append("\t\n").toString();
	                if(!asoTime.equals(""))
	                    data = (new StringBuilder(String.valueOf(data))).append(runId).append("$").append(userName).append("$").append("a-sign-out").append("$").append(asoStatus).append("$").append(asoTime).append("$").append(asoLongitude).append("$").append(asoLatitude).append("$").append(asoAddress).append("$").append(asouuId).append("$").append(asoType).append("$").append("\t\n").toString();
	            }
	
	        }
	        moveFlag = true;
       
        
            if(fw != null)
                fw.flush();
            if(writer != null)
                writer.flush();
            if(writer != null)
                writer.close();
            if(fw != null)
                fw.close();
            if(moveFlag){
            	moveSignFile(filePath);
            }
        }
        catch(Exception e)
        {
            logger.error((new StringBuilder("\u6253\u5361\u6587\u4EF6")).append(filePath).append("\u6D41\u5BF9\u8C61\u5173\u95ED\u5931\u8D25\u3002").toString(), e);
            e.printStackTrace();
        }
    }

    private void moveSignFile(String filePath)
    {
        MySFTP sf;
        File signFile;
        ChannelSftp sftp;
        String gz_sign_path;
        FileInputStream fis;
        sf = new MySFTP();
        signFile = new File(filePath);
        Map configMap = ConfigUtil.resolveProperties();
        sftp = null;
        String host = "192.168.0.88";
        int port = 22;
        String username = "root";
        String password = "bjrun@2014yunwei";
        host = (String)configMap.get("gz_hostIP");
        username = (String)configMap.get("gz_hostUname");
        password = (String)configMap.get("gz_hostPwd");
        gz_sign_path = (String)configMap.get("gz_sign_path");
        sftp = sf.getConnect(host, port, username, password);
        if(signFile.exists()){
        	try {
      		  fis = null;
		          sftp.cd(gz_sign_path);
		          fis = new FileInputStream(signFile);
		          sftp.put(fis, signFile.getName());
		          if(fis != null){
		        	  fis.close();	
		          }
		      }catch(IOException e){
                  e.printStackTrace();
                  logger.error((new StringBuilder("Sftp\u8FDE\u63A5\u5931\u8D25(")).append(filePath).append(")\u3002").toString(), e);
            } catch (SftpException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				logger.error((new StringBuilder("Sftp\u8FDE\u63A5\u5931\u8D25(")).append(filePath).append(")\u3002").toString(), e);
			}  
            sftp.quit();
            sf.closeConn();
        }
    }

    private static Logger logger = Logger.getLogger(AllFileServiceImpl.class);
    private SignService signService;

}
