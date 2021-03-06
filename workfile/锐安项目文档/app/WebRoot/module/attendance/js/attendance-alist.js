var appUserInfo={};
//mui初始化
mui.init({
	swipeBack: true //启用右滑关闭功能
});
//初始化微信用户
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
	}, 800);

	document.getElementById('closePage').addEventListener('tap',function(e){
		mui.openWindow({
			url:"attend-menu.html"
		});
	})
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
	var result = $('#result')[0];
	var btns = $('#yearMonth');
	btns.each(function(i, btn) {
		btn.addEventListener('tap', function() {
			var _self = this;
			if(_self.picker) {
				_self.picker.show(function (rs) {
					btn.innerText =rs.text;
					setTimeout(function() {
						getDataList();
					},500);
					_self.picker.dispose();
					_self.picker = null;
				});
			} else {
				var optionsJson = this.getAttribute('data-options') || '{}';
				var options = JSON.parse(optionsJson);
				var id = this.getAttribute('id');
				/*
				* 首次显示时实例化组件
				* 示例为了简洁，将 options 放在了按钮的 dom 上
				* 也可以直接通过代码声明 optinos 用于实例化 DtPicker
				*/
				_self.picker = new $.DtPicker(options);
				_self.picker.show(function(rs) {
					btn.innerText = rs.text;
					setTimeout(function() {
						getDataList();
					},500);
					_self.picker.dispose();
					_self.picker = null;
				});
			}		
		}, false);
	});
})(mui,document);

//补登
$('#mui-alist-view').on('tap', '.apply', function(event) {
	var id = $(this).attr("value");
	var obj = {id:id};
	var str = JSON.stringify(obj);
	localStorage.obj = str;
	mui.openWindow({
		url:"relogin-apply.html",
	});
});

/**
* 上拉加载具体业务实现
*/
function pullupRefresh() {
	setTimeout(function() {
		var table = document.body.querySelector('#mui-alist-view');
		var cells = document.body.querySelectorAll('.mui-table-view-cell');
		var newCount = cells.length>0?5:10;//首次加载10条，满屏
		var lastId = $("#mui-alist-view li:last-child").attr("value");
		var yearMonth = document.getElementById('yearMonth').innerHTML;
		$.ajax({
			url:pathUrl+'/appAttendance.action',
			type:"get",
			data:{yearMonth:yearMonth,pageSize:10,lastId:lastId,applyUserId:appUserInfo.applyUserId},
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			success:function(data){
				var jsonData = JSON.parse(data);
			    var dataList = "";
			    $.each(jsonData.dataList,function(i,attendance){
			    	if(!attendance.hasOwnProperty("site1")){		    	
			    		attendance.site1 = '--';
			    	}
			    	if(!attendance.hasOwnProperty("site2")){
			    		attendance.site2 = '--';
			    	}
			    	if(!attendance.hasOwnProperty("site3")){		    	
			    		attendance.site3 = '--';
			    	}
			    	if(!attendance.hasOwnProperty("site4")){
			    		attendance.site4 = '--';
			    	}
				    if(attendance.site1 == ''){
							attendance.site1 = '--';
					}
					if(attendance.site2 == ''){
							attendance.site2 = '--';
					}
					if(attendance.site3 == ''){
							attendance.site3 = '--';
					}
					if(attendance.site4 == ''){
							attendance.site4 = '--';
					}
			    	if(attendance.status == '正常' || attendance.status == '已补登'){
			    		dataList='<li class="mui-media relative mui-table-view-cell" value="'+attendance.id+'">'+
									'<div>'+
										'<div class="myui-baobei-list-icon-b mui-pull-left">'+
											'<img src="../../images/attendance-time-icon.png" alt="">'+
										'</div>'+
										'<div class="mui-media-body mui-pull-left">'+ 
											attendance.appTime+'<p class="mui-ellipsis clearfix blue">'+attendance.status+'</p>'+
										'</div>'+
									'</div>'+
									'<div class="clear"></div>'+
									'<div class="mui-media detailMsg fadeBox">'+
										'<span class="mui-col-xs-6 left">上午上班&nbsp;'+ attendance.appAmAttend + '</span>' +
										'<span class="mui-col-xs-6 left">'+ attendance.site1 + '</span>' +
										'<span class="mui-col-xs-6 left">上午下班&nbsp;'+ attendance.appAmClosing + '</span>' +
										'<span class="mui-col-xs-6 left">'+ attendance.site2 + '</span>' +
										'<span class="mui-col-xs-6 left">下午上班&nbsp;'+ attendance.appPmAttend + '</span>' +
										'<span class="mui-col-xs-6 left">'+ attendance.site3 + '</span>' +
										'<span class="mui-col-xs-6 left">下午下班&nbsp;'+ attendance.appPmClosing + '</span>' +
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
											attendance.appTime+'<p class="mui-ellipsis clearfix blue">'+attendance.status+'</p>' +
										'</div>'+
										'<span class="mui-btn mui-btn right apply" value="'+attendance.id+'">补登</span>'+
									'</div>'+
									'<div class="clear"></div>'+
									'<div class="mui-media detailMsg fadeBox">';
						if(attendance.describe1 == '正常'){
							dataList = dataList + '<span class="mui-col-xs-6 left">上午上班&nbsp;'+ attendance.appAmAttend + '</span>' +
										'<span class="mui-col-xs-6 left">'+ attendance.site1 + '</span>';
						}else{
							dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">上午上班&nbsp;'+ attendance.appAmAttend + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site1 + '</span>';
						}
						if(attendance.describe2 == '正常'){
							dataList = dataList + '<span class="mui-col-xs-6 left">上午下班&nbsp;'+ attendance.appAmClosing + '</span>' +
										'<span class="mui-col-xs-6 left">'+ attendance.site2 + '</span>';
						}else{
							dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">上午下班&nbsp;'+ attendance.appAmClosing + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site2 + '</span>';
						}
						if(attendance.describe3 == '正常'){
							dataList = dataList + '<span class="mui-col-xs-6 left">下午上班&nbsp;'+ attendance.appPmAttend + '</span>'+
										'<span class="mui-col-xs-6 left">'+ attendance.site3 + '</span>';
						}else{
							dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">下午上班&nbsp;'+ attendance.appPmAttend + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site3 + '</span>';
						}
						if(attendance.describe4 == '正常'){
							dataList = dataList + '<span class="mui-col-xs-6 left">下午下班&nbsp;'+ attendance.appPmClosing + '</span>'+
										'<span class="mui-col-xs-6 left">'+ attendance.site4 + '</span>';
						}else{
							dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">下午下班&nbsp;'+ attendance.appPmClosing + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site4 + '</span>';
						}
						dataList = dataList + '</div>'+'</li>';
			    	}
					$("#mui-alist-view").append(dataList);
			 	});
			 	mui('#pullrefresh').pullRefresh().endPullupToRefresh(false);
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
    }, 1500);
}

/**
 * 获取考勤记录
 */
function getDataList(){
	var yearMonth = document.getElementById('yearMonth').innerHTML;
	$.ajax({
		url:pathUrl+'/appAttendance.action',
		type:'post',
		data:{yearMonth:yearMonth, applyUserId:appUserInfo.applyUserId, pageSize:10},
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
		    	if(!attendance.hasOwnProperty("site1")){		    	
		    		attendance.site1 = '--';
		    	}
		    	if(!attendance.hasOwnProperty("site2")){
		    		attendance.site2 = '--';
		    	}
		    	if(!attendance.hasOwnProperty("site3")){		    	
		    		attendance.site3 = '--';
		    	}
		    	if(!attendance.hasOwnProperty("site4")){
		    		attendance.site4 = '--';
		    	}
				if(attendance.site1 == ''){
						attendance.site1 = '--';
				}
				if(attendance.site2 == ''){
						attendance.site2 = '--';
				}
				if(attendance.site3 == ''){
						attendance.site3 = '--';
				}
				if(attendance.site4 == ''){
						attendance.site4 = '--';
				}
				if(attendance.status == '正常' || attendance.status == '已补登'){
					dataList='<li class="mui-media relative mui-table-view-cell" value="'+attendance.id+'">'+
								'<div>'+
									'<div class="myui-baobei-list-icon-b mui-pull-left">'+
										'<img src="../../images/attendance-time-icon.png" alt="">'+
									'</div>'+
									'<div class="mui-media-body mui-pull-left">'+ 
										attendance.appTime+'<p class="mui-ellipsis clearfix blue">'+attendance.status+'</p>'+
									'</div>'+
								'</div>'+
								'<div class="clear"></div>'+
								'<div class="mui-media detailMsg fadeBox">'+
									'<span class="mui-col-xs-6 left">上午上班&nbsp;'+ attendance.appAmAttend + '</span>' +
									'<span class="mui-col-xs-6 left">'+ attendance.site1 + '</span>' +
									'<span class="mui-col-xs-6 left">上午下班&nbsp;'+ attendance.appAmClosing + '</span>' +
									'<span class="mui-col-xs-6 left">'+ attendance.site2 + '</span>' +
									'<span class="mui-col-xs-6 left">下午上班&nbsp;'+ attendance.appPmAttend + '</span>' +
									'<span class="mui-col-xs-6 left">'+ attendance.site3 + '</span>' +
									'<span class="mui-col-xs-6 left">下午下班&nbsp;'+ attendance.appPmClosing + '</span>' +
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
										'<p class="mui-ellipsis clearfix blue">'+attendance.status+'</p>'+
									'</div>'+
									'<span class="mui-btn mui-btn right apply" value="'+attendance.id+'">补登</span>'+
								'</div>'+
								'<div class="clear"></div>'+
								'<div class="mui-media detailMsg fadeBox">';
					if(attendance.describe1 == '正常'){
						dataList = dataList + '<span class="mui-col-xs-6 left">上午上班&nbsp;'+ attendance.appAmAttend + '</span>'+
										'<span class="mui-col-xs-6 left">'+ attendance.site1 + '</span>';
					}else{
						dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">上午上班&nbsp;'+ attendance.appAmAttend + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site1 + '</span>';
					}
					if(attendance.describe2 == '正常'){
						dataList = dataList + '<span class="mui-col-xs-6 left">上午下班&nbsp;'+ attendance.appAmClosing + '</span>' +
										'<span class="mui-col-xs-6 left">'+ attendance.site2 + '</span>';
					}else{
						dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">上午下班&nbsp;'+ attendance.appAmClosing + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site2 + '</span>';
					}
					if(attendance.describe3 == '正常'){
						dataList = dataList + '<span class="mui-col-xs-6 left">下午上班&nbsp;'+ attendance.appPmAttend + '</span>'+
										'<span class="mui-col-xs-6 left">'+ attendance.site3 + '</span>';
					}else{
						dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">下午上班&nbsp;'+ attendance.appPmAttend + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site3 + '</span>';
					}
					if(attendance.describe4 == '正常'){
						dataList = dataList + '<span class="mui-col-xs-6 left">下午下班&nbsp;'+ attendance.appPmClosing + '</span>'+
										'<span class="mui-col-xs-6 left">'+ attendance.site4 + '</span>';
					}else{
						dataList = dataList + '<span class="mui-col-xs-6 left" style="color:red">下午下班&nbsp;'+ attendance.appPmClosing + '</span>'+
										'<span class="mui-col-xs-6 left" style="color:red">'+ attendance.site4 + '</span>';
					}			
					dataList = dataList + '</div>'+'</li>';
		    	}
				$("#mui-alist-view").append(dataList);
		 	});
		}
   	});  
}
//获取时间
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
    var currentdate = year + seperator1 + month ;
    return currentdate;
}