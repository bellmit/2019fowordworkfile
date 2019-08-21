package cn.com.img.dao;

import cn.com.img.entity.File;
import cn.com.img.entity.Folder;
import java.util.List;

public abstract interface ShowFileDAO
{
  public abstract List<Folder> getFolderList(int paramInt1, int paramInt2);
  
  public abstract List<File> getFileList(Folder paramFolder, int paramInt1, int paramInt2);
  
  public abstract Folder getFolder(String paramString);
}


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     cn.com.img.dao.ShowFileDAO
 * JD-Core Version:    0.7.0.1
 */