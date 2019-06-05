package com.bjrun.hotelOrder.service.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bjrun.hotelOrder.dao.HotelOrderDao;
import com.bjrun.hotelOrder.entity.HotelOrder;
import com.bjrun.hotelOrder.service.HotelOrderService;
import com.bjrun.util.ConfigUtil;
import com.bjrun.util.MySFTP;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.SftpException;

public class HotelOrderServiceImpl
  implements HotelOrderService
{
  private static Logger logger = Logger.getLogger(HotelOrderServiceImpl.class);
  private HotelOrderDao hotelOrderDao;

  public HotelOrderDao getHotelOrderDao()
  {
    return this.hotelOrderDao;
  }

  public void setHotelOrderDao(HotelOrderDao hotelOrderDao) {
    this.hotelOrderDao = hotelOrderDao;
  }

  public void saveOrUpdate(HotelOrder hotelOrder)
  {
    this.hotelOrderDao.saveOrUpdate(hotelOrder);
  }

  public void saveOrUpdateAll(List<HotelOrder> hotelOrderList) {
    this.hotelOrderDao.saveOrUpdateAll(hotelOrderList);
  }

  public void createFile(HashMap<String, String> map)
  {
    logger.error("酒店报销数据同步至光闸:生成文件！");
    Map configMap = ConfigUtil.resolveProperties();
    Date nowDate = new Date();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(nowDate);
    calendar.add(5, -5);
    Date date = calendar.getTime();

    if (!map.containsKey("cDateStart")) {
      map.put("cDateStart", format.format(date));
    }
    List<HotelOrder> list = this.hotelOrderDao.getHotelOrderList(map);
    boolean moveFlag = false;
    String local_hotel_path = (String)configMap.get("local_hotelOd_path");
    String filePath = local_hotel_path + "hotel.txt";
    FileWriter fw = null;
    BufferedWriter writer = null;
    try {
      fw = new FileWriter(filePath);
      writer = new BufferedWriter(fw);
      if ((list != null) && (list.size() > 0)) {
        logger.error("酒店报销数据同步至光闸数量：" + list.size());
        StringBuffer data = new StringBuffer("");
        for (HotelOrder hOrder : list) {
          String hotelName = hOrder.getHotelName() == null ? "" : hOrder.getHotelName();
          String arrivalDate = hOrder.getArrivalDate() == null ? "" : hOrder.getArrivalDate();
          String departureDate = hOrder.getDepartureDate() == null ? "" : hOrder.getDepartureDate();
          String dataSource = hOrder.getDataSource() == null ? "" : hOrder.getDataSource();
          String settlementPrice = hOrder.getSettlementPrice() == null ? "" : hOrder.getSettlementPrice().toString();
          String userId = hOrder.getUserId() == null ? "" : hOrder.getUserId();

          data.append(userId).append("&").append(departureDate).append("&").append(hotelName).append("&").append(arrivalDate).append("&")
            .append(settlementPrice).append("&").append(dataSource).append("&").append("\t\n").toString();
        }
        if ((data != null) && (data.length() > 0)) {
          writer.write(data.toString());
          moveFlag = true;
        }
      }
      if (fw != null)
        fw.flush();
      if (writer != null)
        writer.flush();
      if (writer != null)
        writer.close();
      if (fw != null)
        fw.close();
      if (moveFlag)
        moveFileToGZ(filePath);
    }
    catch (Exception e) {
      logger.error("酒店报销数据文件" + filePath + "流对象关闭失败。", e);
      e.printStackTrace();
    }
    logger.error("酒店报销数据:生成文件！结束");
  }

  public void createAllFile()
  {
    logger.error("酒店报销数据:生成文件！开始");
    Map map = new HashMap();
    Map configMap = ConfigUtil.resolveProperties();
    Date nowDate = new Date();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(nowDate);
    calendar.add(5, -5);
    Date date = calendar.getTime();

    map.put("cDateStart", format.format(date));
    map.put("cDateEnd", format.format(nowDate));
    List<HotelOrder> list = this.hotelOrderDao.getHotelOrderList(map);
    boolean moveFlag = false;
    String local_hotel_path = (String)configMap.get("local_hotelOd_path");
    String filePath = local_hotel_path + "hotel.txt";
    FileWriter fw = null;
    BufferedWriter writer = null;
    try {
      fw = new FileWriter(filePath);
      writer = new BufferedWriter(fw);
      if ((list != null) && (list.size() > 0)) {
        logger.error("酒店报销数据同步至光闸数量：" + list.size());
        StringBuffer data = new StringBuffer("");
        for (HotelOrder hOrder : list) {
          String hotelName = hOrder.getHotelName() == null ? "" : hOrder.getHotelName();
          String arrivalDate = hOrder.getArrivalDate() == null ? "" : hOrder.getArrivalDate();
          String departureDate = hOrder.getDepartureDate() == null ? "" : hOrder.getDepartureDate();
          String dataSource = hOrder.getDataSource() == null ? "" : hOrder.getDataSource();
          String settlementPrice = hOrder.getSettlementPrice() == null ? "" : hOrder.getSettlementPrice().toString();
          String userId = hOrder.getUserId() == null ? "" : hOrder.getUserId();

          data.append(userId).append("&").append(departureDate).append("&").append(hotelName).append("&").append(arrivalDate).append("&")
            .append(settlementPrice).append("&").append(dataSource).append("&").append("\t\n").toString();
        }
        if ((data != null) && (data.length() > 0)) {
          writer.write(data.toString());
          moveFlag = true;
        }
      }
      if (fw != null)
        fw.flush();
      if (writer != null)
        writer.flush();
      if (writer != null)
        writer.close();
      if (fw != null)
        fw.close();
      if (moveFlag) {
        logger.error("酒店报销数据同步至光闸，开始。。。。。。。");
        moveFileToGZ(filePath);
        logger.error("酒店报销数据同步至光闸，结束。。。。。。。");
      }
    } catch (Exception e) {
      logger.error("打卡文件" + filePath + "流对象关闭失败。", e);
      e.printStackTrace();
    }
    logger.error("酒店报销数据:生成文件！结束");
  }

  private void moveFileToGZ(String filePath)
  {
    Map configMap = ConfigUtil.resolveProperties();
    String host = (String)configMap.get("gz_hostIP");
    int port = 22;
    String username = (String)configMap.get("gz_hostUname");
    String password = (String)configMap.get("gz_hostPwd");
    String gz_hotelOd_path = (String)configMap.get("gz_hotelOd_path");
    MySFTP sf = new MySFTP();
    File signFile = new File(filePath);
    ChannelSftp sftp = sf.getConnect(host, port, username, password);

    if (signFile.exists()) {
      try {
        FileInputStream fis = null;
        sftp.cd(gz_hotelOd_path);
        fis = new FileInputStream(signFile);
        sftp.put(fis, signFile.getName());
        if (fis != null)
          fis.close();
      }
      catch (IOException e) {
        e.printStackTrace();
        logger.error("Sftp连接失败(" + filePath + ")。", e);
      }
      catch (SftpException e) {
        e.printStackTrace();
        logger.error("Sftp连接失败(" + filePath + ")。", e);
      }
      sftp.quit();
      sf.closeConn();
    }
  }

  public HotelOrder getHotelByOrderId(String orderId)
  {
    return this.hotelOrderDao.getHotelByOrderId(orderId);
  }

  public Integer getHotelMaxId() {
    return this.hotelOrderDao.getHotelMaxId();
  }
}