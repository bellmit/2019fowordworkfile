package com.fr.data;

import com.fr.general.data.TableDataException;
import com.fr.jinxin.IDataSynchronizedWsdl;
import com.fr.jinxin.IntlDataSynchronizedService;
import com.fr.stable.ParameterProvider;
import com.fr.stable.StringUtils;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class JXUserData
  extends AbstractTableData
{
  private ArrayList<Map<String, String>> values = null;
  private String[] colsName = null;
  
  public JXUserData()
  {
    this.colsName = new String[] { "USER_NAME", "USER_REAL_NAME", "USER_STATE", "USER_ADDR", "USER_TEL", "USER_PASS" };
  }
  
  public void init()
  {
    if (this.values != null) {
      return;
    }
    String wUrl = this.parameters[0].getValue().toString();
    String appName = this.parameters[1].getValue().toString();
    String startDate = this.parameters[2].getValue().toString();
    String endDate = this.parameters[3].getValue().toString();
    
    Document doc = null;
    try
    {
      doc = DocumentHelper.parseText(getData(wUrl, appName, startDate, endDate));
      Element rootElt = doc.getRootElement();
      Element body = rootElt.element("body");
      Iterator iter = body.elementIterator("items");
      this.values = new ArrayList();
      while (iter.hasNext())
      {
        Element element = (Element)iter.next();
        Map<String, String> vauleMap = new HashMap();
        Iterator itFieldinfo = element.elementIterator("fieldinfo");
        while (itFieldinfo.hasNext())
        {
          Element fieldinfo = (Element)itFieldinfo.next();
          vauleMap.put(fieldinfo.element("fieldname").getStringValue(), fieldinfo.element("fieldvale").getStringValue());
        }
        vauleMap.put("USER_PASS", "123456");
        this.values.add(vauleMap);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }
  
  public static String fileRead()
    throws Exception
  {
    File file = new File("UserData.xml");
    FileReader reader = new FileReader(file);
    BufferedReader bReader = new BufferedReader(reader);
    StringBuilder sb = new StringBuilder();
    String s = "";
    while ((s = bReader.readLine()) != null) {
      sb.append(s + "\n");
    }
    bReader.close();
    return sb.toString();
  }
  
  public String getData(String url, String appName, String start, String end)
    throws IOException
  {
    String result = "";
    IntlDataSynchronizedService factory = null;
    if (StringUtils.isBlank(url)) {
      factory = new IntlDataSynchronizedService();
    } else {
      factory = new IntlDataSynchronizedService(new URL(url));
    }
    IDataSynchronizedWsdl Idata = factory.getDataSynchronizedWsdlImplPort();
    result = Idata.getUserBatchDataByAppName(appName, start, end);
    return result;
  }
  
  public int getColumnCount()
    throws TableDataException
  {
    init();
    return this.colsName.length;
  }
  
  public String getColumnName(int col)
    throws TableDataException
  {
    init();
    return this.colsName[col];
  }
  
  public int getRowCount()
    throws TableDataException
  {
    init();
    return this.values.size();
  }
  
  public Object getValueAt(int row, int col)
  {
    try
    {
      return ((Map)this.values.get(row)).get(getColumnName(col));
    }
    catch (TableDataException e)
    {
      e.printStackTrace();
    }
    return null;
  }
}
