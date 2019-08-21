/*  1:   */ package cn.com.img.dao.impl;
/*  2:   */ 
/*  3:   */ import cn.com.img.dao.FileDAO;
/*  4:   */ import cn.com.img.entity.File;
/*  5:   */ import cn.com.img.entity.Folder;
/*  6:   */ import cn.com.img.entity.User;
/*  7:   */ import java.io.PrintStream;
/*  8:   */ import java.util.List;
/*  9:   */ import org.springframework.orm.hibernate3.HibernateTemplate;
/* 10:   */ import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
/* 11:   */ 
/* 12:   */ public class FileDAOImpl
/* 13:   */   extends HibernateDaoSupport
/* 14:   */   implements FileDAO
/* 15:   */ {
/* 16:13 */   private static int count = 0;
/* 17:   */   
/* 18:   */   public void initImgInfo() {}
/* 19:   */   
/* 20:   */   public void upLoadImg() {}
/* 21:   */   
/* 22:   */   public List<File> getImgFile(Folder folder)
/* 23:   */   {
/* 24:27 */     List<File> filelist = getHibernateTemplate().find("from File as f where f.folderId=?", new Object[] { folder.getFolderId() });
/* 25:28 */     return filelist;
/* 26:   */   }
/* 27:   */   
/* 28:   */   public String saveFolder(Folder folder)
/* 29:   */   {
/* 30:34 */     System.out.println();
/* 31:35 */     System.out.println("********************************************************************************************************************");
/* 32:36 */     System.out.println("文件夹名：" + folder.getFolderName());
/* 33:37 */     System.out.println("文件夹路径：" + folder.getFolderUrl());
/* 34:38 */     System.out.println("发布者：" + folder.getUser().getUserId());
/* 35:39 */     System.out.println("发表时间：" + folder.getFolderReleaseTime());
/* 36:40 */     System.out.println("********************************************************************************************************************");
/* 37:41 */     System.out.println();
/* 38:42 */     Folder _folder = null;
/* 39:   */     try
/* 40:   */     {
/* 41:44 */       getHibernateTemplate().save(folder);
/* 42:   */       
/* 43:46 */       _folder = (Folder)getHibernateTemplate().find("from Folder f where f.folderUrl=?", new Object[] { folder.getFolderUrl() }).get(0);
/* 44:   */     }
/* 45:   */     catch (Exception e)
/* 46:   */     {
/* 47:49 */       e.printStackTrace();
/* 48:   */     }
/* 49:51 */     return _folder.getFolderId();
/* 50:   */   }
/* 51:   */   
/* 52:   */   public void saveFile(File file)
/* 53:   */   {
/* 54:   */     try
/* 55:   */     {
/* 56:57 */       System.out.println();
/* 57:58 */       System.out.println("文件名：" + file.getFileName());
/* 58:59 */       System.out.println("文件夹id：" + file.getFolder().getFolderId());
/* 59:60 */       System.out.println("最后修改时间：" + file.getLastModified());
/* 60:61 */       System.out.println();
/* 61:   */       
/* 62:63 */       getHibernateTemplate().save(file);
/* 63:   */       
/* 64:65 */       System.out.println("*******************************************" + count++ + "*****************************************");
/* 65:   */     }
/* 66:   */     catch (Exception e)
/* 67:   */     {
/* 68:67 */       e.printStackTrace();
/* 69:   */     }
/* 70:   */   }
/* 71:   */   
/* 72:   */   public void addFileNumber(Folder folder)
/* 73:   */   {
/* 74:75 */     getHibernateTemplate().update(folder);
/* 75:   */   }
/* 76:   */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     cn.com.img.dao.impl.FileDAOImpl
 * JD-Core Version:    0.7.0.1
 */