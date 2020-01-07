var expenseHtml = '';
var receiptHtml = '';
var idIndex = 1;
var count=1;
var spendIds=1; //报销单号里面的id
var assortIds=1; //票据里面的id
var proDate;
var proNumDate;
var oneReceipt=1;//单个票据的id(获取父级元素)
var appUserInfo={};
var dailyInfo;
var invoiceIdValue=[]; //选择的发票的id
var dailyDate; //日报的日期，更新发票状态时使用
var dataValueNum;
var arrayMap=new Map();	//存放id值，更新发票状态
var workNo=[];
var workNo1=[];
var buzhu="";
var isTxf=0;
mui.ready(function() {
    if (localStorage.wxUser!=null) {
	    var data = JSON.parse(localStorage.wxUser);
		appUserInfo.mUserName=data.userName;
		appUserInfo.mWxUserId = data.wXUserId;
		appUserInfo.applyUserId = data.userId;
	}
	//获取费用报销HTML(两个div)
	expenseHtml = $('#expense-receipt > div').eq(0).html();
	//获取票据HTML
	receiptHtml = $('#expense-receipt > div > div').eq(2).html();
	//回显的（费用报销）数据
	var  dailySpends= eval('('+localStorage.dailySpends+')'); 
	var workList = eval('('+localStorage.workList+')'); 
	if (workList) {
		$.each(workList,function(i,work){
			workNo.push(work.workNo);
		    if (dailySpends) {
			    $.each(dailySpends,function(j,spend){
		            if (work.proNo == spend.proNo) {						
					    spend.projectType = work.projectType;
					    spend.workNo = work.workNo;
					}	  
                });
			}
        });
	}
	
	//回显的报工数据
	dailyInfo = eval('('+localStorage.dailyInfo+')');
	dailyDate = dailyInfo.dailyDateStr;
	//回显的（票据）数据
	var dailyAssortList = eval('('+localStorage.dailyAssortList+')');
	if(dailySpends!=null&&dailySpends.length>0){
		bindSpendInfo(dailySpends,dailyAssortList);
	}
	for(var i=1;i<spendIds;i++){
		var a=$("span[name='workNo']").eq(i).text();
		workNo.push(a);
	}
	proDate= eval('('+localStorage.proDate+')');
	//设置'发票池'部分字段为只读
	onlyRead(dataValueNum);
	//页面初始化后，设置直接回显的（滴滴，酒店。飞机票）只读
	updateStatus();
});

//添加费用报销页面
$('span#addReceipt').on('tap',function(e) {
	if (localStorage.workList && localStorage.workList != '[]') {
	    var dailyDateStr = dailyInfo.dailyDateStr;
	    if(datedifference(dailyDateStr,getNowFormatDate())>3){
	    	mui.toast("日报与当前日期相隔太长，不能添加报销了");
	    }else{
	    	var regExp = new RegExp("id=\"[a-zA-Z]*_[0-9]*\"","ig");
	    	var html = expenseHtml;
	    	//获取所有的id字段
	    	var reg = html.match(regExp);
	    	var tmpIdIndex = (++idIndex);
	    	var attrId = '';
	    	var ary = null;
	    	reg.forEach(function(item,i) {
	    		attrId = item.substring(item.indexOf("\"") + 1,item.length - 1);
	    		ary = attrId.split("_");
	    		attrId = ary[0] + "_" + tmpIdIndex;
	    		regExp = new RegExp("id=\"" + ary[0] + "_1\"","ig");
	    		//字符串或要替换的模式的 RegExp 对象。
	    		html = html.replace(regExp,"id=\"" + attrId + "\"");
	    	});
	    	//添加页面时，修改id值
	    	html=html.replace("spendNo_1",count);
	    	html=html.replace("assortSpend",count);
	    	html=html.replace("proNo_0","proNo_"+spendIds);//预算编号
	    	html=html.replace("trueProject_0","trueProject_"+spendIds);//项目编号
			html=html.replace("projectNo_0","projectNo_"+spendIds);
			html=html.replace("projectType_0","projectType_"+spendIds);
	    	html=html.replace("budgetType_0","budgetType_"+spendIds);//花销分类
	    	html=html.replace("spendType_0","spendType_"+spendIds);//消费类型
	    	html=html.replace("spendDate_0","spendDate_"+spendIds);//划卡消费日期
	    	html=html.replace("spendTotal_0","spendTotal_"+spendIds);//花销统计
	    	html=html.replace("workNo_0","workNo_"+spendIds);//创建报功时间
			html=html.replace("budgetNo_0","budgetNo_"+spendIds);
			html=html.replace("budgetTypeCode_0","budgetTypeCode_"+spendIds);
			html=html.replace("budgetAvailable_0","budgetAvailable_"+spendIds);
	    	html=html.replace("operationType_0","operationType_"+assortIds);
	    	html=html.replace("ticketId_0","ticketId_"+assortIds);
	    	html=html.replace("ticketType_0","ticketType_"+assortIds);
	    	html=html.replace("spendMoney_0","spendMoney_"+assortIds);
	    	html=html.replace("rate_0","rate_"+assortIds);
	    	html=html.replace("teamSite_0","teamSite_"+assortIds);
	    	html=html.replace("teamUser_0","teamUser_"+assortIds);
	    	html=html.replace("shrikPlace_0","shrikPlace_"+assortIds);
	    	html=html.replace("checkInDate_0","checkInDate_"+assortIds);
	    	html=html.replace("leaveDate_0","leaveDate_"+assortIds);
	    	count++;
	    	spendIds++;
	    	assortIds++;
	    	$('#expense-receipt').append("<div style='margin-bottom:10px'>" + html + "</div>");
	    	//发票单号输入校验
	    	//codeCheck('oneReceipt_0');
	    }
	} else {
	    mui.toast("请先添加工作内容");
	}
});

//选择项目
function addSelectPro(obj){
	var id = $(obj).attr('id');
	getSelectPro(id,id,proDate); //初始化
}

//选择项目弹框
function getSelectPro(clickId,spanId,data) {
    var showUserPickerButton = document.getElementById(clickId);
    var userResult = document.getElementById(spanId);
    showUserPickerButton.addEventListener('tap', function(event) {
    	var _self = this;
		if (_self.proPicker) {
		    _self.proPicker.setData(data);
		    _self.proPicker.show(function(items) {
			    var projInfo = items[0].value.split('#_#');
			    var prjIndexId = clickId.substring (clickId.indexOf('_') + 1);
			    document.getElementById("projectNo_" + prjIndexId).value = projInfo[0]; 
			    document.getElementById("projectType_" + prjIndexId).value = projInfo[1];
			    document.getElementById("workNo_" + prjIndexId).innerHTML  = projInfo[2]; 
			    if(projInfo[1]==4 || projInfo[1] == 3 || projInfo[1] == 2 || projInfo[1] ==1){
					proNumDate=[
						{value: localStorage.ktext, text: localStorage.ktext},
						{value: items[0].text, text:items[0].text}
					];
				}else{
					proNumDate=[
						{value: items[0].text, text:items[0].text}
					];
				}
                userResult.innerText = items[0].text;
				_self.proPicker.dispose();
                _self.proPicker = null;
            });
		} else {
		    _self.proPicker = new mui.PopPicker();
			_self.proPicker.setData(data);
			_self.proPicker.show(function(items) {
			    var projInfo = items[0].value.split('#_#');
			    var prjIndexId = clickId.substring (clickId.indexOf('_') + 1);
			    document.getElementById("projectNo_" + prjIndexId).value = projInfo[0];
			    document.getElementById("projectType_" + prjIndexId).value = projInfo[1];
			    document.getElementById("workNo_" + prjIndexId).innerHTML  = projInfo[2];
			    if(projInfo[1]==4 || projInfo[1] == 3 || projInfo[1] == 2 || projInfo[1] ==1){
					proNumDate=[
						{value: localStorage.ktext, text: localStorage.ktext},
						{value: items[0].text, text:items[0].text}
					];
				}else{
					proNumDate=[
						{value: items[0].text, text:items[0].text}
					];
				}
                userResult.innerText = items[0].text;
                _self.proPicker.dispose();
				_self.proPicker = null;
            });	
		}
    }, false);
};

//选择预算编号
function addSelectProNum(obj){
	var id = $(obj).attr('id');
	getSelectProNum(id,id,proNumDate); //初始化
}
//选择预算编号
function getSelectProNum(clickId,spanId,data) {
    var showUserPickerButton = document.getElementById(clickId);
    var userResult = document.getElementById(spanId);
    showUserPickerButton.addEventListener('tap', function(event) {
    	var _self = this;
		if (_self.proPicker) {
		    _self.proPicker.setData(data);
		    _self.proPicker.show(function(items) {
                userResult.innerText = items[0].text;
				_self.proPicker.dispose();
                _self.proPicker = null;
            });
		} else {
		    _self.proPicker = new mui.PopPicker();
			_self.proPicker.setData(data);
			_self.proPicker.show(function(items) {
             userResult.innerText = items[0].text;
            _self.proPicker.dispose();
			_self.proPicker = null;
            });	
		}
    }, false);
};
//花销分类
function addSelectFee(obj) {
	var id = $(obj).attr('id');
	var prjIndexId = id.substring (id.indexOf('_') + 1);
	var projType = document.getElementById("projectType_" + prjIndexId).value;
	if (!projType || projType == null || projType == '') {
	    mui.toast('请选择项目预算编号');
	} else {
      $.ajax({
		type: "post",
		url:pathUrl+"/getFeeTypeList.action",
		data : {
			userName:appUserInfo.mUserName,
		    projType:projType
		},
		cache:false,
		async:false,/*同步请求*/
		dataType: "json",
		success:function(data){
	        var jsonData = JSON.parse(data);
	        getSelSelectFee(id,id,getPickData(jsonData));
		}
      });
	}
}

//选择花销分类
function getSelSelectFee(clickId,spanId,data) {
    var showUserPickerButton = document.getElementById(clickId);
    var userResult = document.getElementById(spanId);
    showUserPickerButton.addEventListener('tap', function(event) {
        var _self = this;
		if (_self.selPickerFee) {
		    _self.selPickerFee.setData(data);
		    _self.selPickerFee.show(function(items) {
		         var prjIndexId = clickId.substring (clickId.indexOf('_') + 1);
	             var projType = document.getElementById("projectType_" + prjIndexId).value;
		         var projNumber = document.getElementById("projectNo_" + prjIndexId).value;
		         //根据项目编号获取项目预算
		         $.ajax({    
		             type: "post",
		             url:pathUrl+"/getBudgetInfo.action",
		             data : {
		                  projectNum:projNumber,
		                  projectType:projType,
					      spendType: items[0].value
		             },
		             cache:false,
		             async:false,/*同步请求*/
		             dataType: "json",
		             success:function(data){
			             var jsonData = JSON.parse(data);
				         var budget = jsonData.result;
				         if (!budget || !budget.budget_num) {
					         mui.toast("该项目查询不到对应的预算，无法报销，请选择其他花销分类！");
					         document.getElementById("budgetNo_" + prjIndexId).value = null;
					         document.getElementById("budgetTypeCode_" + prjIndexId).value = null;
					         document.getElementById("budgetAvailable_" + prjIndexId).value = null;
							 userResult.innerText = '请选择';
					         return;
				         } else {
					         var a = document.getElementById("budgetNo_" + prjIndexId);
					         if (a) {
					             document.getElementById("budgetNo_" + prjIndexId).value = budget.budget_num;
					          } 
			                  var b = document.getElementById("budgetTypeCode_" + prjIndexId);
					          if (b) {
					              document.getElementById("budgetTypeCode_" + prjIndexId).value = items[0].value;
					          }
			                  var c = document.getElementById("budgetAvailable_" + prjIndexId);
					          if (c) {
					             document.getElementById("budgetAvailable_" + prjIndexId).value = budget.budget_available;
				 	          }
				         }
		             }
                 });
		         userResult.innerText = items[0].text;
                 //团队建设费
                 var receiptId = $("#"+clickId).parent().parent().parent().parent().parent().find("div[name='allreceipt']").attr("id");
                 var siteId=[];
                 $('#'+receiptId+' div ul li input[name=teamSite]').each(function(){
            	     siteId.push($(this).attr('id'));
                 });
                 var peopleId=[];
                 $('#'+receiptId+' div ul li input[name=teamUser]').each(function(){
            	     peopleId.push($(this).attr('id'));
                 });
                 if(items[0].text == '团队建设费'){
            	     //团建时间和人员显示出来
            	     siteId.forEach(function(item,i) {
            		     $("#"+item).parent().show();
            	     }); 
            	     peopleId.forEach(function(item,i) {
            		     $("#"+item).parent().show();
            	     });           	
                 }else {
            	     //团建时间和人员隐藏
            	     siteId.forEach(function(item,i) {
            		     $("#"+item).parent().hide();
            	     }); 
            	     peopleId.forEach(function(item,i) {
            		     $("#"+item).parent().hide();
            	     });
                 }
				_self.selPickerFee.dispose();
                _self.selPickerFee = null;
            });
		} else {
		    _self.selPickerFee = new mui.PopPicker();
			_self.selPickerFee.setData(data);
			_self.selPickerFee.show(function(items) {
				 var prjIndexId = clickId.substring (clickId.indexOf('_') + 1);
	             var projType = document.getElementById("projectType_" + prjIndexId).value;
		         var projNumber = document.getElementById("projectNo_" + prjIndexId).value;
		         //根据项目编号获取项目预算
		         $.ajax({    
		             type: "post",
		             url:pathUrl+"/getBudgetInfo.action",
		             data : {
		                  projectNum:projNumber,
		                  projectType:projType,
					      spendType: items[0].value
		             },
		             cache:false,
		             async:false,/*同步请求*/
		             dataType: "json",
		             success:function(data){
			             var jsonData = JSON.parse(data);
				         var budget = jsonData.result;
				         if (!budget || !budget.budget_num) {
					         mui.toast("该项目查询不到对应的预算，无法报销，请选择其他花销分类！");
					         document.getElementById("budgetNo_" + prjIndexId).value = null;
					         document.getElementById("budgetTypeCode_" + prjIndexId).value = null;
					         document.getElementById("budgetAvailable_" + prjIndexId).value = null;
							 userResult.innerText = '请选择';
					         return;
				         } else {
					         var a = document.getElementById("budgetNo_" + prjIndexId);
					         if (a) {
					             document.getElementById("budgetNo_" + prjIndexId).value = budget.budget_num;
					          } 
			                  var b = document.getElementById("budgetTypeCode_" + prjIndexId);
					          if (b) {
					              document.getElementById("budgetTypeCode_" + prjIndexId).value = items[0].value;
					          }
			                  var c = document.getElementById("budgetAvailable_" + prjIndexId);
					          if (c) {
					             document.getElementById("budgetAvailable_" + prjIndexId).value = budget.budget_available;
				 	          }
				         }
		             }
                 });
		         userResult.innerText = items[0].text;
                 //团队建设费
                 var receiptId = $("#"+clickId).parent().parent().parent().parent().parent().find("div[name='allreceipt']").attr("id");
                 var siteId=[];
                 $('#'+receiptId+' div ul li input[name=teamSite]').each(function(){
            	     siteId.push($(this).attr('id'));
                 });
                 var peopleId=[];
                 $('#'+receiptId+' div ul li input[name=teamUser]').each(function(){
            	     peopleId.push($(this).attr('id'));
                 });
                 if(items[0].text == '团队建设费'){
            	     //团建时间和人员显示出来
            	     siteId.forEach(function(item,i) {
            		     $("#"+item).parent().show();
            	     }); 
            	     peopleId.forEach(function(item,i) {
            		     $("#"+item).parent().show();
            	     });           	
                 }else {
            	     //团建时间和人员隐藏
            	     siteId.forEach(function(item,i) {
            		     $("#"+item).parent().hide();
            	     }); 
            	     peopleId.forEach(function(item,i) {
            		     $("#"+item).parent().hide();
            	     });
                 }
                _self.selPickerFee.dispose();
				_self.selPickerFee = null;
				 var a=$("#"+clickId).html();
				 
            	if(a=="差旅-补助"){
            		console.log(localStorage.site);
            		if(localStorage.site.indexOf("北京")!=-1){
            			mui.alert("驻地为北京不能选择差旅补助！");
            			$("#"+clickId).html("请选择");
            			buzhu=0;
            		}else{
            			buzhu=1;
            		}
            	}else{
            		buzhu=0;
            	}
            });	
		}
    }, false);
}
//时间处理
function getPickData(data) {
    var retData =[];
    $.each(data.result,function(index,result){
        retData[index] = {value:result.chkVal, text: result.chkDisplay }
    });
    return retData;
}

//消费类型
function addSelectType(obj) {
	var id = $(obj).attr('id');
	var data=[{"value":"现金","text":"现金"},{"value":"商务卡","text":"商务卡"}];
	getSelSelectType(id,id,data);
}

//选择消费类型
function getSelSelectType(clickId,spanId,data) {
    var showUserPickerButton = document.getElementById(clickId);
    var userResult = document.getElementById(spanId);
    showUserPickerButton.addEventListener('tap', function(event) {
    
    	var _self = this;
		if (_self.selPickerType) {
		    _self.selPickerType.setData(data);
		    _self.selPickerType.show(function(items) {
                userResult.innerText = items[0].text;
				_self.selPickerType.dispose();
                _self.selPickerType = null;
            });
		} else {
		    _self.selPickerType = new mui.PopPicker();
			_self.selPickerType.setData(data);
			_self.selPickerType.show(function(items) {
                userResult.innerText = items[0].text;
                //划卡消费日期的id
               	var spendValue = 'spendDate_'+clickId.split('_')[1];
                if(userResult.innerText == '现金'){
                	//禁用划卡消费日期
                	$('#'+spendValue).hide();
                }else{
                	//放开划卡消费日期
                	$('#'+spendValue).show();
                }
                _self.selPickerType.dispose();
				_self.selPickerType = null;
            });	
		}
    }, false);
};

//操作类型
function addSelectOpe(obj) {
	//获取开票单位
	var parentId=$(obj).parent().parent().parent().attr('id');
	//获取操作类型的id
	var operationTypeId=$(obj).attr('id');
	for(var key in arrayMap){
		if(key == operationTypeId){
			if(arrayMap[key] && invoiceIdValue.indexOf(arrayMap[key]) == -1){
				//清空数组
				invoiceIdValue.splice(0,invoiceIdValue.length);
				//发票id数组(更新发票的操作类型)
				invoiceIdValue.push(arrayMap[key]);
			}
		}
	}
	//获取操作类型，当操作类型不是'发票池'时，开票单位设置为空
	var operationType = $('#'+parentId+' ul li span[name=operationType]').html();
	var company;
	if(operationType != '发票池'){
		company = '';
	} else {
		company = $('#'+parentId+' ul li input[name=ticketCom]').val();
	}
	var id = $(obj).attr('id');
	var spendNo=$(obj).parent().parent().parent().find("span[id='spendNo']").html();
	var data=[];
	if(buzhu==1){
		data=[{"value":"出差补助","text":"出差补助"},{"value":"通讯补助","text":"通讯补助"},
		{"value":"入疆补助","text":"入疆补助"},{"value":"高原补助","text":"高原补助"},
		{"value":"海外出差补助","text":"海外出差补助"}];
	}else{
		data=[{"value":"发票池","text":"发票池"},{"value":"出差补助","text":"出差补助"},
			{"value":"发票未到报备","text":"发票未到报备"},{"value":"专家费","text":"专家费"},
			{"value":"通讯费","text":"通讯费"}];
	}
	getSelSelectOpe(id,spendNo,data,company,invoiceIdValue);
};

//选择操作类型
function getSelSelectOpe(clickId, spendNo, data, company, invoiceIds) {
	var clickIdGroup = clickId+'/'+spendNo;
    var showUserPickerButton = document.getElementById(clickId);
    var userResult = document.getElementById(clickId);
    showUserPickerButton.addEventListener('tap', function(event) {
    	var _self = this;
		if (_self.selPickerOpe) {
		    _self.selPickerOpe.setData(data);
		    _self.selPickerOpe.show(function(items) {
                userResult.innerText = items[0].text;
                if(items[0].text == '发票池'){
                	//跳转到发票池页面
                	//跳转前先重新设置发票id状态为0（回显数据）
					if(invoiceIds){
                		UpdateState(invoiceIds,clickIdGroup,company);
					}
                }
                if(buzhu=="1"){     	
					a_business_travel(clickId,items[0].text);
                }else{
                  	notOnlyRead(clickId,items[0].text);
                }
                //初始化对应操作类型的默认值
                notOnlyRead(clickId,items[0].text);
				_self.selPickerOpe.dispose();
                _self.selPickerOpe = null;
            });
		} else {
		    _self.selPickerOpe = new mui.PopPicker();
			_self.selPickerOpe.setData(data);
			_self.selPickerOpe.show(function(items) {
                userResult.innerText = items[0].text;
                if(items[0].text == '发票池'){
                	//跳转到发票池页面
                	//跳转前先重新设置发票id状态为0（回显数据）
					if(invoiceIds){
                		UpdateState(invoiceIds,clickIdGroup,company);
					}
                }
                if(buzhu=="1"){     	
					a_business_travel(clickId,items[0].text);
                }else{
                  	notOnlyRead(clickId,items[0].text);
                }
                _self.selPickerOpe.dispose();
				_self.selPickerOpe = null;
            });	
		}
    }, false);  
}
function a_business_travel(clickId,value){

	data=[{"value":"出差补助","text":"出差补助"},{"value":"通讯补助","text":"通讯补助"},
		{"value":"入疆补助","text":"入疆补助"},{"value":"高原补助","text":"高原补助"},
		{"value":"海外出差补助","text":"海外出差补助"}];
	var divId=$("#"+clickId).parent().parent().parent().attr('id');
	$('#'+divId+' ul li span[name="ticketType"]').text("非增值专用税");
   	$('#'+divId+' ul li span[name="ticketType"]').css("readonly", "readonly");
   	$('#'+divId+' ul li input[name="code"]').attr("readonly","readonly");
   	$('#'+divId+' ul li input[name="spendMoney"]').attr("readonly", "readonly");
   	$('#'+divId+' ul li span[name="rate"]').text("0.0");
   	$('#'+divId+' ul li span[name="rate"]').css("readonly", "readonly");
	if(value == '出差补助'){
   		$('#'+divId+' ul li input[name="code"]').val("CC00");
   		$('#'+divId+' ul li input[name="spendMoney"]').val("80");
   		$('#'+divId+' ul li input[name="ticketCom"]').val("锐安");
   		$('#'+divId+' ul li input[name="ticketInfo"]').val("锐安");
   		
	}else if(value == '通讯补助'){
		$('#'+divId+' ul li input[name="code"]').val("TX00");
   		$('#'+divId+' ul li input[name="spendMoney"]').val("10");
   		$('#'+divId+' ul li input[name="ticketCom"]').val("锐安");
   		$('#'+divId+' ul li input[name="ticketInfo"]').val("锐安");
	}else if(value == '入疆补助'){
		$('#'+divId+' ul li input[name="code"]').val("RJ00");
   		$('#'+divId+' ul li input[name="spendMoney"]').val("100");
   		$('#'+divId+' ul li input[name="ticketCom"]').val("锐安");
   		$('#'+divId+' ul li input[name="ticketInfo"]').val("锐安");
	}else if(value == '高原补助'){
		$('#'+divId+' ul li input[name="code"]').val("GY00");
   		$('#'+divId+' ul li input[name="spendMoney"]').val("100");
   		$('#'+divId+' ul li input[name="ticketCom"]').val("锐安");
   		$('#'+divId+' ul li input[name="ticketInfo"]').val("锐安");
   		$('#'+divId+' ul li input[name="rideTime"]').attr("readonly", true);
	}else if(value == '海外出差补助'){
		$('#'+divId+' ul li input[name="spendMoney"]').attr("readonly", false);
		$('#'+divId+' ul li input[name="code"]').val("HW00");
   		$('#'+divId+' ul li input[name="ticketCom"]').val("锐安");
   		$('#'+divId+' ul li input[name="ticketInfo"]').val("锐安");
	}
}
//发票类型
function addSelectTicket(obj) {
	if(buzhu!=1){
		var id = $(obj).attr('id');
	var typeData = $(obj).text();
	var data;
	if(typeData == '请选择'){
		data=[{"value":"增值税专用发票","text":"增值税专用发票"},{"value":"非增值税专用发票","text":"非增值税专用发票"}];
	}else {
		data=[{"value":"普通电子发票","text":"普通电子发票"},{"value":"电子发票专票","text":"电子发票专票"},
		{"value":"普通纸质发票","text":"普通纸质发票"},{"value":"专用纸质发票","text":"专用纸质发票"},
		{"value":"普通纸质卷票","text":"普通纸质卷票"},{"value":"通行费","text":"通行费"},
		{"value":"通用机打","text":"通用机打"},{"value":"的士票","text":"的士票"},{"value":"火车票","text":"火车票"},
		{"value":"飞机票","text":"飞机票"},{"value":"其他","text":"其他"},{"value":"机动车","text":"机动车"},
		{"value":"二手车","text":"二手车"},{"value":"定额发票","text":"定额发票"},{"value":"未知","text":"未知"},
		{"value":"发票未验证","text":"发票未验证"}];
	}
	getSelSelectTicket(id,id,data);
	}
}

//选择发票类型
function getSelSelectTicket(clickId,spanId,data) {
    var showUserPickerButton = document.getElementById(clickId);
    var userResult = document.getElementById(spanId);
    showUserPickerButton.addEventListener('tap', function(event) {
    	var _self = this;
		if (_self.selTicketType) {
		    _self.selTicketType.setData(data);
		    _self.selTicketType.show(function(items) {
                userResult.innerText = items[0].text;
				_self.selTicketType.dispose();
                _self.selTicketType = null;
            });
		} else {
		    _self.selTicketType = new mui.PopPicker();
			_self.selTicketType.setData(data);
			_self.selTicketType.show(function(items) {
                userResult.innerText = items[0].text;
                _self.selTicketType.dispose();
				_self.selTicketType = null;
            });	
		}
    }, false);	
}

//税率
function addSelectRate(obj) {
	var id = $(obj).attr('id');
	var data=[{value:"0",text:"0"},{value:"3",text:"3%"},
		{value:"6",text:"6%"},{value:"10",text:"10%"},
		{value:"13",text:"13%"},{value:"16",text:"16%"}];
	getSelSelectRate(id,id,data);
}

//选择税率
function getSelSelectRate(clickId,spanId,data) {
    var showUserPickerButton = document.getElementById(clickId);
    var userResult = document.getElementById(spanId);
    showUserPickerButton.addEventListener('tap', function(event) {
    	var _self = this;
		if (_self.selPickerRate) {
		    _self.selPickerRate.setData(data);
		    _self.selPickerRate.show(function(items) {
                 userResult.innerText = items[0].text;
				_self.selPickerRate.dispose();
                _self.selPickerRate = null;
            });
		} else {
		    _self.selPickerRate = new mui.PopPicker();
			_self.selPickerRate.setData(data);
			_self.selPickerRate.show(function(items) {
                 userResult.innerText = items[0].text;
                _self.selPickerRate.dispose();
				_self.selPickerRate = null;
            });	
		}
    }, false);	
}
//选择住宿地点
function addSelectShrikPlace(obj) {
	var id = $(obj).attr('id');
	var data=[{value:"境内A类",text:"境内A类"},{value:"境内其他",text:"境内其他"},
		{value:"境外",text:"境外"}];
	getSelectShrikPlace(id,id,data);
}

//选择税率
function getSelectShrikPlace(clickId,spanId,data) {
    var showUserPickerButton = document.getElementById(clickId);
    var userResult = document.getElementById(spanId);
    showUserPickerButton.addEventListener('tap', function(event) {
    	var _self = this;
		if (_self.selPickerRate) {
		    _self.selPickerRate.setData(data);
		    _self.selPickerRate.show(function(items) {
                 userResult.innerText = items[0].text;
				_self.selPickerRate.dispose();
                _self.selPickerRate = null;
            });
		} else {
		    _self.selPickerRate = new mui.PopPicker();
			_self.selPickerRate.setData(data);
			_self.selPickerRate.show(function(items) {
                 userResult.innerText = items[0].text;
                _self.selPickerRate.dispose();
				_self.selPickerRate = null;
            });	
		}
    }, false);	
}

//选择日期
function addDateSelect(obj) {
	var id = $(obj).attr('id');
	var showStyleButton = document.getElementById(id);
	var styleResult = document.getElementById(id);
	var _self = this;
	if(_self.picker){
		_self.picker.show(function (rs) {
			styleResult.innerText =rs.text;
			_self.picker.dispose();
			_self.picker = null;
		});
	}else{
		var optionsJson = showStyleButton.getAttribute('data-options') || '{}';
		var options = JSON.parse(optionsJson);
		_self.picker = new mui.DtPicker(options);
		_self.picker.show(function(rs) {
			styleResult.innerText = rs.text;
			_self.picker.dispose();
			_self.picker = null;
		});
	}
}

//添加票据按钮
function addReceipt(obj) {
	var id = $(obj).attr('id');
	var parent = $('#' + id).parent().parent();
	var regExp = new RegExp("id=\"[a-zA-Z]*_[0-9]*\"","ig");
	var html = receiptHtml;
	//获取所有的id字段
	var reg = html.match(regExp);
	var tmpIdIndex = (++idIndex);
	var attrId = '';
	var ary = null;
	//var spendNo=1;
	reg.forEach(function(item,i) {
		attrId = item.substring(item.indexOf("\"") + 1,item.length - 1);
		ary = attrId.split("_");
		attrId = ary[0] + "_" + tmpIdIndex;
		regExp = new RegExp("id=\"" + ary[0] + "_1\"","ig");
		//字符串或要替换的模式的 RegExp 对象。
		html = html.replace(regExp,"id=\"" + attrId + "\"");
	});
	var spendNo=$(obj).parent().parent().find("span[name='spendNo']").html();
	html=html.replace("assortSpend",spendNo);
	html=html.replace("operationType_0","operationType_"+assortIds);
	html=html.replace("ticketId_0","ticketId_"+assortIds);
	html=html.replace("ticketType_0","ticketType_"+assortIds);
	html=html.replace("spendMoney_0","spendMoney_"+assortIds);
	html=html.replace("rate_0","rate_"+assortIds);
	html=html.replace("oneReceipt_0","oneReceipt_"+oneReceipt);
	html=html.replace("teamSite_0","teamSite_"+assortIds);
	html=html.replace("teamUser_0","teamUser_"+assortIds);
	parent.find('>div').eq(2).append(html);
	assortIds++;
	oneReceipt++;
	//获取此时花销分类的id和value,然后根据情况添加团建地点和人员信息
	var budgetValue =parent.find('span[name=budgetType]').html();
	if(budgetValue == '团队建设费'){
		var budgetId =parent.find('span[name=budgetType]').attr('id');
		showParty(budgetId);
	}
};

//打开发票池时更新发票状态
function UpdateState(dataValue,spendNoData,companyData) {
	var arrayNum=new Array();
	var invoiceData;
	var invoiceIdArray = '';	//跳转到发票池需要选择的发票id
	for(var key in dataValue){
		invoiceIdArray = dataValue[key];
		if(dataValue[key]){
			if(dataValue[key].indexOf(',') != -1){
				var invoiceDataValue = dataValue[key].split(',');
				invoiceDataValue.forEach(function(invoiceValue,i){
					invoiceData={"id":invoiceValue,"daily_temp_status":0,"dailyDate":dailyDate};
					arrayNum.push(invoiceData);
				});
			} else {
				invoiceData={"id":dataValue[key],"daily_temp_status":0,"dailyDate":dailyDate};
				arrayNum.push(invoiceData);
			};
		};

	};
	var invoiceIdList = JSON.stringify(arrayNum);
	$.ajax({
		type: "post",
		async: false,
		url:pathUrl+"/updateTicketStatus.action",
		data : {
			invoiceIdList:invoiceIdList
		},
		cache:false,
		dataType: "json",
		success:function(data){
		    var json = JSON.parse(data);
			if(json.message){
				//跳转发票池页面
				toInvoicePage(spendNoData,companyData,invoiceIdArray);
			}else{
				//跳转发票池页面
				toInvoicePage(spendNoData,companyData,invoiceIdArray);
			}
        }
    });
}
function  pointTo (didiId,ticketIds){
	if((didiId==undefined||didiId=='undefined'||didiId== '')&&(ticketIds==undefined||ticketIds=='undefined'||ticketIds== '')){
		return 'general';
	}else if((didiId==undefined||didiId=='undefined'||didiId== '')){
		return 'ticket';
	}else {
		return 'didi'
	}
}

//删除发票票据
function delReceipt(obj) {
	var btnArrayData = ['取消', '确定'];
	var didiId = $(obj).parent().parent().find("input[name='didiId']").val();
	var ticketId = $(obj).parent().parent().find("input[name='ticketId']").val();
    var pointValue = pointTo(didiId,ticketId);
	if(pointValue == 'ticket'){
		//发票池数据
		//获取操作类型的id 
		var operationTypeId=$(obj).parent().parent().find("span[name='operationType']").attr('id');
		for(var key in arrayMap){
			if(key == operationTypeId){
				if(arrayMap[key] && invoiceIdValue.indexOf(arrayMap[key]) == -1){
					//清空数组
					invoiceIdValue.splice(0,invoiceIdValue.length);
					//发票id数组(更新发票的操作类型)
					invoiceIdValue.push(arrayMap[key]);
				}
			}
		}
		var arrayNumVal = new Array();
		var invoiceDataVal;
		for(var key in invoiceIdValue){
			if(invoiceIdValue[key]){
				if(invoiceIdValue[key].indexOf(',') != -1){
					var invoiceDataValue = invoiceIdValue[key].split(',');
					invoiceDataValue.forEach(function(invoiceValue,i){
						invoiceDataVal={"id":invoiceValue,"daily_temp_status":0,"dailyDate":dailyDate};
						arrayNumVal.push(invoiceDataVal);
					});
				} else {
					invoiceDataVal={"id":invoiceIdValue[key],"daily_temp_status":0,"dailyDate":dailyDate};
					arrayNumVal.push(invoiceDataVal);
				};
			};
		};
		var invoiceIdList = JSON.stringify(arrayNumVal);
		$.ajax({
			type: "post",
			url:pathUrl+"/updateTicketStatus.action",
			data : {
				invoiceIdList:invoiceIdList
			},
			cache:false,
			async:false,/*同步请求*/
			dataType: "json",
			success:function(data){
				$(obj).parent().parent().remove();
			}
		});
	}else if(pointValue == 'didi'){
		//滴滴发票数据
		var infoText = '';
		mui.prompt('确定网约车信息有误吗？说明原因', '请输入网约车信息错误原因', '提示', btnArrayData, function(e) {
			infoText = e.value;
			if(e.index == 1){
				$.ajax({
					type: "post",
					url:pathUrl+"/updateDidiOrderInfo.action",
					data : {
						ids:didiId,
						status:4,
						errorReason:infoText,
						flag:1
					},
					cache:false,
					async:false,/*同步请求*/
					dataType: "json",
					success:function(data){
						$(obj).parent().parent().remove();
					}
				});
			}
		})
	}else{
		$(obj).parent().parent().remove();
	}
}

//删除报销单
function delExpense(obj) {
	//获取发票池发票id 
	var ticketData=$(obj).parent().parent().parent().find("input[name='ticketId']");
	var workNo="workNo_"+$(obj).prev().parent().find("span[name='spendNo']").html();//获取标记时间戳id
	var ticketOne='';
	ticketData.each(function(){
		if($(this).val() != ''){
			if(ticketOne != ''){
				ticketOne = $(this).val()+','+ticketOne;
			}else{
				ticketOne = $(this).val();
			}
		}
	})
	var arrayNum = new Array();
	var ticketDataArray;//存放要更新状态的数据的数组
	var ticketDataValue;//存放切割后的发票id数组
	if(ticketOne != ''){
		if(ticketOne.indexOf(',') != -1){
			ticketDataValue = ticketOne.split(',');
			ticketDataValue.forEach(function(invoiceValue,i){
				ticketDataArray={"id":invoiceValue,"daily_temp_status":0,"dailyDate":dailyDate};
				arrayNum.push(ticketDataArray);
			});
		}else{
			ticketDataArray={"id":ticketOne,"daily_temp_status":0,"dailyDate":dailyDate};
			arrayNum.push(ticketDataArray);
		}
		var invoiceIdList = JSON.stringify(arrayNum);
		$.ajax({
			type: "post",
			url:pathUrl+"/updateTicketStatus.action",
			data : {
				invoiceIdList:invoiceIdList
			},
			cache:false,
			async:false,/*同步请求*/
			dataType: "json",
			success:function(data){
				$(obj).parent().parent().parent().remove();
			}
		});
	}else{
		$(obj).parent().parent().parent().remove();
	}	
}

//封装报销单list
function getSpendList() {
	var spendList=[];
	$('.spend-info-view').each(function(i,item) {
		//去掉隐藏的数据
		if(i>0){
			//新建花销对象
			var spend=new Object();
			//遍历每一行数据放入对象
			$(this).find('span').each(function(j,item) {
				var id = $(this).attr('name');
				var value = $(this).html();
				if(id!='undefined'&&id!=''&&id!=null) {
					if(id == 'spendDate') {
					    if (value == '划卡消费日期') {
						    value = '';
						}
						spend['spendDateStr']=value;
					}
					if(value!='undefined'&&value!=''&&value!=null) {
						spend[id]=value;
					}else {
						spend[id]='';
					}
				}
			});		
		    $(this).find('input').each(function(j,item){
			    var idTmp = $(this).attr('id');
			    if(idTmp != null && idTmp != 'undefined'){
				    var id = idTmp.slice(0,idTmp.indexOf('_'));
				    var value = $(this).attr('value');
				    if(value!='undefined'){
					    spend[id]=value;
				    }else{
					    spend[id]='';
				    }
			    }
		    });
			//将对象放入list中
			spendList.push(spend);
		}
	});
	return JSON.stringify(spendList);
}

//生成发票list
function getAssortList() {
	var assortList=[];
	$('.assort-info-view').each(function(i,item) {
		//去掉隐藏的数据
		if(i>0){
			//新建花销对象
			var assort=new Object();
			assort['operationTypeData']=$(this).find("span[name='operationType']").attr('id');
			//遍历每一行数据放入对象
			$(this).find('span').each(function(j,item) {
				var id = $(this).attr('name');
				var value = $(this).html();
				if(value=="请选择"){
					value="";
				}
				if(id!='undefined'&&id!=''&&id!=null) {
					if(value!='undefined'&&value!=''&&value!=null) {
						assort[id]=value;
					}else {
						assort[id]='';
					}
				}
			});			
			$(this).find('input').each(function(j,item) {
				var id = $(this).attr('name');
				var value = $(this).val();
				if(id!='undefined'&&id!=''&&id!=null){
					if (id == 'rideTime') {
						if(value!='undefined'&&value!=''&&value!=null) {
						    if (isNaN(value) && !isNaN(Date.parse(value))) {
				                assort[id]=value; 
				            } else {	
				                assort['rideType']=value;
				            }
					    }					
				    } else {
					    if(value!='undefined'&&value!=''&&value!=null) {
						    assort[id]=value;
					    }else {
						    assort[id]='';
					    }
				    }				
				}
			});
			$(this).find('textarea').each(function(j,item) {
				var id = $(this).attr('id');
				var value = $(this).val();
				if(id!='undefined'&&id!=''&&id!=null) {
					if(value!='undefined'&&value!=''&&value!=null) {
						assort[id]=value;
					}else {
						assort[id]='';
					}
				}
			});
			//将对象放入list中
			assortList.push(assort);
		}
	});
	return JSON.stringify(assortList);
};

//切换到报工信息
function toWorkPage(){
	var data=count-1;
	for(var i=1;i<=data;i++){
		var types=$("#spendType_"+i).text();
		if(types=="商务卡"){
			var types1=$("#spendDate_"+i).text();
			if(types1=="划卡消费日期"){
				mui.toast('请输入第'+i+'单的划卡日期！');
				return false;
			}
		}
	}
	var btnArray = ['确定'];
	var dailyMode = new Object();
	localStorage.dailySpends = getSpendList();
	localStorage.dailyAssortList = getAssortList();
	dailySpend=eval('('+localStorage.dailySpends+')');
	assortList=eval('('+localStorage.dailyAssortList+')');
	if(dailySpend!=null && dailySpend!='[]'){
		var isbudgetTypeValid = true;
		var isTeamSiteValid = true;
		var isTeamUserValid = true;
		var isProNoValid = true;
		$.each(dailySpend,function(i,spend){
			//检查预算编号
			if (!spend.proNo || spend.proNo == '' ||  spend.proNo == 'null' || spend.proNo == '请选择') {
			    isProNoValid=false;
			}	
			//检查花销分类
			if (!spend.budgetType || spend.budgetType == '' ||  spend.budgetType == 'null' || spend.budgetType == '请选择') {
			    isbudgetTypeValid=false;
			}		
			if(assortList!=null && assortList!='[]'){
				$.each(assortList,function(i,assort){
					if(spend.budgetType == '团队建设费'){
						if(spend.spendNo == assort.spendNo){
							if(assort.teamSite==''){
								isTeamSiteValid=false;
							}
							if(assort.teamUser==''){
								isTeamUserValid=false;
							}
						}
					}
				});
			}
		});
		if (!isProNoValid) {
		    mui.confirm('请选择预算编号', '', btnArray, function(e) {
			}); 
			return false;
		}
		if (!isbudgetTypeValid) {
		    mui.confirm('请选择花销分类', '', btnArray, function(e) {
			}); 
			return false;
		}
		if (!isTeamSiteValid) {
			mui.confirm('团建日期和地点内容不能为空', '', btnArray, function(e) {
			});  
			return false;
		}
		if (!isTeamUserValid) {
			mui.confirm('团建人员不能为空', '', btnArray, function(e) {
			});
			return false;
		}	
	}
	if(assortList!=null && assortList!='[]'){
		var isSpendMoneyValid = true;
		var isTicketInfoValid = true;
		var isOperationTypeValid = true;
		var isTicketTypeValid = true;//发票类型
		var isSpendMoneyValid = true;//花销金额
		var isTicketInfoValid = true;//发票内容
		$.each(assortList,function(i,assort){
			if(assort.spendMoney =='undefined' || assort.spendMoney == null || assort.spendMoney==''||isNaN(assort.spendMoney)||assort.spendMoney>100000){
				isSpendMoneyValid=false;
			}
			if(assort.ticketInfo==''){
				isTicketInfoValid=false;
			}
			if(assort.operationType == '请选择'){
				isOperationTypeValid=false;
			}
			var ticketTypeValue = assort.ticketType;
			if (ticketTypeValue =='请选择' || ticketTypeValue == '' || ticketTypeValue =='undefined' || ticketTypeValue == null) {
			    isTicketTypeValid = false;
			}
		});
		if (!isOperationTypeValid) {
			mui.confirm('请选择操作类型', '', btnArray, function(e) {
			});
			return false;
		}
		if (!isTicketTypeValid) {
			mui.confirm('请选择发票类型', '', btnArray, function(e) {
			});
			return false;
		}
	
		if (!isTicketInfoValid) {
			mui.confirm('发票内容不能为空', '', btnArray, function(e) {
			});
			return false;
		}
	}
	dailyMode.dailWorkList=localStorage.dailWorkList;
	dailyMode.dailyAssortList=localStorage.dailyAssortList;
	dailyMode.dailySpends=localStorage.dailySpends;
	dailyMode.dailyInfo=localStorage.dailyInfo;
	var daily=JSON.stringify(dailyMode);
	mui.openWindow({
		url:"report-info.html"
	});
}

//带入数据
function bindSpendInfo(spendList,assortList) {
	for(var i=0;i<spendList.length;i++) {
		if(localStorage.sworkNo==spendList[i].workNo&&localStorage.sworkNo!=""){
			localStorage.removeItem("sworkNo");
			localStorage.sworkNo="";
			var ticketTwo='';//接收要删除的发票池的id
			for(var j=0;j<assortList.length;j++) {
				if(spendList[i].spendNo==assortList[j].spendNo){
					if(ticketTwo != '' && assortList[j].ticketId != ''){
						ticketTwo = ticketTwo +','+assortList[j].ticketId;
					} else if(assortList[j].ticketId != ''){
						ticketTwo = assortList[j].ticketId;
					}
				}
			}
			spendList[i]={};
			if(ticketTwo.trim() != ''){
				updateTicketSta(ticketTwo);
			}
			continue;
			
		}else{
			count=new Number(spendList[i].spendNo)+1;
			var html="<div class='mui-table-view spend-info-view'>"+
						"<div class='mui-card-header'>"+
							"<span class='left'><span class='mui-icon mui-icon-list user-portal-red'></span>报销单号：<span name='spendNo' >"+spendList[i].spendNo+"</span>单</span>"+
							"<div id='expenseDel_"+(++idIndex)+"' name='expenseDel' onclick='javascript:delExpense(this);' class='mui-icon mui-icon-trash right'></div>"+
						"</div>"+
						"<div class='mui-card-content' >"+
							"<ul class='formList' style='border-top: none;'>"+
								"<li class='clearfix'>"+
									"<span class='left label'>项目编号</span>"+
									"<span class='right content' id='trueProject_"+spendIds+"' name='trueProject' >"+spendList[i].trueProject+"</span>"+
								    "<input type='hidden' name= 'projectNo' id='projectNo_" + spendIds + "' value='" + spendList[i].projectNo + "'/>" + 
									"<input type='hidden' name= 'projectType' id='projectType_" + spendIds + "' value='" + spendList[i].projectType + "'/>" + 
								"</li>"+
								"<li class='clearfix'>"+
									"<span class='left label'>预算编号</span>"+
									"<span class='right content' id='proNo_"+spendIds+"' name='proNo' >"+spendList[i].proNo+"</span>"+
								"</li>"+
								"<li class='clearfix'>"+
									"<span class='left label'>花销分类</span>"+
									"<img src='../../images/rightarr.png' alt='' class='right rightArr'/>"+	
									"<span class='right content' id='budgetType_"+spendIds+"' name='budgetType' onclick='javascript:addSelectFee(this);'>"+spendList[i].budgetType+"</span>"+
									"<input type='hidden' name= 'budgetNo' id='budgetNo_" + spendIds + "' value='" + spendList[i].budgetNo + "'/>" + 
									"<input type='hidden' name= 'budgetTypeCode' id='budgetTypeCode_" + spendIds + "' value='" + spendList[i].budgetTypeCode + "'/>" +
									"<input type='hidden' name= 'budgetAvailable' id='budgetAvailable_" + spendIds + "' value='" + spendList[i].budgetAvailable + "'/>" +								
								"</li>"+
								"<li class='clearfix'>"+
									"<span class='left label'>消费类型</span>"+
									"<img src='../../images/rightarr.png' alt='' class='right rightArr'/>"+	
									"<span class='right content' id='spendType_"+spendIds+"' name='spendType' onclick='javascript:addSelectType(this);'>"+spendList[i].spendType+"</span>"+
								"</li>"+
								"<li class='clearfix'>"+
									"<div class='left label'>划卡消费日期</div>"+
									"<img src='../../images/rightarr.png' alt='' class='right rightArr'/>"+	
									"<span id='spendDate_"+spendIds+"' class='btn right mr' data-options='{\"type\":\"date\",\"beginYear\":2018,\"endYear\":2021}' name='spendDate' onclick='addDateSelect(this)'>"+ (spendList[i].spendDateStr==null || spendList[i].spendDateStr=='' ? '划卡消费日期': spendList[i].spendDateStr)  +"</span>"+
								"</li>"+
								"<li class='clearfix'>"+
									"<div class='left label'>花费统计</div>"+
									"<span class='right content' id='spendTotal_"+spendIds+"' name='spendTotal'>"+''+"</span>"+
								"</li>"+
								"<li class='clearfix' style='display:none'>"+
									"<div class='left label'>创建报工时间</div>"+
									"<span class='right content' id='workNo_"+spendIds+"' name='workNo'>"+spendList[i].workNo+"</span>"+
								"</li>"+
							"</ul>"+
						"</div>"+
						"<div class='clear'></div>"+
					"</div>"+
					"<div class='mui-table-view t10'>"+
						"<a id='addReceipt_"+(++idIndex)+"' name='addReceipt' onclick='javascript:addReceipt(this);' class='add-btn' href='#'> <span>+</span>票据</a>"+
					"</div>";
		if(assortList.length>0) {
			html+="<div id='allreceipt_"+(++idIndex)+"' name='allreceipt'>";			
			var spendNoNumber;
			for(var j=0;j<assortList.length;j++) {
				if(spendList[i].spendNo==assortList[j].spendNo) {
					var rideData="";//乘车时间和原因
					if(assortList[j].rideTime){
						rideData = assortList[j].rideTime;
					}
					if(assortList[j].rideType){
						rideData = assortList[j].rideType;
					}
					spendNoNumber = spendList[i].spendNo;
					arrayMap["operationType_"+assortIds] = assortList[j].ticketId;
					//arrayNum.push(assortList[j].ticketId);
					html+="<div class='alone-receipt assort-info-view' id='oneReceipt_"+(++oneReceipt)+"'>"+
								"<div class='title'>"+
									"票据 — 报销单号:<span id='spendNo' name='spendNo'>"+spendList[i].spendNo+"</span>单"+
									"<div id='receiptDel_1' onclick='javascript:delReceipt(this);' class='mui-icon mui-icon-trash right'></div>"+
								"</div>"+
								"<ul class='formList'>"+
									"<li class='clearfix'>"+
										"<span class='left label'>操作类型</span>"+
										"<img src='../../images/rightarr.png' alt='' class='right rightArr'/>"+	
										"<span class='right content' id='operationType_"+assortIds+"' name='operationType' onclick='javascript:addSelectOpe(this);'>"+ (assortList[j].operationType==null || assortList[j].operationType=='' ? '请选择' : assortList[j].operationType)   +"</span>"+
									    "<input type='hidden' name= 'ticketId' id='ticketId_" + assortIds + "' value='" + (assortList[j].ticketId ? assortList[j].ticketId : "") + "'/>" +
									"</li>"+
									"<li class='clearfix'>"+
										"<span class='left label'>发票类型</span>"+
										"<img src='../../images/rightarr.png' alt='' class='right rightArr'/>"+
										"<span class='right content' id='ticketType_"+(assortIds)+"' name='ticketType' onclick='addSelectTicket(this);'>"+assortList[j].ticketType+"</span>"+
									"</li>"+
									"<li class='clearfix'>"+
										"<span class='left label'>花销金额</span>"+
										"<input type='text' id='spendMoney_"+(assortIds)+"' value='"+assortList[j].spendMoney+"' name='spendMoney' class='f_input right wp60' placeholder='请输入花销金额'/>"+
									"</li>"+
									"<li class='clearfix'>"+
										"<span class='left label'>税率</span>"+
										"<img src='../../images/rightarr.png' alt='' class='right rightArr'/>"+
										"<span class='right content' id='rate_"+assortIds+"' name='rate' class='f_input right wp60' onclick='addSelectRate(this);'>"+assortList[j].rate+"</span>"+
									"</li>"+
									"<li class='clearfix'>"+
										"<span class='left label'>报销单号(后4位)</span>"+
										"<input type='text' id='code_"+(assortIds)+"' value='"+ (assortList[j].code == null?"":assortList[j].code)+"' name='code' class='f_input right wp60' placeholder='请输入报销单号'/>"+
									"</li>"+
									"<li class='clearfix'>"+
										"<span class='left label'>开票单位</span>"+
										"<input type='text' id='ticketCom_"+(assortIds)+"' value='"+assortList[j].ticketCom+"' name='ticketCom' class='f_input right wp60' placeholder='请输入开票单位'/>"+
									"</li>"+
									"<li class='clearfix'>"+
										"<span class='left label'>发票内容</span>"+
										"<input type='text' id='ticketInfo_"+(assortIds)+"' value='"+assortList[j].ticketInfo+"' name='ticketInfo' class='f_input right wp60' placeholder='请输入发票内容'/>"+
									"</li>"+
									"<li class='clearfix'>"+
										"<span class='left label'>住宿地点</span>"+
										"<img src='../../images/rightarr.png' alt='' class='right rightArr'/>"+
										"<span class='right content' id='shrikPlace_"+assortIds+"' name='shrikPlace' class='f_input right wp60' onclick='addSelectShrikPlace(this);'>"+(assortList[j].shrikPlace==null || assortList[j].shrikPlace=='' ? '请选择': assortList[j].shrikPlace)+"</span>"+
									"</li>"+
									"<li class='clearfix'>"+
										"<div class='left label'>入住日期</div>"+
										"<img src='../../images/rightarr.png' alt='' class='right rightArr'/>"+	
										"<span id='checkInDate_"+spendIds+"' class='btn right mr' data-options='{\"type\":\"date\",\"beginYear\":2018,\"endYear\":2021}' name='checkInDate' onclick='addDateSelect(this)'>"+ (assortList[j].checkInDate==null || assortList[j].checkInDate=='' ? '请选择': assortList[j].checkInDate)  +"</span>"+
									"</li>"+
									"<li class='clearfix'>"+
										"<div class='left label'>离店日期</div>"+
										"<img src='../../images/rightarr.png' alt='' class='right rightArr'/>"+	
										"<span id='leaveDate_"+spendIds+"' class='btn right mr' data-options='{\"type\":\"date\",\"beginYear\":2018,\"endYear\":2021}' name='leaveDate' onclick='addDateSelect(this)'>"+ (assortList[j].leaveDate==null || assortList[j].leaveDate=='' ? '请选择': assortList[j].leaveDate)  +"</span>"+
									"</li>"+
									"<li class='clearfix'>"+
										"<span class='left label'>乘车时间/原因</span>"+
										"<input type='text' name='rideTime' id='rideTime_"+(assortIds)+"' value='"+rideData+"' class='f_input right wp60' placeholder='请输入乘车时间/原因'/>"+
									"</li>"+
									"<li class='clearfix'  style='display:none'>"+
										"<span class='left label'>id</span>"+
										"<input type='text' name='didiId' id='didiId_"+(assortIds)+"' value='"+assortList[j].didiId+"' class='f_input right wp60' placeholder=''/>"+
									"</li>"+
									"<li class='clearfix' style='display: none;'>"+
										"<span class='left label'>团建日期和地点</span>"+
										"<input type='text' id='teamSite_"+assortIds+"' value='"+assortList[j].teamSite+"' name='teamSite' class='f_input right wp60'/>"+
									"</li>"+
									"<li class='clearfix' style='display: none;'>"+
										"<span class='left label'>团建人员</span>"+
										"<input type='text' id='teamUser_"+(assortIds++)+"' value='"+assortList[j].teamUser+"' name='teamUser' class='f_input right wp60'/>"+
									"</li>"+
									"<li class='clearfix' style='height: auto;'>"+
										"<textarea class='mui-input-speech t10' style='margin-bottom: 0;' name='remark' id='remark' rows='5' placeholder='请输入备注'>"+assortList[j].remark+"</textarea>"+
									"</li>"+
								"</ul>"+
							"</div>";
				}
				if(assortList[j].dataValue){	
					dataValueNum = assortList[j].dataValue;
				}
				////发票单号输入校验
				/**if(assortList[j].operationType == '操作类型'){
					codeCheck("oneReceipt_"+oneReceipt);
					//$('#'+oneReceiptId+' ul li input[name="code"]').attr("onkeyup", "this.value=this.value.replace(/(![^\w_]|JP00|JD00|CC00|BB00|ZJ00|TX00)/gi,'')");
					//$('#'+oneReceiptId+' ul li input[name="code"]').attr("onblur", "expense(this)");
				}**/
			}
			html+="</div>";
		}
		}
		if(html){
			$('#expense-receipt').append("<div style='margin-bottom:10px'>" + html + "</div>");
			//获取此时花销分类的id和value,然后根据情况添加团建地点和人员信息
			if(spendList[i].budgetType == '团队建设费'){
				var budgetId = "budgetType_"+spendIds;
				//团建时间和人员显示出来
				showParty(budgetId);
			}
			spendIds++;
			oneReceipt++;
		}
	}
}

//时间String 转化为 Date
function stringToDate(dateStr) {
     var separator="-";
     var dateArr = dateStr.split(separator);
     var year = parseInt(dateArr[0]);
     var month;
     //处理月份为04这样的情况                         
     if(dateArr[1].indexOf("0") == 0){
         month = parseInt(dateArr[1].substring(1));
     }else{
         month = parseInt(dateArr[1]);
     }
     var day = parseInt(dateArr[2]);
     var date = new Date(year,month -1,day);
     return date;
}

//提交审批
function submitDaily(flag){
	if(!localStorage.txf&&localStorage.txf==0 && isTxf>0){
		mui.alert("您无权限报销通讯费！");
		return false;
	}
	var check=checks();
	if(check==false){
		return false;
	}
	var btnArray = ['确定'];
	var data=count-1;
	var isTypeValid = true;
	var indexNum = 0;
	for(var i=1;i<=data;i++){
		var types=$("#spendType_"+i).text();
		if(types=="商务卡"){
			var types1=$("#spendDate_"+i).text();
			if(types1=="划卡消费日期"){
				indexNum = i;
				isTypeValid = false;
			}
		}
	}
	if (!isTypeValid) {
		mui.toast('请输入第'+indexNum+'单的划卡日期！');
		return false;
	}
	//参数实体
	var didiIds;
	var hotelIds;
	var listTemp;
	var dailyMode = new Object();
	localStorage.dailySpends = getSpendList();
	localStorage.dailyAssortList = getAssortList();
	dailySpend=eval('('+localStorage.dailySpends+')');
	assortList=eval('('+localStorage.dailyAssortList+')');
	if(localStorage.didiIds){
		didiIds=eval('('+localStorage.didiIds+')');
	}
	if(localStorage.hotelIds){
		hotelIds=eval('('+localStorage.hotelIds+')');
	}
	if(localStorage.listTemp){
		listTemp=eval('('+localStorage.listTemp+')');
	}
	if(dailySpend!=null && dailySpend!='[]'){
		var isbudgetTypeValid = true;
		var isTeamSiteValid = true;
		var isTeamUserValid = true;
		var isTicketTypeValid = true;
		var isProNoValid = true;
		$.each(dailySpend,function(i,spend){
			//检查预算编号
			if (!spend.proNo || spend.proNo == '' ||  spend.proNo == 'null' || spend.proNo == '请选择') {
			    isProNoValid=false;
			}	
			//检查花销分类
			if (!spend.budgetType || spend.budgetType == '' ||  spend.budgetType == 'null' || spend.budgetType == '请选择') {
			    isbudgetTypeValid=false;
			}		
			if(assortList!=null && assortList!='[]'){
				$.each(assortList,function(i,assort){
					if(spend.budgetType == '团队建设费'){
						if(spend.spendNo == assort.spendNo){
							if(assort.teamSite==''){
								isTeamSiteValid=false;
							}
							if(assort.teamUser==''){
								isTeamUserValid=false;
							}
						}
					}
					
				});
			}
		});
		if (!isProNoValid) {
		    mui.confirm('请选择与预算编号', '', btnArray, function(e) {
			}); 
			return false;
		}
		if (!isbudgetTypeValid) {
		    mui.confirm('请选择花销分类', '', btnArray, function(e) {
			}); 
			return false;
		}
		if (!isTeamSiteValid) {
			mui.confirm('团建日期和地点内容不能为空', '', btnArray, function(e) {
			});  
			return false;
		}
		if (!isTeamUserValid) {
			mui.confirm('团建人员不能为空', '', btnArray, function(e) {
			});
			return false;
		}	
	}
	if(assortList!=null && assortList!='[]'){
		var isSpendMoneyValid = true;
		var isTicketInfoValid = true;
		var isOperationTypeValid = true;
		var isTicketComValid = true;
		$.each(assortList,function(i,assort){
			if(assort.spendMoney =='undefined' || assort.spendMoney == null || assort.spendMoney==''||isNaN(assort.spendMoney)||assort.spendMoney>100000){
				isSpendMoneyValid=false;
			}
			if(assort.ticketInfo==''){
				isTicketInfoValid=false;
			}
			var ticketTypeValue = assort.ticketType;
			if (ticketTypeValue =='请选择' || ticketTypeValue == '' || ticketTypeValue =='undefined' || ticketTypeValue == null) {
			    isTicketTypeValid = false;
			} 
			//"value":"增值税","text":"增值税专用发票"},{"value":"非增值税","text":"非增值税专用发票"

			if(assort.operationType == '请选择'){
				isOperationTypeValid=false;
				/**if(assort.code=='JP00' || assort.code=='JD00' || assort.code=='CC00' || assort.code=='BB00' || assort.code=='ZJ00' 
				 	|| assort.code=='TX00'  || assort.code.length>5){
					mui.toast("报销编号必须是四位,且不能是系统指定的报销编号！");
					assort.code='';
					flag1=false;
					return false;
				}**/
			}
			if(assort.ticketCom =='undefined' || assort.ticketCom == null || assort.ticketCom==''){
				isTicketComValid=false;
			}

		});
		if (!isOperationTypeValid) {
			mui.confirm('请选择操作类型', '', btnArray, function(e) {
			});
			return false;
		}
		if (!isTicketTypeValid) {
			mui.confirm('请选择发票类型', '', btnArray, function(e) {
			});
			return false;
		}

		if (flag != '' && flag != 'undefined' && flag == '1' && flag != null && !isTicketComValid) {
			mui.confirm('开票单位不能为空', '', btnArray, function(e) {
			});
			return false;
		}
		if (!isTicketInfoValid) {
			mui.confirm('发票内容不能为空', '', btnArray, function(e) {
			});
			return false;
		}
	}
	//设置提交状态
	var dailyInfo = eval('('+localStorage.dailyInfo+')');
	dailyInfo.state = flag;
	dailyInfo.dailyDate = stringToDate(dailyInfo.dailyDateStr);
	if(dailyInfo.subState=='日报已存在'){
		mui.toast('日报已存在！');
		return false;
	}
	
	dailyInfo = JSON.stringify(dailyInfo);
	//日报基本信息在前一个页面带过来
	dailyMode.dailyInfo=dailyInfo;
	
	var workList = localStorage.workList;
	if(flag==1&&(workList==null||workList.length=='[]')){
		mui.toast('请填写工作内容');
		return false;
	}
	var dailyPlanList = eval('('+localStorage.dailyPlanList+')');
	dailyPlanList = JSON.stringify(dailyPlanList);
	dailyMode.dailyPlanList=dailyPlanList;
	dailyMode.dailWorkList=workList;
	dailyMode.dailyAssortList=localStorage.dailyAssortList;
	dailyMode.dailySpends=localStorage.dailySpends;
	var daily=JSON.stringify(dailyMode);
	var newDailyObj = {};
	newDailyObj.userName=appUserInfo.mUserName;
	newDailyObj.wxUserId=preId+appUserInfo.mWxUserId;
	newDailyObj.daily=dailyMode;
	if(didiIds){
		newDailyObj.didiIds=didiIds;
	}
	if(hotelIds){
		newDailyObj.hotelIds=hotelIds;
	}
	if(listTemp){
		newDailyObj.listTemp=listTemp;
	}
	var newDailyJson = JSON.stringify(newDailyObj);
	$.ajax({
		url: pathUrl+'/saveDailyInfo.action',
		type:'post',
		data : newDailyJson,
		async:false,/*同步请求*/
		contentType:"application/json",
		error : function(){
			mui.confirm('操作失败！', '', btnArray, function(e) {
			});
		},
		success:function(data){
		    if (data) {
			    var jsonData = eval('('+data+')');
			    var flag= jsonData.flag;
			    if(flag == true){
				    localStorage.removeItem('dailyMode');
				    localStorage.removeItem('dailyAssortList');
				    localStorage.removeItem('dailySpends');
				    localStorage.removeItem('dailyInfo');
				    localStorage.removeItem('workList');
				    localStorage = null;
				    mui.confirm('操作成功！', '', btnArray, function(e) {
					    mui.openWindow({
						    url:"daliyList.html"
					    });
				    });
			    } else {
			        if (!jsonData.msg || jsonData.msg == null || jsonData.msg == 'undefined' || jsonData.msg == "") {
			             jsonData.msg = "保存日报失败，请联系管理员";			        
			        }
				    mui.confirm(jsonData.msg, '', btnArray, function(e) {
				    });
			    }
			} else {
				mui.confirm('操作失败！', '', btnArray, function(e) {
				});
			}
		}    
	});
}

/**
*判断出差报销填写数量
*/
function checks(){
		var aa=$("span[name='operationType']").text();
    	var count = 0;
		while(aa.indexOf("出差补助") != -1){
		    aa = aa.substring(aa.indexOf("出差补助")+4,aa.length);       
			count++;
			if(count>1){
				mui.alert("出差补助只能填写1次！");
				return false;
			}
   		}
		while(aa.indexOf("高原补助") != -1){
		    aa = aa.substring(aa.indexOf("高原补助")+1,aa.length);       
			count++;
			if(count>1){
				mui.alert("高原补助只能填写1次！");
				return false;
			}
		}
		while(aa.indexOf("海外出差补助") != -1){
		    aa = aa.substring(aa.indexOf("海外出差补助")+6,aa.length);       
			count++;
			if(count>1){
				mui.alert("海外出差补助只能填写1次！");
				return false;
			}
   		}
		while(aa.indexOf("入疆补助") != -1){
		    aa = aa.substring(aa.indexOf("入疆补助")+4,aa.length);       
			count++;
			if(count>1){
				mui.alert("入疆补助只能填写1次！");
				return false;
			}
   		}
		while(aa.indexOf("通讯补助") != -1){
			isTxf=1;
			localStorage.isTxf=1;
		    aa = aa.substring(aa.indexOf("通讯补助")+4,aa.length);       
			count++;
			if(count>1){
				mui.alert("通讯补助只能填写1次！");
				return false;
			}
   		}
	return true;
}
//跳转到报工列表页面
function backDailyList(){
	mui.openWindow({
		url:"daliyList.html"
	});
}

//跳转到发票页面
function toInvoicePage(spendData,companys,invoiceIdArr) {
	var dailyMode = new Object();
	localStorage.dailySpends = getSpendList();
	localStorage.dailyAssortList = getAssortList();
	dailyMode.dailWorkList=localStorage.dailWorkList;
	dailyMode.dailyAssortList=localStorage.dailyAssortList;
	dailyMode.dailySpends=localStorage.dailySpends;
	dailyMode.dailyInfo=localStorage.dailyInfo;
	var daily=JSON.stringify(dailyMode);
	mui.openWindow( {
	    url:"report-expense-invoice.html?company=" + companys+"&spendData=" + spendData + "&invoiceIdArray=" + invoiceIdArr
	});
}

//获取div修改配置（操作类型为发票池时不能修改内容）
function onlyRead(data) {
	var ticketTypeVal;
	var values=document.getElementsByName("operationType");
	//为2时，是从发票池回显的数据
	if(data == '2' && data){
		for(var i=0;i<values.length;i++) {
			var value = values[i].innerText;
			if(value=='发票池') {
				var inputId =values[i].id;
				var divId=$("#"+inputId).parent().parent().parent().attr('id');
				var num = inputId.split("_");
				$('#'+divId+' ul li input').attr("readonly", true);
				$('#ticketType_'+num[1]).attr("onclick", null);
				//开票单位为空时，可编辑
				var ticketComValue = $('#'+divId+' ul li input[name=ticketCom]').val();
				if(ticketComValue == '' || ticketComValue == null){
					$('#'+divId+' ul li input[name=ticketCom]').attr("readonly", false);
				};
				//花销金额
				$('#'+divId+' ul li input[name=spendMoney]').attr("readonly", false);
				//发票内容
				$('#'+divId+' ul li input[name=ticketInfo]').attr("readonly", false);
				//乘车原因/时间
				$('#'+divId+' ul li input[name=rideTime]').attr("readonly", false);
			}
			//现金状态时，禁用划卡消费日期
			disableSpend(divId);
		}
		//发票内容禁止输入
		$('#'+divId+' ul li input[name=ticketInfo]').attr("readonly", true);
	}else {
		for(var i=0;i<values.length;i++) {
			var value = values[i].innerText;
			if(value=='发票池') {
				var inputId =values[i].id;
				var divId=$("#"+inputId).parent().parent().parent().attr('id');
				var num = inputId.split("_");
				$('#'+divId+' ul li input').attr("readonly", true);
				//$('#ticketType_'+num[1]).attr("onclick", null);
				ticketType = $('#ticketType_'+num[1]).text();
				//开票单位为空时，可编辑
				var ticketComValue = $('#'+divId+' ul li input[name=ticketCom]').val();
				if(ticketComValue == '' || ticketComValue == null){
					$('#'+divId+' ul li input[name=ticketCom]').attr("readonly", false);
				};
				//花销金额
				$('#'+divId+' ul li input[name=spendMoney]').attr("readonly", false);
				//发票内容
				$('#'+divId+' ul li input[name=ticketInfo]').attr("readonly", false);
				//乘车原因/时间
				$('#'+divId+' ul li input[name=rideTime]').attr("readonly", false);
			}
			//现金状态时，禁用划卡消费日期
			disableSpend(divId);
		}
	}

};

//发票池改为别的时，页面状态初始化
function notOnlyRead(clickId,value) {
	var divId=$("#"+clickId).parent().parent().parent().attr('id');
	var num = clickId.split("_");
	$('#'+divId+' ul li input').attr("readonly", false);
	$('#ticketType_'+num[1]).attr("onclick", "addSelectTicket(this);");
	$('#'+divId+' ul li input').val('');
	$('#'+divId+' ul li textarea').val('');
    if(value == '出差补助'){
   		$('#'+divId+' ul li input[name="code"]').attr("readonly", true);
   		$('#'+divId+' ul li input[name="code"]').val("CC00");
   		$('#'+divId+' ul li input[name="spendMoney"]').val("80");
   		$('#'+divId+' ul li input[name="ticketCom"]').val("锐安");
   		$('#'+divId+' ul li input[name="ticketInfo"]').val("锐安");
	}else if(value == '发票未到报备'){
   		$('#'+divId+' ul li input[name="code"]').attr("readonly", true);
   		$('#'+divId+' ul li input[name="code"]').val("BB00");
   		$('#'+divId+' ul li input[name="spendMoney"]').attr("readonly", true);
   		$('#'+divId+' ul li input[name="spendMoney"]').val("0");
	}else if(value == '专家费'){
   		$('#'+divId+' ul li input[name="code"]').attr("readonly", true);
   		$('#'+divId+' ul li input[name="code"]').val("ZJ00");
   		$('#'+divId+' ul li input[name="spendMoney"]').val("");
	}else if(value == '通讯费'){
   		$('#'+divId+' ul li input[name="code"]').attr("readonly", true);
   		$('#'+divId+' ul li input[name="code"]').val("TX00");
   		$('#'+divId+' ul li input[name="spendMoney"]').val("10");
   		$('#'+divId+' ul li input[name="ticketCom"]').val("锐安");
   		$('#'+divId+' ul li input[name="ticketInfo"]').val("锐安");
	}else{
		$('#'+divId+' ul li input[name="code"]').val("");
		$('#'+divId+' ul li input[name="spendMoney"]').val("");
		$('#'+divId+' ul li input[name="code"]').attr("onkeyup", "this.value=this.value.replace(/(![^\w_]|JP00|JD00|CC00|BB00|ZJ00|TX00)/gi,'')");
		$('#'+divId+' ul li input[name="code"]').attr("onblur", "expense(this)");
	}
};
//页面报销编号数据校验
function expense(obj) {
	var code = $(obj).val();
	if (code.length != 4) {
		$(obj).val("");
		mui.toast("报销编号必须是四位,且不能是系统指定的报销编号！");
	}
}

//两个时间相差天数 
function datedifference(sDate1, sDate2) {    //sDate1和sDate2是2006-12-18格式  
    var dateSpan,
        tempDate,
        iDays;
    sDate1 = Date.parse(sDate1);
    sDate2 = Date.parse(sDate2);
    dateSpan = sDate2 - sDate1;
    dateSpan = Math.abs(dateSpan);
    iDays = Math.floor(dateSpan / (24 * 3600 * 1000));
    return iDays
};

//获取当前时间
function getNowFormatDate() {
    var date = new Date();
    //date.setTime(str)
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

//修改为团队建设费时，显示团建地点和团建人员
function showParty(budgetId){
	var receiptId = $("#"+budgetId).parent().parent().parent().parent().parent().find("div[name='allreceipt']").attr("id");
    //var siteIds=$('#'+receiptId+' div ul li input[name=teamSite]');
    var siteId=[];
    $('#'+receiptId+' div ul li input[name=teamSite]').each(function(){
    	siteId.push($(this).attr('id'));
    });
    var peopleId=[];
    $('#'+receiptId+' div ul li input[name=teamUser]').each(function(){
    	peopleId.push($(this).attr('id'));
    });
   	//团建时间和人员显示出来
   	siteId.forEach(function(item,i) {
   		$("#"+item).parent().show();
   	}); 
   	peopleId.forEach(function(item,i) {
   		$("#"+item).parent().show();
	}); 
}
//票据是直接回显的(滴滴发票/)不能修改内容
function updateStatus() {
	var dataStatus = $("input[name='didiId']");
	if(dataStatus.length > 0){
		dataStatus.each(function(){
			var idValue = $(this).attr('id');
			var dataValue = $("#"+idValue).val();
			if(dataValue && dataValue != '' && dataValue != 'undefined'){			
				var parentId = $(this).parent().parent().parent().attr('id');
				var grandParent = $(this).parent().parent().parent().parent().parent();
				var expenseDel = grandParent.find("div[name='expenseDel']").attr("id");
				var addReceipt = grandParent.find("a[name='addReceipt']").attr("id");
				var proNo = grandParent.find("span[name='proNo']").attr("id");
				var spendType = grandParent.find("span[name='spendType']").attr("id");
				var spendDate = grandParent.find("span[name='spendDate']").attr("id");
				//设置票据内容不能修改
				$('#'+parentId+' ul li input').attr("readonly",true);
				$('#'+parentId+' ul li textarea').attr("readonly",true);
				$('#'+parentId+' ul li span').attr("onclick",'');
				//设置预算编号/消费类型/划卡消费日期 不可修改
				$('#'+proNo).removeAttr('onclick');
				$('#'+spendType).removeAttr('onclick');
				$('#'+spendDate).removeAttr('onclick');
				$('#'+spendDate).html('');
				//设置  不能删除报销单和不能添加票据
				$('#'+expenseDel).removeAttr('onclick');
				$('#'+addReceipt).removeAttr('onclick');
				$('#'+expenseDel).css('opacity','0.2');
				$('#'+addReceipt).css('opacity','0.2');
			}		
		});
	}
};
//从发票池回显的数据'现金'时禁用划卡消费日期
function disableSpend(data){
	var htmlValue = $("#"+data).parent().parent();
	var spendTvalu = htmlValue.find("span[name='spendType']").html();
	if(spendTvalu == '现金'){
		var spendDaId = htmlValue.find("span[name='spendDate']").attr('id');
		$('#'+spendDaId).hide();
	}
};
//删除日报内容时，更新发票池对应的发票状态
function updateTicketSta(dataValue){
	var arrayNumb = new Array();
	var invoiceIdData;
	if(dataValue.indexOf(',') != -1){
		var invoiceIdDataValue = dataValue.split(',');
		invoiceIdDataValue.forEach(function(invoiceValue,i){
			invoiceIdData={"id":invoiceValue,"daily_temp_status":0,"dailyDate":dailyDate};
			arrayNumb.push(invoiceIdData);
		});
	} else {
		invoiceIdData={"id":dataValue,"daily_temp_status":0,"dailyDate":dailyDate};
		arrayNumb.push(invoiceIdData);
	};
	
	var invoiceIdList = JSON.stringify(arrayNumb);
	$.ajax({
		type: "post",
		async: false,
		url:pathUrl+"/updateTicketStatus.action",
		data : {
			invoiceIdList:invoiceIdList
		},
		cache:false,
		dataType: "json",
		success:function(data){
		   
        }
    });
}
//发票单号输入校验
/**function codeCheck(oneReceiptId){
	$('#'+oneReceiptId+' ul li input[name="code"]').attr("onkeyup", "this.value=this.value.replace(/(![^\w_]|JP00|JD00|CC00|BB00|ZJ00|TX00)/gi,'')");
	$('#'+oneReceiptId+' ul li input[name="code"]').attr("onblur", "expense(this)");
}**/