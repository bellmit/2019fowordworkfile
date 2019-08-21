package com.bjrun.hotelOrder.entity;

import java.util.Date;

public class HotelOrder
{
  private Integer id;
  private String orderId;
  private String orderIdPlt;
  private String channel;
  private String hotelId;
  private String hotelIdPlt;
  private String hotelName;
  private String geoId;
  private String geoName;
  private String roomId;
  private String roomName;
  private String arrivalDate;
  private String departureDate;
  private Integer roomCount;
  private Integer totalCount;
  private String names;
  private String earliestArrival;
  private String latestArrival;
  private String currencyCode;
  private Double totalPay;
  private Double totalCost;
  private Double selfPay;
  private String customerType;
  private Integer isGuarantee;
  private Double guaranteePrice;
  private Double overPrice;
  private String overReason;
  private Integer isApproved;
  private Integer approvedType;
  private Integer approvedStatus;
  private String approvedDeptId;
  private String approvedDeptName;
  private String noteToApproveder;
  private String customerId;
  private String note;
  private String serverId;
  private String status;
  private String statusPlt;
  private String payType;
  private String payTime;
  private String payStatus;
  private String remark;
  private String orderSource;
  private Integer isDomc;
  private Integer isConfirm;
  private String cancelTime;
  private String createBy;
  private Date createTime;
  private Date lastOptime;
  private String confirmPoint;
  private String travelNo;
  private String contacter;
  private Integer isMalice;
  private String parentOrderId;
  private String parentOrderIdPlt;
  private String balanceType;
  private Double settlementPrice;
  private String voucherId;
  private String userId;
  private String dataSource;

  public Integer getId()
  {
    return this.id;
  }
  public void setId(Integer id) {
    this.id = id;
  }
  public String getOrderId() {
    return this.orderId;
  }
  public void setOrderId(String orderId) {
    this.orderId = orderId;
  }
  public String getOrderIdPlt() {
    return this.orderIdPlt;
  }
  public void setOrderIdPlt(String orderIdPlt) {
    this.orderIdPlt = orderIdPlt;
  }
  public String getChannel() {
    return this.channel;
  }
  public void setChannel(String channel) {
    this.channel = channel;
  }
  public String getHotelId() {
    return this.hotelId;
  }
  public void setHotelId(String hotelId) {
    this.hotelId = hotelId;
  }
  public String getHotelIdPlt() {
    return this.hotelIdPlt;
  }
  public void setHotelIdPlt(String hotelIdPlt) {
    this.hotelIdPlt = hotelIdPlt;
  }
  public String getHotelName() {
    return this.hotelName;
  }
  public void setHotelName(String hotelName) {
    this.hotelName = hotelName;
  }
  public String getGeoId() {
    return this.geoId;
  }
  public void setGeoId(String geoId) {
    this.geoId = geoId;
  }
  public String getGeoName() {
    return this.geoName;
  }
  public void setGeoName(String geoName) {
    this.geoName = geoName;
  }
  public String getRoomId() {
    return this.roomId;
  }
  public void setRoomId(String roomId) {
    this.roomId = roomId;
  }
  public String getRoomName() {
    return this.roomName;
  }
  public void setRoomName(String roomName) {
    this.roomName = roomName;
  }
  public String getArrivalDate() {
    return this.arrivalDate;
  }
  public void setArrivalDate(String arrivalDate) {
    this.arrivalDate = arrivalDate;
  }
  public String getDepartureDate() {
    return this.departureDate;
  }
  public void setDepartureDate(String departureDate) {
    this.departureDate = departureDate;
  }
  public Integer getRoomCount() {
    return this.roomCount;
  }
  public void setRoomCount(Integer roomCount) {
    this.roomCount = roomCount;
  }
  public Integer getTotalCount() {
    return this.totalCount;
  }
  public void setTotalCount(Integer totalCount) {
    this.totalCount = totalCount;
  }
  public String getNames() {
    return this.names;
  }
  public void setNames(String names) {
    this.names = names;
  }
  public String getEarliestArrival() {
    return this.earliestArrival;
  }
  public void setEarliestArrival(String earliestArrival) {
    this.earliestArrival = earliestArrival;
  }
  public String getLatestArrival() {
    return this.latestArrival;
  }
  public void setLatestArrival(String latestArrival) {
    this.latestArrival = latestArrival;
  }
  public String getCurrencyCode() {
    return this.currencyCode;
  }
  public void setCurrencyCode(String currencyCode) {
    this.currencyCode = currencyCode;
  }
  public Double getTotalPay() {
    return this.totalPay;
  }
  public void setTotalPay(Double totalPay) {
    this.totalPay = totalPay;
  }
  public Double getTotalCost() {
    return this.totalCost;
  }
  public void setTotalCost(Double totalCost) {
    this.totalCost = totalCost;
  }
  public Double getSelfPay() {
    return this.selfPay;
  }
  public void setSelfPay(Double selfPay) {
    this.selfPay = selfPay;
  }
  public String getCustomerType() {
    return this.customerType;
  }
  public void setCustomerType(String customerType) {
    this.customerType = customerType;
  }
  public Integer getIsGuarantee() {
    return this.isGuarantee;
  }
  public void setIsGuarantee(Integer isGuarantee) {
    this.isGuarantee = isGuarantee;
  }
  public Double getGuaranteePrice() {
    return this.guaranteePrice;
  }
  public void setGuaranteePrice(Double guaranteePrice) {
    this.guaranteePrice = guaranteePrice;
  }
  public Double getOverPrice() {
    return this.overPrice;
  }
  public void setOverPrice(Double overPrice) {
    this.overPrice = overPrice;
  }
  public String getOverReason() {
    return this.overReason;
  }
  public void setOverReason(String overReason) {
    this.overReason = overReason;
  }
  public Integer getIsApproved() {
    return this.isApproved;
  }
  public void setIsApproved(Integer isApproved) {
    this.isApproved = isApproved;
  }
  public Integer getApprovedType() {
    return this.approvedType;
  }
  public void setApprovedType(Integer approvedType) {
    this.approvedType = approvedType;
  }
  public Integer getApprovedStatus() {
    return this.approvedStatus;
  }
  public void setApprovedStatus(Integer approvedStatus) {
    this.approvedStatus = approvedStatus;
  }
  public String getApprovedDeptId() {
    return this.approvedDeptId;
  }
  public void setApprovedDeptId(String approvedDeptId) {
    this.approvedDeptId = approvedDeptId;
  }
  public String getApprovedDeptName() {
    return this.approvedDeptName;
  }
  public void setApprovedDeptName(String approvedDeptName) {
    this.approvedDeptName = approvedDeptName;
  }
  public String getNoteToApproveder() {
    return this.noteToApproveder;
  }
  public void setNoteToApproveder(String noteToApproveder) {
    this.noteToApproveder = noteToApproveder;
  }
  public String getCustomerId() {
    return this.customerId;
  }
  public void setCustomerId(String customerId) {
    this.customerId = customerId;
  }
  public String getNote() {
    return this.note;
  }
  public void setNote(String note) {
    this.note = note;
  }
  public String getServerId() {
    return this.serverId;
  }
  public void setServerId(String serverId) {
    this.serverId = serverId;
  }
  public String getStatus() {
    return this.status;
  }
  public void setStatus(String status) {
    this.status = status;
  }
  public String getStatusPlt() {
    return this.statusPlt;
  }
  public void setStatusPlt(String statusPlt) {
    this.statusPlt = statusPlt;
  }
  public String getPayType() {
    return this.payType;
  }
  public void setPayType(String payType) {
    this.payType = payType;
  }
  public String getPayTime() {
    return this.payTime;
  }
  public void setPayTime(String payTime) {
    this.payTime = payTime;
  }
  public String getPayStatus() {
    return this.payStatus;
  }
  public void setPayStatus(String payStatus) {
    this.payStatus = payStatus;
  }
  public String getRemark() {
    return this.remark;
  }
  public void setRemark(String remark) {
    this.remark = remark;
  }
  public String getOrderSource() {
    return this.orderSource;
  }
  public void setOrderSource(String orderSource) {
    this.orderSource = orderSource;
  }
  public Integer getIsDomc() {
    return this.isDomc;
  }
  public void setIsDomc(Integer isDomc) {
    this.isDomc = isDomc;
  }
  public Integer getIsConfirm() {
    return this.isConfirm;
  }
  public void setIsConfirm(Integer isConfirm) {
    this.isConfirm = isConfirm;
  }
  public String getCancelTime() {
    return this.cancelTime;
  }
  public void setCancelTime(String cancelTime) {
    this.cancelTime = cancelTime;
  }
  public String getCreateBy() {
    return this.createBy;
  }
  public void setCreateBy(String createBy) {
    this.createBy = createBy;
  }
  public Date getCreateTime() {
    return this.createTime;
  }
  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }
  public Date getLastOptime() {
    return this.lastOptime;
  }
  public void setLastOptime(Date lastOptime) {
    this.lastOptime = lastOptime;
  }
  public String getConfirmPoint() {
    return this.confirmPoint;
  }
  public void setConfirmPoint(String confirmPoint) {
    this.confirmPoint = confirmPoint;
  }
  public String getTravelNo() {
    return this.travelNo;
  }
  public void setTravelNo(String travelNo) {
    this.travelNo = travelNo;
  }
  public String getContacter() {
    return this.contacter;
  }
  public void setContacter(String contacter) {
    this.contacter = contacter;
  }
  public Integer getIsMalice() {
    return this.isMalice;
  }
  public void setIsMalice(Integer isMalice) {
    this.isMalice = isMalice;
  }
  public String getParentOrderId() {
    return this.parentOrderId;
  }
  public void setParentOrderId(String parentOrderId) {
    this.parentOrderId = parentOrderId;
  }
  public String getParentOrderIdPlt() {
    return this.parentOrderIdPlt;
  }
  public void setParentOrderIdPlt(String parentOrderIdPlt) {
    this.parentOrderIdPlt = parentOrderIdPlt;
  }
  public String getBalanceType() {
    return this.balanceType;
  }
  public void setBalanceType(String balanceType) {
    this.balanceType = balanceType;
  }
  public Double getSettlementPrice() {
    return this.settlementPrice;
  }
  public void setSettlementPrice(Double settlementPrice) {
    this.settlementPrice = settlementPrice;
  }
  public String getVoucherId() {
    return this.voucherId;
  }
  public void setVoucherId(String voucherId) {
    this.voucherId = voucherId;
  }
  public String getUserId() {
    return this.userId;
  }
  public void setUserId(String userId) {
    this.userId = userId;
  }
  public String getDataSource() {
    return this.dataSource;
  }
  public void setDataSource(String dataSource) {
    this.dataSource = dataSource;
  }
}