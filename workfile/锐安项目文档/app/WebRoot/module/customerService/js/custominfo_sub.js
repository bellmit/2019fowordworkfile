
$(function () {
  var btnArray = ['确认', '取消'];
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
    // 左移列表删除
    $('#OA_task_1').on('tap', '.mui-btn-red', function(event) {
        var elem = this;
        var li = elem.parentNode.parentNode;
        mui.confirm('确认删除该条记录？', 'Hello MUI', btnArray, function(e) {
            if (e.index == 0) {
                li.parentNode.removeChild(li);
            } else {
                setTimeout(function() {
                    mui.swipeoutClose(li);
                }, 0);
            }
        });
    });
	// 左移列表删除
	$('#OA_task_1').on('tap', '.mui-btn-blue', function(event) {
		mui.openWindow({
			url:"editcustom.html"
		});
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
	}
});
var count = 0;
/**
 * 上拉加载具体业务实现
 */
function pullupRefresh() {
		setTimeout(function() {
			mui('#pullrefresh').pullRefresh().endPullupToRefresh((++count > 2)); //参数为true代表没有更多数据了。
			var table = $('.mui-table-view');
			var cells = $('.mui-table-view-cell');
			var newCount = cells.length>0?5:20;//首次加载20条，满屏
			var _html = '';
			for (var i = cells.length, len = i + newCount; i < len; i++) {
				_html='<li class="mui-table-view-cell mui-media">'+
							'<div class="mui-slider-right mui-disabled">'+
							'<a href="editcustom.html" class="mui-btn mui-btn-blue">编辑</a>'+
						    '<a href="javascript:;" class="mui-btn mui-btn-red">删除</a>'+
							'</div>'+
							'<div class="mui-slider-handle">'+
							'<a href="javascript:;"><img class="mui-media-object mui-pull-left" src="images/muwu.png">'+
							'<div class="mui-media-body">'+
							'东莞SXGXA'+i+
							'<p class="mui-ellipsis clearfix">'+
							'地市：广东-东莞 &nbsp;&nbsp;&nbsp;&nbsp;地址：XXXX区XXXXX街道XXX号XXXX区XXXXX街道XXX号'+
							'<label class="left marginR20"></label>'+
							'<label class="left"></label>'+
							'</p>'+
							'</div></a>'+
							'</div>'+
						'</li>';
				table.append(_html);
			}
		}, 1500);
    }
function addData() {
		var table = $('.mui-table-view');
		var cells = $('.mui-table-view-cell');
	
		for(var i = cells.length, len = i + 5; i < len; i++) {
			var _html='<li class="mui-table-view-cell mui-media">'+
					'<div class="mui-slider-right mui-disabled">'+
					'<a href="editcustom.html" class="mui-btn mui-btn-blue">编辑</a>'+
					'<a href="javascript:;" class="mui-btn mui-btn-red">删除</a>'+
					'</div>'+
					'<div class="mui-slider-handle">'+
					'<a href="javascript:;"><img class="mui-media-object mui-pull-left" src="images/muwu.png">'+
					'<div class="mui-media-body">'+
					'东莞SXGXA'+i+
					'<p class="mui-ellipsis clearfix">'+
					'地市：广东-东莞 &nbsp;&nbsp;&nbsp;&nbsp;地址：XXXX区XXXXX街道XXX号XXXX区XXXXX街道XXX号'+
					'<label class="left marginR20"></label>'+
					'<label class="left"></label>'+
					'</p>'+
					'</div></a>'+
					'</div>'+
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
		mui.toast("为你推荐了5篇文章");
	}, 1500);
}


