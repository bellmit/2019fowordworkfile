var editCount=0;
var appUserInfo={};
//初始化页面数据
(function($, doc) {
		setTimeout(function () {
			if(localStorage.wxUser!=null) {
			    var data = JSON.parse(localStorage.wxUser);
			    appUserInfo.mUserName=data.userName;
				appUserInfo.mWxUserId = data.wXUserId;
		        appUserInfo.applyUserId = data.userId;
			    getDataList();
			}else{
		        mui.toast('网络异常！');
	        }	
		}, 500);
			
	mui.init({
		swipeBack: true, //启用右滑关闭功能		
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
	
	$.ready(function() {
		var _getParam = function(obj, param) {
			return obj[param] || '';
		};
		
		//状态
		var showStyle = new $.PopPicker();
		showStyle.setData([{
			value: 'plane',
			text: '全部'
		}, {
			value: 'plane',
			text: '草稿'
		}, {
			value: 'train',
			text: '已提交'
		},{
			value: 'car', 
			text: '已审批'
		}]);
		var showStyleButton = doc.getElementById('showStyle');
		var styleResult = doc.getElementById('showStyle');
		showStyleButton.addEventListener('tap', function(event) {
			showStyle.show(function(items) {
				styleResult.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
				getDataList();
			});
		}, false);
		
		//时间范围
		var showDate = new $.PopPicker();
		showDate.setData([{
			value: 'plane',
			text: '近一周'
		}, {
			value: 'plane',
			text: '近一月'
		}, {
			value: 'train',
			text: '近三月'
		},{
			value: 'car', 
			text: '全部'
		}]);
		var showDateButton = doc.getElementById('showDate');
		var dateResult = doc.getElementById('showDate');
		showDateButton.addEventListener('tap', function(event) {
			showDate.show(function(items) {
				dateResult.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
				getDataList();
			});
		}, false);
		
	});
	
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
				});
			}
			
		}, false);
	});
	//获取数据
	//getDataList();
})(mui, document);

//删除
var btnArray = ['确认', '取消'];	
$('#OA_task_1').on('tap', '.del', function(event) {
	var id = $(this).attr("value");
	var elem = this;
	var li = elem.parentNode.parentNode;
	mui.confirm('确认要删除这条报工记录吗？', '提示', btnArray, function(e) {
		if (e.index == 0) {
			li.parentNode.removeChild(li);
			delDaily(id);
		} else {
			setTimeout(function() {
				mui.swipeoutClose(li);
			}, 0);
		}
	});
});
//撤销
$('#OA_task_1').on('tap', '.back', function(event) {
	var id = $(this).attr("value");
	var elem = this;
	var li = elem.parentNode.parentNode;
	mui.confirm('确认要撤回这条报工记录吗？', '提示', btnArray, function(e) {
		if (e.index == 0) {
			li.parentNode.removeChild(li);
			backDaily(id);
		} else {
			setTimeout(function() {
				mui.swipeoutClose(li);
			}, 0);
		}
	});
});
//查看
$('#OA_task_1').on('tap', '.view', function(event) {
	var id = $(this).attr("value");
	var btnConfArray = ['确定'];
	$.ajax({
		url: pathUrl + '/viewDailyInfo.action',
		type:"post",
		data : {pid:id},
		async:false,/*同步请求*/
		dataType:"jsonp",
		jsonp:"callback",
		jsonpCallback:"flightHandler",
		error : function(){
			mui.confirm('获取数据失败！', '', btnConfArray, function(e) {
				mui.openWindow({
					url:"daliyList.html"
				});
			});
		},
		success:function(data){
		    var jsonData = eval('(' + data + ')'); 
			//基本信息
			var dailyInfo = jsonData.dailyInfo;
			var str0 = JSON.stringify(dailyInfo);
			localStorage.dailyInfo = str0;
			//今日计划
			var dailyPlanListCurr = jsonData.dailyProPlanList;
			var str1 = JSON.stringify(dailyPlanListCurr);
			localStorage.dailyPlanListCurr = str1;
			//工作内容
			var workList = jsonData.workList;
			var str2 = JSON.stringify(workList);
			localStorage.workList = str2;
			//明日计划
			var dailyPlanList = jsonData.dailyPlanList;
			var str3 = JSON.stringify(dailyPlanList);
			localStorage.dailyPlanList = str3;
			//费用
			var dailySpend = jsonData.dailySpend;
			var str4 = JSON.stringify(dailySpend);
			localStorage.dailySpends = str4;
			//发票
			var dailyAssort = jsonData.dailyAssort;
			var str5 = JSON.stringify(dailyAssort);
			localStorage.dailyAssortList = str5;
			mui.openWindow({
			    url:"report-info-view.html"
			});
		}
	});
});
//编辑
$('#OA_task_1').on('tap', '.edit', function(event) {
	var id = $(this).attr("value");
	var btnConfArray = ['确定'];
	$.ajax({
		url: pathUrl +'/editDailyInfo.action',
		type:"post",
		data : {pid:id},
		async:false,/*同步请求*/
		dataType:"jsonp",
		jsonp:"callback",
		jsonpCallback:"flightHandler",
		error : function(){ 
			mui.confirm('获取数据失败！', '', btnConfArray, function(e) {
				mui.openWindow({
					url:"daliyList.html"
				});
			});
		},
		success:function(data){
		    var jsonData = eval('(' + data + ')'); 
			//基本信息
			var dailyInfo = jsonData.dailyInfo;
			var str0 = JSON.stringify(dailyInfo);
			localStorage.dailyInfo = str0;
			//今日计划
			var dailyPlanListCurr = jsonData.dailyProPlanList;
			var str1 = JSON.stringify(dailyPlanListCurr);
			localStorage.dailyPlanListCurr = str1;
			//工作内容
			var workList = jsonData.workList;
			var str2 = JSON.stringify(workList);
			localStorage.workList = str2;
			//明日计划
			var dailyPlanList = jsonData.dailyPlanList;
			var str3 = JSON.stringify(dailyPlanList);
			localStorage.dailyPlanList = str3;
			//费用
			var dailySpend = jsonData.dailySpend;
			var str4 = JSON.stringify(dailySpend);
			localStorage.dailySpends = str4;
			//发票
			var dailyAssort = jsonData.dailyAssort;
			var str5 = JSON.stringify(dailyAssort);
			localStorage.dailyAssortList = str5;
			//审批记录
			var logList = jsonData.logList;
			var str6 = JSON.stringify(logList);
			localStorage.logList = str6;
			
			localStorage.fromFlag=1;
			mui.openWindow({
				url:"report-info.html"
			});
		}
	});
	
});

var page = 1;
//上拉刷新
function pullupRefresh() {
	setTimeout(function() {
		var table = document.body.querySelector('ul#mytask-content');
		var cells = document.body.querySelectorAll('ul#mytask-content > li.mui-table-view-cell');
		var showStyle = document.getElementById('showStyle').innerHTML;
		var showDate = document.getElementById('showDate').innerHTML;
		page++;
		var DailySelectMode = {};
		DailySelectMode.state = showStyle;
		DailySelectMode.applyUser = appUserInfo.mUserName;
		DailySelectMode.startDate = showDate;
		DailySelectMode.pageSize = 10;
		DailySelectMode.currentPage = page;
		var dailySelection=JSON.stringify(DailySelectMode);
		$.ajax({
			url: pathUrl +'/queryDailyList.action',
			type:'post',
			data:dailySelection,
			async:false,/*同步请求*/
            contentType:"application/json",
			success:function(data){
		        var jsonData = eval('(' + data + ')'); 
		   	    var dataList = "";
			   	mui('#pullrefresh').pullRefresh().endPullupToRefresh(page > jsonData.pageCount);//参数为true代表没有更多数据了。
			   	if(page > jsonData.pageCount){
			   		return false;
			   	}
			   	$.each(jsonData.data,function(i,daily){
			    	if(daily.evaluate == null){
			    		daily.evaluate = '';
			    	}
			    	if(daily.dailyDateStr == null){
			    		daily.dailyDateStr = '';
			    	}
			    	if(daily.workHour == null){
			    		daily.workHour = '';
			    	}
			    	if(daily.submitDateStr == null){
			    		daily.submitDateStr = '';
			    	}
		    		dataList='<li class=" mui-media relative mui-table-view-cell">';
					if(daily.state == 0){
						editCount++;
						dataList = dataList + '<div class="mui-slider-right mui-disabled">'+
							'<a class="mui-btn mui-btn-red del" value="'+daily.id +'">删除</a>'+
						'</div>'+
						'<a class="edit" value="'+daily.id+'">'+
						'<div class="mui-slider-handle">'+
						'<div class="myui-list-title mui-pull-left"><span>草稿</span></div>';
					}else if(daily.state == 1){
						dataList = dataList + '<div class="mui-slider-right mui-disabled">'+
							'<a class="mui-btn mui-btn-red back" value="'+daily.id +'">撤回</a>'+
						'</div>'+
						'<a class="view" value="'+daily.id+'">'+
						'<div class="mui-slider-handle">'+
						'<div class="myui-list-title mui-pull-left"><span>已提交</span></div>';
					}else if(daily.state == 2){
						dataList = dataList + '<a class="view" value="'+daily.id+'">'+
						'<div class="mui-slider-handle">'+
						'<div class="myui-list-title mui-pull-left"><span>已审批</span></div>';
					}	
								
					dataList = dataList + '<div class="mui-media-body mui-pull-left">'+
										'<div class="left">'+daily.dailyDateStr+'<span class="l10 blue">'+daily.workHour+'小时 </span></div>'+
										'<div class="clear"></div>'+
										'<p class="mui-ellipsis clearfix">'+daily.submitDateStr+'提交</p>'+
										'</div>'+
										'<div class="mui-media-body mui-pull-right">'+
										'<div class="right"><span class="mui-badge mui-badge-primary">评价:'+daily.evaluate+'</span></div>'+
										'</div>'+
									'</div>' +
									'</a>' +
							'</div>'+
					'</li>';
					$("#OA_task_1").append(dataList);
			 	});
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
		mui('#pullrefresh').pullRefresh().refresh(true);
    }, 1500);
}

/**
 * 获取用户日报列表
 */
function getDataList(){
	var DailySelectMode = {};
	var showStyle = document.getElementById('showStyle').innerHTML;
	var showDate = document.getElementById('showDate').innerHTML;
	page = 1;
	DailySelectMode.state = showStyle;
	DailySelectMode.startDate = showDate;
	DailySelectMode.applyUser = appUserInfo.mUserName;  //测试使用，后续需要放开
	DailySelectMode.pageSize = 10;
	DailySelectMode.currentPage = page;
	var dailySelection=JSON.stringify(DailySelectMode);

	$.ajax({
		url: pathUrl +'/queryDailyList.action',
		type:'post',
		data:dailySelection,
		async:false,/*同步请求*/
		contentType:"application/json",
		success:function(data){
		    var jsonData = eval('(' + data + ')'); 
		   	var dataList = "";
		   	$("#OA_task_1").html('');
		    $.each(jsonData.data,function(i,daily){
		    	if(daily.evaluate == null){
		    		daily.evaluate = '';
		    	}
		    	if(daily.dailyDateStr == null){
		    		daily.dailyDateStr = '';
		    	}
		    	if(daily.workHour == null){
		    		daily.workHour = '';
		    	}
		    	if(daily.submitDateStr == null){
		    		daily.submitDateStr = '';
		    	}
	    		dataList='<li class=" mui-media relative mui-table-view-cell">';
				if(daily.state == 0){
					editCount++;
					dataList = dataList + '<div class="mui-slider-right mui-disabled">'+
						'<a class="mui-btn mui-btn-red del" onclick="delDaily('+daily.id +')" value="'+daily.id +'">删除</a>'+
					'</div>'+
					'<div class="mui-slider-handle edit" value="'+daily.id+'">'+
					'<div class="myui-list-title mui-pull-left"><span>草稿</span></div>';
				}else if(daily.state == 1){
					dataList = dataList + '<div class="mui-slider-right mui-disabled">'+
						'<a class="mui-btn mui-btn-red back"  value="'+daily.id +'">撤回</a>'+
					'</div>'+
					
					'<div class="mui-slider-handle view" value="'+daily.id+'">'+
					'<div class="myui-list-title mui-pull-left"><span>已提交</span></div>';
				}else if(daily.state == 2){
					dataList = dataList + 
					'<div class="mui-slider-handle view" value="'+daily.id+'">'+
					'<div class="myui-list-title mui-pull-left"><span>已审批</span></div>';
				}	
							
				dataList = dataList + '<div class="mui-media-body mui-pull-left">'+
									'<div class="left">'+daily.dailyDateStr+'<span class="l10 blue">'+daily.workHour+'小时 </span></div>'+
									'<div class="clear"></div>'+
									'<p class="mui-ellipsis clearfix">'+daily.submitDateStr+'提交</p>'+
									'</div>'+
									'<div class="mui-media-body mui-pull-right">'+
									'<div class="right"><span class="mui-badge mui-badge-primary">评价:'+daily.evaluate+'</span></div>'+
									'</div>'+
								'</div>' +
						'</div>'+
				'</li>';
				$("#OA_task_1").append(dataList);			
		 	});
			if($("#OA_task_1").html() == ''){		  
  			    dataList = '<div class="nodata" style="height:'+document.documentElement.clientHeight+'px">'+
						       '<P>'+
						           '您还没有日报记录，如需提交日报请点右上角+'+
						       '</P>'+
						   '</div>'
  			    $("#OA_task_1").append(dataList);
  			}
	   	}    
   	});   
} 

//删除
function delDaily(id){
	var btnDelArray = ['确定'];
	$.ajax({
		url:pathUrl+"/delDailyInfo",
		type:"post",
		data : {
			id:id
		},
		async:false,/*同步请求*/
		dataType:"jsonp",
		jsonp:"callback",
		jsonpCallback:'flightHandler',
		error : function(){
			mui.confirm('删除失败！', '', btnDelArray, function(e) {
				mui.openWindow({
					url:"daliyList.html"
				});
			});
		},
		success:function(data){
		    var jsonData = eval('(' + data + ')'); 
			var msg= jsonData.msg;
			if(msg == true){
				mui.confirm('删除成功！', '', btnDelArray, function(e) {	
					mui.openWindow({
						url:"daliyList.html"
					});
				});	
			}else{
				mui.confirm('删除失败！', '', btnDelArray, function(e) {
					mui.openWindow({
						url:"daliyList.html"
					});
				});
			}
		}
	});
}

//取回
function backDaily(id){
	var btnDelArray = ['确定'];
	$.ajax({
		url:pathUrl+"/backDailyInfo",
		type:"post",
		data : {
			id:id
		},
		async:false,/*同步请求*/
		dataType:"jsonp",
		jsonp:"callback",
		jsonpCallback:'flightHandler',
		error : function(){
			mui.confirm('撤回失败！', '', btnDelArray, function(e) {
				mui.openWindow({
					url:"daliyList.html"
				});
			});
		},
		success:function(data){
            var jsonData = eval('(' + data + ')'); 
			var msg= jsonData.msg;;
			if(msg == true){
				mui.confirm('撤回成功！', '', btnDelArray, function(e) {	
					mui.openWindow({
						url:"daliyList.html"
					});
				});	
			}else{
				mui.confirm('撤回失败！', '', btnDelArray, function(e) {
					mui.openWindow({
						url:"daliyList.html"
					});
				});
			}
		}
	});
}
//刚登陆加载页面
function logInAction(userName,wx_userId){
	appUserInfo.mUserName=userName;
	$.ajax({
			url: pathUrl+'/logInAction.action',
			type:'post',
			data:{userName:userName,wx_userId:preId+wx_userId},
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			success:function(data){
				getDataList();
			}
	});
}

//跳转到菜单
function backMenu(){
	localStorage.fromFlag=null;
	mui.openWindow({
		url:"menu.html"
	});
}
//获取异常事件
function toAddDaily(){
	var err=false;
	$.ajax({
		type: "post",
		url: pathUrl+'/getExceptionData.action',
		data:{
			userId:appUserInfo.applyUserId
		},
		cache:false,
		async:false,/*同步请求*/
		dataType: "json",
		success:function(data){
			if (data) {
			    var result=eval('(' + data + ')'); 
			    if(result.flag==true){
				    mui.toast(result.msg);
				    err=result.flag;
			    }
			}
		}
	})
	
	if(editCount>0){
		mui.toast("请先提交草稿");
		return false;
	}
	localStorage.fromFlag=null;
	localStorage.removeItem('dailyMode');
	localStorage.removeItem('dailyAssortList');
	localStorage.removeItem('dailySpends');
	localStorage.removeItem('dailyInfo');
	localStorage.removeItem('workList');
	localStorage.removeItem('dailyPlanList');
	if(err!=true){
		mui.openWindow({
			url:"report-info.html"
		});
	}
}
