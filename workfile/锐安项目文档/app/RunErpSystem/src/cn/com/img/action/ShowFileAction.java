/*  1:   */ package cn.com.img.action;
/*  2:   */ 
/*  3:   */ import cn.com.img.entity.File;
/*  4:   */ import cn.com.img.entity.Folder;
/*  5:   */ import cn.com.img.service.ShowFileService;
/*  6:   */ import java.io.PrintStream;
/*  7:   */ import java.util.List;
/*  8:   */ 
/*  9:   */ public class ShowFileAction
/* 10:   */ {
/* 11:   */   private ShowFileService showFileService;
/* 12:   */   private List<Folder> folders;
/* 13:   */   private List<File> files;
/* 14:   */   private Folder folder;
/* 15:   */   private String folderId;
/* 16:   */   
/* 17:   */   public ShowFileService getShowFileService()
/* 18:   */   {
/* 19:20 */     return this.showFileService;
/* 20:   */   }
/* 21:   */   
/* 22:   */   public void setShowFileService(ShowFileService showFileService)
/* 23:   */   {
/* 24:24 */     this.showFileService = showFileService;
/* 25:   */   }
/* 26:   */   
/* 27:   */   public List<Folder> getFolders()
/* 28:   */   {
/* 29:28 */     return this.folders;
/* 30:   */   }
/* 31:   */   
/* 32:   */   public void setFolders(List<Folder> folders)
/* 33:   */   {
/* 34:32 */     this.folders = folders;
/* 35:   */   }
/* 36:   */   
/* 37:   */   public List<File> getFiles()
/* 38:   */   {
/* 39:36 */     return this.files;
/* 40:   */   }
/* 41:   */   
/* 42:   */   public void setFiles(List<File> files)
/* 43:   */   {
/* 44:40 */     this.files = files;
/* 45:   */   }
/* 46:   */   
/* 47:   */   public Folder getFolder()
/* 48:   */   {
/* 49:44 */     return this.folder;
/* 50:   */   }
/* 51:   */   
/* 52:   */   public void setFolder(Folder folder)
/* 53:   */   {
/* 54:48 */     this.folder = folder;
/* 55:   */   }
/* 56:   */   
/* 57:   */   public String getFolderId()
/* 58:   */   {
/* 59:52 */     return this.folderId;
/* 60:   */   }
/* 61:   */   
/* 62:   */   public void setFolderId(String folderId)
/* 63:   */   {
/* 64:56 */     this.folderId = folderId;
/* 65:   */   }
/* 66:   */   
/* 67:   */   public String getFolderList()
/* 68:   */   {
/* 69:64 */     this.folders = this.showFileService.getFolderList(1, 30);
/* 70:65 */     return "true";
/* 71:   */   }
/* 72:   */   
/* 73:   */   public String getFileList()
/* 74:   */   {
/* 75:74 */     System.out.println(this.folderId);
/* 76:75 */     this.folder = this.showFileService.getFolder(this.folderId);
/* 77:76 */     this.files = this.showFileService.getFileList(this.folder, 1, 20);
/* 78:   */     
/* 79:78 */     return "true";
/* 80:   */   }
/* 81:   */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     cn.com.img.action.ShowFileAction
 * JD-Core Version:    0.7.0.1
 */