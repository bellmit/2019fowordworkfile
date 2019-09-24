var procInsId;
var taskId;
var taskUser;
var leaveId;
var appUserInfo = {};
(function($, doc) {	
	$.init({
		swipeBack: true
	});

	if(localStorage.wxUser!=null){
		var data = JSON.parse(localStorage.wxUser);
		appUserInfo.mUserName=data.userName;
		appUserInfo.mUserId = data.userId;
	}else{
		mui.alert('网络异常！');
	}

	var data = JSON.parse(localStorage.obj);
	procInsId = data.procInstId;
	taskId = data.taskId;
	taskUser = data.taskUser;
	initLeaveView();
	
})(mui, document);

// 扩展API加载完毕，现在可以正常调用扩展API 
function initLeaveView() {
	setTimeout(function() {
			$.ajax({
				url: pathUrl +'/toLeavBackAudit.action',
				type:'post',
		        data:{
		            procInstId:procInsId,
			        taskUser:taskUser,
			        taskId:taskId,
			        userId:appUserInfo.mUserId
		        },
				async:false,/*同步请求*/
				dataType:'jsonp',
				jsonp:'callback',
				jsonpCallback:'flightHandler',
				success:function(data){
				    var jsonData = JSON.parse(data);
					if(jsonData.code && 'SUCCESS' == jsonData.code && jsonData.result){						
					    var result = jsonData.result;
						var leaveTypeId = result.leaveTypeId;
						if (leaveTypeId && leaveTypeId == 9) {
						    $("#startTimeString").html(result.startTimeBrj);
				            $("#endTimeString").html(result.endTimeBrj);
							var brjsjd = result.brjsjd;
							if (brjsjd && brjsjd == 1) {
								$("#leavePeriod").html("09:00-10:00");
							} else {
								$("#leavePeriod").html("17:00-18:00");
							}
							if($("#divLeavePeriod").hasClass("display_none")){
   			                    $("#divLeavePeriod").removeClass("display_none");
   		                    }
							if(!$("#divLeaveHours").hasClass("display_none")){
   			                    $("#divLeaveHours").addClass("display_none");
   		                    }
						} else {
							$("#startTimeString").html(result.startTimeString);
				            $("#endTimeString").html(result.endTimeString);
							$("#leaveHours").html(result.leaveHours);
							if($("#divLeaveHours").hasClass("display_none")){
   			                    $("#divLeaveHours").removeClass("display_none");
   		                    }
							if(!$("#divLeavePeriod").hasClass("display_none")){
   			                    $("#divLeavePeriod").addClass("display_none");
   		                    }
						}
					    $("#applyTime").html(result.applyDateString);
				        $("#login_name").html(jsonData.login_name);
				        $("#leaveTypeName").html(result.leaveTypeName);
				        $("#reason").html(result.reason);
						$("#replaceUserName").html(result.replaceUserName);
						$("#backStartTime").html(result.backStartTime);
						$("#backEndTime").html(result.backEndTime);
						$("#backStartTimeStr").html(result.backStartTime);
						$("#backEndTimeStr").html(result.backEndTime);
						$("#backReason").html(result.backReason);			
						var leaveTypeName = result.leaveTypeName;
						showLeaveCondition(leaveTypeName);
						if (leaveTypeName == "调休假") {
							$("#takeOffDay").html(result.addtion);
						} else if (leaveTypeName == "产检假") {
							$("#birthCheckFile").html(result.attachment2FileName);
							var typeId = result.addtion;
							if (typeId == 1) {
								$("#checkType").html("第一档(1-7个月)");
							} else if (typeId == 2) {
								$("#checkType").html("第二档(8个月)");
							} else if (typeId == 3) {
								$("#checkType").html("第三档(9个月)");
							}							
						} else if (leaveTypeName == "病假") {
							$("#sickLeaveFile").html(result.attachment2FileName);
						} else if (leaveTypeName == "长期病假") {
							$("#longSickLeaveFile").html(result.attachment2FileName);
						} else if (leaveTypeName == "带薪病假") {
							$("#sickLeaveWithSalFile").html(result.attachment2FileName);
						} else if (leaveTypeName == "陪护假") {
							$("#chaperonageFile").html(result.attachment2FileName);
							$("#birthDay").html(result.birthDay);
						} else if (leaveTypeName == "计划生育假") {
							$("#planBirthFile").html(result.attachment2FileName);
							var planTypeId = result.addtion;
							if (planTypeId == 1) {
								$("#planBirthType").html("第一档(未满4个月)");
							} else if (planTypeId == 2) {
								$("#planBirthType").html("第二档(满4个月)");
							}
						} else if (leaveTypeName == "产假") {
							$("#maternityFile").html(result.attachment2FileName);
							var maternityType = result.addtion.split("@")[0];
			                var count = result.addtion.split("@")[1];
							if (maternityType == 1) {
								$("#maternityType").html("正常产假");
							} else if (maternityType == 2) {
								$("#maternityType").html("难产/剖腹产");
							} else if (maternityType == 3) {
								$("#maternityType").html("多胞胎(" +  count + ")");
							}
						} else if (leaveTypeName == "哺乳假") {
							$("#suckleFile").html(result.attachment2FileName);
							$("#suckleBirthDay").html(result.birthDay);							
						} else if (leaveTypeName == "婚假") {
							$("#weddingFile").html(result.attachment2FileName);
							$("#weddingDay").html(result.birthDay);	
						} 
	
				        $.each(result.logList,function(i,flow){
				    	    var html="<div class='mui-card-content-inner'>"+
						                 "<span class='mui-pull-left'>审批人</span>"+
						                 "<span class='mui-h5 mui-pull-right'>"+flow.taskUser+"</span>"+
						             "</div>"+
						             "<div class='mui-card-content-inner'>"+
							             "<span class='mui-pull-left'>审批时间</span>"+
							             "<span class='mui-h5 mui-pull-right'>"+flow.taskFinishTimeStr+"</span>"+
						             "</div>"+
						             "<div class='mui-card-content-inner'>"+
							             "<span>审批意见</span>"+
							             "<p class='mui-h5'>"+flow.examineOption+"</p>"+
						             "</div>"
						     $("#checkDate").append(html);
				        });
					}else{
						mui.confirm(jsonData.message, '提示', btnArray, function(e) {
						});
					}
				}
	        });
		}, 1500);
}

 //根据假期显示 不同的条件
function showLeaveCondition(titile){
    if(titile!=""){
   		if(!$(".conditon").hasClass("display_none")){
   			$(".conditon").addClass("display_none");
   		}
   		$(".stateTable").each(function(){
   			if(!$(this).hasClass("display_none")){
   				$(this).addClass("display_none");
   			}
   			if($(this).attr("data-title")==titile){
   				$(this).removeClass("display_none");
   				$(".conditon").removeClass("display_none");
   				return;
   			}
   			
   		})   		
   	}
}

function checkleave(){
	var result=$(".mui-btn-primary").html();
	var checkComment=$("#comment").val();
	if(checkComment==''){
		mui.alert('请填写审批意见');
		return false;
	}
	if(result=='不同意'){
		result="否";
	}else{
		result="是";
	}
	var btnArray = ['确定'];
	$.ajax({
		url:pathUrl+'/adjustApplyBack.action',
		type:"post",
		data:{
			procInstId:procInsId,
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
