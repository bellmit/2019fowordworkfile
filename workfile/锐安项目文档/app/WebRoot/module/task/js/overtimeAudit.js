var procInsId;
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
	procInsId = data.procInstId;
	taskId = data.taskId;
	taskUser = data.taskUser;
	initView();
})(mui, document);
//加载加班审批数据
function initView() {
	$.ajax({
		url:pathUrl+'/approvalAppView.action',
		type:"post",
		data:{
			procInstId:procInsId,
			taskId:taskId,
			taskUser:taskUser,
			userId:appUserInfo.mUserId
			},
		async:false,/*同步请求*/
		dataType:'json',
		success:function(data){
		    var jsonData=JSON.parse(data); 
		    if (jsonData.result) {
		        $("#checkState").text(jsonData.result.checkState);
		        $("#overtimeUserName").text(jsonData.result.overtimeUserName);
		        $("#secondDept").text(jsonData.result.secondDept);
		        $("#applyTime").text(jsonData.result.checkTime);
		        $("#overtimeStart").text(jsonData.result.overtimeStart);
		        $("#overtimeEnd").text(jsonData.result.overtimeEnd);
		        $("#overtimeHours").text(jsonData.result.overtimeHours);
		        $("#overtimeReason").text(jsonData.result.overtimeReason);
		        $("#checkUserName").text(jsonData.result.checkUserName);
		        $("#checkDate").text(jsonData.result.checkTime);
		        id=jsonData.result.enId;
		    }
		}
	});
}
//提交审批
function checkleave(){
	var result=$(".mui-btn-primary").html();
	var checkComment=$("#checkComment").val();
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
		url:pathUrl+'/adjustOvertimeApply.action',
		type:"post",
		data:{
			id:id,
			result:result,
			checkComment:checkComment,
			taskUser:taskUser,
			taskId:taskId,
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
