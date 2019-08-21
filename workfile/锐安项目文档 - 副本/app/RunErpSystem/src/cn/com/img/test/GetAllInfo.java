/*  1:   */ package cn.com.img.test;
/*  2:   */ 
/*  3:   */ import cn.com.img.entity.Folder;
/*  4:   */ import cn.com.img.entity.User;
/*  5:   */ import cn.com.img.tools.PublicTools;
/*  6:   */ import java.io.PrintStream;
/*  7:   */ import java.util.Date;
/*  8:   */ import java.util.Iterator;
/*  9:   */ import java.util.Vector;
/* 10:   */ 
/* 11:   */ public class GetAllInfo
/* 12:   */ {
/* 13:   */   public static int recursion(String root, String folderId, String folderName)
/* 14:   */   {
/* 15:15 */     int fileNumber = 0;
/* 16:16 */     java.io.File file = new java.io.File(root);
/* 17:17 */     java.io.File[] subFile = file.listFiles();
/* 18:19 */     for (int i = 0; i < subFile.length; i++) {
/* 19:21 */       if (subFile[i].isDirectory())
/* 20:   */       {
/* 21:22 */         Folder folder_temp = new Folder();
/* 22:   */         
/* 23:   */ 
/* 24:25 */         folder_temp.setFolderUrl(subFile[i].getAbsolutePath());
/* 25:   */         
/* 26:27 */         folder_temp.setFolderName(subFile[i].getName());
/* 27:   */         
/* 28:29 */         User user = new User();
/* 29:30 */         user.setUserId("11111111111111111111111111111");
/* 30:31 */         folder_temp.setUser(user);
/* 31:32 */         folder_temp.setFolderReleaseTime(PublicTools.myFormat(new Date()));
/* 32:   */         
/* 33:   */ 
/* 34:35 */         folderId = null;
/* 35:   */         
/* 36:37 */         fileNumber = recursion(subFile[i].getAbsolutePath(), folderId, folder_temp.getFolderName());
/* 37:38 */         System.out.println();
/* 38:39 */         System.out.println("********************************************************************************************************************");
/* 39:40 */         System.out.println("文件夹名：" + folder_temp.getFolderName());
/* 40:41 */         System.out.println("文件夹路径：" + folder_temp.getFolderUrl());
/* 41:42 */         System.out.println("发布者：" + folder_temp.getUser().getUserId());
/* 42:43 */         System.out.println("文件夹中的文件数量：" + fileNumber);
/* 43:44 */         System.out.println("发表时间：" + folder_temp.getFolderReleaseTime());
/* 44:45 */         System.out.println("********************************************************************************************************************");
/* 45:46 */         System.out.println();
/* 46:   */       }
/* 47:   */       else
/* 48:   */       {
/* 49:50 */         cn.com.img.entity.File file_temp = new cn.com.img.entity.File();
/* 50:   */         
/* 51:   */ 
/* 52:53 */         file_temp.setFileName(subFile[i].getName());
/* 53:   */         
/* 54:   */ 
/* 55:56 */         Date date = new Date(subFile[i].lastModified());
/* 56:   */         
/* 57:58 */         file_temp.setLastModified(PublicTools.myFormat(date));
/* 58:59 */         Folder folder = new Folder();
/* 59:60 */         folder.setFolderId(folderId);
/* 60:61 */         file_temp.setFolder(folder);
/* 61:   */         
/* 62:63 */         System.out.println();
/* 63:64 */         System.out.println("文件名：" + file_temp.getFileName());
/* 64:65 */         System.out.println("文件夹id：" + file_temp.getFolder().getFolderId());
/* 65:66 */         System.out.println("最后修改时间：" + file_temp.getLastModified());
/* 66:67 */         System.out.println("所属文件夹名：" + folderName);
/* 67:68 */         System.out.println();
/* 68:69 */         fileNumber++;
/* 69:   */       }
/* 70:   */     }
/* 71:72 */     System.out.println("********************************************************************************************************************");
/* 72:73 */     return fileNumber;
/* 73:   */   }
/* 74:   */   
/* 75:   */   public static void main(String[] args)
/* 76:   */   {
/* 77:77 */     Vector<String> vecFile = new Vector();
/* 78:78 */     recursion("H:/上网必备/content/tp", null, null);
/* 79:   */     String str;
/* 80:79 */     for (Iterator localIterator = vecFile.iterator(); localIterator.hasNext(); str = (String)localIterator.next()) {}
/* 81:   */   }
/* 82:   */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     cn.com.img.test.GetAllInfo
 * JD-Core Version:    0.7.0.1
 */