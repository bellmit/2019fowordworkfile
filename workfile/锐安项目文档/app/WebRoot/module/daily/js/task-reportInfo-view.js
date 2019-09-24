var count = 0;//工作内容条数
var countPlan = 0;//明日计划条数
var appUserInfo={};
(function($, doc) {
	//获取报工数据
	getData();
	if (localStorage.wxUser!=null) {
	    var data = JSON.parse(localStorage.wxUser);
		appUserInfo.mUserName=data.userName;
		appUserInfo.mWxUserId = data.wXUserId;
	    getAttendacne();
	}

})(mui, document);
//时间戳转化为2019-01-01类型
function getNowFormatDate(str) {
    var date = new Date();
    date.setTime(str)
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
//获取页面数据
function getData(){
	//基本信息
	var dailyInfo = eval('('+localStorage.dailyInfo+')');
	//今日计划
	var dailyPlanListCurr = eval('('+localStorage.dailyPlanListCurr+')');	
	//工作内容
	var workList = eval('('+localStorage.workList+')');
	//明日计划
	var dailyPlanList = eval('('+localStorage.dailyPlanList+')');
	//基本信息
	if(dailyInfo.dailyDateStr==null||dailyInfo.dailyDateStr==""){
		$("#dailyDate").text("");
	}else{
		$("#dailyDate").text(dailyInfo.dailyDateStr);
	}
	$("#subState").html((dailyInfo.subState==null?"":dailyInfo.subState));
	document.getElementById('site').innerHTML = (dailyInfo.site==null||dailyInfo.site==""?"北京市 海淀区":dailyInfo.site);
	$("#evaluate").text(dailyInfo.evaluate);
	$("#evaluateDisc").val(dailyInfo.evaluateDisc);
	$("#evaluateDisc").attr("readonly","readonly");
	$("#checkUser").html(dailyInfo.checkUser);
	if(dailyInfo.checkDate!=null){
		$("#checkDate").html(getNowFormatDate(dailyInfo.checkDate));
	}
	$("#checkDesc").val(dailyInfo.checkDesc);
	//今日计划
	if(dailyPlanListCurr!=null && dailyPlanListCurr!='undefined'){
		$.each(dailyPlanListCurr,function(index,dailyPlan){
			var i = index + 1;
	    	var dataList =  '<li class=" mui-media relative mui-table-view-cell">'+
								'<div>'+(dailyPlan.plan == null?"":dailyPlan.plan)+'</div>'+
							'</li>';
			$("#planCurr-content").append(dataList);
	 	});
	 }
 	//工作内容
	$.each(workList,function(index,work){
		var i = index + 1;
		count = i;
    	var dataList = '<div><div class="title">'+
				'工作填写-内容'+i+
			'</div>'+
			'<ul class="formList workContent">'+
				'<li class="clearfix">'+
					'<div class="left label"><span class="mui-badge mui-badge-primary" id="workHour-'+i+'">'+(work.workHour == null?"0":work.workHour)+'h</span></div>'+
					'<span id="endTime-'+i+'"  data-options=\'{"type":"time"}\' class="btn right mr">'+(work.endTime==null||work.endTime==""?"结束时间":work.endTime)+'</span>'+
					'<img src="../../../images/adr-arrow.png" class="right" alt="" style="height: 25px;margin: 8px 10px;">'+
					'<span id="startTime-'+i+'" class="btn right"  data-options=\'{"type":"time"}\'>'+(work.startTime==null||work.startTime==""?"开始时间":work.startTime)+'</span>'+
				'</li>'+
				'<li class="clearfix">'+
					'<span class="left label">项目(预算)编号</span>'+
//							'<img src="../../images/rightarr.png" alt="" class="right rightArr"/>'+	
//							'<span class="right content showNo1" id="proNo-'+i+'">'+(work.proNo == null?"":work.proNo)+'</span>'+
					'<input type="text" class="f_input right wp60 red" id="proNo-'+i+'" readonly value="'+(work.proNo == null?"":work.proNo)+'"/>'+
				'</li>'+
				'<li class="clearfix" id="showProPicker">'+
					'<span class="left label">里程碑</span>'+	
//							'<img src="../../images/rightarr.png" alt="" class="right rightArr"/>'+	
//							'<span class="right content showStep1" id="proMile-'+i+'">'+(work.proMile == null?"":work.proMile)+'</span>'+
					'<input type="text" class="f_input right wp60 red" id="proMile-'+i+'" readonly value="'+(work.proMile == null?"":work.proMile)+'"/>'+
				'</li>'+
				'<li class="clearfix">'+
					'<span class="left label">任务名称</span>'+
					'<input type="text" class="f_input right wp60 red" id="jobName-'+i+'" readonly value="'+(work.jobName == null?"":work.jobName)+'"/>'+
				'</li>'+
				'<li class="clearfix">'+
					'<span class="left label">完成进度</span>'+
					'<input type="text" class="f_input right wp60 red" id="jobRate-'+i+'" readonly value="'+(work.jobRate == null?"":work.jobRate)+'"/>'+
				'</li>'+
				'<li class="clearfix" style="height: auto;">'+
					'<textarea class="mui-input-speech t10" style="margin-bottom: 0;" readonly id="jobDisc-'+i+'" rows="5" placeholder="请输入任务描述">'+(work.jobDisc == null?"":work.jobDisc)+'</textarea>'+
				'</li>'+
				'<li class="clearfix" style="height: auto;">'+
					'<textarea class="mui-input-speech t10" style="margin-bottom: 0;" readonly id="jobPath-'+i+'" rows="5" placeholder="请输入成果路径">'+(work.jobPath == null?"":work.jobPath)+'</textarea>'+
				'</li>'+
			'</ul></div>';
		$("#workList").append(dataList);
//		getTime('endTime-'+i);//结束时间绑定选择时间控件
//		getTime('startTime-'+i);//开始时间绑定选择时间控件
		//为选择时间元素添加监听
		var startHour = $('#startTime-' + i).text();
		var endHour = $('#endTime-' + i).text();
		//为新添加的删除图标添加监听
		delIconEvent();
 	});		
//		 	明日计划
	if(dailyPlanList!=null && dailyPlanList!='undefined' && dailyPlanList.length>0){
		$.each(dailyPlanList,function(index,dailyPlan){
			var i = index + 1;
			countPlan = i;
	    	var dataList =  '<li class="clearfix" style="height: auto;">'+
								'<textarea class="mui-input-speech t10" readonly style="margin-bottom: 0;" id="plan-'+i+'" rows="5" placeholder="请输入明日计划">'+(dailyPlan.plan == null?"":dailyPlan.plan)+'</textarea>'+
							'</li>';
			$("#plan-content").append(dataList);
	 	});
	 }else{
	 	countPlan ++;
    	var dataList =  '<li class="clearfix" style="height: auto;">'+
							'<textarea class="mui-input-speech t10" readonly style="margin-bottom: 0;" id="plan-'+countPlan+'" rows="5" placeholder="请输入明日计划"></textarea>'+
						'</li>';
		$("#plan-content").append(dataList);
	 }
}
//时间字符串转化为Date
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
 

function toExpense(){
	mui.openWindow({
		url:"report-expense-view.html"
	});
}

delIconEvent();
	
//如果初始页面计划列表为空，则可以把这个函数移除，把函数体放到调用函数的位置
//如果初始页面计划列表不为空，则保持不变
function delIconEvent(){
	//删除图标添加监听
	$('#workList > div').on('tap', 'div.title > div.mui-icon-trash', function(e){
		$(this).parent().parent().remove();
	})
}
//计算时间差
function getHour(s1,s2) {
        s1 = new Date(s1.replace(/-/g, '/'));
        s2 = new Date(s2.replace(/-/g, '/'));
        var ms = Math.abs(s1.getTime() - s2.getTime());
        return ms / 1000 / 60 / 60;
}
//获取基本信息
function getAttendacne(){
	var dailyDate = $("#dailyDate").text();
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
			mui.toast("获取数据失败！");
		},
		success:function(data){		    
			//基本信息
			var jsonData = eval('(' + data + ')'); 
			var result = jsonData.result;
			$("#amAttendStr").text((result.amAttendStr!=null?result.amAttendStr:""));
			$("#describe1").text((result.describe1!=null&&result.describe1!=""?result.describe1:"未打卡"));
			$("#site1").text((result.site1!=null?result.site1:""));
			$("#amClosingStr").text((result.amClosingStr!=null?result.amClosingStr:""));
			$("#describe2").text((result.describe2!=null&&result.describe2!=""?result.describe2:"未打卡"));
			$("#site2").text((result.site2!=null?result.site2:""));
			$("#pmAttendStr").text((result.pmAttendStr!=null?result.pmAttendStr:""));
			$("#describe3").text((result.describe3!=null&&result.describe3!=""?result.describe3:"未打卡"));
			$("#site3").text((result.site3!=null?result.site3:""));
			$("#pmClosingStr").text((result.pmClosingStr!=null?result.pmClosingStr:""));
			$("#describe4").text((result.describe4!=null&&result.describe4!=""?result.describe4:"未打卡"));
			$("#site4").text((result.site4!=null?result.site4:""));
		}
	});
}

function backDailyList(){
	mui.openWindow({
		url:"daliyList.html"
	});
		
}