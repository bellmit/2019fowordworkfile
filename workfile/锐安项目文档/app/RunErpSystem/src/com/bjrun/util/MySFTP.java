/*   1:    */ package com.bjrun.util;
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
/*  22: 24 */   private Channel channel = null;
/*  23: 25 */   private Session sshSession = null;
/*  24:    */   
/*  25:    */   public ChannelSftp getConnect(String host, int port, String username, String password)
/*  26:    */   {
/*  27:    */     try
/*  28:    */     {
/*  29: 36 */       JSch jsch = new JSch();
/*  30: 37 */       jsch.getSession(username, host, port);
/*  31: 38 */       this.sshSession = jsch.getSession(username, host, port);
/*  32: 39 */       this.sshSession.setPassword(password);
/*  33: 40 */       Properties sshConfig = new Properties();
/*  34: 41 */       sshConfig.put("StrictHostKeyChecking", "no");
/*  35: 42 */       this.sshSession.setConfig(sshConfig);
/*  36: 43 */       this.sshSession.connect();
/*  37: 44 */       this.channel = this.sshSession.openChannel("sftp");
/*  38: 45 */       this.channel.connect();
/*  39:    */     }
/*  40:    */     catch (Exception e)
/*  41:    */     {
/*  42: 47 */       System.out.println("连接关闸服务器失败：" + host);
/*  43:    */     }
/*  44: 49 */     return (ChannelSftp)this.channel;
/*  45:    */   }
/*  46:    */   
/*  47:    */   public void closeConn()
/*  48:    */   {
/*  49: 55 */     if (this.channel != null) {
/*  50: 56 */       this.channel.disconnect();
/*  51:    */     }
/*  52: 58 */     if (this.sshSession != null) {
/*  53: 59 */       this.sshSession.disconnect();
/*  54:    */     }
/*  55:    */   }
/*  56:    */   
/*  57:    */   public void upload(String directory, String uploadFile, ChannelSftp sftp)
/*  58:    */   {
/*  59: 69 */     FileInputStream fis = null;
/*  60:    */     try
/*  61:    */     {
/*  62: 71 */       sftp.cd(directory);
/*  63: 72 */       File file = new File(uploadFile);
/*  64: 73 */       fis = new FileInputStream(file);
/*  65: 74 */       sftp.put(fis, file.getName());
/*  66:    */     }
/*  67:    */     catch (Exception e)
/*  68:    */     {
/*  69: 77 */       e.printStackTrace();
/*  70:    */       
/*  71: 79 */       sftp.quit();
/*  72: 80 */       closeConn();
/*  73:    */       try
/*  74:    */       {
/*  75: 82 */         if (fis != null) {
/*  76: 83 */           fis.close();
/*  77:    */         }
/*  78:    */       }
/*  79:    */       catch (IOException e1)
/*  80:    */       {
/*  81: 86 */         e1.printStackTrace();
/*  82:    */       }
/*  83:    */     }
/*  84:    */     finally
/*  85:    */     {
/*  86: 79 */       sftp.quit();
/*  87: 80 */       closeConn();
/*  88:    */       try
/*  89:    */       {
/*  90: 82 */         if (fis != null) {
/*  91: 83 */           fis.close();
/*  92:    */         }
/*  93:    */       }
/*  94:    */       catch (IOException e)
/*  95:    */       {
/*  96: 86 */         e.printStackTrace();
/*  97:    */       }
/*  98:    */     }
/*  99:    */   }
/* 100:    */   
/* 101:    */   public void download(String directory, String downloadFile, String saveFile, ChannelSftp sftp)
/* 102:    */   {
/* 103: 99 */     FileOutputStream fos = null;
/* 104:    */     try
/* 105:    */     { 
/* 106:101 */       sftp.cd(directory);
/* 107:102 */       File file = new File(saveFile);
/* 108:103 */       fos = new FileOutputStream(file);
/* 109:104 */       sftp.get(downloadFile, fos);
/* 110:105 */       sftp.quit();
/* 111:106 */       closeConn();
/* 112:    */     }
/* 113:    */     catch (Exception e)
/* 114:    */     {
/* 115:108 */       e.printStackTrace();
/* 116:    */       
/* 117:110 */       sftp.quit();
/* 118:111 */       closeConn();
/* 119:    */       try
/* 120:    */       {
/* 121:113 */         if (fos != null)
/* 122:    */         {
/* 123:114 */           fos.flush();
/* 124:115 */           fos.close();
/* 125:    */         }
/* 126:    */       }
/* 127:    */       catch (IOException e1)
/* 128:    */       {
/* 129:118 */         e1.printStackTrace();
/* 130:    */       }
/* 131:    */     }
/* 132:    */     finally
/* 133:    */     {
/* 134:110 */       sftp.quit();
/* 135:111 */       closeConn();
/* 136:    */       try
/* 137:    */       {
/* 138:113 */         if (fos != null)
/* 139:    */         {
/* 140:114 */           fos.flush();
/* 141:115 */           fos.close();
/* 142:    */         }
/* 143:    */       }
/* 144:    */       catch (IOException e)
/* 145:    */       {
/* 146:118 */         e.printStackTrace();
/* 147:    */       }
/* 148:    */     }
/* 149:    */   }
/* 150:    */   
/* 151:    */   public boolean batchDownLoadFile(String remotPath, String localPath, String fileFormat, boolean del, ChannelSftp sftp)
/* 152:    */   {
/* 153:137 */     FileOutputStream fos = null;
/* 154:138 */     Vector v = null;
/* 155:    */     try
/* 156:    */     {
/* 157:140 */       v = sftp.ls(remotPath);
/* 158:    */     }
/* 159:    */     catch (SftpException e1)
/* 160:    */     {
/* 161:142 */       e1.printStackTrace();
/* 162:    */     }
/* 163:144 */     if ((v != null) && (v.size() > 0))
/* 164:    */     {
/* 165:145 */       Iterator it = v.iterator();
/* 166:    */       label387:
/* 167:146 */       while (it.hasNext()) {
/* 168:    */         try
/* 169:    */         {
/* 170:148 */           ChannelSftp.LsEntry entry = (ChannelSftp.LsEntry)it.next();
/* 171:149 */           String filename = entry.getFilename();
/* 172:150 */           SftpATTRS attrs = entry.getAttrs();
/* 173:151 */           if (!attrs.isDir()) {
/* 174:152 */             if ((fileFormat != null) && (!"".equals(fileFormat.trim())))
/* 175:    */             {
/* 176:153 */               if (filename.startsWith(fileFormat))
/* 177:    */               {
/* 178:155 */                 sftp.cd(remotPath);
/* 179:    */                 
/* 180:157 */                 File file = new File(localPath + filename);
/* 181:    */                 
/* 182:159 */                 fos = new FileOutputStream(file);
/* 183:    */                 
/* 184:161 */                 sftp.get(remotPath + filename, fos);
/* 185:162 */                 sftp.rm(remotPath + filename);
/* 186:    */                 break label387;
/* 187:    */               }
/* 188:    */             }
/* 189:    */             else
/* 190:    */             {
/* 191:165 */               sftp.cd(remotPath);
/* 192:166 */               File file = new File(localPath + filename);
/* 193:    */               
/* 194:168 */               fos = new FileOutputStream(file);
/* 195:    */               
/* 196:170 */               sftp.get(remotPath + filename, fos);
/* 197:171 */               sftp.rm(remotPath + filename);
/* 198:    */             }
/* 199:    */           }
/* 200:    */         }
/* 201:    */         catch (SftpException e)
/* 202:    */         {
/* 203:175 */           e.printStackTrace();
/* 204:179 */           if (fos != null) {
/* 205:    */             try
/* 206:    */             {
/* 207:181 */               fos.close();
/* 208:    */             }
/* 209:    */             catch (IOException e1)
/* 210:    */             {
/* 211:183 */               e1.printStackTrace();
/* 212:    */             }
/* 213:    */           }
/* 214:    */         }
/* 215:    */         catch (FileNotFoundException e)
/* 216:    */         {
/* 217:177 */           e.printStackTrace();
/* 218:179 */           if (fos != null) {
/* 219:    */             try
/* 220:    */             {
/* 221:181 */               fos.close();
/* 222:    */             }
/* 223:    */             catch (IOException e1)
/* 224:    */             {
/* 225:183 */               e1.printStackTrace();
/* 226:    */             }
/* 227:    */           }
/* 228:    */         }
/* 229:    */         finally
/* 230:    */         {
/* 231:179 */           if (fos != null) {
/* 232:    */             try
/* 233:    */             {
/* 234:181 */               fos.close();
/* 235:    */             }
/* 236:    */             catch (IOException e)
/* 237:    */             {
/* 238:183 */               e.printStackTrace();
/* 239:    */             }
/* 240:    */           }
/* 241:    */         }
/* 242:    */       }
/* 243:188 */       sftp.quit();
/* 244:189 */       closeConn();
/* 245:    */     }
/* 246:192 */     return false;
/* 247:    */   }
/* 248:    */   
/* 249:    */   public boolean bacthUploadFile(String remotePath, String localPath, boolean del, ChannelSftp sf)
/* 250:    */   {
/* 251:208 */     FileInputStream fis = null;
/* 252:    */     try
/* 253:    */     {
/* 254:210 */       File file = new File(localPath);
/* 255:211 */       File[] files = file.listFiles();
/* 256:212 */       for (File fileTemp : files) {
/* 257:213 */         if ((fileTemp.isFile()) && (fileTemp.exists()))
/* 258:    */         {
/* 259:215 */           sf.cd(remotePath);
/* 260:216 */           fis = new FileInputStream(fileTemp);
/* 261:217 */           sf.put(fis, fileTemp.getName());
/* 262:218 */           fis.close();
/* 263:219 */           fileTemp.delete();
/* 264:    */         }
/* 265:    */       }
/* 266:222 */       sf.quit();
/* 267:223 */       closeConn();
/* 268:224 */       return true;
/* 269:    */     }
/* 270:    */     catch (Exception e)
/* 271:    */     {
/* 272:226 */       e.printStackTrace();
/* 273:    */     }
/* 274:228 */     return false;
/* 275:    */   }
/* 276:    */   
/* 277:    */   public void delete(String directory, String deleteFile, ChannelSftp sftp)
/* 278:    */   {
/* 279:    */     try
/* 280:    */     {
/* 281:240 */       sftp.cd(directory);
/* 282:241 */       sftp.rm(deleteFile);
/* 283:    */     }
/* 284:    */     catch (Exception e)
/* 285:    */     {
/* 286:244 */       e.printStackTrace();
/* 287:    */     }
/* 288:    */     finally
/* 289:    */     {
/* 290:246 */       sftp.quit();
/* 291:247 */       closeConn();
/* 292:    */     }
/* 293:    */   }
/* 294:    */   
/* 295:    */   public Vector listFiles(String directory, ChannelSftp sftp)
/* 296:    */     throws SftpException
/* 297:    */   {
/* 298:258 */     return sftp.ls(directory);
/* 299:    */   }
/* 300:    */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     com.bjrun.util.MySFTP
 * JD-Core Version:    0.7.0.1
 */