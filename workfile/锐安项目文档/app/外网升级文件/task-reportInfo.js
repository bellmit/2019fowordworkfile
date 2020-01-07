var count = 0;//工作内容条数
var countPlan = 0;//明日计划条数
var describe=true;//判断是否有打卡
var appUserInfo={};
var tmpIndex=null;
var timeIdNum;
var options = '';
var prjTriggerIndex = -1;
var defaultProjList = '';
var btnArray = ['确定'];
var didiIds=new Array(); 
var hotelIds=new Array(); 
var listTemp=new Array(); 
var map=new Map();
var isFlag=0;
//页面初始化
(function($, doc) {
    if (localStorage.wxUser!=null) {
	    var data = JSON.parse(localStorage.wxUser);
		appUserInfo.mUserName=data.userName;
		appUserInfo.mWxUserId = data.wXUserId;
		appUserInfo.applyUserId = data.userId;
	}
	getDeptInfo();
	txfCheck();
	selectMember(null,null);
	$.ready(function() {
		var _getParam = function(obj, param) {
			return obj[param] || '';
        };
		getDynamicSelcet("showSitePicker","site",2);
		mui('.mui-scroll-wrapper').scroll(); 
	});
	//初始化日报日期选择picker
	var showStyleButton = doc.getElementById('dailyDate');
	var styleResult = doc.getElementById('dailyDate');
	showStyleButton.addEventListener('tap', function() {
		var _self = this;
		if(_self.picker) {
			_self.picker.show(function (rs) {
				styleResult.innerText =rs.text;
				_self.picker.dispose();
				_self.picker = null;
			});
		} else {
			var optionsJson = this.getAttribute('data-options') || '{}';
			var options = JSON.parse(optionsJson);
			var id = this.getAttribute('id');
			_self.picker = new $.DtPicker(options);
			_self.picker.show(function(rs) {
				styleResult.innerText = rs.text;
				getAttendacne();
				_self.picker.dispose();
				_self.picker = null;
			});
		}
	
    }, false);
    
    //初始化评价类型
	var showStyle1 = new $.PopPicker();
	showStyle1.setData([{
	        value: 'A',
		    text: 'A'
	       },
	       {
			value: 'B',
			text: 'B'
		   }, 
		   {
			value: 'C',
			text: 'C'
		   },
		   {
			value: 'S', 
			text: 'S'
		   }]);
	var showStyleButton1 = doc.getElementById('evaluate');
	var styleResult1 = doc.getElementById('evaluate');
	showStyleButton1.addEventListener('tap', function(event) {
			showStyle1.show(function(items) {
				styleResult1.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
			});
	}, false);
	
	//获取报工数据 - 判断request来源： null  - 新增   notnull - 编辑
	var fromFlag = localStorage.fromFlag;
	
	if(fromFlag!=null&&fromFlag!='null'){ //通过编辑Link进入的，需要现获取之前的信息
		getData();
		initExistingWorkEdit();
	}else{  
		setTime();
		setPlan();
		initExistingWork();
	}
	getAttendacne();
})(mui, document);

//初始化明日计划
function setPlan(){
	countPlan ++;
	var dataList =  '<li class="clearfix" style="height: auto;">'+
						'<textarea class="mui-input-speech t10" style="margin-bottom: 0;" id="plan-'+countPlan+'" rows="5" placeholder="请输入明日计划"></textarea>'+
					'</li>';
	$("#plan-content").append(dataList);
}
//初始化页面时间，日报状态， 驻地
function setTime(){
    //初始化日报日期 
    //获取上一次日报上报日期
    $("#dailyDate").html(getNowFormatDate());
    $("#subState").html('正常');
    $("#site").html('北京市,海淀区');
	
    $.ajax({
		url: pathUrl+'/getPreDailyInfo.action',
		type:'post',
		data :{applyUserId:appUserInfo.applyUserId},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		error : function(){
			mui.confirm('操作失败！', '',btnArray, function(e) {
			});
		},
		success:function(data){
		    $("#dailyDate").html('时间');
		    $("#subState").html('');
			var jsonData = eval('('+data+')');
			var preDailyInfo = jsonData.data;
			if (preDailyInfo) {	
			    //如果不超过3天则初始化为最远的那次记录
			     var dailyDateStr = preDailyInfo.dailyDateStr;
			     if(dailyDateStr != null && dailyDateStr != 'undefined' && dailyDateStr != '') {
			        var nextDate = new Date(stringToDate(dailyDateStr).getTime() + 24*60*60*1000);
			        var nextDateStr = dateFormat(nextDate.getTime());
			        $("#dailyDate").html(nextDateStr);
			  		if(datedifference(dailyDateStr,getNowFormatDate())>3){
			            $("#subState").html('延期');
		            }else{
			            $("#subState").html('正常');
		            }		                
			     } else {
			         $("#dailyDate").html(getNowFormatDate());
			         $("#subState").html('正常');
			     }		
			}	
		}    
	});
	
	//初始化员工驻地
	$.ajax({
		url: pathUrl+'/getUserLocation.action',
		type:'post',
		data :{userName:appUserInfo.mUserName},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		error : function(){
			mui.confirm('操作失败！', '',btnArray, function(e) {
			});
		},
		success:function(data){
			var jsonData = eval('('+data+')');
			if (jsonData) {
				if (jsonData.provinceName && jsonData.cityName) {
			        if (jsonData.provinceName == '北京' && jsonData.cityName == '东城区') {
					    $("#site").html('北京,海淀区');	
				    } else {
					    $("#site").html(jsonData.provinceName + ',' + jsonData.cityName);	
				    }
			    }        
			}	
		}    
	});
}
//获取当前时间
function getNowFormatDate() {
    var date = new Date();
    //date.setTime(str)
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

//获取日报基本信息
function getData(){
	//基本信息
	var dailyInfo = eval('('+localStorage.dailyInfo+')');
	//今日计划
	//var dailyPlanListCurr = eval('('+localStorage.dailyPlanListCurr+')');
	//工作内容
	var workList = eval('('+localStorage.workList+')');
	//明日计划
	var dailyPlanList = eval('('+localStorage.dailyPlanList+')');
	if(dailyInfo!=null){
		if(dailyInfo.dailyDateStr==null||dailyInfo.dailyDateStr==""){
			$("#dailyDate").text("");
		}else{
			$("#dailyDate").text(dailyInfo.dailyDateStr);
		}
		$("#subState").html((dailyInfo.subState==null?"":dailyInfo.subState));
		$("#evaluate").text(dailyInfo.evaluate==null||dailyInfo.evaluate==""?"B":dailyInfo.evaluate);
		$("#evaluateDisc").val(dailyInfo.evaluateDisc==null||dailyInfo.evaluateDisc==""?"":dailyInfo.evaluateDisc);
		document.getElementById('site').innerHTML = (dailyInfo.site==null||dailyInfo.site==""?"北京市 海淀区":dailyInfo.site);
	}
 	//工作内容
 	if(workList!=null){
		$.each(workList,function(index,work){
			var i = index + 1;
			count = i;
	    	var dataList = '<div><div class="title">'+
					'工作填写-内容'+i+
					'<div class="right mui-icon mui-icon-trash"></div>'+
				'</div>'+
				'<ul class="formList workContent">'+
					'<li class="clearfix">'+
						'<div class="left label"><span class="mui-badge mui-badge-primary" id="workHour-'+i+'">'+(work.workHour == null?"0":work.workHour)+'h</span></div>'+
						'<span id="endTime-'+i+'"  data-options=\'{"type":"time"}\' class="btn right mr">'+(work.endTime==null||work.endTime==""?"结束时间":work.endTime)+'</span>'+
						'<img src="../../images/adr-arrow.png" class="right" alt="" style="height: 25px;margin: 8px 10px;">'+
						'<span id="startTime-'+i+'" class="btn right"  data-options=\'{"type":"time"}\'>'+(work.startTime==null||work.startTime==""?"开始时间":work.startTime)+'</span>'+
					'</li>'+				
					'<li class="clearfix">'+
						'<span class="left label">项目(预算)编号</span>'+
						'<img src="../../images/rightarr.png" alt="" class="right rightArr">' + 
						'<div style="float:right; margin-right: 5%;"><a id="proNo-' + i + '" style="color: #666" >' + (work.proNo == null?"":work.proNo) + '</a>' + 					
						'<input type="hidden" id="projectId-' + i + '" value="' + (work.projectId ? work.projectId : "") + '" />' + 
						'<input type="hidden" id="projectNo-' + i + '" value="' + (work.projectNo ? work.projectNo : "")+ '" />' + 
						'<input type="hidden" id="projectType-' + i + '" value="' + (work.projectType ? work.projectType : ""  )+ '" />' + 
						'<input type="hidden" id="isProject-' + i + '" value="' + (work.isProject ? work.isProject : "") + '" />' + 
						'<input type="hidden" id="deptId-' + i + '" value="' + (work.deptId ? work.deptId : "") + '" />' + 	
                        '<input type="hidden" id="allotUser-' + i + '" value="' + (work.allotUser ? work.allotUser : "") + '" />' + 
                        '<input type="hidden" id="workNo-' + i + '" value="' + (work.workNo ? work.workNo : "") + '" />' + 
					'</div></li>'+
					'<li class="clearfix" id="showProPicker">'+
						'<span class="left label">里程碑</span>'+	
						'<input type="text"  class="f_input right wp60 red" id="proMile-' + i + '" onclick="initLcbCondition(' + i + ')" value="'+(work.proMile == null?"":work.proMile)+'" readonly/>'+
					'</li>'+
					'<li class="clearfix">'+
						'<span class="left label">任务名称</span>'+
						'<input type="text" class="f_input right wp60 red" id="jobName-'+i+'" value="'+(work.jobName == null?"":work.jobName)+'"/>'+
					'</li>'+
					'<li class="clearfix">'+
						'<span class="left label">完成进度</span>'+
						'<input type="text" class="f_input right wp60 red" id="jobRate-'+i+'" value="'+(work.jobRate == null?"":work.jobRate)+'"/>'+
					'</li>'+
					'<li class="clearfix" style="height: auto;">'+
						'<textarea class="mui-input-speech t10" style="margin-bottom: 0;" id="jobDisc-'+i+'" rows="5" placeholder="请输入任务描述">'+(work.jobDisc == null?"":work.jobDisc)+'</textarea>'+
					'</li>'+
					'<li class="clearfix" style="height: auto;">'+
						'<textarea class="mui-input-speech t10" style="margin-bottom: 0;" id="jobPath-'+i+'" rows="5" placeholder="请输入成果路径">'+(work.jobPath == null?"":work.jobPath)+'</textarea>'+
					'</li>'+
				'</ul></div>';
			$("#workList").append(dataList);
			//构建选择项目编号
	        var projectElem = document.getElementById('proNo-' + i);
	        if (projectElem) {
	           projectElem.addEventListener('tap', function(event) {
		           prjTriggerIndex = event.target.id;
			       mui("#middlePopover").popover('toggle', document.getElementById(prjTriggerIndex));
	           }, false);
	        }
	
//			getTime('endTime-'+i);//结束时间绑定选择时间控件
//			getTime('startTime-'+i);//开始时间绑定选择时间控件
			//为选择时间元素添加监听
			var startHour = $('#startTime-' + i).text();
			var endHour = $('#endTime-' + i).text();
			getTimeAttachCallback('startTime-' + i,function(startHour){
				var endHour = $('#endTime-' + i).text();
				if(endHour != '' && endHour != '结束时间'){
					if(endHour <= startHour){
						$('#workHour-' + i).text('0.0h');
					}else{
						var curtDate = new Date();
						var year = curtDate.getFullYear();
						var month = curtDate.getMonth() + 1;
						var day = curtDate.getDate();
						var start = year + "-" + month + "-" + day + " " + startHour;
						var end = year + "-" + month + "-" + day + " " + endHour;
						$('#workHour-' + i).text(getHour(start,end).toFixed(1) + 'h');
					}	
				}
			});
			getTimeAttachCallback('endTime-' + i,function(endHour){
				var startHour = $('#startTime-' + i).text();
				if(startHour != '' && startHour != '结束时间'){
					if(endHour <= startHour){
						$('#workHour-' + i).text('0.0h');
					}else{
						var curtDate = new Date();
						var year = curtDate.getFullYear();
						var month = curtDate.getMonth() + 1;
						var day = curtDate.getDate();
						var start = year + "-" + month + "-" + day + " " + startHour;
						var end = year + "-" + month + "-" + day + " " + endHour;
						$('#workHour-' + i).text(getHour(start,end).toFixed(1) + 'h');
					}
				}
			});
			//为新添加的删除图标添加监听
			delIconEvent();
	 	});	
 	}
//		 	明日计划
		if(dailyPlanList!=null && dailyPlanList!='undefined' && dailyPlanList.length>0){
			$.each(dailyPlanList,function(index,dailyPlan){
				var i = index + 1;
				countPlan = i;
		    	var dataList =  '<li class="clearfix" style="height: auto;">'+
									'<textarea class="mui-input-speech t10" style="margin-bottom: 0;" id="plan-'+i+'" rows="5" placeholder="请输入明日计划">'+(dailyPlan.plan == null?"":dailyPlan.plan)+'</textarea>'+
								'</li>';
				$("#plan-content").append(dataList);
		 	});
		 }else{
		 	countPlan ++;
	    	var dataList =  '<li class="clearfix" style="height: auto;">'+
								'<textarea class="mui-input-speech t10" style="margin-bottom: 0;" id="plan-'+countPlan+'" rows="5" placeholder="请输入明日计划"></textarea>'+
							'</li>';
			$("#plan-content").append(dataList);
		 }
		
		var logList = eval('('+localStorage.logList+')');
		if(logList!=null&&logList.length>0){
			$.each(logList,function(index,log){
				html="<li class='clearfix' id='ifAgree'>\
					<div class='left label'>审批人</div>\
					<div class='mui-radio right' style=' display: inline-block; '>\
						<span id='checkUser'>"+log.taskUser+"</span>\
					</div>\
				</li>\
				<li class='clearfix' id='ifAgree'>\
					<div class='left label'>审批日期</div>\
					<div class='mui-radio right' style=' display: inline-block; '>\
						<span id='checkDate'>"+dateFormat(log.taskFinishTime)+"</span>\
					</div>\
				</li>\
				<li class='clearfix' style='height: auto;'>\
				<div class='left label'>审批意见</div>\
				<textarea class='mui-input-speech t10' style='margin-bottom: 0;' id='checkDesc' rows='5' value='"+log.examineOption+"' readonly='readonly'></textarea>\
				</li>"
				$("#checkData").append(html);
			});
		}
}

//日期转换：字符串转日期类型
function stringToDate(dateStr){
     var separator="-";
     var dateArr = dateStr.split(separator);
     var year = parseInt(dateArr[0]);
     var month;
     //处理月份为04这样的情况                         
     if(dateArr[1].indexOf("0") == 0){
         month = parseInt(dateArr[1].substring(1));
     }else{
          month = parseInt(dateArr[1]);
     }
     var day = parseInt(dateArr[2]);
     var date = new Date(year,month -1,day);
     return date;
 }
/* 
* 时间格式化工具 
* 把Long类型的1527672756454日期还原yyyy-MM-dd格式日期 
*/
function dateFormat(longTypeDate){ 
	var dateTypeDate = ""; 
	var date = new Date(); 
	date.setTime(longTypeDate); 
	dateTypeDate += date.getFullYear(); //年 
	dateTypeDate += "-" + (date.getMonth(date) + 1); //月 
	dateTypeDate += "-" + date.getDate(date); //日 
	return dateTypeDate; 
} 

//提交日报
function submitDaily(flag){

	if(localStorage.txf==0 && localStorage.isTxf && localStorage.isTxf>0){
		mui.alert("您无权限报销通讯费！");
		return false;
	}
	var btnArray = ['确定'];
	var dailyMode = new Object();
	//基本信息
	var dailyInfo = eval('('+localStorage.dailyInfo+')');
	if(!dailyInfo){
		dailyInfo={};
	}
		//基本信息
	if (!$("#dailyDate").text() || '时间' == $("#dailyDate").text()) {
		mui.confirm('请选择日报日期！', '',btnArray, function(e) {
		});
		return false;
	} 
	dailyInfo.state = flag;
	var evaluate=$("#evaluate").text();//自我评价
	dailyInfo.evaluate = evaluate;
	var evaluateDisc=$("#evaluateDisc").val();//自我评价描述
	dailyInfo.evaluateDisc = evaluateDisc;
	if(evaluate=='A' && (evaluateDisc==null||evaluateDisc=='')){
		mui.confirm('请输入自我评价描述！', '',btnArray, function(e) {
		});
		return false;
	}
	dailyInfo.dailyDate = stringToDate($("#dailyDate").text());
	dailyInfo.subState = $("#subState").html();
	if(dailyInfo.subState=='日报已存在'){
		mui.confirm('日报已存在！', '', btnArray, function(e) {
		});
		return false;
	}
	var nowData=$("#dailyDate").text();
	//if(!describe&&flag==1){
		//if(nowData!=getNowFormatDate()){
			//mui.confirm('不存在考勤！', '',btnArray, function(e) {
			//});
			//return false;
		//}
	//}
	dailyInfo.site = document.getElementById('site').innerHTML;
	dailyInfo = JSON.stringify(dailyInfo);
	//报工内容 
	var workListArr = [];

	var isJobRateValidFlag = true;
	var isProjNoValidFlag = true;
	$('.workContent').each(function(i,item){
		var work = new Object();
		$(this).find('span').each(function(j,item){
			var idTmp = $(this).attr('id');
			if(idTmp != null && idTmp != 'undefined'){
				var id = idTmp.slice(0,idTmp.indexOf('-'));
				var value = document.getElementById(idTmp).innerHTML;
				if(id == 'workHour'){
					value = value.substr(0,value.length-1);
				}
				if(value!='undefined' && value!='开始时间' && value!='结束时间'){
					work[id]=value;
				}else{
					work[id]='';
				}
			}
		});
		$(this).find('input').each(function(j,item){
			var idTmp = $(this).attr('id');
			if(idTmp != null && idTmp != 'undefined'){
				var id = idTmp.slice(0,idTmp.indexOf('-'));
				var value = $(this).attr('value');
				//完成进度
				if(id=='jobRate'&&(value == '' || value =='undefined' || value == null || value>100||isNaN(value))){
					isJobRateValidFlag = false;
				}
				//项目编号不能为空
				if(id=='proNo'&& (value =='请选择' || value == '' || value =='undefined' || value == null)){
					isProjNoValidFlag = false;
				}			
				if(value!='undefined'){
					work[id]=value;
				}else{
					work[id]='';
				}
			}
		});
		$(this).find('a').each(function(j,item){
			var idTmp = $(this).attr('id');
			if(idTmp != null && idTmp != 'undefined'){
				var id = idTmp.slice(0,idTmp.indexOf('-'));
				var value = $(this).text();
				if(isFlag==1){
					value=map.get(value);
				}
				//项目编号不能为空
				if(id=='proNo'&& (value =='请选择' || value == '' || value =='undefined' || value == null)){
					isProjNoValidFlag = false;
				}
				if(value!='undefined'){
					work[id]=value;
				}else{
					work[id]='';
				}
			}
		});
		
		$(this).find('textarea').each(function(j,item){
			var idTmp = $(this).attr('id');
			if(idTmp != null && idTmp != 'undefined'){
				var id = idTmp.slice(0,idTmp.indexOf('-'));
				var value = $(this).attr('value');
				if(value!='undefined'){
					work[id]=value;
				}else{
					work[id]='';
				}
			}
		});
		workListArr.push(work);
	});
	if(workListArr.length==0){
		mui.confirm('请填写工作内容！', '', btnArray, function(e) {
		});
		return false;
	}
	if (!isProjNoValidFlag) {
		mui.confirm('请选择项目编号', '', btnArray, function(e) {
		});
		return false;
	}
	if (!isJobRateValidFlag) {
		mui.confirm('完成进度必须为小于100的数字！', '',btnArray, function(e) {
		});
		return false;
	}
	var workList = JSON.stringify(workListArr);
	//明日计划
	var dailyPlanListArr = [];
	for(var i=1;i<=countPlan;i++){
		var dailyPlan = new Object();
		dailyPlan.plan = $("#plan-"+i).val();
		dailyPlanListArr.push(dailyPlan);
	}
	var dailyPlanList = JSON.stringify(dailyPlanListArr);
	//报销信息
	var dailySpends = localStorage.dailySpends;
	//发票信息
	var dailyAssortList = localStorage.dailyAssortList;
	
	var dailySpend=eval('('+localStorage.dailySpends+')');
	var assortList=eval('('+localStorage.dailyAssortList+')');
	if(dailySpend!=null && dailySpend!='[]'){
		var isbudgetTypeValid = true;
		var isTeamSiteValid = true;
		var isTeamUserValid = true;
		var isProNoValid = true;
		$.each(dailySpend,function(i,spend){
			//检查预算编号
			if (!spend.proNo || spend.proNo == '' ||  spend.proNo == 'null' || spend.proNo == '请选择') {
			    isProNoValid=false;
			}
			//检查花销分类
			if (!spend.budgetType || spend.budgetType == '' ||  spend.budgetType == 'null' || spend.budgetType == '请选择') {
				isbudgetTypeValid = false;
			}		
			if(assortList!=null && assortList!='[]'){
				$.each(assortList,function(i,assort){
					if(spend.budgetType == '团队建设费'){
						if(spend.spendNo == assort.spendNo){
							if(assort.teamSite==''){
								isTeamSiteValid = false;
							}
							if(assort.teamUser==''){
								isTeamUserValid = false;
							}
						}
					}				
				});
			}
		});
		if (!isProNoValid) {
		    mui.confirm('请选择与预算编号', '', btnArray, function(e) {
			}); 
			return false;
		}
		if (!isbudgetTypeValid) {
		    mui.confirm('请选择花销分类', '', btnArray, function(e) {
			}); 
			return false;
		}		
		if (!isTeamSiteValid) {
			mui.confirm('团建日期和地点内容不能为空', '', btnArray, function(e) {
			});  
			return false;
		}
		if (!isTeamUserValid) {
			mui.confirm('团建人员不能为空', '', btnArray, function(e) {
			});
			return false;
		}			
	}
	
	if(assortList!=null&&assortList!='[]'){
		var isSpendMoneyValid = true;
		var isTicketInfoValid = true;
		var isOperationTypeValid = true;
		var isTicketComValid = true;
		$.each(assortList,function(i,assort){
			if(assort.spendMoney =='undefined' || assort.spendMoney == null || assort.spendMoney==''||isNaN(assort.spendMoney)||assort.spendMoney>100000){			
				isSpendMoneyValid=false;
			}
			if(assort.ticketInfo==''){
				isTicketInfoValid=false;
			}
			if(assort.operationType == '操作类型'){
				isOperationTypeValid=false;
			}
			if(assort.ticketCom =='undefined' || assort.ticketCom == null || assort.ticketCom==''){
				isTicketComValid=false;
			}
		});
		if (!isOperationTypeValid) {
			mui.confirm('请选择操作类型', '', btnArray, function(e) {
			});
			return false;
		}

		
		if (flag != '' && flag != 'undefined' && flag == '1' && flag != null && !isTicketComValid) {
			mui.confirm('开票单位不能为空', '', btnArray, function(e) {
			});
			return false;
		}

		if (!isTicketInfoValid) {
			mui.confirm('发票内容不能为空', '', btnArray, function(e) {
			});
			return false;
		}
	}

	//参数实体
	dailyMode.dailWorkList = workList;
	dailyMode.dailyPlanList = dailyPlanList;
	dailyMode.dailySpends = dailySpends;
	dailyMode.dailyAssortList = dailyAssortList;
	dailyMode.dailyInfo = dailyInfo;
	var daily=JSON.stringify(dailyMode);
	if($.isEmptyObject(workList)){
		mui.confirm('未填写具体工作！', '', btnArray, function(e) {
		}); 
		return false;
	}
	var newDailyObj = {};
	newDailyObj.userName=appUserInfo.mUserName;
	newDailyObj.didiIds=didiIds;
	newDailyObj.hotelIds=hotelIds;
	newDailyObj.listTemp=listTemp;
	newDailyObj.wxUserId=preId+appUserInfo.mWxUserId;
	newDailyObj.daily=dailyMode;
	var newDailyJson = JSON.stringify(newDailyObj);
	$.ajax({
		url: pathUrl+'/saveDailyInfo.action',
		type:'post',
		data : newDailyJson,
		async:false,/*同步请求*/
		contentType:"application/json",
		error : function(){
			mui.confirm('操作失败！', '', btnArray, function(e) {
			});
		},
		success:function(data){
		    if (data) {
			    var jsonData = eval('('+data+')');
			    var flag= jsonData.flag;
			    if(flag == true){
					localStorage.removeItem('dailyMode');
				    localStorage.removeItem('dailyAssortList');
				    localStorage.removeItem('dailySpends');
				    localStorage.removeItem('dailyInfo');
				    localStorage.removeItem('workList');
				    localStorage.removeItem('invoiceIdValue');
				    localStorage=null;
				    mui.confirm('操作成功！', '', btnArray, function(e) {
					    mui.openWindow({
						    url:"daliyList.html"
					    });
				    });
			    }else{
			        if (!jsonData.msg || jsonData.msg == null || jsonData.msg == 'undefined' || jsonData.msg == "") {
			             jsonData.msg = "保存日报失败，请联系管理员";			        
			        }
				    mui.confirm(jsonData.msg, '', btnArray, function(e) {
				    });
			    }
			} else{
				    mui.confirm('操作失败！', '', btnArray, function(e) {
				    });
			}
		}    
	});
}

//跳转到日报费用界面
function toExpense(){
	var site=$("#site").text();
	localStorage.site=site;
	localStorage.didiIds=didiIds;
	localStorage.hotelIds=hotelIds;
	localStorage.listTemp=listTemp;
	localStorage.sworkNo;
	var dailyInfo ={};
	var btnArray = ['确定'];
	//判断是否点击添加进入
	if(localStorage.fromFlag !=null && localStorage.fromFlag != 'null'){
		dailyInfo= eval('('+localStorage.dailyInfo+')');
		if (!dailyInfo) {
			dailyInfo ={};
		}
	}else{
		localStorage.fromFlag=1;
	}
	//基本信息
	if ($("#dailyDate").text() && '时间' != $("#dailyDate").text()) {
		dailyInfo.dailyDateStr = $("#dailyDate").text();
	} else {
		mui.confirm('请选择日报日期！', '',btnArray, function(e) {
		});
		return false;
	}
    dailyInfo.subState = $("#subState").html();
	//校验自我描述
	var evaluate=$("#evaluate").text();//自我评价
	dailyInfo.evaluate = evaluate;
	var evaluateDisc=$("#evaluateDisc").val();//自我评价描述
	dailyInfo.evaluateDisc = evaluateDisc;
	if(evaluate=='A' && (evaluateDisc==null||evaluateDisc=='')){
		mui.confirm('请输入自我评价描述！', '',btnArray, function(e) {
		});
		return false;
	}
	dailyInfo.site = document.getElementById('site').innerHTML;
	dailyInfo = JSON.stringify(dailyInfo);
	//报工内容 
	var workListArr = [];
	//项目编号
	var proDate=[];
	var proDataIndex = 0;
	var isEmptyProNo = false;
	var isJobRateValidFlag = true;
	$('.workContent').each(function(i,item){
		var work = new Object();
		var proName = new Object();
		$(this).find('span').each(function(j,item){
			var idTmp = $(this).attr('id');
			if(idTmp != null && idTmp != 'undefined'){
				var id = idTmp.slice(0,idTmp.indexOf('-'));
				var value = document.getElementById(idTmp).innerHTML;
				if(id == 'workHour'){
					value = value.substr(0,value.length-1);
				}
				if(value!='undefined' && value!='开始时间' && value!='结束时间'){
					work[id]=value;
				}else{
					work[id]='';
				}
			}
		});
	
		$(this).find('input').each(function(j,item){			
			var idTmp = $(this).attr('id');
			if(idTmp != null && idTmp != 'undefined'){
				var id = idTmp.slice(0,idTmp.indexOf('-'));
				var value = $(this).attr('value');			
				//完成进度		
				if(id=='jobRate'&&(value == '' || value =='undefined' || value == null || value > 100|| isNaN(value))){
					isJobRateValidFlag = false;
				}
				//项目编号不能为空
				if(id=='proNo'&& (value =='请选择' || value == '' || value =='undefined' || value == null)){
					isEmptyProNo=true;
				}
				if(value!='undefined'){
					work[id]=value;
				}else{
					work[id]='';
				}
			}
		});
	
		$(this).find('textarea').each(function(j,item){
			var idTmp = $(this).attr('id');
			if(idTmp != null && idTmp != 'undefined'){
				var id = idTmp.slice(0,idTmp.indexOf('-'));
				var value = $(this).attr('value');	
				if(value!='undefined'){
					work[id]=value;
				}else{
					work[id]='';
				}
			}
		});
		
		$(this).find('a').each(function(j,item){
			var idTmp = $(this).attr('id');
			if(idTmp != null && idTmp != 'undefined'){
				var id = idTmp.slice(0,idTmp.indexOf('-'));
				var value = $(this).text();
				if(isFlag==1){
					value=map.get(value);
				}
				if(id == 'proNo' && (value =='请选择' || value == '' || value =='undefined' || value == null)){
					isEmptyProNo = true;												
				}
				if(value!='undefined'){
					work[id]=value;
				}else{
					work[id]='';
				}
				if(id=='proNo' && !isEmptyProNo){
				    var projectIndexId = idTmp.substring (idTmp.indexOf('-') + 1);
				    var projectNumTmp = document.getElementById("projectNo-" + projectIndexId).value;
				    var projectTypeTmp = document.getElementById("projectType-" + projectIndexId).value;
				    var tempValue = projectNumTmp + '#_#' + projectTypeTmp +'#_#' +work.workNo;
				    proDate[proDataIndex] = { value: tempValue,  text: value };
				    proDataIndex = proDataIndex + 1;
				}
			}
		});
		workListArr.push(work);
	});
	if(workListArr.length==0){
		mui.confirm('请填写工作内容！', '', btnArray, function(e) {
		});
		return false;
	}

	if (isEmptyProNo) {
		mui.confirm('请选择项目编号', '', btnArray, function(e) {
		});
		return false;
	}
	if (!isJobRateValidFlag) {
		mui.confirm('完成进度必须为小于100的数字！', '',btnArray, function(e) {
		});
		return false;
	}
	var  workList = JSON.stringify(workListArr);
	var dailyPlanListArr = [];
	for(var i=1;i<=countPlan;i++){
		var dailyPlan = new Object();
		dailyPlan.plan = $("#plan-"+i).val();
		dailyPlanListArr.push(dailyPlan);
	}
	
	var  dailyPlanList = JSON.stringify(dailyPlanListArr);
	localStorage.dailyInfo = dailyInfo;
	localStorage.workList = workList;
	localStorage.dailyPlanList = dailyPlanList;
	localStorage.proDate= JSON.stringify(proDate);
	if (!isEmptyProNo) {
	   mui.openWindow({
		url:"report-expense.html"
	   });
	}
}

//监听添加工作计划按钮
document.getElementById('addWork').addEventListener('tap',function(e){
	/**
	 * 为什么要声明临时变量？
	 * 因为elementIdIndex是唯一ID编号，会在最后加一
	 * 如果不赋值给临时变量，在执行动作监听时会根据新的elementIdIndex值查找ID，结果为NULL
	 * 所以将值给临时变量再加一
	 */
	tmpIndex = count+1;
	count = tmpIndex;
	var planNum = $('div#workList > div').length;
	var endHour = '';
	if(planNum != 0){
		//取上个计划的结束时间
		endHour = $('#endTime-' + (tmpIndex - 1)).text();
		if(endHour>='12:00'&&endHour<'13:30'){
			endHour='13:30';
		}
	}
	var html = "<div><div class='title'>\
				工作填写-内容" + (planNum + 1) + "<div class='right mui-icon mui-icon-trash'></div>\
			    </div>\
			    <ul class='formList workContent'>\
				<li class='clearfix'>\
			    <div class='left label'><span class='mui-badge mui-badge-primary' id='workHour-" + tmpIndex + "'>0h</span></div>\
				<span id='endTime-" + tmpIndex + "' data-options='{\"type\":\"time\"}' class='btn right mr'>结束时间</span>\
				<img src='../../images/adr-arrow.png' class='right' alt='' style='height: 25px;margin: 8px 10px;'>\
				<span id='startTime-" + tmpIndex + "' class='btn right'  data-options='{\"type\":\"time\"}'>开始时间</span>\
				</li>\
				<li class='clearfix'>\
				<span class='left label'>项目(预算)编号</span>\
				   <img src='../../images/rightarr.png' alt='' class='right rightArr'>\
				   <div style='float:right; margin-right: 5%;'><a id='proNo-" + tmpIndex + "' style='color: #666' >请选择</a></div>\
				   <input type='hidden' id='projectId-" + tmpIndex + "' />\
				   <input type='hidden' id='projectNo-" + tmpIndex + "' />\
				   <input type='hidden' id='projectType-" + tmpIndex + "' />\
				   <input type='hidden' id='isProject-" + tmpIndex + "' />\
				   <input type='hidden' id='deptId-" + tmpIndex + "' />\
				   <input type='hidden' id='allotUser-" + tmpIndex + "' value='" + appUserInfo.mUserName +  "' />\
				   <input type='hidden' id='workNo-" + tmpIndex + "' value='" + (new Date()).getTime() +  "' />\
				</li>\
				<li class='clearfix' id='showProPicker'>\
				<span class='left label'>里程碑</span>\
				<input type='text' class='f_input right wp60 red' id='proMile-" + tmpIndex + "'  onclick='initLcbCondition(" + tmpIndex + ")' placeholder='请输入里程碑' />\
				</li>\
				<li class='clearfix'>\
				<span class='left label'>任务名称</span>\
				<input type='text' class='f_input right wp60 red' id='jobName-" + tmpIndex + "' placeholder='请输入任务名称'/>\
				</li>\
				<li class='clearfix'>\
				<span class='left label'>完成进度</span>\
				<input type='text' class='f_input right wp60 red' id='jobRate-" + tmpIndex + "' placeholder='请输入完成进度'/>\
				</li>\
				<li class='clearfix' style='height: auto;'>\
				<textarea class='mui-input-speech t10' style='margin-bottom: 0;' id='jobDisc-" + tmpIndex + "'  rows='5' placeholder='请输入任务描述'></textarea>\
				</li>\
				<li class='clearfix' style='height: auto;'>\
				<textarea class='mui-input-speech t10' style='margin-bottom: 0;' id='jobPath-" + tmpIndex + "'  rows='5' placeholder='请输入成果路径'></textarea>\
				</li>\
			    </ul></div>";
	$('#workList').append(html);
	//构建选择项目编号
	var projectElem = document.getElementById('proNo-' + tmpIndex);
	if (projectElem) {
	    projectElem.addEventListener('tap', function(event) {
		    prjTriggerIndex = event.target.id;
		    
		    //初始化部门数据
	        $('#deptSelection').children().remove();
	        $("#deptSelection").prepend(options);
	        //初始化人员数据
	        $('#memberSelection').children().remove();
          	$('#memberSelection').append('<option value="请选择人员">请选择人员</option>');
        	//初始化项目
	        $("#projectText").children().remove();
	        $("#projectText").prepend(defaultProjList); 
		    
			mui("#middlePopover").popover('toggle', document.getElementById(prjTriggerIndex));
	    }, false);
	}
	if(endHour != '' && endHour != '结束时间'){
		$('#startTime-' + tmpIndex).text(endHour);
	}

	//为选择时间元素添加监听
	getTimeAttachCallbackAdd('startTime-' + tmpIndex,function(startHour,timeId){
		timeIdNum = timeId.split('-')[1];
		var endHour = $('#endTime-' + timeIdNum).text();
		if(endHour != '' && endHour != '结束时间'){
			if(endHour <= startHour){
				$('#workHour-' + timeIdNum).text('0.0h');
			}else{
				var curtDate = new Date();
				var year = curtDate.getFullYear();
				var month = curtDate.getMonth() + 1;
				var day = curtDate.getDate();
				var start = year + "-" + month + "-" + day + " " + startHour;
				var end = year + "-" + month + "-" + day + " " + endHour;
				$('#workHour-' + timeIdNum).text(getHour(start,end).toFixed(1) + 'h');
			}	
		}
	});
	getTimeAttachCallbackAdd('endTime-' + tmpIndex,function(endHour,timeId){
		timeIdNum = timeId.split('-')[1];
		var startHour = $('#startTime-' + timeIdNum).text();
		if(startHour != '' && startHour != '结束时间'){
			if(endHour <= startHour){
				$('#workHour-' + timeIdNum).text('0.0h');
			}else{
				var curtDate = new Date();
				var year = curtDate.getFullYear();
				var month = curtDate.getMonth() + 1;
				var day = curtDate.getDate();
				var start = year + "-" + month + "-" + day + " " + startHour;
				var end = year + "-" + month + "-" + day + " " + endHour;
				$('#workHour-' + timeIdNum).text(getHour(start,end).toFixed(1) + 'h');
			}		
		}
	});
	//为新添加的删除图标添加监听
	delIconEvent();
})

//删除图标
delIconEvent();	

//初始化用户列表
function initManagerInfo(departSelection){
    var sname=null;
	var deptType = $(departSelection).find('option:selected').attr('dept-type');
    $('#memberSelection').children().remove();
    $("#projectText").children().remove();
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

//处理用户选择项目列表中的项目
function radios(proId, proName, proNumber, proType, isProj, deptId){
	var prjIndexId = prjTriggerIndex.substring (prjTriggerIndex.indexOf('-') + 1);
	//set 显示值
	if(isFlag==0){
		
		$("#"+prjTriggerIndex).text(proName);
	}else{
		
		$("#"+prjTriggerIndex).text(proNumber);
	}
	//set Id
	var hiddeProjId = document.getElementById("projectId-" + prjIndexId); 
	if (hiddeProjId) {
	    hiddeProjId.value = proId;
	}
	//set num
	var hiddeProjNum = document.getElementById("projectNo-" + prjIndexId); 
	if (hiddeProjNum) {
	    hiddeProjNum.value = proNumber;
	}
	//set type
	var hiddeProjType = document.getElementById("projectType-" + prjIndexId); 
	if (hiddeProjType) {
	    hiddeProjType.value = proType;
	}
	//set isProject
	var hiddeIsProject = document.getElementById("isProject-" + prjIndexId); 
	if (hiddeIsProject) {
	    hiddeIsProject.value = isProj;
	}
	//set departmentId
	var hiddeDeptId = document.getElementById("deptId-" + prjIndexId); 
	if (hiddeDeptId) {
	    hiddeDeptId.value = deptId;
	}
	//更新费用缓存的信息 - 清除缓存信息
	if (localStorage.dailySpends && localStorage.dailySpends != null && localStorage.dailySpends != '') {
	    var dailySpends = eval('('+localStorage.dailySpends+')');
	    if (dailySpends[prjIndexId-1]) {
	        dailySpends[prjIndexId-1].proNo = proName;    
	        dailySpends[prjIndexId-1].projectNo = proNumber;
	        dailySpends[prjIndexId-1].projectType = proType;
	        dailySpends[prjIndexId-1].budgetType = '请选择';
	        dailySpends[prjIndexId-1].budgetNo = '';
	        dailySpends[prjIndexId-1].budgetTypeCode = '';
	        dailySpends[prjIndexId-1].budgetAvailable = '';
	        localStorage.dailySpends =  JSON.stringify(dailySpends);  
	    }
	}
	//initLcbCondition(prjIndexId);
}

//处理选择用户事件
function selectMember(memSelection,firstName){
	$("#projectText").children().remove();
	var memName=null;
	var isLoginUser = false;
	if(memSelection!=null){
		memName= $(memSelection).find('option:selected').attr('value');
	}else if(firstName==null ||firstName==''){
		memName=appUserInfo.mUserName;	
		isLoginUser = true;	
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
			   localStorage.ktext=jsonResult.ktext;
			   var departId = '';
			   if (json.deptId) {
			       departId = json.deptId;
			   }
			   radioHtml += '<p id="radio' + radioIndex + '"><input type="radio" id="radio' + radioIndex + '" onchange="radios(\'' + jsonResult.cbzx + '\',\'' + jsonResult.ktext + '\',\'' + jsonResult.lrzx + '\', 99 ,2,' + departId + ')" name="radio" />'+  jsonResult.ktext  + '</p>';	            		
			}
			var login=$("#memberSelection option:selected").val();
        	$.each(json.list, function(index,value){
        	    index = index + radioIndex;
        	    map.set(value.projNo,value.projName);
        	    if(appUserInfo.mUserName==login || "请选择人员"==login){
        	    	isFlag=0
        			radioHtml += '<p id="radio' + index + '"><input type="radio" id="radio' + index + '" onchange="radios(\'' + value.id + '\',\'' + value.projName + '\',\'' + value.projNo + '\',' + value.projType + ',1, \'\')" name="radio" />'+  value.projName + '</p>';	            		
	        	}else{
	        		isFlag=1
	        		radioHtml += '<p id="radio' + index + '"><input type="radio" id="radio' + index + '" onchange="radios(\'' + value.id + '\',\'' + value.projName + '\',\'' + value.projNo + '\',' + value.projType + ',1, \'\')" name="radio" />'+  value.projNo + '</p>';
	        	};
			})
			if (isLoginUser) {
			    defaultProjList = radioHtml;
			}
        	$("#projectText").prepend(radioHtml); 
        }
    })
}

//获取部门信息
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
}
	
//如果初始页面计划列表为空，则可以把这个函数移除，把函数体放到调用函数的位置
//如果初始页面计划列表不为空，则保持不变
function delIconEvent(){
	//删除图标添加监听
	$('#workList > div').on('tap', 'div.title > div.mui-icon-trash', function(){
		var aaa=$(this).parent().text().trim().substring(7);
		var workNo=$("#workNo-"+aaa).val();
		if(workNo!=null&&workNo!=""){
			localStorage.sworkNo=workNo;
		}
		$(this).parent().parent().remove();
		var aaa=$(this).parent().parent().html();
		//var result=$(this).parent().html();
		//var data=JSON.stringify(localStorage.workList);	
	})
}

//计算时间差
function getHour(s1,s2) {
        s1 = new Date(s1.replace(/-/g, '/'));
        s2 = new Date(s2.replace(/-/g, '/'));
        var ms = Math.abs(s1.getTime() - s2.getTime());
        return ms / 1000 / 60 / 60;
}
//两个时间相差天数 
function datedifference(sDate1, sDate2) {    //sDate1和sDate2是2006-12-18格式  
    var dateSpan,
        tempDate,
        iDays;
    sDate1 = Date.parse(sDate1);
    sDate2 = Date.parse(sDate2);
    dateSpan = sDate2 - sDate1;
    dateSpan = Math.abs(dateSpan);
    iDays = Math.floor(dateSpan / (24 * 3600 * 1000));
    return iDays
};

//获取考勤信息
function getAttendacne(){    
	var btnConfArray = ['确定'];
	var dailyDate = $("#dailyDate").text();
	if(dailyDate=='时间'){
		dailyDate='';
	}else{
		if(datedifference(dailyDate,getNowFormatDate())>3){
			$("#subState").html('延期');
		}else{
			$("#subState").html('正常');
		}
	}
	$.ajax({
		url: pathUrl+'/getAttendInfo.action',
		type:"post",
		data:{
		    dailyTime:dailyDate,
		    userName:appUserInfo.mUserName,
		    wxUserId:preId+appUserInfo.mWxUserId
		},
		async:true,/*同步请求*/
		dataType:"jsonp",
		jsonp:"callback",
		jsonpCallback:"flight",
		error : function(){
			mui.confirm('获取数据失败！', '', btnConfArray, function(e) {
			});
		},
		success:function(data){
			var count=0;
			//基本信息
			var jsonData = eval('(' + data + ')'); 
			var result = jsonData.result;
			$("#amAttendStr").text((result.amAttendStr!=null?result.amAttendStr:""));
			$("#describe1").text((result.describe1!=null&&result.describe1!=""?result.describe1:"未刷卡"));
			if(result.describe1!=null&&result.describe1!=""&&result.describe1!="未刷卡"){
				count++;
			}
			$("#site1").text((result.site1!=null?result.site1:""));
			$("#amClosingStr").text((result.amClosingStr!=null?result.amClosingStr:""));
			$("#describe2").text((result.describe2!=null&&result.describe2!=""?result.describe2:"未刷卡"));
			if(result.describe2!=null&&result.describe2!=""&&result.describe2!="未刷卡"){
				count++;
			}
			$("#site2").text((result.site2!=null?result.site2:""));
			$("#pmAttendStr").text((result.pmAttendStr!=null?result.pmAttendStr:""));
			$("#describe3").text((result.describe3!=null&&result.describe3!=""?result.describe3:"未刷卡"));
			if(result.describe3!=null&&result.describe3!=""&&result.describe3!="未刷卡"){
				count++;
			}
			$("#site3").text((result.site3!=null?result.site3:""));
			$("#pmClosingStr").text((result.pmClosingStr!=null?result.pmClosingStr:""));
			$("#describe4").text((result.describe4!=null&&result.describe4!=""?result.describe4:"未刷卡"));
			if(result.describe4!=null&&result.describe4!=""&&result.describe4!="未刷卡"){
				count++;
			}
			$("#site4").text((result.site4!=null?result.site4:""));
			//日报是否存在
			if(jsonData.flag){
				$("#subState").html('日报已存在');
			}
			if(count==0){
				describe=false;
			}else{
				describe=true;
			}
			//今日计划
			if(jsonData.planList!=null && jsonData.planList!='undefined'){
				$("#planCurr-content").html("");
				$.each(jsonData.planList,function(index,dailyPlan){
					var i = index + 1;
			    	var dataList =  '<li class=" mui-media relative mui-table-view-cell">'+
										'<div>'+(dailyPlan.plan == null?"":dailyPlan.plan)+'</div>'+
									'</li>';
					$("#planCurr-content").append(dataList);
			 	});
			 }
		}
	});
}

//返回日报列表界面
function backDailyList(){
	mui.openWindow({
		url:"daliyList.html"
	});
		
}

//picker处理方法
function getPickData(data) {
 var retData =[];
 $.each(data.data,function(index,result){
    retData[index] = {value:result.proNodeRelationId, text: result.proStage }
 });
 return retData;
}

//初始化里程碑列表
function initLcbCondition(click){
	var value=$("#projectNo-"+click).val();
	var lcbId = "proMile-"+click;
	if(value == "请选择" || value == ""){
		mui.confirm('请填写项目预算编号', '提示',btnArray, function(e){});
 	}else{
 		$.ajax({
		        type: "post",
		        url:pathUrl+"/selectBosom.action",
		        data : {
		             proCode:value
		        },
		        cache:false,
		        async:false,/*同步请求*/
		        dataType: "json",
		        success:function(data){
	                var result = JSON.parse(data);
	                if(result.data.length > 0){
						getSelectLcb(lcbId,lcbId,getPickData(result));
	                } else {
	                	mui.confirm('选择项目无里程碑信息', '提示',btnArray, function(e) {
						});
	                }
		        }
		});
 		
 	}
}

//里程碑选择事件处理
function getSelectLcb(sab,spanId,data){
    var showUserPickerButton = document.getElementById(sab);
    showUserPickerButton.addEventListener('tap', function(event) {
	    var _self = this;
		if (_self.userPicker) {
		    _self.userPicker.setData(data);
		    _self.userPicker.show(function(items) {
                showUserPickerButton.value = items[0].text;
				_self.userPicker.dispose();
                _self.userPicker = null;
            });
		} else {
		    _self.userPicker = new mui.PopPicker();
			_self.userPicker.setData(data);
			_self.userPicker.show(function(items) {
                showUserPickerButton.value = items[0].text;
                _self.userPicker.dispose();
				_self.userPicker = null;
            });	
		}
    }, false);
}

//初始化滴滴打车、酒店住宿、机票等费用信息
function initExistingWork() {
    var spendListTmp = [];
	var assortListTmp = [];
	initDidi(spendListTmp, assortListTmp);
	initHotel(spendListTmp, assortListTmp);
	initFlight(spendListTmp, assortListTmp);

	if (0 < spendListTmp.length) {
	    localStorage.dailySpends = JSON.stringify(spendListTmp);
	    localStorage.dailyAssortList = JSON.stringify(assortListTmp);
	}
}
//编辑状态如如果滴滴，酒店，飞机票等信息不为空，禁用删除等信息
function initExistingWorkEdit() {
	if(localStorage.didiIds||localStorage.hotelIds||localStorage.listTemp){
		for(var i=1;i<=count;i++){
			var bz=$("#jobDisc-"+i).text();
			if(bz.indexOf("网约车")!=-1||bz.indexOf("飞机票")!=-1||bz.indexOf("酒店")!=-1){
				var a=$("#jobDisc-"+i).parent().parent().prev().find("div").removeClass("mui-icon-trash");;
			}
		}
	}
}

//初始化滴滴记录
function initDidi(spendListTmp, assortListTmp){
	var dailyDateTmp =$("#dailyDate").text();
	$.ajax({
          type: "post",
          url:  pathUrl+'/getDidiInfo.action',
          data : {
        	userId:appUserInfo.applyUserId,//3501,
        	orderDate:dailyDateTmp //"2019-05-20"  //dailyDateTmp
          },
		  async:false,/*同步请求*/
          cache:false,
          dataType: "json",
          success:function(data){
			
            if (data) {
             
              var jsonData = eval('('+data+')');
			  if(jsonData.didiOrdertList != null && jsonData.didiOrdertList != 'undefined' && jsonData.didiOrdertList!=''){
	        	  $.each(jsonData.didiOrdertList, function (index, value) {
	        	  		 if(value.id){
              				didiIds.push(value.id);
              			}
                        //初始化工作内容				  
					    tmpIndex = count+1;
	                    count = tmpIndex;
	        		    var jobDesc = "网约车+" + dateFormat(value.orderDate)+ "+"+value.orderApplier+"+"+value.orderMoney;
	            	    var html = "<div><div class='title'>\
	            			工作填写-内容" + tmpIndex + "<div class='right  mui-icon-trash'></div>\
	            		    </div>\
	            		    <ul class='formList workContent'>\
	            			<li class='clearfix'>\
	            		    <div class='left label'><span class='mui-badge mui-badge-primary' id='workHour-" + tmpIndex + "'>0h</span></div>\
	            			<span id='endTime-" + tmpIndex + "' data-options='{\"type\":\"time\"}' class='btn right mr'>结束时间</span>\
	            			<img src='../../images/adr-arrow.png' class='right' alt='' style='height: 25px;margin: 8px 10px;'>\
	            			<span id='startTime-" + tmpIndex + "' class='btn right'  data-options='{\"type\":\"time\"}'>开始时间</span>\
	            			</li>\
				            <li class='clearfix'>\
				               <span class='left label'>项目(预算)编号</span>\
				               <img src='../../images/rightarr.png' alt='' class='right rightArr'>\
				               <div style='float:right; margin-right: 5%;'><a id='proNo-" + tmpIndex + "' style='color: #666' >请选择</a></div>\
				               <input type='hidden' id='projectId-" + tmpIndex + "' />\
				               <input type='hidden' id='projectNo-" + tmpIndex + "' />\
				               <input type='hidden' id='projectType-" + tmpIndex + "' />\
				               <input type='hidden' id='isProject-" + tmpIndex + "' />\
				               <input type='hidden' id='deptId-" + tmpIndex + "' />\
							   <input type='hidden' id='allotUser-" + tmpIndex + "' value='" + appUserInfo.mUserName +  "' />\
				               <input type='hidden' id='workNo-" + tmpIndex + "' value='" + (new Date()).getTime() +  "' />\
				            </li>\
	            			<li class='clearfix' id='showProPicker'>\
	            			<span class='left label'>里程碑</span>\
	            			<input type='text' class='f_input right wp60 red' id='proMile-" + tmpIndex + "'   onclick='initLcbCondition(" + tmpIndex + ")' placeholder='请输入里程碑' />\
	            			</li>\
	            			<li class='clearfix'>\
	            			<span class='left label'>任务名称</span>\
	            			<input type='text' class='f_input right wp60 red' id='jobName-" + tmpIndex + "' placeholder='请输入任务名称'/>\
	            			</li>\
	            			<li class='clearfix'>\
	            			<span class='left label'>完成进度</span>\
	            			<input type='text' class='f_input right wp60 red' id='jobRate-" + tmpIndex + "' value='100' readonly='true' />\
	            			</li>\
	            			<li class='clearfix' style='height: auto;'>\
	            			<textarea class='mui-input-speech t10' style='margin-bottom: 0;' id='jobDisc-" + tmpIndex + "'  rows='5' readonly='true'>"+jobDesc+"</textarea>\
	            			</li>\
	            			<li class='clearfix' style='height: auto;'>\
	            			<textarea class='mui-input-speech t10' style='margin-bottom: 0;' id='jobPath-" + tmpIndex + "'  rows='5' placeholder='请输入成果路径'></textarea>\
	            			</li>\
	            		    </ul></div>";
	            		$('#workList').append(html);		
	                    //构建选择项目编号
	                    var projectElem = document.getElementById('proNo-' + tmpIndex);
	                    if (projectElem) {
	                        projectElem.addEventListener('tap', function(event) {
	                    	    prjTriggerIndex = event.target.id;
	                    	    //初始化部门数据
					        	$('#deptSelection').children().remove();
						        $("#deptSelection").prepend(options);
						        //初始化人员数据
						        $('#memberSelection').children().remove();
					          	$('#memberSelection').append('<option value="请选择人员">请选择人员</option>');
					        	//初始化项目
						        $("#projectText").children().remove();
						        $("#projectText").prepend(defaultProjList);
	                    		mui("#middlePopover").popover('toggle', document.getElementById(prjTriggerIndex));
	                        }, false);
	                    }
                        
	                    //为选择时间元素添加监听
	                    getTimeAttachCallback('startTime-' + tmpIndex,function(startHour){
	                    	var endHour = $('#endTime-' + tmpIndex).text();
	                    	if(endHour != '' && endHour != '结束时间'){			
	                    		if(endHour <= startHour){
	                    			$('#workHour-' + tmpIndex).text('0.0h');
	                    		}else{
	                    			var curtDate = new Date();
	                    			var year = curtDate.getFullYear();
	                    			var month = curtDate.getMonth() + 1;
	                    			var day = curtDate.getDate();
	                    			var start = year + "-" + month + "-" + day + " " + startHour;
	                    			var end = year + "-" + month + "-" + day + " " + endHour;
	                    			$('#workHour-' + tmpIndex).text(getHour(start,end).toFixed(1) + 'h');
	                    		}	
	                    	}
	                    });
	                    getTimeAttachCallback('endTime-' + tmpIndex,function(endHour){
	                    	var startHour = $('#startTime-' + tmpIndex).text();
	                    	if(startHour != '' && startHour != '结束时间'){			
	                    		if(endHour <= startHour){
	                    			$('#workHour-' + tmpIndex).text('0.0h');
	                    		}else{
	                    			var curtDate = new Date();
	                    			var year = curtDate.getFullYear();
	                    			var month = curtDate.getMonth() + 1;
	                    			var day = curtDate.getDate();
	                    			var start = year + "-" + month + "-" + day + " " + startHour;
	                    			var end = year + "-" + month + "-" + day + " " + endHour;
	                    			$('#workHour-' + tmpIndex).text(getHour(start,end).toFixed(1) + 'h');
	                    		}		
	                    	}
	                    });	
						var spendObj=new Object(); 
	        		  	var assortObj=new Object();					
						spendObj.spendNo=tmpIndex; //花销单号
						spendObj.proNo=''; //预算编号
						//spendObj.budgetType=value.costType;//花销分类
						spendObj.budgetType='请选择';
						spendObj.spendType='现金';//消费类型
						spendObj.spendDateStr=''; //划卡日期
						//初始化票据类型
						assortObj.spendNo=tmpIndex;
						assortObj.operationType=value.costType;//需要确认滴滴的操作类型是什么？
						assortObj.ticketType=value.invoiceType;//发票类型
						assortObj.spendMoney=value.orderMoney;//金额
						assortObj.rate=value.taxRate;//税率
						if(value.orderDate){
							var a=Conversiontime(value.orderDate);
							assortObj.rideTime=a;//乘车时间
						}else{
							assortObj.rideTime=value.orderDate;//乘车时间
						}
						assortObj.didiId=value.id;//id
						assortObj.code=value.invoiceNum;//报销单号
						assortObj.ticketCom=value.issuingOffice;//开票单位
						assortObj.remark = value.costType;
						assortObj.ticketInfo = value.invoiceContent;
						assortObj.ticketSource = '1';//自动带入的发票数据，值为1，作为禁止删除票据的依据
						spendListTmp.push(spendObj);
						assortListTmp.push(assortObj);
	              })//
        	  }
            }
          }
	  });
}

//初始化酒店住宿记录
function initHotel(spendListTmp, assortListTmp){
	$.ajax({
		type: "post",
		url:  pathUrl+'/getHotelInfo.action',
		data : {
			id:appUserInfo.applyUserId   //731
		},
		cache:false,
		async:false,/*同步请求*/
		dataType: "json",
		success:function(data){
		  if (data) {
		    var jsonData = eval('('+data+')');
			if(jsonData.hoteltList!=null && jsonData.hoteltList != 'undefined' && jsonData.hoteltList!=''){
				$.each(jsonData.hoteltList, function (index, value) {
						if(value.id){
							hotelIds.push(value.id);
						}
                       //初始化工作内容				  
					   tmpIndex = count+1;
	                   count = tmpIndex;
	        		   var jobDesc = "酒店+" + dateFormat(value.checkInDate)+"+"+value.hotelName+"+"+value.billMoney ;
	            	   var html = "<div><div class='title'>\
	            		工作填写-内容" + tmpIndex + "<div class='right mui-icon mui-icon-trash'></div>\
	            	    </div>\
	            	    <ul class='formList workContent'>\
	            		<li class='clearfix'>\
	            	    <div class='left label'><span class='mui-badge mui-badge-primary' id='workHour-" + tmpIndex + "'>0h</span></div>\
	            		<span id='endTime-" + tmpIndex + "' data-options='{\"type\":\"time\"}' class='btn right mr'>结束时间</span>\
	            		<img src='../../images/adr-arrow.png' class='right' alt='' style='height: 25px;margin: 8px 10px;'>\
	            		<span id='startTime-" + tmpIndex + "' class='btn right'  data-options='{\"type\":\"time\"}'>开始时间</span>\
	            		</li>\
				           <li class='clearfix'>\
				              <span class='left label'>项目(预算)编号</span>\
				              <img src='../../images/rightarr.png' alt='' class='right rightArr'>\
				              <div style='float:right; margin-right: 5%;'><a id='proNo-" + tmpIndex + "' style='color: #666' >请选择</a></div>\
				              <input type='hidden' id='projectId-" + tmpIndex + "' />\
				               <input type='hidden' id='projectNo-" + tmpIndex + "' />\
				               <input type='hidden' id='projectType-" + tmpIndex + "' />\
				               <input type='hidden' id='isProject-" + tmpIndex + "' />\
				               <input type='hidden' id='deptId-" + tmpIndex + "' />\
							   <input type='hidden' id='allotUser-" + tmpIndex + "' value='" + appUserInfo.mUserName +  "' />\
				               <input type='hidden' id='workNo-" + tmpIndex + "' value='" + (new Date()).getTime() +  "' />\
				           </li>\
	            		<li class='clearfix' id='showProPicker'>\
	            		<span class='left label'>里程碑</span>\
	            		<input type='text' class='f_input right wp60 red' id='proMile-" + tmpIndex + "'  onclick='initLcbCondition(" + tmpIndex + ")' placeholder='请输入里程碑' />\
	            		</li>\
	            		<li class='clearfix'>\
	            		<span class='left label'>任务名称</span>\
	            		<input type='text' class='f_input right wp60 red' id='jobName-" + tmpIndex + "' placeholder='请输入任务名称'/>\
	            		</li>\
	            		<li class='clearfix'>\
	            		<span class='left label'>完成进度</span>\
	            		<input type='text' class='f_input right wp60 red' id='jobRate-" + tmpIndex + "' value='100' readonly='true' />\
	            		</li>\
	            		<li class='clearfix' style='height: auto;'>\
	            		<textarea class='mui-input-speech t10' style='margin-bottom: 0;' id='jobDisc-" + tmpIndex + "'  rows='5' readonly='true'>"+jobDesc+"</textarea>\
	            		</li>\
	            		<li class='clearfix' style='height: auto;'>\
	            		<textarea class='mui-input-speech t10' style='margin-bottom: 0;' id='jobPath-" + tmpIndex + "'  rows='5' placeholder='请输入成果路径'></textarea>\
	            		</li>\
	            	    </ul></div>";
	            	$('#workList').append(html);
					
	                 //构建选择项目编号
	                 var projectElem = document.getElementById('proNo-' + tmpIndex);
	                 if (projectElem) {
	                     projectElem.addEventListener('tap', function(event) {
	                 	    prjTriggerIndex = event.target.id;
	                 		mui("#middlePopover").popover('toggle', document.getElementById(prjTriggerIndex));
	                     }, false);
	                 }
                     
	                 //为选择时间元素添加监听
	                 getTimeAttachCallback('startTime-' + tmpIndex,function(startHour){
	                 	var endHour = $('#endTime-' + tmpIndex).text();
	                 	if(endHour != '' && endHour != '结束时间'){			
	                 		if(endHour <= startHour){
	                 			$('#workHour-' + tmpIndex).text('0.0h');
	                 		}else{
	                 			var curtDate = new Date();
	                 			var year = curtDate.getFullYear();
	                 			var month = curtDate.getMonth() + 1;
	                 			var day = curtDate.getDate();
	                 			var start = year + "-" + month + "-" + day + " " + startHour;
	                 			var end = year + "-" + month + "-" + day + " " + endHour;
	                 			$('#workHour-' + tmpIndex).text(getHour(start,end).toFixed(1) + 'h');
	                 		}	
	                 	}
	                 });
	                 getTimeAttachCallback('endTime-' + tmpIndex,function(endHour){
	                 	var startHour = $('#startTime-' + tmpIndex).text();
	                 	if(startHour != '' && startHour != '结束时间'){			
	                 		if(endHour <= startHour){
	                 			$('#workHour-' + tmpIndex).text('0.0h');
	                 		}else{
	                 			var curtDate = new Date();
	                 			var year = curtDate.getFullYear();
	                 			var month = curtDate.getMonth() + 1;
	                 			var day = curtDate.getDate();
	                 			var start = year + "-" + month + "-" + day + " " + startHour;
	                 			var end = year + "-" + month + "-" + day + " " + endHour;
	                 			$('#workHour-' + tmpIndex).text(getHour(start,end).toFixed(1) + 'h');
	                 		}		
	                 	}
	                 });				
				
					var spendObj=new Object(); 
	        		var assortObj=new Object();	
                    //初始化报销记录					
					spendObj.spendNo=tmpIndex; //花销单号
					spendObj.proNo=''; //预算编号
					//spendObj.budgetType=value.costType;//花销分类
					spendObj.budgetType='请选择';
					spendObj.spendType='现金';//消费类型
					spendObj.spendDateStr=''; //划卡日期
					
					//初始化票据记录
					assortObj.spendNo=tmpIndex;
					assortObj.operationType=value.costType;//需要确认滴滴的操作类型是什么？
					assortObj.ticketType=value.invoiceType;//发票类型
					assortObj.spendMoney=value.billMoney;//金额
					assortObj.rate=value.rate;//税率
					assortObj.code=value.invoiceNum;//报销单号
					assortObj.ticketCom=value.issuingOffice;//开票单位
					assortObj.remark = value.costType;
					assortObj.ticketInfo = value.invoiceContent;
					assortObj.ticketSource = '1';//自动带入的发票数据，值为1，作为禁止删除票据的依据
					spendListTmp.push(spendObj);
					assortListTmp.push(assortObj);
				})
			}
		  }
		}
	});
}

//初始化机票记录
function initFlight(spendListTmp, assortListTmp){
	var dailyDateTmp=$("#dailyDate").text();
	$.ajax({
		type: "post",
		url: pathUrl+'/getFlightInfo.action',
		data:{
			userId:appUserInfo.applyUserId, //755,
			orderDate:dailyDateTmp //"2019-03-25"
		},
		cache:false,
		async:false,/*同步请求*/
		dataType: "json",
		success:function(data){
		    if (data) {
			    var jsonData = eval('('+data+')');
				if(jsonData.airTicketList!=null&& jsonData.airTicketList != 'undefined' && jsonData.airTicketList!=''){			
			    $.each(jsonData.airTicketList, function (index, value) {
			    		if(value.id){
			    			listTemp.push(value.id);
			    		}
                       //初始化工作内容				  
					   tmpIndex = count+1;
	                   count = tmpIndex;
	        		   var jobDesc = "飞机票+" + value.invoiceContent;
	            	   var html = "<div><div class='title'>\
	            		工作填写-内容" + tmpIndex + "<div class='right mui-icon mui-icon-trash'></div>\
	            	    </div>\
	            	    <ul class='formList workContent'>\
	            		<li class='clearfix'>\
	            	    <div class='left label'><span class='mui-badge mui-badge-primary' id='workHour-" + tmpIndex + "'>0h</span></div>\
	            		<span id='endTime-" + tmpIndex + "' data-options='{\"type\":\"time\"}' class='btn right mr'>结束时间</span>\
	            		<img src='../../images/adr-arrow.png' class='right' alt='' style='height: 25px;margin: 8px 10px;'>\
	            		<span id='startTime-" + tmpIndex + "' class='btn right'  data-options='{\"type\":\"time\"}'>开始时间</span>\
	            		</li>\
				           <li class='clearfix'>\
				              <span class='left label'>项目(预算)编号</span>\
				              <img src='../../images/rightarr.png' alt='' class='right rightArr'>\
				              <div style='float:right; margin-right: 5%;'><a id='proNo-" + tmpIndex + "' style='color: #666' >请选择</a></div>\
				               <input type='hidden' id='projectId-" + tmpIndex + "' />\
				               <input type='hidden' id='projectNo-" + tmpIndex + "' />\
				               <input type='hidden' id='projectType-" + tmpIndex + "' />\
				               <input type='hidden' id='isProject-" + tmpIndex + "' />\
				               <input type='hidden' id='deptId-" + tmpIndex + "' />\
							   <input type='hidden' id='allotUser-" + tmpIndex + "' value='" + appUserInfo.mUserName +  "' />\
				               <input type='hidden' id='workNo-" + tmpIndex + "' value='" + (new Date()).getTime() +  "' />\
				           </li>\
	            		<li class='clearfix' id='showProPicker'>\
	            		<span class='left label'>里程碑</span>\
	            		<input type='text' class='f_input right wp60 red' id='proMile-" + tmpIndex + "'  onclick='initLcbCondition(" + tmpIndex + ")' placeholder='请输入里程碑' />\
	            		</li>\
	            		<li class='clearfix'>\
	            		<span class='left label'>任务名称</span>\
	            		<input type='text' class='f_input right wp60 red' id='jobName-" + tmpIndex + "' placeholder='请输入任务名称'/>\
	            		</li>\
	            		<li class='clearfix'>\
	            		<span class='left label'>完成进度</span>\
	            		<input type='text' class='f_input right wp60 red' id='jobRate-" + tmpIndex + "' value='100' readonly='true' />\
	            		</li>\
	            		<li class='clearfix' style='height: auto;'>\
	            		<textarea class='mui-input-speech t10' style='margin-bottom: 0;' id='jobDisc-" + tmpIndex + "'  rows='5' readonly='true'>"+jobDesc+"</textarea>\
	            		</li>\
	            		<li class='clearfix' style='height: auto;'>\
	            		<textarea class='mui-input-speech t10' style='margin-bottom: 0;' id='jobPath-" + tmpIndex + "'  rows='5' placeholder='请输入成果路径'></textarea>\
	            		</li>\
	            	    </ul></div>";
	            	$('#workList').append(html);
					
	                 //构建选择项目编号
	                 var projectElem = document.getElementById('proNo-' + tmpIndex);
	                 if (projectElem) {
	                     projectElem.addEventListener('tap', function(event) {
	                 	    prjTriggerIndex = event.target.id;
	                 		mui("#middlePopover").popover('toggle', document.getElementById(prjTriggerIndex));
	                     }, false);
	                 }
                     
	                 //为选择时间元素添加监听
	                 getTimeAttachCallback('startTime-' + tmpIndex,function(startHour){
	                 	var endHour = $('#endTime-' + tmpIndex).text();
	                 	if(endHour != '' && endHour != '结束时间'){			
	                 		if(endHour <= startHour){
	                 			$('#workHour-' + tmpIndex).text('0.0h');
	                 		}else{
	                 			var curtDate = new Date();
	                 			var year = curtDate.getFullYear();
	                 			var month = curtDate.getMonth() + 1;
	                 			var day = curtDate.getDate();
	                 			var start = year + "-" + month + "-" + day + " " + startHour;
	                 			var end = year + "-" + month + "-" + day + " " + endHour;
	                 			$('#workHour-' + tmpIndex).text(getHour(start,end).toFixed(1) + 'h');
	                 		}	
	                 	}
	                 });
	                 getTimeAttachCallback('endTime-' + tmpIndex,function(endHour){
	                 	var startHour = $('#startTime-' + tmpIndex).text();
	                 	if(startHour != '' && startHour != '结束时间'){			
	                 		if(endHour <= startHour){
	                 			$('#workHour-' + tmpIndex).text('0.0h');
	                 		}else{
	                 			var curtDate = new Date();
	                 			var year = curtDate.getFullYear();
	                 			var month = curtDate.getMonth() + 1;
	                 			var day = curtDate.getDate();
	                 			var start = year + "-" + month + "-" + day + " " + startHour;
	                 			var end = year + "-" + month + "-" + day + " " + endHour;
	                 			$('#workHour-' + tmpIndex).text(getHour(start,end).toFixed(1) + 'h');
	                 		}		
	                 	}
	                 });				
				
					var spendObj=new Object(); 
	        		var assortObj=new Object();	
                    //初始化报销记录					
					spendObj.spendNo=tmpIndex; //花销单号
					spendObj.proNo=''; //预算编号
					//spendObj.budgetType=value.costType;//花销分类
					spendObj.budgetType='请选择';
					spendObj.spendType='现金';//消费类型
					spendObj.spendDateStr=''; //划卡日期
					
					//初始化票据记录
					assortObj.spendNo=tmpIndex;
					assortObj.operationType=value.costType;//需要确认滴滴的操作类型是什么？
					assortObj.ticketType=value.invoiceType;//发票类型
					assortObj.spendMoney=value.costNum;//金额
					assortObj.rate=value.taxTate;//税率
					assortObj.code=value.invoiceNum;//报销单号
					assortObj.ticketCom=value.issuingOffice;//开票单位
					assortObj.remark = value.costType;
					assortObj.ticketInfo = value.invoiceContent;
					assortObj.ticketSource = '1';//自动带入的发票数据，值为1，作为禁止删除票据的依据
					spendListTmp.push(spendObj);
					assortListTmp.push(assortObj);
				})
			  }
			}
		}
	});
}
function txfCheck(){
	$.ajax({
		type: "post",
		url: pathUrl+'/txfCheck.action',
		data:{
			userId:	appUserInfo.applyUserId, //登陆人,
		},
		cache:false,
		async:false,/*同步请求*/
		dataType: "json",
		success:function(data){
			var json=JSON.parse(data); 
			localStorage.txf=json.result;
		}	
	});	
}
function Conversiontime(timestamp) {
     var date = new Date(timestamp);
     Y = date.getFullYear() + '-';
     M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
     D = (date.getDate()<10?'0'+(date.getDate()):date.getDate()) + ' ';
     h = (date.getHours()<10?'0'+(date.getHours()):date.getHours()) + ':';
     m = (date.getMinutes()<10?'0'+(date.getMinutes()):date.getMinutes())+':';
     s = (date.getSeconds()<10?'0'+(date.getSeconds()):date.getSeconds());
     return Y+M+D+h+m+s;
}
//工作内容的时间选择单独处理（处理先添加多个内容再选择时间）
function getTimeAttachCallbackAdd(clickId,callback){
    var btns = $('#'+clickId);
    btns.each(function(i, btn) {
        btn.addEventListener('tap', function() {
            var _self = this;
            if(_self.picker) {
                _self.picker.show(function (rs) {
                    $('#'+clickId).text(rs.text);
                    _self.picker.dispose();
                    _self.picker = null;
                    $('#'+clickId).text(rs.text);
					callback(rs.text,clickId);
                });
            } else {
                var optionsJson = this.getAttribute('data-options') || '{}';
                var options = JSON.parse(optionsJson);
                var id = this.getAttribute('id');
                _self.picker = new mui.DtPicker(options);
                _self.picker.show(function(rs) {
                    $('#'+clickId).text(rs.text);
					callback(rs.text,clickId);
                    _self.picker.dispose();
                    _self.picker = null;
                });
            }
        }, false);
    });
}