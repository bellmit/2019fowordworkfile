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
//初始化费用资金申请数据
function initView() {
	$.ajax({
		url:pathUrl+'/approval.action',
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
			fyMaterialDetail(json.fyMaterialDetail);
			fySupplierDetail(json.fySupplierDetail);
			if(json.currProcessNode=="经办人 部门总监"){
				$("#files").css("display","block");
			}
			list(json);
			cgFy(json);
		}
	});
}
//费用资金申请提交
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
		url:pathUrl+'/checkApproval.action',
		type:"post",
		data:{
			userId:userId,
			id:id,
			taskUser:taskUser,
			taskId:taskId,
			opinion:opinion,
			isAgree:check
		},
		async:false,/*同步请求*/
		dataType:'json',
		success:function(data){
			var json = JSON.parse(data);
			if(json.ri.success==true ){
				mui.confirm("审批通过！", '提示', ['确定'], function(e) {
					mui.openWindow({
						url:"agencyList.html"
					});	
				});	
			}else{
				mui.confirm("审批失败！", '提示', ['确定'], function(e) {
					mui.openWindow({
						url:"agencyList.html"
					});	
				});	
			}
		}
	});
	
}
//历史审批记录
function list(json){
	if(json.hasOwnProperty("list")){
		var data = JSON.parse(json.list);
		$.each(data.list,function(i,list){
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
		})
	}
}
//生成费用资金申请基本信息
function cgFy(json){
	id=json.cgFy.id;
	$("#id").val(json.cgFy.id);
	$("#askName").val(json.cgFy.askName);
	$("#askDeptName").val(json.cgFy.askDeptName);
	$("#askDate").val(json.cgFy.askDate);
	$("#sku").val(json.cgFy.sku);
	$("#companyCode").val(json.cgFy.companyCode);
	$("#needFpName").val(json.cgFy.needFpName);
	$("#cgGroupName").val(json.cgFy.cgGroupName);
	$("#needContractName").val(json.cgFy.needContractName);
	$("#title").val(json.cgFy.title);
	$("#wantDhDate").val(json.cgFy.wantDhDate);
	$("#isGzName").val(json.cgFy.isGzName);
	$("#needAgreementName").val(json.cgFy.needAgreementName);
	$("#agreementSku").val(json.cgFy.agreementSku);
	$("#isXmylName").val(json.cgFy.isXmylName);
	$("#negotiateTitle").val(json.cgFy.negotiateTitle);
	$("#sapSku").val(json.cgFy.sapSku);
	$("#isCdName").val(json.cgFy.isCdName);
	$("#isCdName").val(json.cgFy.isCdName);
	$("#cancelDate").val(json.cgFy.cancelDate);
	$("#fyyt").val(json.cgFy.fyyt);
	$("#zbspFileName").val(json.cgFy.zbspFileName);
	$("#htFileName").val(json.cgFy.htFileName);
	$("#bjdFileName").val(json.cgFy.bjdFileName);
	$("#zdcghFileName").val(json.cgFy.zdcghFileName);
	$("#otherFileName").val(json.cgFy.otherFileName);
	$("#commitment1Name").val(json.cgFy.commitment1Name);
	$("#commitment3Name").val(json.cgFy.commitment3Name);
	$("#commitment2Name").val(json.cgFy.commitment2Name);
	
}
//采购物品规格型号数量
function fyMaterialDetail(json){
	$.each(json,function(i,list){
		var html="<li class='clearfix '><span class='left label'>科目分配类别：</span> "+
			"<input type='text' id='typeName' class='f_input right wp60' value="+list.typeName+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>项目预算名称：</span> "+
				"<input type='text' id='projectName' class='f_input right wp60' value="+list.projectName+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>项目预算编号：</span> "+
				"<input type='text' id='projectSku' class='f_input right wp60' value="+list.projectSku+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>一级部门：</span> "+
				"<input type='text' id='cancelDate' class='f_input right wp60' value="+list.deptName+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>损益表承担部门：</span> "+
				"<input type='text' id='cancelDate' class='f_input right wp60' value="+list.centerTitle+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>申请人：</span> "+
				"<input type='text' id='askName' class='f_input right wp60' value="+list.askName+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>采购物品规格型号：</span> "+
				"<input type='text' id='spec' class='f_input right ' style='width:30%;' value="+list.spec+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>数量：</span> "+
				"<input type='text' id='num' class='f_input right wp60' value="+list.num+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>单价：</span> "+
				"<input type='text' id='price2' class='f_input right wp60' value="+list.price+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>货币：</span> "+
				"<input type='text' id='currencyName2' class='f_input right wp60' value="+list.currencyName+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>税率：</span> "+
				"<input type='text' id='taxRateName' class='f_input right wp60' value="+list.taxRateName+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>费用类型：</span> "+
				"<input type='text' id='categoryTitle' class='f_input right wp60' value="+list.categoryTitle+">"+
			"</li>";
		$("#fyMaterialDetail").append(html);
	});
}
//生成供货商信息
function fySupplierDetail(json){
	$.each(json,function(i,list){
		var isCheck="";
		if(list.isCheck=="1"){
			isCheck="是";
		}
		var html="<li class='clearfix '><span class='left label'>供货商：</span>"+
				"<input type='text' id='supplierName' class='f_input right wp60' value="+list.supplierName+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>供货商编号：</span> "+
				"<input type='text' id='supplierSku' class='f_input right wp60' value="+list.supplierSku+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>总计：</span> "+
				"<input type='text' id='price' class='f_input right wp60' value="+list.price+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>货币：</span> "+
				"<input type='text' id='currencyName' class='f_input right wp60' value="+list.currencyName+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>备注：</span> "+
				"<input type='text' id='remark' class='f_input right wp60' value="+list.remark+">"+
			"</li>"+
			"<li class='clearfix '><span class='left label'>使用此家：</span> "+
				"<input type='text' id='isCheck' class='f_input right wp60' value="+isCheck+">"+
			"</li>";
		$("#fySupplierDetail").append(html);
		});
}