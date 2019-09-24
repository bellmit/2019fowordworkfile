
(function (mui, doc, $) {
	// mui 初始化
	mui.init({
		pullRefresh: {
			container: '#pullrefresh',
			down: {
				callback: pulldownRefresh
			}
			// up: {
			// 	contentrefresh: '正在加载...',
			// 	callback: ""
			// }
		}
	});
	getMyTaskList();
	$("#myTaskList").on("tap", function (e) {
		showMyTaskHistory(e);
	})
})(mui, document, jQuery);



/**
*根据pageIdex加载数据的问题
*/
function getMyTaskList() {
	var loginUser = JSON.parse(localStorage.wxUser);
	var applyUser = loginUser.userName;
	$.ajax({
		url: URL_PATH + '/mySendTaskList.action',
		type: "post",
		data: {
			userName: applyUser
		},
		async: false,/*同步请求*/
		cache: false,//不使用缓存
		dataType: "jsonp",
		jsonp: "callback",
		jsonpCallback: 'flightHandler',
		error: function () {
			alert("网络异常！");
		},
		success: function (data) {
			var dataList = "";
			var allTotal = 0;
			var resultMap = JSON.parse(JSON.parse(data).data.substring(2,JSON.parse(data).data.length-1)).data;
			$.each(resultMap, function (i, e) {
				var innerStr = "";
				for(var j=0;j<e.length;j++){
					innerStr += '<div class="pd5px pendingBorderB targetHistory" data-procInstId="'+e[j].procInstId+'">'
					+ '<span class="pendingSpan pendWith40c targetHistory" data-procInstId="'+e[j].procInstId+'">' + e[j].taskUser + '</span><span class="pendingSpan pendWith60c targetHistory" data-procInstId="'+e[j].procInstId+'" data-startTime ="'+formatDate(JSON.parse(e[j].procInstStartTime).time)+'" >' + formatDate(JSON.parse(e[j].taskCreateTime).time) + '</span>'
					+ '</div>';
				}
			
				allTotal+=e.length;
				dataList += '<li class="mui-table-view-cell mui-collapse">'
					+ '<a href="#" class="mui-navigate-right customNavWord" data-page="0" data-totle="' + e.length + '">' + i + '(' + e.length + ')</a>'
					+ '<div class="mui-collapse-content">'
					+ innerStr	
					+ '</div>'
					+ '</li>';
			})
			$("#myTaskList").html(dataList);
			$("title").text("我发起的进行中流程("+allTotal+")");
		}
	});

}
/**
*上拉刷新的方法
*/
function pulldownRefresh() {
	setTimeout(function () {
		getMyTaskList();
		mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
		mui('#pullrefresh').pullRefresh().refresh(true);
	}, 1500);
}
/**
*格式化日期
*/
function formatDate(time) { 
	var now=new Date(time); 
	var year=now.getFullYear(); 
	var month=now.getMonth()+1; 
	var date=now.getDate(); 
	var hour=now.getHours(); 
	var minute=now.getMinutes(); 
	var second=now.getSeconds(); 
	return year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second; 
} 

function showMyTaskHistory(e){
	var $div = e.target;
	if ($($div).hasClass("targetHistory")) {
		var taskObj={

		}
		
		taskObj.processInstanceId = $($div).attr("data-procInstId");
		if($($div).hasClass("pendingSpan")){
			$div = $($div).parent();
		}
		taskObj.tasker = $($div).find(".pendWith40c").text();
		taskObj.time = $($div).find(".pendWith60c").text();
		taskObj.startTime = $($div).find(".pendWith60c").attr("data-startTime");
		localStorage.taskObj = JSON.stringify(taskObj);
		window.location.href="myTask_history.html";
	}
}