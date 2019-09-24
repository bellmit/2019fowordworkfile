var procInsId;
var taskId;
var taskUser;
var taskId;
var instanceId;
var appUserInfo = {};
var userId;
//页面初始化-初始化微信用户信息及审批流程信息
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
//查看销售变更基本信息审批详情
function initView() {
	$.ajax({
		url:pathUrl+'/saleApproveView.action',
		type:"post",
		data:{
			procInstId:procInstId,
			taskUser:taskUser,
			userId:userId
		},
		async:false,/*同步请求*/
		dataType:'json',
		success:function(data){
			var json = JSON.parse(data);
			taskId=json.userData.taskId;
			instanceId=json.userData.instanceId;
			sumType(json.entryMap.deviceName);
			commentsList(json.comments.data);
			contact(json);
			milestone(json);
			bgyy(json);
			var dateOfApplicantion=newTime(json.entryMap.dateOfApplicantion);
			$("#dateOfApplicantion").val(dateOfApplicantion);
			$("#applicantName").val(json.entryMap.applicantName);
			$("#deptName").val(json.entryMap.deptName);
			$("#ifSigned").val(json.entryMap.ifSigned);
			$("#relatedItems").text(json.entryMap.relatedItems);
			$("#proManagerName").val(json.entryMap.proManagerName);
			$("#enterpriseCustomerContractName").val(json.entryMap.enterpriseCustomerContractName);
			$("#costDeptName").val(json.entryMap.costDeptName);
			$("#subjectContractName").val(json.entryMap.subjectContractName);
			$("#costCenterName").val(json.entryMap.costCenterName);
			$("#costCenterCode").val(json.entryMap.costCenterCode);
			$("#contractDeptName").val(json.entryMap.contractDeptName);
			$("#solutionPersonName").val(json.entryMap.solutionPersonName);
			$("#responsiblePersonName").val(json.entryMap.responsiblePersonName);
			var bigProject=judge(json.entryMap.bigProject);
			$("#bigProject").val(bigProject);
			var customerBudgetPass=judge(json.entryMap.customerBudgetPass);
			$("#customerBudgetPass").val(customerBudgetPass);
			$("#procInstStartUser").val(json.entryMap.proMembers);
			$("#description").val(json.entryMap.description);
			$("#saleGroupName").val(json.entryMap.saleGroupName);
			$("#preProjectName").val(json.entryMap.preProjectName);
			$("#preProjectCode").val(json.entryMap.preProjectCode);
			$("#finalUserName").val(json.entryMap.finalUserName);
			$("#provinceName").val(json.entryMap.provinceName);
			$("#cityName").val(json.entryMap.cityName);
			$("#countyName").val(json.entryMap.countyName);
			$("#firstIndustryName").val(json.entryMap.firstIndustryName);
			$("#secondIndustryName").val(json.entryMap.secondIndustryName);
			$("#enterpriseCustomerName").val(json.entryMap.enterpriseCustomerName);
			$("#firstBigdataName").val(json.entryMap.firstBigdataName);
			$("#secondBigdataName").val(json.entryMap.secondBigdataName);
			$("#distributionChannelName").val(json.entryMap.distributionChannelName);
			$("#turnoverRate").val(json.entryMap.turnoverRate);
			$("#totalContractBudget").val(json.entryMap.totalContractBudget);
			var signedTime=newTime(json.entryMap.signedTime);
			$("#signedTime").val(signedTime);
			$("#businessTypeName").val(json.entryMap.businessTypeName);
			var time = dateOfApplicantion.split('-');
			var projectName = time[0]+json.entryMap.enterpriseCustomerName+
								json.entryMap.productMainDataNames+json.entryMap.qcjd;
			$("#projectName").text(projectName);
			$("#totalBudget").val(json.entryMap.totalBudget);
			$("#productMainDataNames").val(json.entryMap.productMainDataNames);
			$("#qcjd").val(json.entryMap.qcjd);
			$("#target").text(json.entryMap.target);
			$("#profitCenterCode").val(json.entryMap.profitCenterCode);
			var isAfterSaleStage = "1"==json.entryMap.isAfterSaleStage? "是" : "否";
			$("#isAfterSaleStage").val(isAfterSaleStage);
			$("#afterSaleStageMemo").text(json.entryMap.afterSaleStageMemo);
			var budgetArrivalTime=newTime(json.entryMap.budgetArrivalTime);
			$("#budgetArrivalTime").val(budgetArrivalTime);
			$("#customerBudgetAmount").val(json.entryMap.customerBudgetAmount);
			$("#taskUser").val(json.userData.taskUser);
			$("#approvalDate").text(json.userData.approvalDate);
			$('input[type="text"]').attr('readOnly','readOnly');
		}
	});
}
//查看基本信息变更原因
function bgyy(json){
	var html='<li class="clearfix "><span class="left label">变更原因：</span>'+
		'<span  id="" class="f_input right wp60" >'+json.entryMap.infoChangeReasons+'</span>'+
	'</li>';
	$("#bgyy").append(html);
}
//Timestamp转换Date格式
function newTime(date){
	var time = new Date(date);
	var newTime = time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate();
	return newTime;
}
//1/0 转化为 '是'/'否'
function judge(data){
	var judge = (data == '1') ? '是' : '否';
	return judge;
}
//接入分流设备
function sumType(jsons){
	var json = JSON.parse(jsons);
	var numType = '';
	var sum = '';
	var remake = '';
	for (i = 0; i < 6; i++) {
		if(i == 0){
			numType = 'GE';
			sum = json.sumGE;
			remake = json.remakeGE;
		} else if (i == 1){
			numType = '100GPOS';
			sum = json.sum100GPOS;
			remake = json.remake100GPOS;
		} else if (i == 2){
			numType = '100GELAN';
			sum = json.sum100GELAN;
			remake = json.remake100GELAN;
		} else if (i == 3){
			numType = '100GEWAN';
			sum = json.sum100GEWAN;
			remake = json.remake100GEWAN;
		} else if (i == 4){
			numType = '40GPOS';
			sum = json.sum40GPOS;
			remake = json.remake40GPOS;
		} else if (i == 5){
			numType = '100GE';
			sum = json.sum100GE;
			remake = json.remake100GE;
		}
	    var html='<li class="clearfix "><span class="left label">线路类型：</span>'+
				'<input type="text" id="" class="f_input right wp60" value="'+numType+'">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">线路数量(路)：</span> '+
				'<input type="text" id="" class="f_input right wp60" value="'+sum+'">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">备注：</span> '+
				'<input type="text" id="" class="f_input right wp60" value="'+remake+'">'+
			'</li></br>';
		$("#sumType").append(html);
	}
}
//生成历史审批记录
function commentsList(json){
	if(json.length > 0){
		$.each(json,function(i,list){
			var attitude="";
			if(list.attitude=="1"){
				attitude="同意";
			}else{
				attitude="不同意";
			}
			var html='<li class="clearfix "><span class="left label">序号：</span>'+
						'<input type="text" id="" class="f_input right" style="width:70%" value="'+(i+1)+'">'+
					'</li>'+
					'<li class="clearfix "><span class="left label">流程节点：</span> '+
						'<input type="text" id="" class="f_input right wp60" value="'+list.taskName+'">'+
					'</li>'+
					'<li class="clearfix "><span class="left label">参与审批人：</span> '+
						'<input type="text" id="" class="f_input right wp60" value="'+list.taskUser+'">'+
					'</li>'+
					'<li class="clearfix "><span class="left label">审批状态：</span> '+
						'<input type="text" id="" class="f_input right wp60" value="'+attitude+'">'+
					'</li>'+
					'<li class="clearfix "><span class="left label">审批意见：</span> '+
						'<input type="text" id="" class="f_input right wp60" value="'+list.message+'">'+
					'</li>'+
					'<li class="clearfix "><span class="left label">审批时间：</span> '+
						'<span type="text" id="" class="f_input mui-pull-right" style="padding-right:10px">'+list.taskFinishTime+'</span>'+
					'</li></br>';
			$("#commentsList").append(html);
		})
	}
}

//生成里程碑列表
function milestone(json){
	if(json.hasOwnProperty("pnrData")){
		$.each(json.pnrData,function(i,list){
			var planFinishTime = newTime(list.planFinishTime);
			var html='<li class="clearfix "><span class="left label">序号：</span>'+
						'<input type="text" id="" class="f_input right" style="width:70%" value="'+(i+1)+'">'+
					'</li>'+
					'<li class="clearfix "><span class="left label">项目阶段：</span> '+
						'<input type="text" id="" class="f_input right wp60" value="'+list.proStage+'">'+
					'</li>'+
					'<li class="clearfix "><span class="left label">动作：</span>'+
						'<span type="text" id="" class="f_input right" style="padding-right:20px">'+list.movement+'</span>'+
					'</li>'+
					'<li class="clearfix "><span class="left label">计划完成时间：</span> '+
						'<input type="text" id="" class="f_input right wp60" value="'+planFinishTime+'">'+
					'</li>'+
					'<li class="clearfix "><span class="left label">描述：</span>'+
						'<span type="text" id="" class="f_input right" style="padding-right:20px">'+list.description+'</span>'+
					'</li>'+
					'<li class="clearfix "><span class="left label">执行人员：</span> '+
						'<input type="text" id="" class="f_input right wp60" value="'+list.executeRoleNames+'">'+
					'</li></br>';
			$("#milestone").append(html);
		})
	}
}
//生成客户联系人
function contact(json){
	var html='';
	if(json.hasOwnProperty("name_1")){
	    html='<li class="clearfix "><span class="left label">姓名：</span>'+
				'<input type="text" id="" class="f_input right wp60" value="'+json.name_1+'">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">性别：</span> '+
				'<input type="text" id="" class="f_input right wp60" value="'+json.sex_1+'">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">业务部门(一级)：</span> '+
				'<input type="text" id="" class="f_input right wp60">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">业务部门(二级)：</span> '+
				'<input type="text" id="" class="f_input right wp60" >'+
			'</li>'+
			'<li class="clearfix "><span class="left label">行业分类(二级)：</span> '+
				'<input type="text" id="" class="f_input right wp60" ">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">决策链位置定位：</span> '+
				'<input type="text" id="" class="f_input right wp60" value="'+json.policyDecision_1+'">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">与我方关系定位：</span> '+
				'<input type="text" id="" class="f_input right wp60" value="'+json.relationship_1+'">'+
			'</li></br>';
	}
	if(json.hasOwnProperty("name_2")){
	    html = html+'<li class="clearfix "><span class="left label">姓名：</span>'+
				'<input type="text" id="" class="f_input right wp60" value="'+json.name_2+'">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">性别：</span> '+
				'<input type="text" id="" class="f_input right wp60" value="'+json.sex_2+'">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">业务部门(一级)：</span> '+
				'<input type="text" id="" class="f_input right wp60">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">业务部门(二级)：</span> '+
				'<input type="text" id="" class="f_input right wp60" >'+
			'</li>'+
			'<li class="clearfix "><span class="left label">行业分类(二级)：</span> '+
				'<input type="text" id="" class="f_input right wp60" ">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">决策链位置定位：</span> '+
				'<input type="text" id="" class="f_input right wp60" value="'+json.policyDecision_2+'">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">与我方关系定位：</span> '+
				'<input type="text" id="" class="f_input right wp60" value="'+json.relationship_2+'">'+
			'</li></br>';
	}
	if(json.hasOwnProperty("name_3")){
	    html = html+'<li class="clearfix "><span class="left label">姓名：</span>'+
				'<input type="text" id="" class="f_input right wp60" value="'+json.name_3+'">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">性别：</span> '+
				'<input type="text" id="" class="f_input right wp60" value="'+json.sex_3+'">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">业务部门(一级)：</span> '+
				'<input type="text" id="" class="f_input right wp60">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">业务部门(二级)：</span> '+
				'<input type="text" id="" class="f_input right wp60" >'+
			'</li>'+
			'<li class="clearfix "><span class="left label">行业分类(二级)：</span> '+
				'<input type="text" id="" class="f_input right wp60" ">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">决策链位置定位：</span> '+
				'<input type="text" id="" class="f_input right wp60" value="'+json.policyDecision_3+'">'+
			'</li>'+
			'<li class="clearfix "><span class="left label">与我方关系定位：</span> '+
				'<input type="text" id="" class="f_input right wp60" value="'+json.relationship_3+'">'+
			'</li></br>';
	}
	html = html + '<li class="clearfix "><span class="left label">客户联系人不足三人时备注说明：</span> </br>'+
			'<input type="text" id="" class="f_input right wp60" value="'+json.entryMap.remark+'">'+
		'</li></br>';	
	$("#contact").append(html);
}
//提交审批
function submits(){
	var check=$("input[name='check']:checked").val();
	var opinion=$("#opinion").val();
	if(!taskId){
		mui.confirm('获取taskId失败', '', ['确定'], function(e) {
		});
		return false;
	}
	if(!check){
		mui.confirm('请选择审批结果', '', ['确定'], function(e) {
		});
		return false;
	}
	if(!opinion){
		mui.confirm('请填写审批意见', '', ['确定'], function(e) {
		});
		return false;
	}
	$("#btns").attr("disabled","disabled");
	$.ajax({
		url:pathUrl+'/saleApproveCheck.action',
		type:"post",
		data:{
			taskId:taskId,
			instanceId:instanceId,
			attitude:check,
			comment:opinion,
			taskUser:taskUser,
			userId:userId
		},
		dataType:'json',
		success:function(data){
			var json = JSON.parse(data);
			if(json.msg=="审批完成！"){
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