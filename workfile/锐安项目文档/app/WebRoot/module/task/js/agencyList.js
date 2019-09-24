var appUserInfo = {};
var count = 0;
var page = 1;
//页面初始化-初始化微信用户信息及代办列表信息
(function($,doc){
	mui.init({
		pullRefresh: {
			container: '#pullrefresh',
			down: {
				callback: pulldownRefresh
			},
			up: {
				contentrefresh: '正在加载...',
				callback: pullupRefresh
			}
		}
	});
	setTimeout(function () {
	    if(localStorage.wxUser!=null){
		    var data = JSON.parse(localStorage.wxUser);
		    appUserInfo.mUserName = data.userName;
		    appUserInfo.mUserId = data.userId;
		    getDataList();
	    }else{
	    	mui.toast('网络异常！');
	    }	
	}, 800);
	$.ready(function() {
		var _getParam = function(obj, param) {
			return obj[param] || '';
		};
		//类型列表
		var showStyle = new $.PopPicker();
		showStyle.setData([
		    {
			    value: '日报审批',
			    text: '日报审批'
		    },
			{
			    value: '考勤补登',
			    text: '考勤补登'
		    },  
		    {
			    value: '加班申请',
			    text: '加班申请'
		    }, 
	        {
			    value: '考勤异常申请',
			    text: '考勤异常申请'
		    },
		    {
			    value: '请假申请',
			    text: '请假申请'
		    },
			{
			    value: '日报费用',
			    text: '日报费用'
		    },
			{
			    value: '员工招待费',
			    text: '员工招待费'
		    },
		    {
			    value: '请假申请撤销',
			    text: '请假申请撤销'
		    },
		    {
			    value: '年度预算变更',
			    text: '年度预算变更'
		    },
		    {
			    value: '年度采购供货协议',
			    text: '年度采购供货协议'
		    },
		    {
			    value: '年度采购供货协议作废',
			    text: '年度采购供货协议作废'
		    },
		    {
			    value: '销售项目合作协议',
			    text: '销售项目合作协议'
		    },
		    {
			    value: '销售项目合作协议作废',
			    text: '销售项目合作协议作废'
		    },
		    {
			    value: '生态伙伴合作框架协议',
			    text: '生态伙伴合作框架协议'
		    },
		    {
			    value: '生态伙伴合作框架协议作废',
			    text: '生态伙伴合作框架协议作废'
		    },
		    {
			    value: '课题联合申报协议',
			    text: '课题联合申报协议'
		    },
		    {
			    value: '课题联合申报协议作废',
			    text: '课题联合申报协议作废'
		    },
		    {
			    value: '产品、服务代理协议',
			    text: '产品、服务代理协议'
		    },
		    {
			    value: '产品、服务代理协议作废',
			    text: '产品、服务代理协议作废'
		    },
			{
			    value: '产品研发战略合作协议',
			    text: '产品研发战略合作协议'
		    },
		    {
			    value: '产品研发战略合作协议作废',
			    text: '产品研发战略合作协议作废'
		    },
		    {
			    value: '费用类资金使用申请',
			    text: '费用类资金使用申请'
		    },
		    {
			    value: '费用类资金使用申请_作废',
			    text: '费用类资金使用申请_作废'
		    },
		    {
			    value: '资金直接支付申请',
			    text: '资金直接支付申请'
		    },
		    {
			    value: '销售立项',
			    text: '销售立项'
		    },
		    {
			    value: '销售项目-费用增补',
			    text: '销售项目-费用增补'
		    },
		    {
			    value: '销售项目-变更基本信息',
			    text: '销售项目-变更基本信息'
		    },
		    {
			    value: '销售立项里程碑变更',
			    text: '销售立项里程碑变更'
		    },
		    {
			    value: '销售项目-里程碑关闭',
			    text: '销售项目-里程碑关闭'
		    },
			{
			    value: '销售项目-成员变更',
			    text: '销售项目-成员变更'
		    }, {
			    value: '销售项目-经理变更',
			    text: '销售项目-经理变更'
		    }, 
			{
			    value: '销售项目结项',
			    text: '销售项目结项'
		    }
		]);
		var showStyleButton = doc.getElementById('showStyle');
		var styleResult = doc.getElementById('showStyle');
		showStyleButton.addEventListener('tap', function(event) {
			showStyle.show(function(items) {
				styleResult.innerText = items[0].text;
				getDataList();
			});
		}, false);
	});
	
})(mui,document);

//日报处理
$("#agency-content").on('tap', '.dailyView', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"dailyAudit.html",
	    });
	}
});

//补登处理
$("#agency-content").on('tap', '.redemView', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"remedyAudit.html",
	    });
	}
});

//加班申请处理
$("#agency-content").on('tap', '.overtimeView', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"overtimeAudit.html",
	    });
	}
});

//请假申请处理
$("#agency-content").on('tap', '.vacationView', function(event){  
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"leaveApplyAudit.html", 
	    });
	}
});

//考勤异常申请处理
$("#agency-content").on('tap', '.unusualView', function(event){  
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"unusualAudit.html", 
	    });
	}
});

//日报费用报销
$("#agency-content").on('tap', '.dailySpendView', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"dailyCost.html", // 需要新增的页面
	    });
	}
});

//员工招待费调整
$("#agency-content").on('tap', '.staffEntertainView', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"entertainmentAudit.html",
	    });
	}
});

//请假申请撤销
$("#agency-content").on('tap', '.vocationBackView', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"leaveBackAudit.html",
	    });
	}
});
//年度采购
$("#agency-content").on('tap', '.purchase', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"purchase.html",
	    });
	}
});
//产品研发作废
$("#agency-content").on('tap', '.productDevelopRevoke', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"productDevelopRevoke.html",
	    });
	}
});
//年度采购作废
$("#agency-content").on('tap', '.purchaseRevoke', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"purchaseRevoke.html",
	    });
	}
});
//销售合作协议
$("#agency-content").on('tap', '.sales_Projects', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"sales_Projects.html",
	    });
	}
});
//销售合作协议作废
$("#agency-content").on('tap', '.sales_ProjectsRevoke', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"sales_ProjectsRevoke.html",
	    });
	}
});
//产品研发合作协议
$("#agency-content").on('tap', '.productDevelop', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"productDevelop.html",
	    });
	}
});
//产品研发合作协议作废
$("#agency-content").on('tap', '.productDevelopRevoke', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"productDevelopRevoke.html",
	    });
	}
});
//费用资金申请作废
$("#agency-content").on('tap', '.capitalApplyRevoke', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"capitalApplyRevoke.html",
	    });
	}
});
//费用资金申请
$("#agency-content").on('tap', '.capitalApply', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"capitalApply.html",
	    });
	}
});
//费用类资金直接支付申请
$("#agency-content").on('tap', '.capitalPay', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"capitalPay.html",
	    });
	}
});
//年度预算变更
$("#agency-content").on('tap', '.budgetChangeView', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"budgetChangeAudit.html",
	    });
	}
});
//生态伙伴合作协议
$("#agency-content").on('tap', '.ecologicalPartners', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"ecologicalPartners.html",
	    });
	}
});
//生态伙伴合作协议作废
$("#agency-content").on('tap', '.ecologPartnersRevoke', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"ecologicalPartnersRevoke.html",
	    });
	}
});
//产品、服务代理协议
$("#agency-content").on('tap', '.serviceAgent', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"serviceAgent.html",
	    });
	}
});
//产品、服务代理协议作废
$("#agency-content").on('tap', '.serviceAgentRevoke', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"serviceAgentRevoke.html",
	    });
	}
});
//销售项目立项
$("#agency-content").on('tap', '.saleApprovexmlx', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"saleApprovexmlx.html",
	    });
	}
});
//销售项目_变更基本信息
$("#agency-content").on('tap', '.saleApprovebgjbxx', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"saleApprovebgjbxx.html",
	    });
	}
});
//销售项目_里程碑变更
$("#agency-content").on('tap', '.saleApprovelcbbg', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"saleApprovelcbbg.html",
	    });
	}
});
//销售项目-经理变更审批流程
$("#agency-content").on('tap', '.saleApprovexmjlbg', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"saleApprovexmjlbg.html",
	    });
	}
});
//销售项目_里程碑关闭
$("#agency-content").on('tap', '.saleApprovelcbgb', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"saleApprovelcbgb.html",
	    });
	}
});
//销售项目_成员变更
$("#agency-content").on('tap', '.saleApprovecybg', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"saleApprovecybg.html",
	    });
	}
});
//销售项目-费用增补流程
$("#agency-content").on('tap', '.saleApprovefyzb', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"saleApprovefyzb.html",
	    });
	}
});
//销售项目-结项
$("#agency-content").on('tap', '.saleApprovejx', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"saleApprovejx.html",
	    });
	}
});
/**
* 上拉加载具体业务实现
*/
function pullupRefresh() {
	setTimeout(function() {
	  var type = document.getElementById('showStyle').innerHTML;
	  if (type) {
	      if (type == '类型') {
	          type = '';
	      } else if (type == '日报审批') {
	          type = '日报审批流程v2.0';
	      }else if(type == '考勤补登'){
	      	  type = '考勤补登';
	      }else if(type == '加班申请'){
	    	  type = '加班申请流程V2.0';
	      }else if(type == '考勤异常申请'){
	      	  type = '考勤异常申请流程';
	      }else if(type == '请假申请'){
	      	  type = '请假申请流程V5.0';
	      }else if(type == '日报费用'){
	      	  type = '日报费用流程审批2.0';
	      }else if(type == '员工招待费'){
	    	  type = '员工招待费调整';
	      }else if (type == '请假申请撤销') {
	          type = '请假撤销流程V3.0';
	      }else if (type == '年度预算变更') {
	          type = '年度预算变更流程';
	      }else if (type == '年度采购供货协议') {
	    	  type = '年度采购供货协议V3.0';
	      }else if (type == '年度采购供货协议作废') {
	    	  type = '年度采购供货协议作废V3.0';
	      }else if(type == '销售项目合作协议'){
	      	  type = '销售项目合作协议审批v4.0';
	      }else if(type == '销售项目合作协议作废'){
	    	  type = '销售项目合作协议作废v2.0';
	      }else if(type == '生态伙伴合作框架协议'){
	      	  type = '生态伙伴合作框架协议3.0';
	      }else if(type == '生态伙伴合作框架协议作废'){
	      	  type = '生态伙伴合作框架协议作废';
	      }else if(type == '课题联合申报协议'){
	      	  type = '课题联合申报协议2';
	      }else if(type == '课题联合申报协议作废'){
	      	  type = '课题联合申报协议作废2';
	      }else if(type == '产品、服务代理协议'){
	      	  type = '产品、服务代理协议';
	      }else if(type == '产品、服务代理协议作废'){
	      	  type = '产品、服务代理协议作废';
	      }else if(type == '产品研发战略合作协议'){
	    	  type = '产品研发战略合作协议3.0';
	      }else if(type == '产品研发战略合作协议作废'){
	    	  type = '产品研发战略合作协议作废';
	      }else if(type == '费用类资金使用申请'){
	      	  type = '费用类资金使用申请V2.0';
	      }else if(type == '费用类资金使用申请_作废'){
	      	  type = '费用类资金使用申请_作废';
	      }else if(type == '资金直接支付申请'){
	      	  type = '资金直接支付申请2';
	      }else if(type == '销售立项'){
	      	  type = '销售立项审批流程V2.0';
	      }else if(type == '销售项目-费用增补'){
	    	  type = '销售项目-费用增补流程V1.1';
	      }else if(type == '销售项目-变更基本信息'){
	    	  type = '销售项目-变更基本信息审批流V2.0';
	      }else if(type == '销售立项里程碑变更'){
	    	  type = '销售立项里程碑变更';
	      }else if(type == '销售项目-里程碑关闭'){
	    	  type = '销售项目-里程碑关闭流程';
	      }else if(type == '销售项目-成员变更'){
	    	  type = '销售项目-成员变更流程';
	      }else if(type == '销售项目-经理变更'){
	    	  type = '销售项目-经理变更审批流程';
	      }else if(type == '销售项目结项'){
	    	  type = '销售项目结项流程';
	      }
	  }
	  page++;
	  $.ajax({
		url: pathUrl +'/agencyList.action',
		type:'post',
		data:{
		    applyUserId:appUserInfo.mUserId,
			type:type,
			currentPage:page,
			pageSize:10
		},
		async:false,/*同步请求*/
		dataType:"jsonp",
		jsonp:"callback",
		jsonpCallback:'flightHandler',
		error : function(){
			mui.toast("获取登录用户信息失败！");
		},
		success:function(data){
		   	var dataList = "";
		    var jsonData = JSON.parse(data); 
		   	mui('#pullrefresh').pullRefresh().endPullupToRefresh((jsonData.dataSize == 0 || jsonData.dataSize < 100)); 	
		    //$("#agency-content").html('');	    
		    if (jsonData.dataList) {
		      $.each(jsonData.dataList,function(i,pending){	
				    if(pending.procName == '日报审批流程v2.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="dailyView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';				
					} else if (pending.procName == '考勤补登') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="redemView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';				
					} else if (pending.procName == '加班申请流程V2.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="overtimeView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';				
					} else if (pending.procName == '考勤异常申请流程') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="unusualView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';				
					}else if (pending.procName == '请假申请流程V5.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="vacationView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';				
					}else if (pending.procName == '日报费用流程审批2.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="dailySpendView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';				
					}else if (pending.procName == '员工招待费调整') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="staffEntertainView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';				
					} else if (pending.procName == '请假撤销流程V3.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="vocationBackView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';				
					}else if (pending.procName == '年度预算变更流程') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="budgetChangeView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';				
					}else if (pending.procName == '年度采购供货协议V3.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="purchase" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';				
					}else if (pending.procName == '销售项目合作协议审批v4.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="sales_Projects" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '年度采购供货协议作废V3.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="purchaseRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '生态伙伴合作框架协议3.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="ecologicalPartners" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '课题联合申报协议2') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="ecologicalPartners" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '产品、服务代理协议') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="serviceAgent" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '销售项目合作协议作废v2.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="sales_ProjectsRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';				
					}else if (pending.procName == '生态伙伴合作框架协议作废') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="ecologPartnersRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '课题联合申报协议作废2') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="ecologPartnersRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '产品、服务代理协议作废') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="serviceAgentRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '产品研发战略合作协议3.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="productDevelop" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '产品研发战略合作协议作废') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="productDevelopRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '费用类资金使用申请_作废') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="capitalApplyRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '资金直接支付申请2') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="capitalPay" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '费用类资金使用申请V2.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="capitalApply" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '销售立项审批流程V2.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="saleApprovexmlx" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '销售项目-费用增补流程V1.1') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="saleApprovefyzb" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '销售项目-变更基本信息审批流V2.0') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="saleApprovebgjbxx" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '销售立项里程碑变更') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="saleApprovelcbbg" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '销售项目-里程碑关闭流程') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="saleApprovelcbgb" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '销售项目-成员变更流程') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="saleApprovecybg" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '销售项目-经理变更审批流程') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="saleApprovexmjlbg" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}else if (pending.procName == '销售项目结项流程') {
						dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
				    			     '<li class="mui-media relative mui-table-view-cell">'+
								     	'<div>'+
										    '<a class="saleApprovejx" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
								     		'<div class="myui-list-title mui-pull-left">'+
								     			'<span>'+ pending.procName +'</span>'+
								     		'</div>'+
								     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
								     			pending.procInstStartUser +
								     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
								     		'</div>'+							     		
								     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
								     	'</div>'+
								     '</li>'+
								     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
								     	'<div>'+
								     		'节点：'+ pending.taskName +
								     	'</div>'+
								     '</li>'+
								'</ul>';
					}
				    $("#agency-content").append(dataList);
		      });	    
		    }
	   	}    
   	});  
	}, 1500);
}

/**
 * 下拉刷新具体业务实现
 */
function pulldownRefresh() {
	setTimeout(function() {
		getDataList();
		mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
		mui('#pullrefresh').pullRefresh().refresh(true); //上拉后可以再次加载
	}, 1500);
}
/**
 * 获取待办列表
 */
function getDataList(){
	var type = document.getElementById('showStyle').innerHTML;
	  if (type) {
	      if (type == '类型') {
	          type = '';
	      } else if (type == '日报审批') {
	          type = '日报审批流程v2.0';
	      }else if(type == '考勤补登'){
	      	  type = '考勤补登';
	      }else if(type == '加班申请'){
	    	  type = '加班申请流程V2.0';
	      }else if(type == '考勤异常申请'){
	      	  type = '考勤异常申请流程';
	      }else if(type == '请假申请'){
	      	  type = '请假申请流程V5.0';
	      }else if(type == '日报费用'){
	      	  type = '日报费用流程审批2.0';
	      }else if(type == '员工招待费'){
	    	  type = '员工招待费调整';
	      }else if (type == '请假申请撤销') {
	          type = '请假撤销流程V3.0';
	      }else if (type == '年度预算变更') {
	          type = '年度预算变更流程';
	      }else if (type == '年度采购供货协议') {
	    	  type = '年度采购供货协议V3.0';
	      }else if (type == '年度采购供货协议作废') {
	    	  type = '年度采购供货协议作废V3.0';
	      }else if(type == '销售项目合作协议'){
	      	  type = '销售项目合作协议审批v4.0';
	      }else if(type == '销售项目合作协议作废'){
	    	  type = '销售项目合作协议作废v2.0';
	      }else if(type == '生态伙伴合作框架协议'){
	      	  type = '生态伙伴合作框架协议3.0';
	      }else if(type == '生态伙伴合作框架协议作废'){
	      	  type = '生态伙伴合作框架协议作废';
	      }else if(type == '课题联合申报协议'){
	      	  type = '课题联合申报协议2';
	      }else if(type == '课题联合申报协议作废'){
	      	  type = '课题联合申报协议作废2';
	      }else if(type == '产品、服务代理协议'){
	      	  type = '产品、服务代理协议';
	      }else if(type == '产品、服务代理协议作废'){
	      	  type = '产品、服务代理协议作废';
	      }else if(type == '产品研发战略合作协议'){
	    	  type = '产品研发战略合作协议3.0';
	      }else if(type == '产品研发战略合作协议作废'){
	    	  type = '产品研发战略合作协议作废';
	      }else if(type == '费用类资金使用申请'){
	      	  type = '费用类资金使用申请V2.0';
	      }else if(type == '费用类资金使用申请_作废'){
	      	  type = '费用类资金使用申请_作废';
	      }else if(type == '资金直接支付申请'){
	      	  type = '资金直接支付申请2';
	      }else if(type == '销售立项'){
	      	  type = '销售立项审批流程V2.0';
	      }else if(type == '销售项目-费用增补'){
	    	  type = '销售项目-费用增补流程V1.1';
	      }else if(type == '销售项目-变更基本信息'){
	    	  type = '销售项目-变更基本信息审批流V2.0';
	      }else if(type == '销售立项里程碑变更'){
	    	  type = '销售立项里程碑变更';
	      }else if(type == '销售项目-里程碑关闭'){
	    	  type = '销售项目-里程碑关闭流程';
	      }else if(type == '销售项目-成员变更'){
	    	  type = '销售项目-成员变更流程';
	      }else if(type == '销售项目-经理变更'){
	    	  type = '销售项目-经理变更审批流程';
	      }else if(type == '销售项目结项'){
	    	  type = '销售项目结项流程';
	      }
	  }
	page = 1;
	$.ajax({
	    url: pathUrl +'/agencyList.action',
		type:"post",
		data:{
		    applyUserId:appUserInfo.mUserId,
			type:type,
			currentPage:page,
			pageSize:10
		},
		async:false,/*同步请求*/
		dataType:"jsonp",
		jsonp:"callback",
		jsonpCallback:'flightHandler',
		error : function(){
			mui.toast("获取登录用户信息失败！");
		},
		success:function(data){
		    var jsonData = JSON.parse(data); 
		   	var dataList = "";
		    $("#agency-content").html('');
		    if (jsonData.dataList) {
		      $.each(jsonData.dataList,function(i,pending){
			    if(pending.procName == '日报审批流程v2.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="dailyView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				} else if (pending.procName == '考勤补登') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="redemView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				} else if (pending.procName == '加班申请流程V2.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="overtimeView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				} else if (pending.procName == '考勤异常申请流程') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="unusualView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}else if (pending.procName == '请假申请流程V5.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="vacationView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}else if (pending.procName == '日报费用流程审批2.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="dailySpendView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}else if (pending.procName == '员工招待费调整') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="staffEntertainView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				} else if (pending.procName == '请假撤销流程V3.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="vocationBackView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}else if (pending.procName == '年度预算变更流程') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="budgetChangeView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}else if (pending.procName == '年度采购供货协议V3.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="purchase" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}else if (pending.procName == '销售项目合作协议审批v4.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="sales_Projects" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '年度采购供货协议作废V3.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="purchaseRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '生态伙伴合作框架协议3.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="ecologicalPartners" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '课题联合申报协议2') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="ecologicalPartners" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '产品、服务代理协议') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="serviceAgent" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '销售项目合作协议作废v2.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="sales_ProjectsRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}else if (pending.procName == '生态伙伴合作框架协议作废') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="ecologPartnersRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '课题联合申报协议作废2') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="ecologPartnersRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '产品、服务代理协议作废') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="serviceAgentRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '产品研发战略合作协议3.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="productDevelop" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '产品研发战略合作协议作废') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="productDevelopRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '费用类资金使用申请_作废') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="capitalApplyRevoke" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '资金直接支付申请2') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="capitalPay" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '费用类资金使用申请V2.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="capitalApply" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '销售立项审批流程V2.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="saleApprovexmlx" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '销售项目-费用增补流程V1.1') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="saleApprovefyzb" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '销售项目-变更基本信息审批流V2.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="saleApprovebgjbxx" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '销售立项里程碑变更') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="saleApprovelcbbg" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '销售项目-里程碑关闭流程') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="saleApprovelcbgb" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '销售项目-成员变更流程') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="saleApprovecybg" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '销售项目-经理变更审批流程') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="saleApprovexmjlbg" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}else if (pending.procName == '销售项目结项流程') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="saleApprovejx" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left"  style="width:45%">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';
				}
				$("#agency-content").append(dataList);
		 	  });	    
		    }
		 	if($("#agency-content").html() == ''){
  			    dataList = '<div class="nodata" style="height:'+document.documentElement.clientHeight+'px">'+
						       '<P>'+
						           '您还暂时没有待办事项!'+
						       '</P>'+
						   '</div>'
  			    $("#tishi").append(dataList);
  			}
	   	}    
   	});    
} 
//获取类型列表
function getSelectType(clickId,spanId,data){
    var userPicker = new mui.PopPicker();
    userPicker.setData(data);
    var showUserPickerButton = document.getElementById(clickId);
    var userResult = document.getElementById(spanId);
    showUserPickerButton.addEventListener('tap', function(event) {
        userPicker.show(function(items) {
            userResult.innerText = items[0].text;
            getDataList();
        });
    }, false);
}
//登录信息
function logInAction(userName,wx_userId){
	$.ajax({
			url: app_login_path,
			type:'post',
			data:{userName:userName,wx_userId:preId+wx_userId},
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			success:function(data){
				setTicketToUrl(data.ticket);
			}
	});
}
//加载代办列表
function setTicketToUrl(ticket){
	app_sso_ticket=ticket;
	app_sso_path=app_sso_tgt+ticket+"&service="
	getDataList();
	initQueryCondition();
}
//加载代办数据
function initQueryCondition(){
    var data = [{value: "考勤补登", text: "考勤补登"},{value:"日报审批流程v2.0", text: "日报审批流程v2.0"}];
    getSelectType('showStyle','showStyle',data);
}

//获取所有的参数
function getParams(){
   var type=document.getElementById("showStyle").innerHTML;
   var params={};
   params.type = type;
   return params;
}