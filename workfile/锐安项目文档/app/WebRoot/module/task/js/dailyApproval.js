var dailyId;
var procInsId;
var taskId;
var taskUser;
var appUserInfo = {};
//页面初始化-初始化微信用户信息及日报的评价信息
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
	initDaily(procInsId, taskId, taskUser);
	var showStyle = new $.PopPicker();
		showStyle.setData([{
			value: 'A',
			text: 'A'
		},{
			value: 'B',
			text: 'B'
		}, {
			value: 'C',
			text: 'C'
		},{
			value: 'S', 
			text: 'S'
		}]);
		var showStyleButton = doc.getElementById('showNo');
		var styleResult = doc.getElementById('showNo');
		showStyleButton.addEventListener('tap', function(event) {
			showStyle.show(function(items) {
				styleResult.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
			});
		}, false);
})(mui, document);
//生成日报的详细信息
function initDaily(procInsId, taskId, taskUser){
	setTimeout(function() {
		$.ajax({
			url: pathUrl +'/viewDailyAudit.action',
			type:'post',
	        data:{
	            procInstId:procInsId,
		        taskUser:taskUser,
		        taskId:taskId
	        },
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			success:function(data){
			    var jsonData = JSON.parse(data);
				//日报基本信息
				if (jsonData.dailyInfo) {
				    dailyId = jsonData.dailyInfo.id;
				}
				$('#dailyDate').html(jsonData.dailyInfo.dailyDateStr+"日报");
				$('#applyUser').html(jsonData.dailyInfo.applyUser);
				$('#workHour').html(jsonData.dailyInfo.workHour);
				$('#subState').html(jsonData.dailyInfo.subState);
				$('#submitDate').html(jsonData.dailyInfo.submitDateStr+"提交");
				$('#site').html(jsonData.dailyInfo.site);
				$('#evaluate').html(jsonData.dailyInfo.evaluate);
				$('#evaluateDisc').html(jsonData.dailyInfo.evaluateDisc);
				$('#checkDesc').val(jsonData.dailyInfo.checkDesc);
				$('#showNo').html(jsonData.dailyInfo.evaluate);
				$('#checkDate').html(jsonData.dailyInfo.checkDate);
				//报工内容
				initDailyWork(jsonData.workList);
				//报销
				initDailySpend(jsonData.dailySpend);
				//发票
				initDailyAssort(jsonData.dailyAssort);
				//明日计划
				if(jsonData.dailyPlanList!=null){
					initDailyPlan(jsonData.dailyPlanList);
				}
				//今日计划
				if(jsonData.dailyProPlanList!=null){
					initProDailyPlan(jsonData.dailyProPlanList);
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
				             "</div>";
				     $("#auditHis").append(html);
			     });
			}
		});
	}, 1000);
}
//生成报工内容
function initDailyWork(workList){
	$.each(workList,function(i,work){
		html="<li class=' mui-media relative mui-table-view-cell'>"+
						"<div class='myui-circle-list-icon mui-pull-left'><span id='workHourSon'>"+work.workHour+" <em>h</em></span></div>"+
						"<div class='mui-media-body mui-pull-left'>"+
							"用时<span class='l10 blue' id='time'>"+work.startTime+"-"+work.endTime+"</span>"+
							"<p class='mui-ellipsis clearfix' id='jobPath'>成果路径："+work.jobPath+"</p>"+
						"</div>"+
						"<div class='clear'></div>"+
						"<div class='line'></div>"+
						"<div class='mui-col-xs-4 left' id='proNo'>"+work.proNo+"</div>"+
						"<div class='mui-col-xs-4 left' id='proMile'>"+work.proMile+"</div>"+
						"<div class='mui-col-xs-4 left' id='jobName'>"+work.jobName+"</div>"+
						"<div class='mui-h5' id='jobDisc'>"+work.jobDisc+"</div>"+	
					"</li>";
		$("#work").append(html);
	});
}
//生成报销信息
function initDailySpend(dailySpend){
	$.each(dailySpend,function(i,spend){
		html="<div >"+
				"<li class='mui-table-view-cell'>"+
					"<span class='left label'>"+spend.budgetType+"</span>"+
					"<span class='right content' id='allotUser'>"+spend.spendNo+"单</span>"+
				"</li>"+
				"<li class='mui-table-view-cell'>"+
					"<span class='left label'>被分配人</span>"+
					"<span class='right content' >"+ (spend.allotUser?spend.allotUser: "")+"</span>"+
				"</li>"+
				"<li class='mui-table-view-cell'>"+
					"<span class='left label'>预算编号</span>"+
					"<span class='right content' id='proNoS'>"+spend.proNo+"</span>"+
				"</li>"+
				"<li class='mui-table-view-cell'>"+
					"<span class='left label'>方式</span>"+
					"<span class='right content' id='spendType'>"+spend.spendType+"</span>"+
				"</li>"+
			"</div>";
		$("#spend").append(html);
	});
}
//生成发票信息
function initDailyAssort(dailyAssort){
	$.each(dailyAssort,function(i,assort){
		html="<li class='mui-table-view-cell'>"+
				"<div>"+
					"<div class='mui-col-xs-3 left'><span class='mui-badge mui-badge-primary' id='spendMoney'>"+assort.spendMoney+"</span></div>"+
					"<div class='mui-col-xs-3 left' id='code'>"+assort.code+"</div>"+
					"<div class='mui-col-xs-6 left' id='ticketCom'>"+assort.ticketCom+"</div>"+
					"<div class='mui-col-xs-6 left t5' id='ticketType'>"+assort.ticketType+"</div>"+
					"<div class='mui-col-xs-6 left t5' id='ticketInfo'>"+assort.ticketInfo+"</div>"+
					"<div class='mui-col-xs-12 left mui-h5 t5' id='remark'>"+assort.remark+"</div>"+	
				"</div>"+
			"</li>";
		$("#assort").append(html);
	});
}
//生成计划
function initDailyPlan(dailyPlan){
	$.each(dailyPlan,function(i,plan){
		html="<div >"+
				"<li class=' mui-media relative mui-table-view-cell'>"+
					"<div class='t10'>"+plan.plan+"</div>"+
				"</li>"+
			"</div>";
		$("#plan").append(html);
	});
}
//生成今日计划
function initProDailyPlan(dailyPlan){
	$.each(dailyPlan,function(i,plan){
		html="<p class='t5 mui-h5'>"+plan.plan+"</p>";
		$("#todayPlan").append(html);
	});
}
//提交
function checkDaily(){
	var ifAgree=$("#ifAgree").find(".mui-btn-primary").html();
	var dailyCheck=$("#dailyCheck").val();
	var evaluate=$("#showNo").html();
	$.ajax({
		url: pathUrl +'/auditDaily.action',
		type:'post',
		data:{
			pid:dailyId,
			ifAgree:ifAgree,
			dailyCheck:dailyCheck,
			taskId:taskId,
			taskUser:taskUser,
			evaluate:evaluate,
			userName:appUserInfo.mUserName
		},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		success:function(data){
		    var jsonData = JSON.parse(data);
			if(jsonData.code && 'SUCCESS' == jsonData.code){
				mui.confirm('审批成功！', '提示', ['确定'], function(e) {
					mui.openWindow({
						url:"agencyList.html"
					});
				});	
			}else{
				mui.confirm(jsonData.message, '提示', ['确定'], function(e) {
					mui.openWindow({
						url:"agencyList.html"
					});
				});
			}
		}
	});
}