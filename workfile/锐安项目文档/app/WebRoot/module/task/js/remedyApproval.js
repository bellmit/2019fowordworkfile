var dailyId;
var procInsId;
var taskId;
var taskUser;
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
	initRemedy(procInsId, taskId, taskUser);
})(mui, document);

//加载补登审批详情数据
function initRemedy(procInsId, taskId, taskUser){
	setTimeout(function() {
		$.ajax({
			url: pathUrl +'/viewRemedyAudit.action',
			type:'post',
	        data:{
	            procInstId:procInsId,
		        taskUser:taskUser,
		        taskId:taskId,
		        userName:appUserInfo.mUserName
	        },
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			success:function(data){
			    var jsonData = JSON.parse(data);
				//补登基本信息
				if (jsonData.dailyInfo) {
				    dailyId = jsonData.dailyInfo.id;
				}
				$('#remedyDate').html("补登打卡日期：" + jsonData.remedyTimeStr);
				$('#applyUser').html(jsonData.name);
				$('#applyDate').html("申请日期：" + jsonData.applyTimeStr);
				$('#auditStatus').html("审批状态：" + jsonData.state);
				//补登详细信息
				initAmAttend(jsonData);
				initAmClosing(jsonData);
				initPmAttend(jsonData);
				initPmClosing(jsonData);
			}
	    });
	}, 500);
}

//初始化第1次打卡记录
function initAmAttend(remedyDetail) {
    html ="<div>" +
              "<li class='mui-table-view-cell'>" + 
		          "<span class='left label'>时间</span>"+
			      "<span class='right content'>"+(remedyDetail.amAttendStr?remedyDetail.amAttendStr: "")+"</span>"+
		      "</li>"+
		      "<li class='mui-table-view-cell'>"+
			      "<span class='left label'>打卡地点</span>"+
				  "<span class='right content'>"+ (remedyDetail.site1?remedyDetail.site1: "")+"</span>"+
			  "</li>"+
			  "<li class='mui-table-view-cell'>"+
			     "<span class='left label'>打卡描述</span>"+
				 "<span class='right content'>" + (remedyDetail.describe1?remedyDetail.describe1: "正常") + "</span>"+
			  "</li>";
			  if(remedyDetail.describe1 && "补登" == remedyDetail.describe1) {
			      html+="<li class='mui-table-view-cell'>"+
				      "<span class='left label'>补登原因</span>"+
					  "<span class='right content'>" + (remedyDetail.cause1?remedyDetail.cause1: "") + "</span>"+
				  "</li>";
			   }
	html+="</div>"; 
	$("#amAttending").append(html);
}
//初始化第2次打卡记录
function initAmClosing(remedyDetail) {
    html="<div>" +
              "<li class='mui-table-view-cell'>" + 
		          "<span class='left label'>时间</span>"+
			      "<span class='right content'>"+(remedyDetail.amClosingStr?remedyDetail.amClosingStr: "")+"</span>"+
		      "</li>"+
		      "<li class='mui-table-view-cell'>"+
			      "<span class='left label'>打卡地点</span>"+
				  "<span class='right content'>"+ (remedyDetail.site2?remedyDetail.site2: "")+"</span>"+
			  "</li>"+
			  "<li class='mui-table-view-cell'>"+
			     "<span class='left label'>打卡描述</span>"+
				 "<span class='right content'>" + (remedyDetail.describe2?remedyDetail.describe2: "正常") + "</span>"+
			  "</li>";
			  if(remedyDetail.describe2 && "补登" == remedyDetail.describe2) {			 
			      html+="<li class='mui-table-view-cell'>"+
				      "<span class='left label'>补登原因</span>"+
					  "<span class='right content'>" + (remedyDetail.cause2?remedyDetail.cause2: "") + "</span>"+
				  "</li>";
			   }
	html+="</div>";
	$("#amClosing").append(html);
}
//初始化第3次打卡记录
function initPmAttend(remedyDetail) {
    html="<div>" +
              "<li class='mui-table-view-cell'>" + 
		          "<span class='left label'>时间</span>"+
			      "<span class='right content'>"+(remedyDetail.pmAttendStr?remedyDetail.pmAttendStr: "")+"</span>"+
		      "</li>"+
		      "<li class='mui-table-view-cell'>"+
			      "<span class='left label'>打卡地点</span>"+
				  "<span class='right content'>"+ (remedyDetail.site3?remedyDetail.site3: "")+"</span>"+
			  "</li>"+
			  "<li class='mui-table-view-cell'>"+
			     "<span class='left label'>打卡描述</span>"+
				 "<span class='right content'>" + (remedyDetail.describe3?remedyDetail.describe3: "正常") + "</span>"+
			  "</li>";
			  if(remedyDetail.describe3 && "补登" == remedyDetail.describe3) {
			      html+="<li class='mui-table-view-cell'>"+
				      "<span class='left label'>补登原因</span>"+
					  "<span class='right content'>" + (remedyDetail.cause3?remedyDetail.cause3: "") + "</span>"+
				  "</li>";
			   }
	html+="</div>";
	$("#pmAttending").append(html);
}
//初始化第4次打卡记录
function initPmClosing(remedyDetail) {
    html="<div>" +
              "<li class='mui-table-view-cell'>" + 
		          "<span class='left label'>时间</span>"+
			      "<span class='right content'>"+(remedyDetail.pmClosingStr?remedyDetail.pmClosingStr: "")+"</span>"+
		      "</li>"+
		      "<li class='mui-table-view-cell'>"+
			      "<span class='left label'>打卡地点</span>"+
				  "<span class='right content'>"+ (remedyDetail.site4?remedyDetail.site4: "")+"</span>"+
			  "</li>"+
			  "<li class='mui-table-view-cell'>"+
			     "<span class='left label'>打卡描述</span>"+
				 "<span class='right content'>" + (remedyDetail.describe4?remedyDetail.describe4: "正常") + "</span>"+
			  "</li>";
			  if(remedyDetail.describe4 && "补登" == remedyDetail.describe4) {
			      html+="<li class='mui-table-view-cell'>"+
				      "<span class='left label'>补登原因</span>"+
					  "<span class='right content'>" + (remedyDetail.cause4?remedyDetail.cause4: "") + "</span>"+
				  "</li>";
			   }
	html+="</div>"; 
	$("#pmClosing").append(html);
}

//提交审批
function checkRemedy(){
	var ifAgree=$("#ifAgree").find(".mui-btn-primary").html();
	var remedyCheck=$("#remedyCheck").val();
	var btnArray = ['确定'];
	$.ajax({
		url: pathUrl +'/auditRemedy.action',
		type:'post',
		data:{procInsId:procInsId,ifAgree:ifAgree,remedyCheck:remedyCheck,taskId:taskId,taskUser:taskUser,userName:appUserInfo.mUserName},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		success:function(data){
		    var jsonData = JSON.parse(data);			    
			if(jsonData.code && 'SUCCESS' == jsonData.code){
				mui.confirm('审批成功！', '提示', btnArray, function(e) {
					mui.openWindow({
						url:"agencyList.html"
					});
				});	
			}else{
				mui.confirm(jsonData.message, '提示', btnArray, function(e) {
					mui.openWindow({
						url:"agencyList.html"
					});
				});
			}		
		}
	});
}
