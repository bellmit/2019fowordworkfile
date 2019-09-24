var appUserInfo;
var userName=null;
var userId=null;
var options = '';
var leaveTypeId="";
var attachment2FileName;
var addtion='';
var replaceUserId;
var endTimeBrj;
var startTimeBrj;
var birthDay;
var brjsjd;
var type="";
var leavelId="";
var id="";
mui.init({
    swipeBack:true //启用右滑关闭功能
});
//初始化微信用户等数据
(function($, doc) {
	if(localStorage.wxUser!=null){
		var data = JSON.parse(localStorage.wxUser);
		userId=data.userId;
		userName=data.userName;
		setName(userName);
	}else{
		mui.toast('网络异常！');
	}
	var data = JSON.parse(localStorage.leavelStr);
	leavelId = data.leavelId;
	type=data.type;
	
	$.init();
	
    var result = $('#result')[0];
    var btns = $('.btn');
    btns.each(function(i, btn) {
        btn.addEventListener('tap', function() {
	        var _self = this;
	        if(_self.picker) {
	    	    _self.picker.show(function (rs) {
	    		    btn.innerText =rs.text;
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
	    		    _self.picker.dispose();
	    		    _self.picker = null;
	    		    // 计算小时数
	    		    calHour();
	    	    });
	        }	
        }, false);
    });
	
	$.ready(function() {
	    var _getParam = function(obj, param) {
		    return obj[param] || '';
	    };	
	    //普通示例
	    var userPicker = new $.PopPicker();
	    userPicker.setData([
	    	{
	    		value: 'yearVacation',
	    		text: '年假'
	    	}, 
	    	{
	    		value: 'birthCheck',
	    		text: '产检假'
	    	}, 
			{
	    		value: 'train',
	    		text: '离职职务假'
	    	},
			{
	    		value: 'sickLeave', 
	    		text: '病假'
	    	},
			{
	    		value: 'sickLeaveSal', 
	    		text: '带薪病假'
	    	},
			{
	    		value: 'chaperonage', 
	    		text: '陪护假'
	    	},
			{
	    		value: 'planBirth', 
	    		text: '计划生育假'
	    	},
			{
	    		value: 'maternity', 
	    		text: '产假'
	    	},
			{
	    		value: 'suckleBirth', 
	    		text: '哺乳假'
	    	},
			{
	    		value: 'takeOff', 
	    		text: '调休假'
	    	},
			{
	    		value: 'wedding', 
	    		text: '婚假'
	    	},
			{
	    		value: 'absence', 
	    		text: '事假'
	    	},
			{
	    		value: 'funeral', 
	    		text: '丧假'
	    	},
			{
	    		value: 'longLeave', 
	    		text: '长期病假'
	    	}
	    ]);
		
	    var showAttendanceButton = doc.getElementById('showAttendance');
	    var userResult = doc.getElementById('showAttendance');
	    showAttendanceButton.addEventListener('tap', function(event) {
	    	userPicker.show(function(items) {
	    		userResult.innerText = items[0].text;
	    		var result=userResult.innerText;
	    		var flag=checked(result);
	    		if(flag==true){
	    			if( result== "产检假" ){
	    				leaveTypeId=2;
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("chanjian");
	    				aaa.style.display="block";
	    			}else{
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("chanjian");
	    				aaa.style.display="none";
	    			}
	    			if(result== "带薪病假" ||result== "长期病假" || result== "病假"){
	    				if(result== "带薪病假"){
	    					leaveTypeId=5;
	    				}else if(result== "长期病假"){
	    					leaveTypeId=15;
	    				}else if(result== "病假"){
	    					leaveTypeId=4;
	    				}
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("bing");
	    				aaa.style.display="block";
	    			}else{
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("bing");
	    				aaa.style.display="none";
	    			}
	    			if(result== "陪护假"){
	    				leaveTypeId=6;
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("peihu");
	    				aaa.style.display="block";
	    			}else{
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("peihu");
	    				aaa.style.display="none";
	    			}
	    			if(result== "计划生育假"){
	    				leaveTypeId=7;
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("jihua");
	    				aaa.style.display="block";
	    			}else{
	    				var aaa=document.getElementById("jihua");
	    				aaa.style.display="none";
	    			}
	    			if(result== "产假"){
	    				leaveTypeId=8;
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("chanjia");
	    				aaa.style.display="block";
	    			}else{
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("chanjia");
	    				aaa.style.display="none";
	    			}
	    			if(result== "调休假"){
	    				leaveTypeId=10;
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("tiaoxiu");
	    				aaa.style.display="block";
	    			}else{
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("tiaoxiu");
	    				aaa.style.display="none";
	    			}
	    			if(result== "婚假"){
	    				leaveTypeId=11;
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("hunjia");
	    				aaa.style.display="block";
	    			}else{
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("hunjia");
	    				aaa.style.display="none";
	    			}
	    			if(result== "年假" || result== "丧假" || result== "事假"){
	    				if(result== "年假"){
	    					leaveTypeId=1;
	    				}else if(result== "丧假"){
	    					leaveTypeId=14;
	    				}else if(result== "事假"){
	    					leaveTypeId=12;
	    				}
	    				var bbb=document.getElementById("onload");
	    				bbb.style.display="none";
	    			}
	    			if(result== "哺乳假"){
	    				leaveTypeId=9;
	    				var bbb=document.getElementById("noBuru");
	    				bbb.style.display="none";
	    				var aaa=document.getElementById("buru1");
	    				aaa.style.display="block";
	    				var aaa=document.getElementById("buru2");
	    				aaa.style.display="block";
	    				var ccc=document.getElementById("burujia");
	    				ccc.style.display="block";
	    			}else {
	    				var bbb=document.getElementById("noBuru");
	    				bbb.style.display="block";
	    				var aaa=document.getElementById("buru1");
	    				aaa.style.display="none";
	    				var aaa=document.getElementById("buru2");
	    				aaa.style.display="none";
	    				var ccc=document.getElementById("burujia");
	    				ccc.style.display="none";
	    			}
	    			if(result== "离职职务假"){
	    				leaveTypeId=3;
	    				var ccc=document.getElementById("lizhi");
	    				ccc.style.display="block";
	    				var ccc=document.getElementById("files");
	    				ccc.style.display="none";
	    			}else{
	    				var ccc=document.getElementById("lizhi");
	    				ccc.style.display="none";
	    				var ccc=document.getElementById("files");
	    				ccc.style.display="block";
	    			}
	    			getSurplus();
	    		} else{
	    			userResult.innerText="请选择";
	    		}
	    		userPicker.picker = null;
	    		//返回 false 可以阻止选择框的关闭
	    		//return false;
	    	});
	    });
	});
	getDeptInfo();
	if(type=="edit"){
		datas(leavelId);
	}
})(mui, document);

//验证休假类型
function checked(type){
	var flag;
	$.ajax({
		   type:"post",
		   url:pathUrl+"/checkLeaveType.action",
		   dataType:"json",
		   data:{type:type,userId:userId},
		   async:false,
		   success:function(data){
		   		var json = JSON.parse(data);
		   		if(json.state=="fail"){
		   			flag=false;
		   			mui.confirm(json.msg, '提示', ['确定'], function(e) {
					});	
		   			return false;
		   		}else{
		   			flag=true;
		   		}
		   }
	});
	return flag;
}
var errMsg="";
//验证休假时间
function calHour(){
	// 清空已有小时数
	$("#leaveHours").val("");
	var startDate = $("#demo1").text();
	var endDate = $("#demo2").text();
	// 校验时间是否规范
	if(startDate!="" && startDate!='开始时间'){
		var startDay = startDate.substring(0,10);
		if(!ajaxValidateTime(startDay)){
			mui.toast('开始时间在非工作日！');
			$("#demo1").text('开始时间');
			return  false;
		}
		var startHour=startDate.substring(startDate.length-2);
		if(parseInt(startHour) <9 || parseInt(startHour) >18){
			mui.toast('开始时间在非正常工作时间！');
			$("#demo1").text('开始时间');
			return false;
		}
		if(!ajaxValidateTime2(startDate,1)){
			mui.toast(errMsg);
			$("#demo1").text('开始时间');
			return false;
		}
	}
	if(endDate!="" && endDate!='结束时间'){
		var endDay = endDate.substring(0,10);
		if(!ajaxValidateTime(endDay)){
			mui.toast('结束时间在非工作日！');
			$("#demo2").text('结束时间');
			return  false;
		}
		var endHour=endDate.substring(endDate.length-2);
		if(parseInt(endHour) <9 || parseInt(endHour) >18){
			mui.toast('结束时间在非正常工作时间！');
			$("#demo2").text('结束时间');
			return false;
		}
		if(!ajaxValidateTime2(endDate,2)){
			mui.toast(errMsg);
			$("#demo2").text('结束时间');
			return false;
		}
	}
	if(startDate!=""&&endDate!="" && startDate!='开始时间' && endDate!='结束时间'){
		if(startDate > endDate){
			mui.toast("结束时间应大于等于开始时间！");
			$("#demo2").text('结束时间');
			return false;
		}
		if(startDate == endDate){
			mui.toast("结束时间应不能等于开始时间！");
			$("#demo2").text('结束时间');
			return false;
		}
        var result= getHours(startDate,endDate);
        $("#leaveHours").val(result);
	}else{
		$("#leaveHours").val("");
	}
}
/**
 * 校验申请时间是否在正常工作日
 */
function ajaxValidateTime(validateTime){
	var flag=true;
	$.ajax({
		   type:"post",
		   url:pathUrl+"/ajaxValidateTime.action",
		   dataType:"json",
		   data:{validateTime:validateTime},
		   async:false,
		   success:function(data){
				if(data==0){
					flag=false;
				}
		   }
	});
	return flag;
}
/**
 * 校验申请时间是否在正常工作日
 */
function ajaxValidateTime2(validateTime,type){
	var flag=true;
	$.ajax({
		    url:pathUrl+"/ajaxValidateTime2.action",
			type:'post',
			data:{
				validateTime:validateTime,
				userId:userId,
				type:type
			},
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			success:function(data){		 
				if(data.type=='false'){					
					flag=false;
					errMsg = data.errMsg;
				}
			}
	});
	return flag;
}
//得到小时数
function getHours(startDate,endDate){ 
	var count;
    $.ajax({
	   type:"post",
	   url:pathUrl+"/getWorkDay.action",
	   dataType:"json",
	   data:{
			"startDate":startDate,
			"endDate":endDate
	   },
	   async:false,
	   success:function(data){
			var json= JSON.parse(data);
			count=json.count;
	   }
    });
   return count;
   
}   
//设置请假人名称
function setName(username){
	 $("#userName").text(username);
}
//验证休假类型是否有剩余
function getSurplus(){
	var showAttendance=$("#showAttendance").html();
	$.ajax({
			url:pathUrl+'/getSurplus.action',
			type:'post',
			data:{userName:userName,showAttendance:showAttendance},
			async:false,/*同步请求*/
			dataType:'json',
			success:function(data){
				var result = eval('('+data+')');
				$("#surplus").html(result.surplus);
			}
	});
}
/**
 * 请假提交
 */
$("#leaveSubmit").click(function(){
	var msgArray = ['确定'];
	var type= $("#showAttendance").text();
	if(type=="调休假"){
		addtion=$("#tiaoxiu").text();
		if(addtion==null){
			mui.toast("请填写调休明细");
		}
	}
	if(type=="产假"){
		addtion=$("input[name='chanjia']:checked").val();
		if(addtion==null){
			mui.toast("请选择产假类型！");
			return false;
		}
		if(addtion=="3" || addtion==3){
			var duo=$("#duo").val();
			if(duo==null){
				mui.toast("请填写多胞胎数量！");
				return false;
			}else{
				addtion=cc+"@"+duo;
			}
		}
		attachment2FileName=$("#maternityFile").text();
		if(!attachment2FileName){
			mui.toast("请上传附件");
			return false;
		}
	}	
	if(type=="婚假"){
		birthDay=$("#demo7").text();
		if(birthDay=="请选择领证日期"){
			mui.toast("请选择结婚日期日期");
			return false;
		}
		attachment2FileName=$("#weddingFile").text();
		if(!attachment2FileName){
			mui.toast("请上传附件");
			return false;
		}
	}
	if(type=="离职职务假"){
		var addtion=$(".suser2").text();
		if(addtion=="请选择当前离职人"){
			mui.toast("当前离职人员不能为空！");
			return false;
		}
	}
	if(type=="计划生育假"){
		addtion=$("input[name='jihua']:checked").val();
		if(addtion==null){
			mui.toast("请选择计划类型！");
			return false;
		}
		attachment2FileName=$("#planBirthFile").text();
		if(!attachment2FileName){
			mui.toast("请上传附件");
			return false;
		}
	}
	if(type=="病假" ||type=="带薪病假" || type=="长期病假"){
		attachment2FileName=$("#sickLeaveFile").text();
		if(!attachment2FileName){
			mui.toast("请上传附件");
			return false;
		}
	}
	if(type=="陪护假"){
		birthDay=$("#demo5").text();
		if(birthDay=="请选择出生日期"){
			mui.toast("请选择子女出生日期");
			return false;
		}
		attachment2FileName=$("#chaperonageFile").text();
		if(!attachment2FileName){
			mui.toast("请上传附件");
			return false;
		}
	}
 	if(type=="哺乳假"){
 		
 		var aa=$("#demo3").text().substring(8);
		var bb=$("#demo4").text().substring(8);
		startTimeBrj=$("#demo3").text();
		endTimeBrj=$("#demo4").text();
		if($("#demo3").text()=="开始时间" || $("#demo4").text()=="结束时间"){
			mui.toast("时间不能为空！");
			return false;
		}
		if(aa > bb){
			mui.toast("结束时间不能小于开始时间");
			return false;
		}
		brjsjd=$("input[name='duan']:checked").val();
		if(brjsjd==null){
			mui.toast("请选择哺乳时间段！");
			return false;
		}
		birthDay=$("#demo6").text();
		if(birthDay=="请选择出生日期"){
			mui.toast("请选择子女出生日期");
			return false;
		}
		attachment2FileName=$("#suckleFile").text();
		if(!attachment2FileName){
			mui.toast("请上传附件");
			return false;
		}
 	}
	if(type=="产检假"){
		addtion=$("input[name='chan']:checked").val();
		if(addtion ==null){
			mui.toast("请选择产检类型！");
			return false;
		}
		attachment2FileName=$("#birthCheckFile").text();
		if(!attachment2FileName){
			mui.toast("请上传附件");
			return false;
		}
	}
	var startTime = $("#demo1").html();
	var endTime = $("#demo2").html();
	var leaveHours = $("#leaveHours").val();
	var textarea = $("#textarea").val();
	var attachment1 = $("#attachment1").val();
	var attachment1FileName = $("#attachment1FileName").val();
	var showAttendance=$("#showAttendance").text();
	if(showAttendance=="请选择"){
		mui.toast("请假类型不能为空");
		return false;
	}
	if(startTime!='开始时间' || startTimeBrj!='开始时间'){
		if(startTime!='开始时间'){
			startTime+=':00:00';
		}
	}else{
		mui.toast("请选择时间");
		return false;
	}
	if(endTime!='结束时间' || endTimeBrj!='结束时间'){
		if(endTime!='结束时间'){
			endTime+=':00:00';
		}
	}else{
		mui.toast("请选择时间");
		return false;
	}
	if(textarea==''){
		mui.toast("请填写原因");
		return false;
	}
	$("#leaveSubmit").attr("disabled",true);
	if(leaveTypeId==""){
		leaveTypeId=localStorage.leaveTypeId;
	}
	$.ajax({
		url:pathUrl+'/appleavelSave.action',
		type:'post',
		data:{
			id:id,
			leaveTypeId:leaveTypeId,
			startTimeString:startTime,
			endTimeString:endTime,
			leaveHours:leaveHours,
			reason:textarea,
			state:2,
			mode:'add',
			attachment2FileName:attachment2FileName,
			addtion:addtion,
			endTimeBrj:endTimeBrj,
			startTimeBrj:startTimeBrj,
			birthDay:birthDay,
			brjsjd:brjsjd,
			replaceUserId:replaceUserId,
			newFileName:localStorage.newFileName,
			userId:userId
		},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		success:function(data){
			var result = eval('('+data+')');
			if(result.msg){
				mui.confirm(result.msg, '', msgArray, function(e) {
				});
				return false;
			}else{
				if(result.state == 'success'){
				mui.confirm('操作成功！', '', msgArray, function(e) {
					mui.openWindow({
						url:"vacation-list.html"
					});
				});
				}else{
					mui.confirm('操作失败！', '', msgArray, function(e) {
						mui.openWindow({
							url:"vacation-list.html"
						});
					});
				}
			}
	   	}    
   	}); 

});
//获取部门
function getDeptInfo(){
	$.ajax({
        type: "post",
        url:pathUrl+"/getDeptInfo.action",
        dataType: "json",
        async: false,
        cache:false,
		success: function (data) {
        	var json = eval('(' + data + ')'); 
        	var dept=JSON.parse(json.result);
			var deptList = dept.list;
            var optionArray = [];
            if (deptList.length > 0) {
                $.each(deptList, function (index, value) {
                	if(value.name != 'zero'){
                        optionArray.push({text: value.name, value: value.name, type: '0', id: value.id});
                    }
                    var firstDeptArray = value.list;
                    $.each(firstDeptArray, function(firstDeptIndex, firstDeptValue){
                        optionArray.push({text: firstDeptValue.name, value: firstDeptValue.name, type: '1', id: firstDeptValue.id});
                        var secondDeptArray = firstDeptValue.list;
                        $.each(secondDeptArray, function (secondDeptIndex, secondDeptValue) {
                            optionArray.push({text: '&nbsp;&nbsp;>>' + secondDeptValue.name, value: secondDeptValue.name, type: '2', id: secondDeptValue.id});
                        })
                    })
                })
            }
            //引入默认值
            options += '<option value="请选择部门" dept-type="-1" dept-id="-1">请选择部门</option>';
			$.each(optionArray, function(index, value){
                options += '<option value="'+value.value+'" dept-type="' + value.type + '" dept-id="'+value.id+'">'+value.text+'</option>';
			})
		}
	});
	$("#deptSelection").prepend(options);
	$("#deptSelection2").prepend(options);
}
//根据部门id查询部门下的人员2
function initManagerInfo(departSelection){
    var sname=null;
   
	var deptType = $(departSelection).find('option:selected').attr('dept-type');
    $('#memberSelection').children().remove();
    if(deptType && deptType.trim() != '') {
        var deptId = $(departSelection).find('option:selected').attr('dept-id');
        $.ajax({
            type: "post",
            url:pathUrl+"/getUserList.action",
            data : {
            	id:deptId,
            	type:deptType
            },
            cache:false,
            dataType: "json",
            success:function(data){
            	var json = eval('(' + data + ')'); 
            	var dept=JSON.parse(json.result);
                var userArray = dept.list;
                $.each(userArray, function (index, value) {
               		sname=userArray[0].name;
                    $('#memberSelection').append('<option value="'+value.id+'">' + value.name + '</option>');
                })	   
				
				selectMember();
            }
        }); 
	}   
}
//根据部门id查询部门下的人员2
function initManagerInfo2(departSelection){
	var deptType = $(departSelection).find('option:selected').attr('dept-type');
    $('#memberSelection2').children().remove();
    if(deptType && deptType.trim() != '') {
        var deptId = $(departSelection).find('option:selected').attr('dept-id');
        $.ajax({
            type: "post",
            url:pathUrl+"/getUserList.action",
            data : {
            	id:deptId,
            	type:deptType
            },
            cache:false,
            dataType: "json",
            success:function(data){
            	var json = eval('(' + data + ')'); 
            	var dept=JSON.parse(json.result);
                var userArray = dept.list;
                $.each(userArray, function (index, value) {
                	
                    $('#memberSelection2').append('<option value="'+value.id+'">' + value.name + '</option>');
                })	   
				
				selectMember2();
            }
        }); 
	}   
}
//弹出层设置名称1
function selectMember(){
	replaceUserId=$("#memberSelection").find('option:selected').val();
	var resu=$("#memberSelection").find('option:selected').text();
	$(".suser").text(resu);
	
}
//弹出层设置名称2
function selectMember2(){
	addtion=$("#memberSelection2").find('option:selected').val();
	var resu2=$("#memberSelection2").find('option:selected').text();
	$(".suser2").text(resu2);
}
/**
 * 查看
 */
function toView(leavelId){
	var obj = {leavelId:leavelId};
	var leavelStr = JSON.stringify(obj);
	localStorage.leavelStr = leavelStr;
	mui.openWindow({
		url:"apply-detail.html",
	});
}
//请假撤销编辑
function datas(leavelId){
	$.ajax({
            type: "post",
            url:pathUrl+"/leaveApplyEdit.action",
            data : {
            	id:leavelId,
            	userId:userId
            },
            cache:false,
            dataType: "json",
            success:function(data){
            	var result=JSON.parse(data);
            	var leaveTypeId="";
            	if(result.result.leaveTypeId == 1){
	            	leaveTypeId="年假";
            	}
            	if(result.result.leaveTypeId == 2){
            		leaveTypeId="产检假";
            	}
            	if(result.result.leaveTypeId == 3){
            		leaveTypeId="离职服务假";
            	}
            	if(result.result.leaveTypeId == 4){
            		leaveTypeId="病假";
            	}
            	if(result.result.leaveTypeId == 5){
            		leaveTypeId="带薪病假";
            	}
            	if(result.result.leaveTypeId == 6){
            		leaveTypeId="陪护假";
            	}
            	if(result.result.leaveTypeId == 7){
            		leaveTypeId="计划生育假";
            	}
            	if(result.result.leaveTypeId == 8){
            		leaveTypeId="产假";
            	}
            	if(result.result.leaveTypeId == 9){
            		leaveTypeId="哺乳假";
            	}
            	if(result.result.leaveTypeId == 10){
            		leaveTypeId="调休假";
            	}	
            	if(result.result.leaveTypeId == 11){
            		leaveTypeId="婚假";
            	}
            	if(result.result.leaveTypeId == 12){
            		leaveTypeId="事假";
            	}
            	if(result.result.leaveTypeId == 14){
            		leaveTypeId="丧假";
            	}
            	if(result.result.leaveTypeId == 15){
            		leaveTypeId="长期病假";
            	}
            	id=result.result.id;
            	$("#showAttendance").text(leaveTypeId);
            	var startTimeString=result.result.startTimeString.substring(0,13);
            	var endTimeString=result.result.endTimeString.substring(0,13);
            	$("#demo2").text(startTimeString);
            	$("#demo1").text(endTimeString);
            	$("#leaveHours").val(result.result.leaveHours);
            	$("#textarea").val(result.result.reason);
            	localStorage.leaveTypeId=result.result.leaveTypeId;
            }
        }); 
}