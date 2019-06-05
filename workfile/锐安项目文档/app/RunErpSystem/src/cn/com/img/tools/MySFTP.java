/*   1:    */ package cn.com.img.tools;
/*   2:    */ 
/*   3:    */ import com.jcraft.jsch.Channel;
/*   4:    */ import com.jcraft.jsch.ChannelSftp;
/*   5:    */ import com.jcraft.jsch.ChannelSftp.LsEntry;
/*   6:    */ import com.jcraft.jsch.JSch;
/*   7:    */ import com.jcraft.jsch.Session;
/*   8:    */ import com.jcraft.jsch.SftpATTRS;
/*   9:    */ import com.jcraft.jsch.SftpException;
/*  10:    */ import java.io.File;
/*  11:    */ import java.io.FileInputStream;
/*  12:    */ import java.io.FileNotFoundException;
/*  13:    */ import java.io.FileOutputStream;
/*  14:    */ import java.io.IOException;
/*  15:    */ import java.io.PrintStream;
/*  16:    */ import java.util.Iterator;
/*  17:    */ import java.util.Properties;
/*  18:    */ import java.util.Vector;
/*  19:    */ 
/*  20:    */ public class MySFTP
/*  21:    */ {
/*  22: 27 */   private Channel channel = null;
/*  23: 28 */   private Session sshSession = null;
/*  24:    */   
/*  25:    */   public ChannelSftp getConnect(String host, int port, String username, String password)
/*  26:    */   {
/*  27:    */     try
/*  28:    */     {
/*  29: 40 */       JSch jsch = new JSch();
/*  30: 41 */       jsch.getSession(username, host, port);
/*  31: 42 */       this.sshSession = jsch.getSession(username, host, port);
/*  32: 43 */       this.sshSession.setPassword(password);
/*  33: 44 */       Properties sshConfig = new Properties();
/*  34: 45 */       sshConfig.put("StrictHostKeyChecking", "no");
/*  35: 46 */       this.sshSession.setConfig(sshConfig);
/*  36: 47 */       this.sshSession.connect();
/*  37: 48 */       this.channel = this.sshSession.openChannel("sftp");
/*  38: 49 */       this.channel.connect();
/*  39:    */     }
/*  40:    */     catch (Exception e)
/*  41:    */     {
/*  42: 51 */       System.out.println("链接主机异常，主机：" + host);
/*  43:    */     }
/*  44: 53 */     return (ChannelSftp)this.channel;
/*  45:    */   }
/*  46:    */   
/*  47:    */   public void closeConn()
/*  48:    */   {
/*  49: 60 */     if (this.channel != null) {
/*  50: 61 */       this.channel.disconnect();
/*  51:    */     }
/*  52: 63 */     if (this.sshSession != null) {
/*  53: 64 */       this.sshSession.disconnect();
/*  54:    */     }
/*  55:    */   }
/*  56:    */   
/*  57:    */   public void upload(String directory, String uploadFile, ChannelSftp sftp)
/*  58:    */   {
/*  59:    */     try
/*  60:    */     {
/*  61: 75 */       sftp.cd(directory);
/*  62: 76 */       File file = new File(uploadFile);
/*  63: 77 */       FileInputStream fis = new FileInputStream(file);
/*  64: 78 */       sftp.put(fis, file.getName());
/*  65: 79 */       sftp.quit();
/*  66: 80 */       closeConn();
/*  67: 81 */       fis.close();
/*  68:    */     }
/*  69:    */     catch (Exception e)
/*  70:    */     {
/*  71: 83 */       e.printStackTrace();
/*  72:    */     }
/*  73:    */   }
/*  74:    */   
/*  75:    */   public void download(String directory, String downloadFile, String saveFile, ChannelSftp sftp)
/*  76:    */   {
/*  77:    */     try
/*  78:    */     {
/*  79: 96 */       sftp.cd(directory);
/*  80: 97 */       File file = new File(saveFile);
/*  81: 98 */       sftp.get(downloadFile, new FileOutputStream(file));
/*  82: 99 */       sftp.quit();
/*  83:100 */       closeConn();
/*  84:    */     }
/*  85:    */     catch (Exception e)
/*  86:    */     {
/*  87:103 */       e.printStackTrace();
/*  88:    */     }
/*  89:    */   }
/*  90:    */   
/*  91:    */   public boolean batchDownLoadFile(String remotPath, String localPath, String fileFormat, boolean del, ChannelSftp sftp)
/*  92:    */   {
/*  93:122 */     FileOutputStream fos = null;
/*  94:    */     try
/*  95:    */     {
/*  96:124 */       Vector v = sftp.ls(remotPath);
/*  97:125 */       if ((v != null) && (v.size() > 0))
/*  98:    */       {
/*  99:126 */         Iterator it = v.iterator();
/* 100:127 */         while (it.hasNext())
/* 101:    */         {
/* 102:128 */           ChannelSftp.LsEntry entry = (ChannelSftp.LsEntry)it.next();
/* 103:129 */           String filename = entry.getFilename();
/* 104:130 */           SftpATTRS attrs = entry.getAttrs();
/* 105:131 */           if (!attrs.isDir())
/* 106:    */           {
/* 107:132 */             if ((fileFormat != null) && (!"".equals(fileFormat.trim())))
/* 108:    */             {
/* 109:133 */               if (filename.startsWith(fileFormat))
/* 110:    */               {
/* 111:135 */                 sftp.cd(remotPath);
/* 112:136 */                 File file = new File(localPath + filename);
/* 113:    */                 
/* 114:138 */                 fos = new FileOutputStream(file);
/* 115:    */                 
/* 116:140 */                 sftp.get(remotPath + filename, fos);
/* 117:141 */                 sftp.rm(remotPath + filename);
/* 118:    */               }
/* 119:    */             }
/* 120:    */             else
/* 121:    */             {
/* 122:144 */               sftp.cd(remotPath);
/* 123:145 */               File file = new File(localPath + filename);
/* 124:    */               
/* 125:147 */               fos = new FileOutputStream(file);
/* 126:    */               
/* 127:149 */               sftp.get(remotPath + filename, fos);
/* 128:150 */               sftp.rm(remotPath + filename);
/* 129:    */             }
/* 130:152 */             if (fos != null) {
/* 131:153 */               fos.close();
/* 132:    */             }
/* 133:    */           }
/* 134:    */         }
/* 135:157 */         sftp.quit();
/* 136:158 */         closeConn();
/* 137:    */       }
/* 138:    */     }
/* 139:    */     catch (SftpException e)
/* 140:    */     {
/* 141:161 */       e.printStackTrace();
/* 142:    */     }
/* 143:    */     catch (FileNotFoundException e)
/* 144:    */     {
/* 145:163 */       e.printStackTrace();
/* 146:    */     }
/* 147:    */     catch (IOException e)
/* 148:    */     {
/* 149:165 */       e.printStackTrace();
/* 150:    */     }
/* 151:168 */     return false;
/* 152:    */   }
/* 153:    */   
/* 154:    */   public void delete(String directory, String deleteFile, ChannelSftp sftp)
/* 155:    */   {
/* 156:    */     try
/* 157:    */     {
/* 158:179 */       sftp.cd(directory);
/* 159:180 */       sftp.rm(deleteFile);
/* 160:181 */       sftp.quit();
/* 161:182 */       closeConn();
/* 162:    */     }
/* 163:    */     catch (Exception e)
/* 164:    */     {
/* 165:184 */       e.printStackTrace();
/* 166:    */     }
/* 167:    */   }
/* 168:    */   
/* 169:    */   public Vector<String> listFiles(String directory, ChannelSftp sftp)
/* 170:    */     throws SftpException
/* 171:    */   {
/* 172:196 */     Vector<String> fileList = sftp.ls(directory);
/* 173:197 */     closeConn();
/* 174:198 */     return fileList;
/* 175:    */   }
/* 176:    */   
/* 177:    */   public static void main(String[] args)
/* 178:    */   {
/* 179:243 */     MySFTP sf = new MySFTP();
/* 180:244 */     String host = "192.168.0.88";
/* 181:245 */     int port = 22;
/* 182:246 */     String username = "root";
/* 183:247 */     String password = "bjrun@2014yunwei";
/* 184:    */     
/* 185:249 */     ChannelSftp sftp = sf.getConnect(host, port, username, password);
/* 186:    */     
/* 187:251 */     sf.batchDownLoadFile("/mobilesigntest/", "D:\\mobilesigntest\\", null, true, sftp);
/* 188:252 */     System.exit(0);
/* 189:    */   }
/* 190:    */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     cn.com.img.tools.MySFTP
 * JD-Core Version:    0.7.0.1
 */