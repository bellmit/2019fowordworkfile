$(function(){
	mui.init({
        pullRefresh: {
            container: '#pullrefresh_1',
            down: {
                callback: pulldownRefresh
            },
            up: {
                contentrefresh: '正在加载...',
                callback: pullupRefresh
            }
        }
    });
    
    
    //点击查看周报按钮
		$(".contractList a").on("tap",function(){
			mui.openWindow({
				url : $(this).attr("href")
			})
		});
})
var count = 0;
/**
 * 下拉刷新具体业务实现
 */
function pulldownRefresh() {
    setTimeout(function() {
        addData();
        mui('#pullrefresh_1').pullRefresh().endPulldownToRefresh();
        //mui.toast("为你推荐了5篇文章");
    }, 1500);
}
/**
 * 上拉加载具体业务实现
 */
function pullupRefresh() {
    setTimeout(function() {
        mui('#pullrefresh_1').pullRefresh().endPullupToRefresh((++count > 2)); //参数为true代表没有更多数据了。
        var table = $('.contractList');
        var cells = $('.contractList .mui-table-view-cell');
        var newCount = cells.length>0?5:20;//首次加载20条，满屏
        var _html = '';
        for (var i = cells.length, len = i + newCount; i < len; i++) {
            _html='<li class="clearfix">'
		            +'<span class="left">陕西净可为一期项目</span>'
		            +'<a href="contractpayinfo.html" class="right">查看</a>'
		        +'</li>';
            table.append(_html);
        }
        
        //点击查看周报按钮
				$(".contractList a").on("tap",function(){
					mui.openWindow({
						url : $(this).attr("href")
					})
				});
    }, 1500);
}

function addData() {
    var table = $('.contractList');
    var cells = $('.contractList .mui-table-view-cell');

    for(var i = cells.length, len = i + 5; i < len; i++) {
        _html='<li class="clearfix">'
		            +'<span class="left">陕西净可为一期项目</span>'
		            +'<a href="contractpayinfo.html" class="right">查看</a>'
		        +'</li>';
        //下拉刷新，新纪录插到最前面；
        table.prepend(_html);
    }
    //点击查看周报按钮
		$(".contractList a").on("tap",function(){
			mui.openWindow({
				url : $(this).attr("href")
			})
		});
}