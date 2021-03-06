var dailyAssortList=[];
var values=[];//存放所有的带回来的发票数据
var spends=[];//存放每一次选择的标签数据

var  projectList ;
var options = '';
var prjTriggerIndex;
var appUserInfo={};
var companyVal;
//获取回显的发票数据
(function($, doc) {
    if (localStorage.wxUser!=null) {
	    var data = JSON.parse(localStorage.wxUser);
		appUserInfo.mUserName=data.userName;
		appUserInfo.mWxUserId = data.wXUserId;
		appUserInfo.applyUserId = data.userId;
	}
	
	//获取项目编号列表
	getDeptInfo();
	selectMember(null,null);
	//获取票据的id(作为返回时的if判断字段)
	//获取url中的Id参数
	prjTriggerIndex = getUrlParam('prjTriggerIndex');
	//获取HTML
	dailyAssortList = eval('('+localStorage.dailyAssortList+')');
})(mui, document);

// 获取url中的参数的函数
function getUrlParam(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r!= null) {
		return unescape(r[2]);
	}else{
		return null;
	};
}


//跳回到费用报销页面
function toAssortPage() {

	localStorage.projectList = projectList;
	mui.openWindow({
		url:"report-info.html"
	});
};

//得到部门信息
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

            options += '<option value="请选择部门" dept-type="-1" dept-id="-1">请选择部门</option>';

			$.each(optionArray, function(index, value){

                options += '<option value="'+value.value+'" dept-type="' + value.type + '" dept-id="'+value.id+'">'+value.text+'</option>';
			})
		}
	});
	$("#deptSelection").prepend(options);
}
//根据人员查询项目编号
function selectMember(memSelection,firstName){
	$("#projectText").children().remove();
	var memName=null;
	if(memSelection!=null){
		memName= $(memSelection).find('option:selected').attr('value');
	}else if(firstName==null ||firstName==''){
		memName=appUserInfo.mUserName;		
	}else if(firstName!=null ||firstName!=''){
   	 	memName=firstName;
    }
    $.ajax({
        type: "post",
        url:pathUrl+"/getProjectInfo.action",
        data : {
        	userName:memName
        },
        cache:false,
        dataType: "json",
        success:function(data){
			if (prjTriggerIndex != -1) {
		        //设置allotUser
			    var prjIndexId = prjTriggerIndex.substring (prjTriggerIndex.indexOf('-') + 1);
				var hiddeAllotUser = document.getElementById("allotUser-" + prjIndexId); 
				if (hiddeAllotUser) {
	                hiddeAllotUser.value = memName;
	            }
			}
        	var json = eval('(' + data + ')'); 
        	var radioHtml='';
        	var radioIndex = 0;
			if (json.result) {
			   var jsonResult = JSON.parse(json.result);
			   var departId = '';
			   if (json.deptId) {
			       departId = json.deptId;
			   }
			   radioHtml += '<p id="radio' + radioIndex + '"><input type="radio" id="radio' + radioIndex + '" onchange="radios(\'' + jsonResult.cbzx + '\',\'' + jsonResult.ktext + '\',\'' + jsonResult.lrzx + '\', 99 ,2,' + departId + ')" name="radio" />'+  jsonResult.ktext  + '</p>';	            		
			}
        	$.each(json.list, function(index,value){
        	    index = index + radioIndex;
        		radioHtml += '<p id="radio' + index + '"><input type="radio" id="radio' + index + '" onchange="radios(\'' + value.id + '\',\'' + value.projName + '\',\'' + value.projNo + '\',' + value.projType + ',1, \'\')" name="radio" />'+  value.projName + '</p>';	            		
			})
        	$("#projectText").prepend(radioHtml); 
        	
        }
    })
}
//根据部门id得到部门人员
function initManagerInfo(departSelection){
    var sname=null;
	var deptType = $(departSelection).find('option:selected').attr('dept-type');
    $('#memberSelection').children().remove();
    $("#text").children().remove();
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
                    $('#memberSelection').append('<option value="'+value.name+'">' + value.name + '</option>');
                })	   
				
				selectMember(null,sname);
            }
        }); 
	}   
}
//替换项目预算编号
function radios(proId, proName, proNumber, proType, isProj, deptId){
	var projectListArr=[];
	var spend=new Object();
	spend["prjTriggerIndex"]=prjTriggerIndex;
	spend["projectId"]=proId;
	spend["projectNo"]=proName;
	spend["projectType"]=proNumber;
	spend["isProject"]=proType;
	spend["deptId"]=isProj;
	spend["allotUser"]=deptId;
	
	projectListArr.push(spend);
 	projectList = JSON.stringify(projectListArr);	
	//initLcbCondition(prjIndexId);
}