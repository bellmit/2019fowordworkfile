package com.bjrun.hotelOrder.action;

import java.io.BufferedReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.bjrun.base.BaseAction;
import com.bjrun.hotelOrder.entity.HotelOrder;
import com.bjrun.hotelOrder.service.HotelOrderService;
/**
 * @Desc   酒店账单推送
 * @author Administrator
 * @Date   2019-05-25 13：00
 */
public class HotelOrderAction extends BaseAction{
  private static final long serialVersionUID = -877232888472178596L;
  private static Logger logger = Logger.getLogger(HotelOrderAction.class);
  private HotelOrderService hotelOrderService;
  private String result;

  public HotelOrderService getHotelOrderService(){
    return this.hotelOrderService;
  }

  public void setHotelOrderService(HotelOrderService hotelOrderService){
    this.hotelOrderService = hotelOrderService;
  }

  public String getResult(){
    return this.result;
  }

  public void setResult(String result){
    this.result = result;
  }
  /**
   * 酒店账单接收
   * @return
   * @throws Exception
   */
  public String hotelOrderList() throws Exception{
	  
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    logger.error("酒店数据接收开始执行，时间：" + formatter.format(new Date()));
    BufferedReader br = this.request.getReader();
    String wholeStr = "";
    String str;
    while ((str = br.readLine()) != null){
      wholeStr = wholeStr + str;
    }
    logger.error("数据：" + wholeStr);

    JSONObject wholeObj = JSONObject.fromObject(wholeStr);
    String orderId = wholeObj.getString("orderId");
    logger.error("酒店数据推送，订单：" + orderId + "推送时间：" + formatter.format(new Date()));
    HotelOrder hotelOrder1 = this.hotelOrderService.getHotelByOrderId(orderId);
    if (hotelOrder1 == null) {
      logger.error("酒店数据接收,start.........." + formatter.format(new Date()));
      HotelOrder hotelOrder = new HotelOrder();
      hotelOrder.setDataSource("中青旅");
      hotelOrder.setOrderId(orderId);

      if (wholeObj.containsKey("orderIdPlt")) {
        String orderIdPlt = wholeObj.getString("orderIdPlt");
        if ((orderIdPlt != null) && (orderIdPlt != "")) {
          hotelOrder.setOrderIdPlt(orderIdPlt);
        }
      }

      if (wholeObj.containsKey("settlementPrice")) {
        String settlementPriceStr = wholeObj.getString("settlementPrice");
        if ((settlementPriceStr != null) && (settlementPriceStr != "")) {
          Double settlementPrice = Double.valueOf(Double.parseDouble(settlementPriceStr));
          hotelOrder.setSettlementPrice(settlementPrice);
        }
      }

      if (wholeObj.containsKey("channel")) {
        String channel = wholeObj.getString("channel");
        if ((channel != null) && (channel != "")) {
          hotelOrder.setChannel(channel);
        }
      }

      if (wholeObj.containsKey("hotelId")) {
        String hotelId = wholeObj.getString("hotelId");
        if ((hotelId != null) && (hotelId != "")) {
          hotelOrder.setHotelId(hotelId);
        }
      }

      if (wholeObj.containsKey("hotelIdPlt")) {
        String hotelIdPlt = wholeObj.getString("hotelIdPlt");
        if ((hotelIdPlt != null) && (hotelIdPlt != "")) {
          hotelOrder.setHotelIdPlt(hotelIdPlt);
        }
      }

      if (wholeObj.containsKey("hotelName")) {
        String hotelName = wholeObj.getString("hotelName");
        if ((hotelName != null) && (hotelName != "")) {
          hotelOrder.setHotelName(hotelName);
        }
      }

      if (wholeObj.containsKey("geoId")) {
        String geoId = wholeObj.getString("geoId");
        if ((geoId != null) && (geoId != "")) {
          hotelOrder.setGeoId(geoId);
        }
      }

      if (wholeObj.containsKey("geoName")) {
        String geoName = wholeObj.getString("geoName");
        if ((geoName != null) && (geoName != "")) {
          hotelOrder.setGeoName(geoName);
        }
      }

      if (wholeObj.containsKey("roomId")) {
        String roomId = wholeObj.getString("roomId");
        if ((roomId != null) && (roomId != "")) {
          hotelOrder.setRoomId(roomId);
        }
      }

      if (wholeObj.containsKey("roomName")) {
        String roomName = wholeObj.getString("roomName");
        if ((roomName != null) && (roomName != "")) {
          hotelOrder.setRoomName(roomName);
        }
      }

      if (wholeObj.containsKey("arrivalDate")) {
        String arrivalDate = wholeObj.getString("arrivalDate");
        if ((arrivalDate != null) && (arrivalDate != "")) {
          hotelOrder.setArrivalDate(arrivalDate);
        }
      }

      if (wholeObj.containsKey("departureDate")) {
        String departureDate = wholeObj.getString("departureDate");
        if ((departureDate != null) && (departureDate != "")) {
          hotelOrder.setDepartureDate(departureDate);
        }
      }

      if (wholeObj.containsKey("roomCount")) {
        String roomCountStr = wholeObj.getString("roomCount");
        if ((roomCountStr != null) && (roomCountStr != "")) {
          Integer roomCount = Integer.valueOf(Integer.parseInt(roomCountStr));
          hotelOrder.setRoomCount(roomCount);
        }
      }

      if (wholeObj.containsKey("totalCount")) {
        String totalCountStr = wholeObj.getString("totalCount");
        if ((totalCountStr != null) && (totalCountStr != "")) {
          Integer totalCount = Integer.valueOf(Integer.parseInt(totalCountStr));
          hotelOrder.setTotalCount(totalCount);
        }
      }

      if (wholeObj.containsKey("names")) {
        String names = wholeObj.getString("names");
        if ((names != null) && (names != "")) {
          hotelOrder.setNames(names);
        }
      }

      if (wholeObj.containsKey("earliestArrival")) {
        String earliestArrival = wholeObj.getString("earliestArrival");
        if ((earliestArrival != null) && (earliestArrival != "")) {
          hotelOrder.setEarliestArrival(earliestArrival);
        }
      }

      if (wholeObj.containsKey("latestArrival")) {
        String latestArrival = wholeObj.getString("latestArrival");
        if ((latestArrival != null) && (latestArrival != "")) {
          hotelOrder.setLatestArrival(latestArrival);
        }
      }

      if (wholeObj.containsKey("currencyCode")) {
        String currencyCode = wholeObj.getString("currencyCode");
        if ((currencyCode != null) && (currencyCode != "")) {
          hotelOrder.setCurrencyCode(currencyCode);
        }
      }

      if (wholeObj.containsKey("totalPay")) {
        String totalPayStr = wholeObj.getString("totalPay");
        if ((totalPayStr != null) && (totalPayStr != "")) {
          Double totalPay = Double.valueOf(Double.parseDouble(totalPayStr));
          hotelOrder.setTotalPay(totalPay);
        }
      }

      if (wholeObj.containsKey("totalCost")) {
        String totalCostStr = wholeObj.getString("totalCost");
        if ((totalCostStr != null) && (totalCostStr != "")) {
          Double totalCost = Double.valueOf(Double.parseDouble(totalCostStr));
          hotelOrder.setTotalCost(totalCost);
        }
      }

      if (wholeObj.containsKey("customerType")) {
        String customerType = wholeObj.getString("customerType");
        if ((customerType != null) && (customerType != "")) {
          hotelOrder.setCustomerType(customerType);
        }
      }

      if (wholeObj.containsKey("overPrice")) {
        String overPriceStr = wholeObj.getString("overPrice");
        if ((overPriceStr != null) && (overPriceStr != "")) {
          Double overPrice = Double.valueOf(Double.parseDouble(overPriceStr));
          hotelOrder.setOverPrice(overPrice);
        }
      }

      if (wholeObj.containsKey("approvedType")) {
        String approvedTypeStr = wholeObj.getString("approvedType");
        if ((approvedTypeStr != null) && (approvedTypeStr != "")) {
          Integer approvedType = Integer.valueOf(Integer.parseInt(approvedTypeStr));
          hotelOrder.setApprovedType(approvedType);
        }
      }

      if (wholeObj.containsKey("approvedStatus")) {
        String approvedStatusStr = wholeObj.getString("approvedStatus");
        if ((approvedStatusStr != null) && (approvedStatusStr != "")) {
          Integer approvedStatus = Integer.valueOf(Integer.parseInt(approvedStatusStr));
          hotelOrder.setApprovedStatus(approvedStatus);
        }
      }

      if (wholeObj.containsKey("approvedDeptName")) {
        String approvedDeptName = wholeObj.getString("approvedDeptName");
        if ((approvedDeptName != null) && (approvedDeptName != "")) {
          hotelOrder.setApprovedDeptName(approvedDeptName);
        }
      }

      if (wholeObj.containsKey("customerId")) {
        String customerId = wholeObj.getString("customerId");
        if ((customerId != null) && (customerId != "")) {
          hotelOrder.setCustomerId(customerId);
        }
      }

      if (wholeObj.containsKey("serverId")) {
        String serverId = wholeObj.getString("serverId");
        if ((serverId != null) && (serverId != "")) {
          hotelOrder.setServerId(serverId);
        }
      }

      if (wholeObj.containsKey("status")) {
        String status = wholeObj.getString("status");
        if ((status != null) && (status != "")) {
          hotelOrder.setStatus(status);
        }
      }

      if (wholeObj.containsKey("payStatus")) {
        String payStatus = wholeObj.getString("payStatus");
        if ((payStatus != null) && (payStatus != "")) {
          hotelOrder.setPayStatus(payStatus);
        }
      }

      if (wholeObj.containsKey("orderSource")) {
        String orderSource = wholeObj.getString("orderSource");
        if ((orderSource != null) && (orderSource != "")) {
          hotelOrder.setOrderSource(orderSource);
        }
      }

      if (wholeObj.containsKey("cancelTime")) {
        String cancelTime = wholeObj.getString("cancelTime");
        if ((cancelTime != null) && (cancelTime != "")) {
          hotelOrder.setCancelTime(cancelTime);
        }
      }

      if (wholeObj.containsKey("createBy")) {
        String createBy = wholeObj.getString("createBy");
        if ((createBy != null) && (createBy != "")) {
          hotelOrder.setCreateBy(createBy);
        }
      }

      if (wholeObj.containsKey("contacter")) {
        String contacter = wholeObj.getString("contacter");
        if ((contacter != null) && (contacter != "")) {
          hotelOrder.setContacter(contacter);
        }
      }

      if (wholeObj.containsKey("balanceType")) {
        String balanceType = wholeObj.getString("balanceType");
        if ((balanceType != null) && (balanceType != "")) {
          hotelOrder.setBalanceType(balanceType);
        }
      }

      hotelOrder.setCreateTime(new Date());
      hotelOrder.setCreateTime(new Date());

      if (wholeObj.containsKey("customers")) {
        JSONArray customersArray = wholeObj.getJSONArray("customers");
        if ((customersArray != null) && (customersArray.size() > 0)) {
          JSONObject customersObj = customersArray.getJSONObject(0);
          if ((customersObj != null) && 
            (customersObj.containsKey("accountNo"))) {
            String userId = customersObj.getString("accountNo");
            if ((userId != null) && (userId != "")) {
              hotelOrder.setUserId(userId);
            }
          }
        }
      }

      this.hotelOrderService.saveOrUpdate(hotelOrder);
      logger.error("酒店数据接收,end.........." + formatter.format(new Date()));
    }else {
      logger.error("订单:" + orderId + "已存在！end..." + formatter.format(new Date()));
    }
    JSONObject json = new JSONObject();
    this.result = json.toString();
    return "success";
  }
  
  /**
   * 附件创建
   */
  public void handelCreateFile(){
    String cDateStart = this.request.getParameter("cDateStart");
    String cDateEnd = this.request.getParameter("cDateEnd");
    HashMap map = new HashMap();
    if ((cDateStart != null) && (cDateStart != "")) {
      map.put("cDateStart", cDateStart);
    }
    if ((cDateEnd != null) && (cDateEnd != "")) {
      map.put("cDateEnd", cDateEnd);
    }
    this.hotelOrderService.createFile(map);
  }
}