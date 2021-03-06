
mui.init({
swipeBack:true //启用右滑关闭功能
});

var leavelId;
var flowId;
var taskId;
var flowId;
//初始化微信用户
(function($) {
$.init();

var data = JSON.parse(localStorage.leavelStr);
	leavelId = data.leavelId;
	flowId = data.flowId;
	taskId = data.taskId;
	taskUser = data.taskUser;
	initView(leavelId);
})(mui);

// 扩展API加载完毕，现在可以正常调用扩展API 
function initView(leavelId) {
	setTimeout(function() {
			$.ajax({
				url:pathUrl+'/leaveAppView.action',
				type:"post",
				data:{id:leavelId},
				async:false,/*同步请求*/
				dataType:'jsonp',
				jsonp:'callback',
				jsonpCallback:'flightHandler',
				success:function(data){
				    $("#applyTime").html(data.applyDateString);
				    $("#login_name").html(data.login_name);
				    $("#startTimeString").html(data.startTimeString);
				    $("#endTimeString").html(data.endTimeString);
				    $("#leaveHours").html(data.leaveHours);
				    $("#leaveTypeName").html(data.leaveTypeName);
				    $("#reason").html(data.reason);
				     $("#dept").html(data.dept);
				    $.each(data.logList,function(i,flow){
				    	var html="<div class='mui-card-content-inner'>"+
						"<span class='mui-pull-left'>审批人</span>"+
						"<span class='mui-h5 mui-pull-right'>"+flow.taskUser+"</span>"+
						"</div>"+
						"<div class='mui-card-content-inner'>"+
							"<span class='mui-pull-left'>审批时间</span>"+
							"<span class='mui-h5 mui-pull-right'>"+flow.taskFinishTime+"</span>"+
						"</div>"+
						"<div class='mui-card-content-inner'>"+
							"<span>审批意见</span>"+
							"<p class='mui-h5'>"+flow.examineOption+"</p>"+
						"</div>"
						$("#checkDate").append(html);
				    });
				   }
				});
		}, 1500);
}

//提交审批
function checkleave(){
	var result=$(".mui-btn-primary").html();
	var comment=$("#comment").val();
	if(result=='不同意'&&comment==''){
		mui.confirm('请填写审批意见', '提示', ['确定'], function(e) {
		});	
		return false;
	}
	if(result=='不同意'){
		result=2;
	}else{
		result=1;
	}
	$.ajax({
		url:pathUrl+'/adjustApply.action',
		type:"post",
		data:{id:leavelId,result:result,flowId:flowId,comment:comment,taskUser:taskUser,taskId:taskId},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		success:function(data){
			if(data.flag){
				mui.confirm('审批成功', '提示', ['确定'], function(e) {
					mui.openWindow({
						url:"approval-list.html",
					});
				});	
			}
		}
	});
}
