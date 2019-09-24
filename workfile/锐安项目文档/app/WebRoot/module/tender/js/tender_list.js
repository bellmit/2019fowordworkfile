/**
*点击查看跳转查看页面
*/
function tenderView(e) {
	localStorage.tenderAction = "view";
	localStorage.tenderActionDataId = $(e).attr("dataId");
	window.location.href = "tender_view.html";
}
/**
*点击确认按钮跳转确认页面
*/
function tenderComfirm(e) {
	localStorage.tenderActionDataId = $(e).attr("dataId");
	localStorage.tenderAction = "comfirm";
	window.location.href = "tender_comfirm.html";
}
/**
*点击修改跳转修改页面
*/
function tenderEdit(e) {
	localStorage.tenderAction = "edit";
	localStorage.tenderActionDataId = $(e).attr("dataId");
	window.location.href = "tender_add.html";
}
(function ($, doc) {
	// mui 初始化
	mui.init({
		pullRefresh: {
		container: '#pullrefresh',
		down: {
			callback: pulldownRefresh
		},
		up: {
			contentrefresh: '正在加载...',
			callback: pullUpRefresh
		}
}
});
	//初始化  默认显示第一页数据
	getCustomList(1);

})(mui, document);

/**
*下拉加载下一页数据的方法
*/
function tenderNextPage() {
		var pageIndex = $("#pageIndex").val();
		if (pageIndex == "") {
			pageIndex = 1;
		} else {
			pageIndex = parseInt(pageIndex) + 1;
		}
		getCustomList(pageIndex);
}

/**
*根据pageIdex加载数据的问题
*/
function getCustomList(pageIdex) {
	if(pageIdex==1){
		//第一页的时候清空数据再加载
		$("#tenderList").empty();
	}
	$("#pageIndex").val(pageIdex);
	var projectName = $("#projectName").val();
	var loginUser = JSON.parse(localStorage.wxUser);
	var applyUser=loginUser.userName ;
	$.ajax({
		url: URL_PATH + '/tenderList.action',
		type: "post",
		data: {
			projectName: projectName,
			applyUser: applyUser,
			pageIndex: pageIdex
		},
		async: false,/*同步请求*/
		cache:false,//不使用缓存
		dataType: "jsonp",
		jsonp: "callback",
		jsonpCallback: 'flightHandler',
		error: function () {
			alert("网络异常！");
		},
		success: function (data) {
			var list = JSON.parse(data).list;
			var dataList = "";
			for (var i = 0; i < list.length; i++) {
				var confirmStr = "";
				if (list[i].status == 1) {
				
				confirmStr = '<input class="listBtn tender_bule" onclick="tenderEdit(this)" dataId="' + list[i].id + '" type="button" value="编辑"><input class="listBtn tender_green" onclick="tenderComfirm(this)" dataId="' + list[i].id + '" type="button" value="确认">';
				} else {
				confirmStr = '<input class="listBtn"  onclick="tenderView(this)"  dataId="' + list[i].id + '" type="button" value="查看">';
				}
				dataList = '<li class="pd5px">' 
					+'<div class="tender_li_div">' + list[i].projectName + '</div>'
					+ '<div class="fz14">填报人:' + list[i].applyUser + '      填报日期：' + list[i].createTime.split(" ")[0] + '</div>'
					+ '<div class="taend">' + confirmStr + '</div>'
				'</div>' +
					'</div></li>';
				dataList = dataList.replace("NaN", "");
				$("#tenderList").append(dataList);
			}
		}
	});



}

/**
*上拉刷新的方法
*/
function pulldownRefresh() {
	setTimeout(function () {
		getCustomList(1);
		mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
		mui('#pullrefresh').pullRefresh().refresh(true);
	}, 1500);
}

/**
*下拉加载下一页数据的方法
*/
function pullUpRefresh() {
	setTimeout(function () {
		var projectName = $("#projectName").val();
		var pageIndex = $("#pageIndex").val();
		var loginUser = JSON.parse(localStorage.wxUser);
		var applyUser=loginUser.userName ;
			$.ajax({
				url: URL_PATH + '/tenderCount.action',
				type: "post",
				data: {
					projectName: projectName,
					applyUser: applyUser
				},
				async: false,/*同步请求*/
				dataType: "jsonp",
				jsonp: "callback",
				jsonpCallback: 'flightHandler',
				error: function () {
					alert("获取登录用户信息失败！");
				},
				success: function (data) {
					var flag = (parseInt(JSON.parse(data).count)-5*(parseInt(pageIndex))+1)<=0;
					mui('#pullrefresh').pullRefresh().endPullupToRefresh(flag);
					if(!flag){
						tenderNextPage();
					}
				}
			})
	}, 1500);
}