
$(function () {
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
	//点击页面隐藏自动补全提示框
	document.onclick = function(e) {
		var e = e ? e : window.event;
		var tar = e.srcElement || e.target;
		if (tar.id != "autoInput") {
			if ($("#auto_div").is(":visible")) {
				$("#auto_div").css("display", "none");
				$('.mui-table-view').removeClass('hide');
			}
		}

		
	};
	//查看按钮
	$('.chkBtn').die().live('touchend',function(){
		$(this).toggleClass('slt');
		if($(this).text()=='查看'){
			mui.openWindow({
				url:"custom_chkquestion.html"
			});
		}else if($(this).text()=='确认'){
			mui.openWindow({
				url:"custom_serverconfirm.html"
			});
		}else if($(this).text()=='评价'){
			mui.openWindow({
				url:"custom_serverevaluate.html"
			});
		}
	});
	//题目点击
	$('.customList .titleText').die().live('touchend',function(){
		$(this).toggleClass('slt');
		if($(this).next().text()=='查看'){
			mui.openWindow({
				url:"custom_chkquestion.html"
			});
		}else if($(this).next().text()=='确认'){
			mui.openWindow({
				url:"custom_serverconfirm.html"
			});
		}else if($(this).next().text()=='评价'){
			mui.openWindow({
				url:"custom_serverevaluate.html"
			});
		}
	});
});

function addData() {
		var table = $('.mui-table-view');
		var cells = $('.customList');
		for(var i = cells.length, len = i + 5; i < len; i++) {
			var _html='<li class="customList">'+
							'<div class="listTitle clearfix">'+
								'<span class="left status red">已提交</span>'+
								'<h6 class="left titleText">导出功能无法使用</h6>'+
								'<a href="javascript:;" class="right chkBtn">查看</a>'+
							'</div>'+
							'<div class="bordergrey nocolor"></div>'+
						'</li>'+
						'<li class="customList">'+
							'<div class="listTitle clearfix">'+
								'<span class="left status yellow">已分配</span>'+
								'<h6 class="left titleText">导出功能无法使用</h6>'+
								'<a href="javascript:;" class="right chkBtn">查看</a>'+
							'</div>'+
							'<div class="bordergrey"></div>'+
							'<dl class="bottomCon">'+
								'<dd class="clearfix">'+
								'<span class="left marginR60">负责人：仁青</span>'+
								'<span class="left">电话：18612355568</span>'+
								'</dd>'+
							'</dl>'+
						'</li>';
			//下拉刷新，新纪录插到最前面；
			table.prepend(_html);
		}
}
/**
 * 下拉刷新具体业务实现
 */
function pulldownRefresh() {
	setTimeout(function() {
		addData();
		mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
		mui.toast("加载了两条数据");
	}, 1500);
}
var count = 0;
/**
 * 上拉加载具体业务实现
 */
function pullupRefresh() {
	setTimeout(function() {
		mui('#pullrefresh').pullRefresh().endPullupToRefresh((++count > 2)); //参数为true代表没有更多数据了。
		var table = $('.mui-table-view');
		var cells = $('.customList');
		var newCount = cells.length>0?5:10;//首次加载10条，满屏
		var _html = '';
		for (var i = cells.length, len = i + newCount; i < len; i++) {
			var _html='<li class="customList">'+
				'<div class="listTitle clearfix">'+
				'<span class="left status red">已提交</span>'+
				'<h6 class="left titleText">导出功能无法使用</h6>'+
				'<a href="javascript:;" class="right chkBtn">查看</a>'+
				'</div>'+
				'<div class="bordergrey nocolor"></div>'+
				'</li>'+
				'<li class="customList">'+
				'<div class="listTitle clearfix">'+
				'<span class="left status yellow">已分配</span>'+
				'<h6 class="left titleText">导出功能无法使用</h6>'+
				'<a href="javascript:;" class="right chkBtn">查看</a>'+
				'</div>'+
				'<div class="bordergrey"></div>'+
				'<dl class="bottomCon">'+
				'<dd class="clearfix">'+
				'<span class="left marginR60">负责人：仁青</span>'+
				'<span class="left">电话：18612355568</span>'+
				'</dd>'+
				'</dl>'+
				'</li>';
			table.append(_html);
		}
	}, 1500);
}

function parentFn(){
	$('.topInput').on('blur',function(){
		$('.topInput').addClass('hide');
		$('.topInput').nextAll('a').removeClass('hide');
	});	
}




