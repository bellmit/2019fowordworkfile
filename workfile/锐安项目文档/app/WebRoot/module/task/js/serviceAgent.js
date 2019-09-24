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
//加载产品服务代理协议详情信息
function initView() {
	$.ajax({
		url:pathUrl+'/approvalNPageNdcg.action',
		type:"post",
		data:{
			procInstId:procInstId,
			taskId:taskId,
			taskUser:taskUser,
		},
		async:false,/*同步请求*/
		dataType:'json',
		success:function(data){
			var json = JSON.parse(data);
			id=json.ca.id;
			list(json);
			if(json.hasOwnProperty("type2")){
				if(json.ca.type2=="1"){
				$("input[name='type2'][value=1]").attr("checked",true);
				}else  if(json.ca.type2=="2"){
					$("input[name='type2'][value=2]").attr("checked",true);
				}else if(json.ca.type2=="3"){
					$("input[name='type2'][value=3]").attr("checked",true);
				}
			}
			$("#type").val(json.type);
			$("#projectName").val(json.ca.projectName);
			$("#projectSku").val(json.ca.projectSku);
			$("#xyqsbyx").val(json.ca.xyqsbyx);
			$("#ghxyjghlx").val(json.ca.ghxyjghlx);
			$("#askName").val(json.ca.askName);
			$("#askDept1Name").val(json.ca.askDept1Name);
			var askDate=newTime(json.ca.askDate);
			$("#askDate").val(askDate);
			$("#requireDeptName").val(json.ca.requireDeptName);
			$("#title").val(json.ca.title);
			$("#sku").val(json.ca.sku);
			$("#supplierName").val(json.ca.supplierName);
			$("#supplierSku").val(json.ca.supplierSku);
			$("#money").val(json.ca.money);
			var startDate=newTime(json.ca.startDate);
			$("#startDate").val(startDate);
			var endDate=newTime(json.ca.endDate);
			$("#endDate").val(endDate);
			var signDate=newTime(json.ca.signDate);
			$("#description").val(json.ca.description);
			$("#signDate").val(signDate);
			//协议
			if(json.hasOwnProperty("xyFile")){
				$("#xyFile").val(json.xyFile.fileName);
			}
			//其他附件
			if(json.hasOwnProperty("otherFile")){
				$("#otherFile").val(json.otherFile.fileName);
			}
			//产品代理商管理措施
			if(json.hasOwnProperty("cpdlsFile")){
				$("#cpdlsFile").val(json.cpdlsFile.fileName);
			}
			//产品选型附件
			if(json.hasOwnProperty("cpxxFile")){
				$("#cpxxFile").val(json.cpxxFile.fileName);
			}
			//公司廉洁证明
			if(json.hasOwnProperty("companyFile")){
				$("#companyFile").val(json.companyFile.fileName);
			}
			//招标
			if(json.hasOwnProperty("zbFile")){
				$("#zbFile").val(json.zbFile.fileName);
			}
			//个人廉洁证明
			if(json.hasOwnProperty("personFile")){
				$("#personFile").val(json.personFile.fileName);
			}
			//供应商能力证明
			if(json.hasOwnProperty("cancelFile")){
				$("#cancelFile").val(json.cancelFile.fileName);
			}
			$('input[type="text"]').attr('disabled','disabled');
		}
	});
}
//审批提交
function submits(){
	var check=$("input[name='check']:checked").val();
	var opinion=$("#opinion").val();
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
		url:pathUrl+'/approvalAgreement.action',
		type:"post",
		data:{
			userId:userId,
			id:id,
			approvalOpinion:opinion,
			approval:check,
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
//Timestamp转换Date格式
function newTime(date){
	var time = new Date(date);
	var newTime= time.getFullYear()+"年"+(time.getMonth()+1)+"月"+time.getDate()+"日";
	return newTime;
}
//生成历史审批记录
function list(json){
	if(json.hasOwnProperty("approvalList")){
		$.each(json.approvalList.resultList,function(i,list){
			var attitude="";
			if(list.attitude=="1"){
				attitude="同意";
			}else{
				attitude="不同意";
			}
			var time=list.taskFinishTime.substring(0,10);
			var html='<li class="clearfix "><span class="left label">节点名称：</span>'+
						'<input type="text" id="" class="f_input right" style="width:70%" value="'+list.taskName+'">'+
					'</li>'+
					'<li class="clearfix "><span class="left label">审批人：</span> '+
						'<input type="text" id="" class="f_input right wp60" value="'+list.taskUser+'">'+
					'</li>'+
					'<li class="clearfix "><span class="left label">审批结果：</span> '+
						'<input type="text" id="" class="f_input right wp60" value="'+attitude+'">'+
					'</li>'+
					'<li class="clearfix "><span class="left label">审批意见：</span> '+
						'<input type="text" id="" class="f_input right wp60" value="'+list.message+'">'+
					'</li>'+
					'<li class="clearfix "><span class="left label">审批时间：</span> '+
						'<input type="text" id="" class="f_input right wp60" value="'+time+'">'+
					'</li></br>';
			$("#apply").append(html);
		});
	}
}
