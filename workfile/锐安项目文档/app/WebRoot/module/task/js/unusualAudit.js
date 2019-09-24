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
	taskId = data.taskId;
	taskUser = data.taskUser;
	initView();
})(mui, document);
//加载考勤异常申请审批详情信息
function initView() {
	$.ajax({
		url:pathUrl + '/unusualAppView.action',
		type:"post",
		data:{
			procInstId:procInstId,
			taskId:taskId,
			taskUser:taskUser
		},
		async:false,/*同步请求*/
		dataType:'json',
		success:function(data){
		    var result=JSON.parse(data);
		    $("#checkState").text(result.result.checkState);
		    $("#applyUserName").text(result.result.applyUserName);
		    $("#unusualType").text(result.result.unusualType);
		    $("#applyTime").text(result.result.applyTime);
		    $("#unusualDate").text(result.result.unusualDate);
		    $("#attachmentName").text(result.result.attachmentName);
		    $("#applyReason").text(result.result.applyReason);
		    $("#checkUserName").text(result.result.checkUserName);
		    $("#checkDate").text(result.result.checkTime);
		    id = result.result.enId;
		}
	});
}
function checkleave(){
	var result=$(".mui-btn-primary").html();
	var checkComment=$("#checkComment").val();
	var time=$("#time").val();
	if(checkComment==''){
		mui.confirm('请填写审批意见', '', ['确定'], function(e) {
		});
		return false;
	}
	if(result=='不同意'){
		result="否";
	}else{
		result="是";
	}
	var btnArray = ['确定'];
	$.ajax({
		url:pathUrl+'/adjustUnusualApply.action',
		type:"post",
		data:{
			id:id,
			result:result,
			checkComment:checkComment,
			taskUser:taskUser,
			taskId:taskId,
			time:time,
			userId:appUserInfo.mUserId
		},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		success:function(data){
		    var result=JSON.parse(data);
			if(result.flag){
			    mui.confirm('审批成功！', '提示', btnArray, function(e) {
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