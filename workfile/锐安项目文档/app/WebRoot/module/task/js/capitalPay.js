var procInsId;
var taskId;
var taskUser;
var id;
var appUserInfo = {};
var userId;
//页面初始化-初始化微信用户信息
$(function() {
    if(localStorage.wxUser!=null){
		var data = JSON.parse(localStorage.wxUser);
		appUserInfo.mUserName=data.userName;
		userId = data.userId;
	}else{
		mui.toast('网络异常！');
	}
    var data = JSON.parse(localStorage.obj);
	procInstId = data.procInstId;
	taskId = data.taskId;
	taskUser = data.taskUser;
	initView();
})(mui);
//生成费用类资金直接支付申请详细信息
function initView() {
	$.ajax({
		url:pathUrl+'/costPaymentApply.action',
		type:"post",
		data:{
			procInstId:procInstId,
			taskId:taskId,
			taskUser:taskUser
		},
		async:false,/*同步请求*/
		dataType:'json',	
		success:function(data){
			var json = JSON.parse(data);
			$("#title").val(json.busiPayDirect.title);
			$("#sku").val(json.busiPayDirect.sku);
			$("#budgetSku").val(json.busiPayDirect.budgetSku);
			$("#userName").val(json.busiPayDirect.userName);
			$("#feeTypeName").val(json.busiPayDirect.feeTypeName);
			$("#payMethodName").val(json.busiPayDirect.payMethodName);
			$("#askName").val(json.busiPayDirect.askName);
			$("#askDate").val(json.busiPayDirect.askDate);
			$("#askDeptName").val(json.busiPayDirect.askDeptName);
			$("#askAmount").val(json.busiPayDirect.askAmount);
			$("#yt").val(json.busiPayDirect.yt);
			$("#fpWayName").val(json.busiPayDirect.fpWayName);
			$("#payName").val(json.busiPayDirect.payName);
			$("#payAccount").val(json.busiPayDirect.payAccount);
			$("#jpDaysStr").val(json.busiPayDirect.jpDaysStr);
			$("#rkInfo").val(json.busiPayDirect.rkInfo);
			$("#wantDate").val(json.busiPayDirect.wantDate);
			//合同及相关附件
			if(json.hasOwnProperty("htFile")){
				$("#htFile").val(json.htFile.fileName);
			}
			//验收报告
			if(json.hasOwnProperty("ysbgFile")){
				$("#ysbgFile").val(json.ysbgFile.fileName);
			}
			//SVN配置库地址
			if(json.hasOwnProperty("svnFile")){
				$("#svnFile").val(json.svnFile.fileName);
			}
			id=json.busiPayDirect.id;
			list(json);
			$('input[type="text"]').attr('disabled','disabled');
		}
	});
}

//提交审批
function submits(){
	var check=$("input[name='check']:checked").val();  
	var opinion=$("#opinion").val();
	var btnArray = ['确定'];
	if(!id){
		mui.confirm('获取id失败', '', ['确定'], function(e) {
		});
		return false;
	}
	if(!check){
		mui.confirm('请选择审批结果', '', ['确定'], function(e) {
		});
		return false;
	}
	if(!opinion){
		mui.confirm('审批意见不可为空', '', ['确定'], function(e) {
		});
		return false;
	}
	$("#btns").attr("disabled","disabled");
	$.ajax({
		url:pathUrl+'/payApproval.action',
		type:"post",
		data:{
			userId:userId,
			id:id,
			approvalOpinion:opinion,
			approval:check
		},
		async:false,/*同步请求*/
		dataType:'json',
		success:function(data){
			var json = JSON.parse(data);
			if(json.msg=="审批通过！" || json.msg=="不同意此审批！"){
				mui.confirm(json.msg, '提示', ['确定'], function(e) {
					mui.openWindow({
						url:"agencyList.html"
					});	
				});	
			}else{
				mui.confirm(json.msg, '提示', ['确定'], function(e) {
					mui.openWindow({
						url:"agencyList.html"
					});	
				});	
			}
		}
	});	
}
//审批记录列表
function list(json){
	var html='';
	if(json.hasOwnProperty("approvalList")){
		var approvalList = JSON.parse(json.approvalList);
		$.each(approvalList.list,function(i,list){
			var attitude="";
			if(list.attitude=="1"){
				attitude="同意";
			}else{
				attitude="不同意";
			}
			if(list.taskUser == list.taskFinishUser){
				html = '<li class="clearfix "><span class="left label">审批人：</span> '+
							'<input type="text" id="" class="f_input right wp60" value="'+list.taskUser+'">'+
						'</li>';
			}else {
				html = '<li class="clearfix "><span class="left label">审批人：</span> '+
							'<span type="text" id="" class="f_input mui-pull-right" style="padding-right:10px">'+list.taskUser+'(代理人：'+list.taskFinishUser+')'+'</span>'+
						'</li>';
			}
			html = html+'<li class="clearfix "><span class="left label">审批结果：</span> '+
							'<input type="text" id="" class="f_input right wp60" value="'+attitude+'">'+
						'</li>'+
						'<li class="clearfix "><span class="left label">审批意见：</span> '+
							'<input type="text" id="" class="f_input right wp60" value="'+list.message+'">'+
						'</li>'+
						'<li class="clearfix "><span class="left label">审批时间：</span> '+
							'<span type="text" id="" class="f_input mui-pull-right" style="padding-right:10px">'+list.taskFinishTime+'</span>'+
						'</li></br>';
			$("#apply").append(html);
		});
	}
}
