var procInstId;
var taskId;
var taskUser;
var currentName;
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
		currentName = appUserInfo.mUserName;
	}else{
		mui.toast('网络异常！');
	}
	var data = JSON.parse(localStorage.obj);
	procInstId = data.procInstId;
	taskId = data.taskId;
	taskUser = data.taskUser;
	initView();
})(mui, document);
//查看年度预算变更申请审批详情
function initView() {
	$.ajax({
		url:pathUrl + '/budgetChangeView.action',
		type:"post",
		data:{
			procInstId:procInstId,
			taskId:taskId,
			taskUser:taskUser,
			currentName:taskUser
		},
		async:false,/*同步请求*/
		dataType:'json',
		success:function(data){
		    var result=JSON.parse(data);
			$("#sku").text(result.bbc.sku);
			$("#askName").text(result.bbc.askName);
			$("#askDate").text(result.bbc.askDate);
			$("#askDept1Name").text(result.bbc.askDept1Name);
			$("#askDept2Name").text(result.bbc.askDept2Name);
			$("#askYear").text(result.bbc.askYear);
			$("#askFileName").text(result.bbc.askFileName);
			$("#askReason").text(result.bbc.askReason);
			if('1' == result.bbc.type){
				$("#type").text("同利润中心");
			}else {
				$("#type").text("不同利润中心");
			}
			if(result.hasOwnProperty("isGM")){
			   	$("#typeli").removeClass("display_none");
   			    $("#leftAmountli").removeClass("display_none");
   			    $("#useReserve").removeClass("display_none");
   			    $("#typeInfo").text(result.changeTypeInfo);
   			    $("#leftAmount").text(result.reservedLeftAmount+"元");
			}
		    id = result.bbc.id;
			var profits = result.changeDetailMap;
			var html='';
			var approvalHtml = '';
			for(var key in profits){
				html = html + "<div class='title'>选择利润中心"+
							"<span type='text' id='time' class='mui-table-view right'>"+result.profitName[key]+"</span>"+
						"</div>";
				$.each(profits[key], function(i, item){
					html = html + "<ul class='mui-table-view fixBox conditon'>"+
						"<li class='mui-table-view-cell mui-media  fadeBox stateTable takeOffCheck'>"+
							"<div>预算类别：<span id='takeOffDay'>"+item.typeName+"</span></div>"+
						"</li>"+
						"<li class='mui-table-view-cell mui-media  fadeBox stateTable takeOffCheck'>"+
							"<div>预算总额：<span id='takeOffDay'>"+item.initAmount+"</span></div>"+
						"</li>"+
						"<li class='mui-table-view-cell mui-media  fadeBox stateTable takeOffCheck'>"+
							"<div>已用预算：<span id='takeOffDay'>"+item.usedAmount+"</span></div>"+
						"</li>"+
						"<li class='mui-table-view-cell mui-media  fadeBox stateTable takeOffCheck'>"+
							"<div>剩余预算：<span id='takeOffDay'>"+item.leftAmount+"</span></div>"+
						"</li>"+
						"<li class='mui-table-view-cell mui-media  fadeBox stateTable takeOffCheck'>"+
							"<div>调整后预算总额：<span id='takeOffDay'>"+item.newAmount+"</span></div>"+
						"</li>"+
						"<li class='mui-table-view-cell mui-media  fadeBox stateTable takeOffCheck'>"+
							"<div>调整后预算剩余：<span id='takeOffDay'>"+mathRound(item.newAmount,item.usedAmount)+"</span></div>"+
						"</li>"+
					"</ul>"; 
				});
			}			
			var approvalList=JSON.parse(result.approvalList);
			$.each(approvalList.list, function(i, item){
				approvalHtml = approvalHtml + "<ul class='mui-table-view fixBox conditon'>"+
					"<li class='mui-table-view-cell mui-media  fadeBox stateTable takeOffCheck'>"+
						"<div>审批人：<span id='takeOffDay'>"+item.taskUser+"</span></div>"+
					"</li>"+
					"<li class='mui-table-view-cell mui-media  fadeBox stateTable takeOffCheck'>"+
						"<div>审判结果：<span id='takeOffDay'>"+agree(item.attitude)+"</span></div>"+
					"</li>"+
					"<li class='mui-table-view-cell mui-media  fadeBox stateTable takeOffCheck'>"+
						"<div>审批意见：<span id='takeOffDay'>"+item.message+"</span></div>"+
					"</li>"+
					"<li class='mui-table-view-cell mui-media  fadeBox stateTable takeOffCheck'>"+
						"<div>审批时间：<span id='takeOffDay'>"+item.taskFinishTime+"</span></div>"+
					"</li>"+
				"</ul>"; 
			});
			$("#profits").append(html);
			$("#checkDate").append(approvalHtml);
		}
	});
}

//审批结果赋值
function agree(item){
	var attitude = (item == '1')?'同意':'不同意';
	return attitude;
}

//处理调整后的金额
function mathRound(newAmount,usedAmount){
	var date = newAmount-usedAmount;
	var mathRound = Math.round(date*100)/100;
	return mathRound;
}
//提交审批
function checkSubmit(){
	var result=$(".ifAgree").html();
	var useReserve=$(".useReserve").html();
	var checkComment=$("#checkComment").val();
	if(checkComment==''){
		mui.confirm('请填写审批意见', '', ['确定'], function(e) {
		});
		return false;
	}
	if(result=='是'){
		result="1";
	}else{
		result="0";
	}
	if(useReserve=='是'){
		useReserve="1";
	}else{
		useReserve="0";
	}
	if($("#useReserve").hasClass("display_none")){
		useReserve = '';
	}
	var btnArray = ['确定'];
	$.ajax({
		url:pathUrl+'/budgetChangeCheck.action',
		type:"post",
		data:{
			id:id,
			currentName:taskUser,
			isAgree:result,
			opinion:checkComment,
			useReserve:useReserve
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