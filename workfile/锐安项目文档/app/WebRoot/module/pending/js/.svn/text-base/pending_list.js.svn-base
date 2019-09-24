
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
	getPendingList();
	$("#pendingList").on("tap", function (e) {
		showPendingDetail(e);
	})
})(mui, document, jQuery);



/**
*根据pageIdex加载数据的问题
*/
function getPendingList() {
	var loginUser = JSON.parse(localStorage.wxUser);
	var applyUser = loginUser.userName;
	$.ajax({
		url: URL_PATH + '/pendingList.action',
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
			$.each(JSON.parse(data).map, function (i, e) {
				dataList += '<li class="mui-table-view-cell mui-collapse">'
					+ '<a href="#" class="mui-navigate-right customNavWord" data-page="0" data-totle="' + e + '">' + i + '(' + e + ')</a>'
					+ '<div class="mui-collapse-content">'
					+ '</div>'
					+ '</li>';
					allTotal+=parseInt(e);
			})
			$("#pendingList").html(dataList);
			$("title").text("待办列表("+allTotal+")");
		}
	});

}

/**
*点击列表展示详情
*/
function showPendingDetail(e) {
	if ($(e.target).hasClass("customNavWord")) {
		if (parseInt($(e.target).attr("data-page")) == 0) {
			var procName = $(e.target).text().replace(/\(\d{1,}\)/, "").replace("【老家园流程】","");
			var loginUser = JSON.parse(localStorage.wxUser);
			var userName = loginUser.userName;
			var pageIndex = 1;
			var total = parseInt($(e.target).attr("data-totle"));
			$(e.target).attr("data-page", pageIndex);
			var showMore = "";
			if (total - 5 * pageIndex > 0) {
				showMore = "<span class='pendingSpan witdh100 pendingShowMore' >更多</span>";
			}
			loadDetailData(e.target, userName, procName, pageIndex, showMore);
		} else {
			$(e.target).next().empty();
			$(e.target).attr("data-page", 0);
			$(e.target).parent().find(".pendingShowMore").remove();
		}
	}else if($(e.target).hasClass("pendingShowMore")){
		event.stopPropagation();
		showMoreFnc(e.target);
	}
}

/**
*点击更多加载数据
*/
function showMoreFnc(e) {
	var $a = $(e).parent().find("a");
	var procName = $($a).text().replace(/\(\d{1,}\)/, "").replace("【老家园流程】","");
	var loginUser = JSON.parse(localStorage.wxUser);
	var userName = loginUser.userName;
	var pageIndex = parseInt($($a).attr("data-page"))+1;
	var total = parseInt($($a).attr("data-totle"));
	loadDetailData($a, userName, procName, pageIndex, "");
	if (total - 5 * pageIndex < 0) {
		$(e).parent().find(".pendingShowMore").remove();
	}
}

function loadDetailData(e, userName, procName, pageIndex, showMore) {
	$.ajax({
		url: URL_PATH + '/getPendingDetail.action',
		type: "post",
		data: {
			userName: userName,
			procName: procName,
			pageIndex: pageIndex
		},
		dataType: "jsonp",
		async: false,/*同步请求*/
		jsonp: "callback",
		jsonpCallback: 'flightHandler',
		error: function () {
			alert("网络异常！");
		},
		success: function (data) {
			var list = JSON.parse(data).list;
			var confirmStr = "";
			for (var i = 0; i < list.length; i++) {
				confirmStr += '<div class="pd5px pendingBorderB">'
					+ '<span class="pendingSpan pendWith40c">' + list[i].procInstStartUser + '</span><span class="pendingSpan pendWith60c">' + list[i].taskCreateTime + '</span>'
					+ '</div>';
			}
			$(e).next().append(confirmStr);
				$(e).next().after(showMore);
		}
	})
}

function pulldownRefresh() {
	setTimeout(function () {
		getPendingList();
		mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
		mui('#pullrefresh').pullRefresh().refresh(true);
	}, 1500);
}