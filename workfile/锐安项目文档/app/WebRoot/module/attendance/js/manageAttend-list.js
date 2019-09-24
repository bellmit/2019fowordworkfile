var appUserInfo={};
//初始化微信数据
(function($,doc) {
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
	
	var showStyleButton = doc.getElementById("queryDate");
	var styleResult = doc.getElementById("queryDate");
	//绑定时间加载的插件
	showStyleButton.addEventListener("tap", function () {
		var _self = this;
		if (_self.picker) {
			_self.picker.show(function (rs) {
				styleResult.innerText = rs.text;
				_self.picker.dispose();
				_self.picker = null;
			});
		} else {
			var optionsJson = this.getAttribute("data-options") || "{}";
			var options = JSON.parse(optionsJson);
			var id = this.getAttribute("id");
			_self.picker = new $.DtPicker(options);
			_self.picker.show(function (rs) {
				styleResult.innerText = rs.text;
				getDataList();
				_self.picker.dispose();
				_self.picker = null;
			});
		}
	}, false);
	
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
	
})(mui,document);


/**
* 上拉加载具体业务实现
*/
function pullupRefresh() {
	setTimeout(function() {
		var table = document.body.querySelector('#mui-alist-view');
		var cells = document.body.querySelectorAll('.mui-table-view-cell');
		var newCount = cells.length>0?5:10;//首次加载10条，满屏
		var lastId = $("#mui-alist-view li:last-child").attr("value");
		var data = JSON.parse(localStorage.wxUser);
	    var UserName=data.userName;
        var UserId = data.userId;
		var queryUserName = $('#queryUserName').val();
        var queryDate = document.getElementById('queryDate').innerHTML;
        if(queryDate == '时间'){
			queryDate = getNowFormatDate();
		}
		$.ajax({
			url:pathUrl+'/getAttendList.action',
			type:"get",
			data:{
				queryDate:queryDate,
				applyUserId:UserId,
				loginName:UserName,
				queryUserName:queryUserName,
				pageSize:5,
				lastId:lastId
			},
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			success:function(data){
				var jsonData = JSON.parse(data);
			    var dataList = "";
			    $.each(jsonData.dataList,function(i,attendance){
			    	
			    	//当不存在site1字段时，说明是补登数据，打卡地点赋值为空
			    	if(!attendance.hasOwnProperty("site1") || attendance.site1 == ''){		    	
			    		attendance.site1 = '--';
			    	}
			    	if(!attendance.hasOwnProperty("site2") || attendance.site2 == ''){
			    		attendance.site2 = '--';
			    	}
			    	if(!attendance.hasOwnProperty("site3") || attendance.site3 == ''){		    	
			    		attendance.site3 = '--';
			    	}
			    	if(!attendance.hasOwnProperty("site4") || attendance.site4 == ''){
			    		attendance.site4 = '--';
			    	}
			    	if(attendance.status == '正常'){
			    		dataList='<li class="mui-media relative mui-table-view-cell" value="'+attendance.id+'">'+
									'<div>'+
										'<div class="myui-baobei-list-icon-b mui-pull-left">'+
											'<img src="../../images/attendance-time-icon.png" alt="">'+
										'</div>'+
										'<div class="mui-media-body mui-pull-left">'+ 
											attendance.appTime+'<p class="mui-ellipsis clearfix blue">'+attendance.staffName+'</p>'+
										'</div>'+
									'</div>'+
									'<div class="clear"></div>'+
									'<div class="mui-media detailMsg fadeBox">'+
										'<span class="mui-col-xs-6 left">上午上班'+ attendance.appAmAttend + '</span>' +
										'<span class="mui-col-xs-6 left">'+ attendance.site1 + '</span>' +
										'<span class="mui-col-xs-6 left">上午下班'+ attendance.appAmClosing + '</span>' +
										'<span class="mui-col-xs-6 left">'+ attendance.site2 + '</span>' +
										'<span class="mui-col-xs-6 left">下午上班'+ attendance.appPmAttend + '</span>' +
										'<span class="mui-col-xs-6 left">'+ attendance.site3 + '</span>' +
										'<span class="mui-col-xs-6 left">下午下班'+ attendance.appPmClosing + '</span>' +
										'<span class="mui-col-xs-6 left">'+ attendance.site4 + '</span>' +
									'</div>'+
								'</li>';
			    	}else{
			    		dataList='<li class="mui-media relative mui-table-view-cell" value="'+attendance.id+'">'+
									'<div>'+
										'<div class="myui-baobei-list-icon mui-pull-left">'+
											'<img src="../../images/attendance-time-icon.png" alt="">'+
										'</div>'+
										'<div class="mui-media-body mui-pull-left">'+ 
											attendance.appTime+'<p class="mui-ellipsis clearfix blue">'+attendance.staffName+'</p>' +
										'</div>'+
										'<span></span>'+
									'</div>'+
									'<div class="clear"></div>'+
									'<div class="mui-media detailMsg fadeBox">';
						if(attendance.describe1 == '正常'){
							dataList = dataList + '<span class="mui-col-xs-6 left">上午上班'+ attendance.appAmAttend + '</span>' +
										'<span class="mui-col-xs-6 left">'+ attendance.site1 + '</span>';
						}else{
							dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">上午上班'+ attendance.appAmAttend + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site1 + '</span>';
						}
						if(attendance.describe2 == '正常'){
							dataList = dataList + '<span class="mui-col-xs-6 left">上午下班'+ attendance.appAmClosing + '</span>' +
										'<span class="mui-col-xs-6 left">'+ attendance.site2 + '</span>';
						}else{
							dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">上午下班'+ attendance.appAmClosing + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site2 + '</span>';
						}
						if(attendance.describe3 == '正常'){
							dataList = dataList + '<span class="mui-col-xs-6 left">下午上班'+ attendance.appPmAttend + '</span>'+
										'<span class="mui-col-xs-6 left">'+ attendance.site3 + '</span>';
						}else{
							dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">下午上班'+ attendance.appPmAttend + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site3 + '</span>';
						}
						if(attendance.describe4 == '正常'){
							dataList = dataList + '<span class="mui-col-xs-6 left">下午下班'+ attendance.appPmClosing + '</span>'+
										'<span class="mui-col-xs-6 left">'+ attendance.site4 + '</span>';
						}else{
							dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">下午下班'+ attendance.appPmClosing + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site4 + '</span>';
						}
						dataList = dataList + '</div>'+'</li>';
			    	}
					$("#mui-alist-view").append(dataList);
			 	});
			 	mui('#pullrefresh').pullRefresh().endPullupToRefresh(false);
		   	}    
	   	});
	}, 700);
}

/**
 * 下拉刷新具体业务实现
 */
function pulldownRefresh() {
    setTimeout(function() {
        getDataList();
		mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
		mui('#pullrefresh').pullRefresh().refresh(true); //上拉后可以再次加载
    }, 500);
}

/**
 * 获取考勤记录
 */
function getDataList(){

	var data = JSON.parse(localStorage.wxUser);
    var UserName=data.userName;
    var UserId = data.userId;
	var queryUserName = $('#queryUserName').val();
	var queryDate = document.getElementById('queryDate').innerHTML;
	if(queryDate == '时间'){
		queryDate = getNowFormatDate();
	}
	
	$.ajax({
		url:pathUrl+'/getAttendList.action',
		type:'post',
		data:{
			queryDate:queryDate,
			applyUserId:UserId,
			loginName:UserName,
			queryUserName:queryUserName,
			pageSize:5
		},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		success:function(data){
	        var jsonData = JSON.parse(data);
		   	var dataList = "";
		    $("#mui-alist-view").html('');
		    $.each(jsonData.dataList,function(i,attendance){
		    
		    		//当不存在site1字段时，说明是补登数据，打卡地点赋值为空
		    		if(!attendance.hasOwnProperty("site1") || attendance.site1 == ''){		    	
			    		attendance.site1 = '--';
			    	}
			    	if(!attendance.hasOwnProperty("site2") || attendance.site2 == ''){
			    		attendance.site2 = '--';
			    	}
			    	if(!attendance.hasOwnProperty("site3") || attendance.site3 == ''){		    	
			    		attendance.site3 = '--';
			    	}
			    	if(!attendance.hasOwnProperty("site4") || attendance.site4 == ''){
			    		attendance.site4 = '--';
			    	}
				if(attendance.status == '正常'){
					dataList='<li class="mui-media relative mui-table-view-cell" value="'+attendance.id+'">'+
								'<div>'+
									'<div class="myui-baobei-list-icon-b mui-pull-left">'+
										'<img src="../../images/attendance-time-icon.png" alt="">'+
									'</div>'+
									'<div class="mui-media-body mui-pull-left">'+ 
										attendance.appTime+'<p class="mui-ellipsis clearfix blue">'+attendance.staffName+'</p>'+
									'</div>'+
								'</div>'+
								'<div class="clear"></div>'+
								'<div class="mui-media detailMsg fadeBox">'+
									'<span class="mui-col-xs-6 left">上午上班 '+ attendance.appAmAttend + '</span>' +
									'<span class="mui-col-xs-6 left">'+ attendance.site1 + '</span>' +
									'<span class="mui-col-xs-6 left">上午下班 '+ attendance.appAmClosing + '</span>' +
									'<span class="mui-col-xs-6 left">'+ attendance.site2 + '</span>' +
									'<span class="mui-col-xs-6 left">下午上班 '+ attendance.appPmAttend + '</span>' +
									'<span class="mui-col-xs-6 left">'+ attendance.site3 + '</span>' +
									'<span class="mui-col-xs-6 left">下午下班 '+ attendance.appPmClosing + '</span>' +
									'<span class="mui-col-xs-6 left">'+ attendance.site4 + '</span>' +
								'</div>'+
							'</li>';
				}else{
		    		dataList='<li class="mui-media relative mui-table-view-cell" value="'+attendance.id+'">'+
								'<div>'+
									'<div class="myui-baobei-list-icon mui-pull-left">'+
										'<img src="../../images/attendance-time-icon.png" alt="">'+
									'</div>'+
									'<div class="mui-media-body mui-pull-left">'+ 
										attendance.appTime+
										'<p class="mui-ellipsis clearfix blue">'+attendance.staffName+'</p>'+
									'</div>'+
									'<span></span>'+
								'</div>'+
								'<div class="clear"></div>'+
								'<div class="mui-media detailMsg fadeBox">';
					if(attendance.describe1 == '正常'){
						dataList = dataList + '<span class="mui-col-xs-6 left">上午上班 '+ attendance.appAmAttend + '</span>'+
										'<span class="mui-col-xs-6 left">'+ attendance.site1 + '</span>';
					}else{
						dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">上午上班 '+ attendance.appAmAttend + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site1 + '</span>';
					}
					if(attendance.describe2 == '正常'){
						dataList = dataList + '<span class="mui-col-xs-6 left">上午下班 '+ attendance.appAmClosing + '</span>' +
										'<span class="mui-col-xs-6 left">'+ attendance.site2 + '</span>';
					}else{
						dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">上午下班 '+ attendance.appAmClosing + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site2 + '</span>';
					}
					if(attendance.describe3 == '正常'){
						dataList = dataList + '<span class="mui-col-xs-6 left">下午上班 '+ attendance.appPmAttend + '</span>'+
										'<span class="mui-col-xs-6 left">'+ attendance.site3 + '</span>';
					}else{
						dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">下午上班 '+ attendance.appPmAttend + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site3 + '</span>';
					}
					if(attendance.describe4 == '正常'){
						dataList = dataList + '<span class="mui-col-xs-6 left">下午下班 '+ attendance.appPmClosing + '</span>'+
										'<span class="mui-col-xs-6 left">'+ attendance.site4 + '</span>';
					}else{
						dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">下午下班 '+ attendance.appPmClosing + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site4 + '</span>';
					}			
					dataList = dataList + '</div>'+'</li>';
		    	}
				$("#mui-alist-view").append(dataList);
		 	});
		}
   	});  
}
/**
 * 获取当前日期：yyyy-MM-dd
 */
function getNowFormatDate() {
    var date = new Date();
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
/**
 * 搜索框点击事件触发
 */
$('#myform').bind('search',function(){
	getDataList();
	document.activeElement.blur();
})
