var userId="";
var type="";
var backHours="";
var leaveTypeId="";
mui.init({
swipeBack:true //启用右滑关闭功能
});

//初始化微信登录用户
(function($) {
$.init();
	if(localStorage.wxUser!=null){
		var data = JSON.parse(localStorage.wxUser);
		//userId="3887";
		userId=data.userId;
	}else{
		mui.toast('网络异常！');
	}
var data = JSON.parse(localStorage.leavelStr);
	leavelId = data.leavelId;
	type=data.type;
	initView(leavelId);
	
	
})(mui);
//时间选择插件
(function($) {
$.init();
var btns = $('.btn');
btns.each(function(i, btn) {
btn.addEventListener('tap', function() {

	var _self = this;
	if(_self.picker) {
		_self.picker.show(function (rs) {
			btn.innerText =rs.text;
			check();
			_self.picker.dispose();
			_self.picker = null;
		});
	} else {
		var optionsJson = this.getAttribute('data-options') || '{}';
		var options = JSON.parse(optionsJson);
		var id = this.getAttribute('id');
		_self.picker = new $.DtPicker(options);
		_self.picker.show(function(rs) {
			btn.innerText = rs.text;
			check();
			_self.picker.dispose();
			_self.picker = null;
		});
	}
	
}, false);
});
})(mui);
if(type == "back"){

$("#submit").css("display","block");
}else{
$("#submit").css("display","none");
}

// 扩展API加载完毕，现在可以正常调用扩展API 
function initView(leavelId) {
	setTimeout(function() {
			$.ajax({
				url: pathUrl+'/leaveAppView.action',
				type:"post",
				data:{id:leavelId,userId:userId,type:type},
				async:false,/*同步请求*/
				dataType:'json',
				success:function(data){
					
					var jsonData = JSON.parse(data);
					if(jsonData.code && 'SUCCESS' == jsonData.code && jsonData.result){		
						
						
						jsonData.result.logList				
					    var result = jsonData.result;
						leaveTypeId = result.leaveTypeId;
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
				        $("#login_name").html(result.loginName);
				        $("#leaveTypeName").html(result.leaveTypeName);
				        $("#reason").html(result.reason);
				        $("#dept").html(result.dept);
						$("#replaceUserName").html(result.replaceUserName);
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
						if(result.backStartTime&&result.backEndTime){
							
							$("#chexTime1").text(result.backStartTime);
							$("#chexTime2").text(result.backEndTime);
							$("#chexYuan").text(result.backReason);
						}
						if( type!="back"){
							$.each(result.logList,function(i,flow){
								var d = new Date(flow.taskFinishTime);
								var date = (d.getFullYear()) + "-" + 
								(d.getMonth() + 1) + "-" +
								(d.getDate()) + " " + 
								(d.getHours()) + ":" + 
								(d.getMinutes()) + ":" + 
								(d.getSeconds());
								flow.taskFinishTimeStr=date;
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
							var bbb=document.getElementById("yuany");
							bbb.style.display="block";
						}
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

//处理时间
function dateFtt(val){
	if(val != null){
		var date=new Date(val);
		return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	}
	return "";
}
//提交
function submit(){
	var data1=$("#date2").text();
	var data2=$("#date1").text();
	var reason=$("#reason").text();
	
	if(reason == null || reason=="" ){
		mui.toast('请填写撤销请假原因！');
	}
	$.ajax({
				url: pathUrl+'/saveBackForm.action',
				type:"post",
				data:{
					id:leavelId,
					userId:userId,
					leaveTypeId:leaveTypeId,
					backHours:backHours,
					backStartTime:data1+":00:00",
					backEndTime:data2+":00:00",
					backReason:reason
					},
				async:false,/*同步请求*/
				dataType:'json',
				success:function(data){
					var json=JSON.parse(data);
					if(json.msg==true){
						mui.confirm("撤销成功！", '提示', ['确定'], function(e) {
							mui.openWindow({
								url:"vacation-list.html",
							});	
						});	
					}
				}
	})
}
//页面时间验证
function check(){
	var startTimeString =$("#startTimeString").text();
	var endTimeString =$("#endTimeString").text();
	if($("#date2").text()!="开始时间" &&$("#date1").text()!="结束时间"){
		var stime=$("#date2").text()+":00";
		var etime=$("#date1").text()+":00";
		var atime = new Date(Date.parse(startTimeString));
		var btime = new Date(Date.parse(stime));
		var dtime = new Date(Date.parse(etime));
		var ctime = new Date(Date.parse(endTimeString));
		getWorkTime();
		if(btime<atime){
			mui.confirm('撤销时间不能小于请假开始时间！', '', ['确定'], function(e) {
			});
			$("#date2").text("开始时间");
			return false;
		}
		if(btime>ctime){
			mui.confirm('撤销时间不能大于请假结束时间！', '', ['确定'], function(e) {
			});
			$("#date2").text("开始时间");
			return false;
		}
		if(dtime<atime){
			mui.confirm('撤销时间不能小于请假开始时间！', '', ['确定'], function(e) {
			});
			$("#date1").text("结束时间");
			return false;
		}
		if(dtime>ctime){
			mui.confirm('撤销时间不能大于请假结束时间！', '', ['确定'], function(e) {
			});
			$("#date1").text("结束时间");
			return false;
		}
		if(btime>dtime){
			mui.confirm('结束时间不能大于开始时间！', '', ['确定'], function(e) {
			});
			$("#date1").text("结束时间");
			return false;
		}
		
	}else if($("#date2").text()=="开始时间" &&$("#date1").text()=="结束时间"){
		mui.confirm('请选择时间', '', ['确定'], function(e) {
			});
	}
}
//获取工作时间
function getWorkTime(){
	var time1=$("#date2").text();
	var time2=$("#date1").text();
	$.ajax({
		url: pathUrl+'/getWorkTime.action',
		type:"post",
		data:{
			time1:time1,
			time2:time2
			},
		async:false,/*同步请求*/
		dataType:'json',
		success:function(data){
			var json=JSON.parse(data);
			backHours=json.count;
		}
	})
}
