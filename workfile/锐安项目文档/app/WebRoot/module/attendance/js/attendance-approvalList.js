
//mui初始化
mui.init({
	swipeBack: true //启用右滑关闭功能
});
//初始化微信用户
(function($, doc) {
	if(localStorage.wxUser!=null){
		var data = JSON.parse(localStorage.wxUser);
		logInAction(data.userName,data.wXUserId);	
	}else{
		mui.toast('网络异常！');
	}
	$.init({
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
		
		//类型
		var showStyle = new $.PopPicker();
		showStyle.setData([{
			value: 'plane',
			text: '全部'
		},{
			value: 'plane',
			text: '年假'
		}, {
			value: 'train',
			text: '婚假'
		},{
			value: 'car', 
			text: '事假/长期病假'
		},{
			value: 'car', 
			text: '调休假'
		},{
			value: 'car', 
			text: '带薪年假'
		}]);
		var showStyleButton = doc.getElementById('showStyle');
		var styleResult = doc.getElementById('showStyle');
		showStyleButton.addEventListener('tap', function(event) {
			showStyle.show(function(items) {
				styleResult.innerText = items[0].text;
				getDataInfo();
			});
		}, false);
		
	});
})(mui, document);

var currentPage=1;
var pageCount=0;
/**
 * 下拉刷新具体业务实现
 */
function pulldownRefresh() {
	getDataInfo();
	mui('#pullrefresh').pullRefresh().endPulldownToRefresh(); //refresh completed
}
/**
* 上拉加载具体业务实现
*/
function pullupRefresh() {
	setTimeout(function() {
		mui('#pullrefresh').pullRefresh().endPullupToRefresh((currentPage >= pageCount)); //参数为true代表没有更多数据了。
		var table = document.body.querySelector('#mui-table-view-list');
		var cells = document.body.querySelectorAll('.mui-table-view-cell');
		var leaveType = $("#showStyle").html().trim();
		if(leaveType=='类型'){
			leaveType='';
		}
		$.ajax({
			url:pathUrl+'/approveList.action',
			type:"post",
			data:{leaveType:leaveType,pageSize:5,currentPage:currentPage,adjust:'审批'},
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			success:function(data){
			     $.each(data.result,function(i,flow){
			    	var li = document.createElement('li');
						li.className = 'mui-table-view-cell mui-media';
						li.innerHTML = "<a href='javascript:#;'  class='addApplyB' id='"+flow.procInstId+"-"+flow.taskId+"-"+flow.taskUser+"' name='"+flow.state+"' name='"+flow.state+"' value='"+flow.id+"'>"+
							"<div>"+
								"<div class='myui-baobei-list-icon mui-pull-left'><span>"+flow.leaveType+"</span></div>"+
								"<div class='mui-media-body mui-pull-left'>"
									+flow.name+
									"<p class='mui-ellipsis clearfix blue'>"+flow.dept+"</p>"+
								"</div>"+
								"<span class='mui-badge mui-badge-success right'>"+flow.state+"</span>"+
							"</div>"+
							"<div class='clear'></div>"+
							"<div class='mui-media detailMsg fadeBox'>"+
								"<div>请假时间："+flow.startTime+" - "+flow.endTime+"</div>"+
								"<div>请假小时数： "+flow.leaveHours+"</div>"+
								"<div>申请日期："+flow.applyDate+"</div>"+
								"<div>审批人："+flow.current+"  </div>"+
//								"<div>"+
//									"请假理由：<br>"
//									+flow.reason+
//								"</div>"+
							"</div>"+
						"</a>"
				
				$("#mui-table-view-list").append(li);
				
				});
				currentPage++;
			}
		});
	}, 1500);
}
//获取页面初始化数据	
function getDataInfo(){
	setTimeout(function() {
		var leaveType = $("#showStyle").html().trim();
		if(leaveType=='类型'){
			leaveType='';
		}
		currentPage=1;
		$.ajax({
			url:pathUrl+'/approveList.action',
			type:"post",
			data:{leaveType:leaveType,pageSize:5,currentPage:currentPage,adjust:'审批'},
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			success:function(data){
				$("#mui-table-view-list").html('');
			    $.each(data.result,function(i,flow){
			    	var li = document.createElement('li');
						li.className = 'mui-table-view-cell mui-media';
						li.innerHTML = "<a href='javascript:#;'  class='addApplyB' id='"+flow.procInstId+"-"+flow.taskId+"-"+flow.taskUser+"' name='"+flow.state+"' value='"+flow.id+"'>"+
							"<div>"+
								"<div class='myui-baobei-list-icon mui-pull-left'><span>"+flow.leaveType+"</span></div>"+
								"<div class='mui-media-body mui-pull-left'>"
									+flow.name+
									"<p class='mui-ellipsis clearfix blue'>"+flow.dept+"</p>"+
								"</div>"+
								"<span class='mui-badge mui-badge-success right'>"+flow.state+"</span>"+
							"</div>"+
							"<div class='clear'></div>"+
							"<div class='mui-media detailMsg fadeBox'>"+
								"<div>请假时间："+flow.startTime+" - "+flow.endTime+"</div>"+
								"<div>请假小时数： "+flow.leaveHours+"</div>"+
								"<div>申请日期："+flow.applyDate+"</div>"+
								"<div class='line'></div>"+
							"</div>"+
						"</a>"
				
				$("#mui-table-view-list").append(li);
			    });
			    //总页数
			    pageCount=data.pageCount;
			    currentPage=2;
			    mui('#pullrefresh').pullRefresh().endPullupToRefresh((currentPage > pageCount));
			}
		});
	}, 1500);
}
//登录验证
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
				getDataInfo();
			}
	});
}

//请假数据传输
$('#mui-table-view-list').on('tap', '.addApplyB', function(event) {
	//存放id
	var leavelId = $(this).attr("value");
	//存放flowId
	var flowIdStr = $(this).attr("id");
	var listFlow=flowIdStr.split('-');
	var flowId=listFlow[0];
	var taskId=listFlow[1];
	var taskUser=listFlow[2];
	//存放flowId
	var state = $(this).attr("name");
	var obj = {leavelId:leavelId,flowId:flowId,taskId:taskId,taskUser:taskUser};
	var leavelStr = JSON.stringify(obj);
	localStorage.leavelStr = leavelStr;
	if(state=='审批中'){
		mui.openWindow({
			url:"approval-check.html",
		});
	}else{
		mui.openWindow({
			url:"apply-detail.html",
		});
	}
});