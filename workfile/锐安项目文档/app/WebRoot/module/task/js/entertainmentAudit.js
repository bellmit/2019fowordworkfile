var procInstId;
var taskId;
var taskUser;
var id;
var appUserInfo = {};
//页面初始化-初始化微信用户信息
(function($, doc) {
	$.init({
		swipeBack: true
	});
	if(localStorage.wxUser!=null){
		var data = JSON.parse(localStorage.wxUser);
		appUserInfo.mUserName=data.userName;
		appUserInfo.mUserId = data.userId;
	}else{
		mui.toast('网络异常！');
	}
	var data = JSON.parse(localStorage.obj);
	procInstId = data.procInstId;
	taskUser = data.taskUser;
	initView();
})(mui, document);

//生成员工招待费调整详细信息
function initView() {
	$.ajax({
		url:pathUrl + '/entertainmentView.action',
		type:"post",
		data:{
			procInstId:procInstId,
			taskUser:taskUser
		},
		async:false,/*同步请求*/
		dataType:'json',	
		success:function(data){
		    var result=JSON.parse(data);
		    //部门 busiZdf.askDeptName
			$("#applyUserName").text(result.busiZdf.askName);
			$("#applyTime").text(dateFormat(result.busiZdf.createDate));
			$("#applyDepart").text(result.busiZdf.askDeptName);
			var ZdfDetailList = result.busiZdf.busiZdfDetailList;
			$.each(ZdfDetailList,function(i,ZdfDetail){
				var enterType = '';
				if(ZdfDetail.type == '1'){
					enterType = "十天";
				} else {
					enterType = "月";
				}
				var html=   "<li class='mui-table-view-cell mui-media detailMsg fadeBox'>"+
				                "<div>类别：<span>" + enterType + "</span></div>" + 
					            "<div>选择开始时间：<span>" + dateFormat(ZdfDetail.startDate) +"</span></div>" + 
					            "<div>开始时间（自动）：<span>" + dateFormat(ZdfDetail.startDate) +"</span></div>" +
					            "<div>结束时间（自动）：<span>" + dateFormat(ZdfDetail.endDate) +"</span></div>" +
					            "<div>调整前限额（自动）：<span>" + ZdfDetail.currentAmount +"</span></div>" +
					            "<div>实际已花（自动）：<span>" + ZdfDetail.costAmount +"</span></div>" +
					            "<div>调整后限额（手动）：<span>" + ZdfDetail.needAmount +"</span></div>" +
					            "<div>调整后剩余可花费金额（自动）：<span>" + ZdfDetail.needAmount +"</span></div>" +
						    "</li>";
			    $("#checkDate").append(html);
			});
			$("#askReason").text(result.busiZdf.askReason);
			if (result.hasOwnProperty('askFile')) {
				$("#fileName").text(result.askFile.fileName);
			} else {
				$("#fileName").text(result.busiZdf.askFile);
			}
		}
	});
}
//提交审批
function checkleave(){
	var result=$(".mui-btn-primary").html();
	var checkComment=$("#comment").val();
	if(checkComment==''){
		mui.confirm('请填写审批意见', '', ['确定'], function(e) {
		});
		return false;
	}
	if(result=='不同意'){
		result="0";
	}else{
		result="1";
	}
	var btnArray = ['确定'];
	$.ajax({
		url:pathUrl+'/entertainmentCheck.action',
		type:"post",
		data:{
			result:result,
			checkComment:checkComment,
			procInstId:procInstId
		},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		success:function(data){
		    var result=JSON.parse(data);
			if(result.flag){
			    mui.confirm(result.msg, '提示', btnArray, function(e) {
				    mui.openWindow({
					    url:"agencyList.html"
					});
				});	
			} else {
		        mui.confirm(result.msg, '提示', btnArray, function(e) {
				    mui.openWindow({
					    url:"agencyList.html"
					});
				});
			}
		}
	});
}
/* 
* 时间格式化工具 
* 把Long类型的1527672756454日期还原yyyy-MM-dd格式日期 
*/
var dateTypeDate = ""; 
function dateFormat(longTypeDate){
	dateTypeDate = "";
	var date = new Date(); 
	date.setTime(longTypeDate); 
	dateTypeDate += date.getFullYear(); //年 
	dateTypeDate += "-" + (date.getMonth(date) + 1); //月 
	dateTypeDate += "-" + date.getDate(date); //日  
	return dateTypeDate; 
}