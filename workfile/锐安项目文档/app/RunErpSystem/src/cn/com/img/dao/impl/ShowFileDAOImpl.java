/*  1:   */ package cn.com.img.dao.impl;
/*  2:   */ 
/*  3:   */ import cn.com.img.dao.ShowFileDAO;
/*  4:   */ import cn.com.img.entity.File;
/*  5:   */ import cn.com.img.entity.Folder;
/*  6:   */ import java.io.PrintStream;
/*  7:   */ import java.util.List;
/*  8:   */ import org.hibernate.Query;
/*  9:   */ import org.hibernate.SessionFactory;
/* 10:   */ import org.hibernate.classic.Session;
/* 11:   */ import org.springframework.orm.hibernate3.HibernateTemplate;
/* 12:   */ import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
/* 13:   */ 
/* 14:   */ public class ShowFileDAOImpl
/* 15:   */   extends HibernateDaoSupport
/* 16:   */   implements ShowFileDAO
/* 17:   */ {
/* 18:   */   public List<Folder> getFolderList(int pageNumber, int pageCount)
/* 19:   */   {
/* 20:17 */     List<Folder> folders = null;
/* 21:   */     try
/* 22:   */     {
/* 23:19 */       Query query = getHibernateTemplate().getSessionFactory().openSession().createQuery("from Folder f where f.fileNumber>0");
/* 24:20 */       query.setFirstResult((pageNumber - 1) * pageCount);
/* 25:21 */       query.setMaxResults(pageNumber * pageCount);
/* 26:22 */       folders = query.list();
/* 27:23 */       System.out.println(folders.size());
/* 28:   */     }
/* 29:   */     catch (Exception e)
/* 30:   */     {
/* 31:25 */       e.printStackTrace();
/* 32:   */     }
/* 33:27 */     return folders;
/* 34:   */   }
/* 35:   */   
/* 36:   */   public List<File> getFileList(Folder folder, int pageNumber, int pageCount)
/* 37:   */   {
/* 38:32 */     Query query = null;
/* 39:   */     try
/* 40:   */     {
/* 41:35 */       query = getHibernateTemplate().getSessionFactory().openSession().createQuery("from File f where f.folder=:folder").setParameter("folder", folder);
/* 42:   */     }
/* 43:   */     catch (Exception e)
/* 44:   */     {
/* 45:37 */       System.out.println("这里！！");
/* 46:38 */       e.printStackTrace();
/* 47:   */     }
/* 48:42 */     query.setFirstResult((pageNumber - 1) * pageCount);
/* 49:43 */     query.setMaxResults(pageNumber * pageCount);
/* 50:   */     
/* 51:45 */     System.out.println(query.getQueryString());
/* 52:46 */     return query.list();
/* 53:   */   }
/* 54:   */   
/* 55:   */   public Folder getFolder(String folderId)
/* 56:   */   {
/* 57:50 */     return (Folder)getHibernateTemplate().find("from Folder f where f.folderId=?", new Object[] { folderId }).get(0);
/* 58:   */   }
/* 59:   */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     cn.com.img.dao.impl.ShowFileDAOImpl
 * JD-Core Version:    0.7.0.1
 */