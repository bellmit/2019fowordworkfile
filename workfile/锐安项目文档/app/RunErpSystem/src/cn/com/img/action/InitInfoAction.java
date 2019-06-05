/*   1:    */ package cn.com.img.action;
/*   2:    */ 
/*   3:    */ import cn.com.img.entity.Folder;
/*   4:    */ import cn.com.img.entity.User;
/*   5:    */ import cn.com.img.service.FileService;
/*   6:    */ import cn.com.img.tools.PublicTools;
/*   7:    */ import java.io.PrintStream;
/*   8:    */ import java.util.Date;
/*   9:    */ 
/*  10:    */ public class InitInfoAction
/*  11:    */ {
/*  12:    */   private FileService fileService;
/*  13:    */   
/*  14:    */   public FileService getFileService()
/*  15:    */   {
/*  16: 25 */     return this.fileService;
/*  17:    */   }
/*  18:    */   
/*  19:    */   public void setFileService(FileService fileService)
/*  20:    */   {
/*  21: 29 */     this.fileService = fileService;
/*  22:    */   }
/*  23:    */   
/*  24:    */   public String aa()
/*  25:    */   {
/*  26: 33 */     System.out.println("*********");
/*  27: 34 */     return "true";
/*  28:    */   }
/*  29:    */   
/*  30:    */   public int recursion(String root, String folderId, String folderName)
/*  31:    */   {
/*  32: 39 */     int fileNumber = 0;
/*  33: 40 */     int fileNumber_temp = 0;
/*  34: 41 */     java.io.File file = new java.io.File(root);
/*  35: 42 */     java.io.File[] subFile = file.listFiles();
/*  36: 44 */     for (int i = 0; i < subFile.length; i++) {
/*  37: 46 */       if (subFile[i].isDirectory())
/*  38:    */       {
/*  39: 47 */         Folder folder_temp = new Folder();
/*  40:    */         
/*  41:    */ 
/*  42:    */ 
/*  43:    */ 
/*  44:    */ 
/*  45:    */ 
/*  46:    */ 
/*  47:    */ 
/*  48:    */ 
/*  49:    */ 
/*  50: 58 */         folder_temp.setFolderUrl(subFile[i].getAbsolutePath());
/*  51:    */         
/*  52: 60 */         folder_temp.setFolderName(subFile[i].getName());
/*  53:    */         
/*  54: 62 */         User user = new User();
/*  55: 63 */         user.setUserId("11111111111111111111111111111");
/*  56: 64 */         folder_temp.setUser(user);
/*  57: 65 */         folder_temp.setFolderReleaseTime(PublicTools.myFormat(new Date()));
/*  58:    */         
/*  59:    */ 
/*  60: 68 */         folderId = this.fileService.saveFolder(folder_temp);
/*  61:    */         
/*  62: 70 */         fileNumber_temp = recursion(subFile[i].getAbsolutePath(), folderId, folder_temp.getFolderName());
/*  63:    */         
/*  64: 72 */         folder_temp.setFileNumber(fileNumber_temp);
/*  65:    */         
/*  66: 74 */         this.fileService.addFileNumber(folder_temp);
/*  67:    */       }
/*  68:    */       else
/*  69:    */       {
/*  70: 89 */         cn.com.img.entity.File file_temp = new cn.com.img.entity.File();
/*  71:    */         
/*  72:    */ 
/*  73: 92 */         file_temp.setFileName(subFile[i].getName());
/*  74:    */         
/*  75:    */ 
/*  76: 95 */         Date date = new Date(subFile[i].lastModified());
/*  77:    */         
/*  78: 97 */         file_temp.setLastModified(PublicTools.myFormat(date));
/*  79: 98 */         Folder folder = new Folder();
/*  80: 99 */         folder.setFolderId(folderId);
/*  81:100 */         file_temp.setFolder(folder);
/*  82:102 */         if (PublicTools.isImg(file_temp))
/*  83:    */         {
/*  84:103 */           this.fileService.saveFile(file_temp);
/*  85:104 */           fileNumber++;
/*  86:    */         }
/*  87:    */       }
/*  88:    */     }
/*  89:116 */     System.out.println("********************************************************************************************************************");
/*  90:117 */     return fileNumber;
/*  91:    */   }
/*  92:    */   
/*  93:    */   public String initInfo()
/*  94:    */   {
/*  95:167 */     recursion("F:/self", null, null);
/*  96:168 */     recursion("H:/上网必备/content/tp", null, null);
/*  97:169 */     return "true";
/*  98:    */   }
/*  99:    */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     cn.com.img.action.InitInfoAction
 * JD-Core Version:    0.7.0.1
 */