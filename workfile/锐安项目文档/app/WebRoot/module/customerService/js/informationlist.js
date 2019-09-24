$(function(){
	mui.init({
        pullRefresh: {
            container: '#pullrefresh_3',
            down: {
                callback: pulldownRefresh
            },
            up: {
                contentrefresh: '正在加载...',
                callback: pullupRefresh
            }
        }
    });
})
var count = 0;
/**
 * 下拉刷新具体业务实现
 */
function pulldownRefresh() {
    setTimeout(function() {
        addData();
        mui('#pullrefresh_3').pullRefresh().endPulldownToRefresh();
        //mui.toast("为你推荐了5篇文章");
    }, 1500);
}
/**
 * 上拉加载具体业务实现
 */
function pullupRefresh() {
    setTimeout(function() {
        mui('#pullrefresh_3').pullRefresh().endPullupToRefresh((++count > 2)); //参数为true代表没有更多数据了。
        var table = $('.informationList');
        var cells = $('.informationList .mui-table-view-cell');
        var newCount = cells.length>0?5:20;//首次加载20条，满屏
        var _html = '';
        for (var i = cells.length, len = i + newCount; i < len; i++) {
            _html='<li class="clearfix">'
		            +'<a href="#" class="left">陕西净可为一期项目</a>'
		            +'<span class="right">2019-01-01</span>'
		        +'</li>';
            table.append(_html);
        }
    }, 1500);
}

function addData() {
    var table = $('.informationList');
    var cells = $('.informationList .mui-table-view-cell');

    for(var i = cells.length, len = i + 5; i < len; i++) {
        _html='<li class="clearfix">'
		            +'<a href="#" class="left">陕西净可为一期项目</a>'
		            +'<span class="right">2019-01-01</span>'
		        +'</li>';
        //下拉刷新，新纪录插到最前面；
        table.prepend(_html);
    }
}