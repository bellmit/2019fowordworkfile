var appUserInfo = {};
var count = 0;
var page = 1;
(function($,doc){
	mui.init({
		pullRefresh: {
			container: '#pullrefresh',
			down: {
				callback: pulldownRefresh
			},
			up: {
				contentrefresh: '正在加载...',
				callback: pullupRefresh
			}
		}
	});
	
	setTimeout(function () {
	    if(localStorage.wxUser!=null){
		    var data = JSON.parse(localStorage.wxUser);
		    appUserInfo.mUserName = data.userName;
		    appUserInfo.mUserId = data.userId;
		    getDataList();
	    }else{
		    alert('网络异常！');
	    }	
	}, 800);
	
	$.ready(function() {
		var _getParam = function(obj, param) {
			return obj[param] || '';
		};
		
		//类型
		var showStyle = new $.PopPicker();
		showStyle.setData([
		    {
			    value: '考勤补登',
			    text: '考勤补登'
		    }, 
		    {
			    value: '日报审批',
			    text: '日报审批'
		    }, 
		    {
			    value: '加班申请',
			    text: '加班申请'
		    }, 
	        {
			    value: '考勤异常申请',
			    text: '考勤异常申请'
		    },
		    {
			    value: '请假申请',
			    text: '请假申请'
		    },
		    {
			    value: '请假申请撤销',
			    text: '请假申请撤销'
		    }
		]);
		var showStyleButton = doc.getElementById('showStyle');
		var styleResult = doc.getElementById('showStyle');
		showStyleButton.addEventListener('tap', function(event) {
			showStyle.show(function(items) {
				styleResult.innerText = items[0].text;
				getDataList();
			});
		}, false);
	});
	
})(mui,document);

//日报处理
$("#agency-content").on('tap', '.dailyView', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"dailyAudit.html",
	    });
	}
});

//补登处理
$("#agency-content").on('tap', '.redemView', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"remedyAudit.html",
	    });
	}
});

//加班申请处理
$("#agency-content").on('tap', '.overtimeView', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"overtimeAudit.html",
	    });
	}
});

//请假申请处理
$("#agency-content").on('tap', '.vacationView', function(event){  
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"leaveApplyAudit.html", 
	    });
	}
});

//考勤异常申请处理
$("#agency-content").on('tap', '.unusualView', function(event){  
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"unusualAudit.html", 
	    });
	}
});

//日报费用报销
$("#agency-content").on('tap', '.dailySpendView', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		//mui.openWindow({
		//   url:"dailyCost.html", // 需要新增的页面
	    //});
	}
});

//员工招待费调整
$("#agency-content").on('tap', '.staffEntertainView', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"entertainmentAudit.html",
	    });
	}
});

//请假申请撤销
$("#agency-content").on('tap', '.vocationBackView', function(event){
    var id = $(this).attr("value");
	if (id) {
	    var pendingInfo = id.split('#_#');
	    var obj = {procInstId:pendingInfo[0],taskId:pendingInfo[1],taskUser:pendingInfo[2]};
	    var str = JSON.stringify(obj);
	    localStorage.obj = str;
		mui.openWindow({
		   url:"leaveBackAudit.html",
	    });
	}
});
/**
* 上拉加载具体业务实现
*/
function pullupRefresh() {
	setTimeout(function() {
	  var type = document.getElementById('showStyle').innerHTML;
	  if (type) {
	      if (type == '类型') {
	          type = '';
	      } else if (type == '日报审批') {
	          type = '日报审批流程v2.0';
	      }else if(type == '加班申请'){
	      	  type = '加班申请';
	      }else if(type == '考勤异常申请'){
	      	  type = '考勤异常申请流程';
	      }else if(type == '请假申请'){
	      	  type = '请假申请流程V5.0';
	      }else if(type == '员工招待费'){
	      	  type = '员工招待费调整';
	      }else if (type == '请假申请撤销') {
	          type = '请假撤销流程V3.0';
	      }
	  }
	  page++;
	  $.ajax({
		url: pathUrl +'/agencyList.action',
		type:'post',
		data:{
		    applyUserId:appUserInfo.mUserId,
			type:type,
			currentPage:page,
			pageSize:10
		},
		async:false,/*同步请求*/
		dataType:"jsonp",
		jsonp:"callback",
		jsonpCallback:'flightHandler',
		error : function(){
			showAlert("获取登录用户信息失败！");
		},
		success:function(data){
		   	var dataList = "";
		    var jsonData = JSON.parse(data); 
		   	mui('#pullrefresh').pullRefresh().endPullupToRefresh((jsonData.dataSize == 0 || jsonData.dataSize < 100)); 	
		    //$("#agency-content").html('');	    
		    if (jsonData.dataList) {
		      $.each(jsonData.dataList,function(i,pending){	    	
			    if(pending.procName == '日报审批流程v2.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="dailyView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				} else if (pending.procName == '考勤补登') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="redemView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				} else if (pending.procName == '加班申请') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="overtimeView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				} else if (pending.procName == '考勤异常申请流程') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="unusualView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}else if (pending.procName == '请假申请流程V5.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="vacationView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}else if (pending.procName == '日报费用流程审批2.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="dailySpendView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}else if (pending.procName == '员工招待费调整') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="staffEntertainView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				} else if (pending.procName == '请假撤销流程V3.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="vocationBackView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}
				$("#agency-content").append(dataList);
		 	  });	    
		    }
	   	}    
   	});  
	}, 1500);
}

/**
 * 下拉刷新具体业务实现
 */
function pulldownRefresh() {
	setTimeout(function() {
		getDataList();
		mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
		mui('#pullrefresh').pullRefresh().refresh(true); //上拉后可以再次加载
	}, 1500);
}

/**
 * 获取待办列表
 */
function getDataList(){
	var type = document.getElementById('showStyle').innerHTML;
	  if (type) {
	      if (type == '类型') {
	          type = '';
	      } else if (type == '日报审批') {
	          type = '日报审批流程v2.0';
	      }else if(type == '加班申请'){
	      	  type = '加班申请';
	      }else if(type == '考勤异常申请'){
	      	  type = '考勤异常申请流程';
	      }else if(type == '请假申请'){
	      	  type = '请假申请流程V5.0';
	      }else if(type == '员工招待费'){
	      	  type = '员工招待费调整';
	      }else if (type == '请假申请撤销') {
	          type = '请假撤销流程V3.0';
	      }
	  }
	page = 1;
	$.ajax({
	    url: pathUrl +'/agencyList.action',
		type:"post",
		data:{
		    applyUserId:appUserInfo.mUserId,
			type:type,
			currentPage:page,
			pageSize:10
		},
		async:false,/*同步请求*/
		dataType:"jsonp",
		jsonp:"callback",
		jsonpCallback:'flightHandler',
		error : function(){
			showAlert("获取登录用户信息失败！");
		},
		success:function(data){
		    var jsonData = JSON.parse(data); 
		   	var dataList = "";
		    $("#agency-content").html('');
		    if (jsonData.dataList) {
		      $.each(jsonData.dataList,function(i,pending){
			    if(pending.procName == '日报审批流程v2.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="dailyView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				} else if (pending.procName == '考勤补登') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="redemView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				} else if (pending.procName == '加班申请流程V2.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="overtimeView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				} else if (pending.procName == '考勤异常申请流程') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="unusualView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}else if (pending.procName == '请假申请流程V5.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="vacationView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}else if (pending.procName == '日报费用流程审批2.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="dailySpendView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}else if (pending.procName == '员工招待费调整') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="staffEntertainView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				} else if (pending.procName == '请假撤销流程V3.0') {
					dataList='<ul class="mui-table-view fixBox" value="'+pending.procDefId+'">'+
			    			     '<li class="mui-media relative mui-table-view-cell">'+
							     	'<div>'+
									    '<a class="vocationBackView" value="' + pending.procInstId + '#_#' + pending.taskId + '#_#' + pending.taskUser + '">' + 
							     		'<div class="myui-list-title mui-pull-left">'+
							     			'<span>'+ pending.procName +'</span>'+
							     		'</div>'+
							     		'<div class="mui-media-body mui-pull-left">'+ 
							     			pending.procInstStartUser +
							     			'<p class="mui-ellipsis clearfix blue">发起时间：'+pending.procInstStartTime+'</p>'+
							     		'</div>'+							     		
							     		'<span class="mui-badge mui-badge-success right">'+ pending.state +'</span>'+
							     	'</div>'+
							     '</li>'+
							     '<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							     	'<div>'+
							     		'节点：'+ pending.taskName +
							     	'</div>'+
							     '</li>'+
							'</ul>';				
				}
				$("#agency-content").append(dataList);
		 	  });	    
		    }
		 	if($("#agency-content").html() == ''){
  			    dataList = '<div class="nodata" style="height:'+document.documentElement.clientHeight+'px">'+
						       '<P>'+
						           '您还暂时没有待办事项!'+
						       '</P>'+
						   '</div>'
  			    $("#tishi").append(dataList);
  			}
	   	}    
   	});    
} 

function getSelectType(clickId,spanId,data){
    var userPicker = new mui.PopPicker();
    userPicker.setData(data);
    var showUserPickerButton = document.getElementById(clickId);
    var userResult = document.getElementById(spanId);
    showUserPickerButton.addEventListener('tap', function(event) {
        userPicker.show(function(items) {
            userResult.innerText = items[0].text;
            getDataList();
        });
    }, false);
}


function logInAction(userName,wx_userId){
	$.ajax({
			url: app_login_path,
			type:'post',
			data:{userName:userName,wx_userId:preId+wx_userId},
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			success:function(data){
				setTicketToUrl(data.ticket);
			}
	});
}

function setTicketToUrl(ticket){
	app_sso_ticket=ticket;
	app_sso_path=app_sso_tgt+ticket+"&service="
	getDataList();
	initQueryCondition();
}

function initQueryCondition(){
    var data = [{value: "考勤补登", text: "考勤补登"},{value:"日报审批流程v2.0", text: "日报审批流程v2.0"}];
    getSelectType('showStyle','showStyle',data);
}

//获取所有的参数
function getParams(){
   var type=document.getElementById("showStyle").innerHTML;
   var params={};
   params.type = type;
   return params;
}