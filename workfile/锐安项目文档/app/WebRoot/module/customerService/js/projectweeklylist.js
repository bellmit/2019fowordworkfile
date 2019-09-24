$(function(){
	mui.init({
        pullRefresh: {
            container: '#pullrefresh_2',
            down: {
                callback: pulldownRefresh
            },
            up: {
                contentrefresh: '正在加载...',
                callback: pullupRefresh
            }
        }
    });
    //点击评价按钮
	$(".projectWeeklyList a").on("tap",function(){
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
        mui('#pullrefresh_2').pullRefresh().endPulldownToRefresh();
        //mui.toast("为你推荐了5篇文章");
    }, 1500);
}
/**
 * 上拉加载具体业务实现
 */
function pullupRefresh() {
    setTimeout(function() {
        mui('#pullrefresh_2').pullRefresh().endPullupToRefresh((++count > 2)); //参数为true代表没有更多数据了。
        var table = $('.projectWeeklyList');
        var cells = $('.projectWeeklyList .mui-table-view-cell');
        var newCount = cells.length>0?5:20;//首次加载20条，满屏
        var _html = '';
        for (var i = cells.length, len = i + newCount; i < len; i++) {
            _html='<li class="clearfix">'
		        	+'<div class="left projectWeeklyListDes">'
		            	+'<span>第一周（有问题或待协调事宜）</span>'
		            	+'<em>2019-06-24 — 2019-06-30</em>'
		            +'</div>'
		            +'<a href="projectweeklyevaluate.html" class="right">评价</a>'
		            +'<a href="#" class="right">查看</a>'
		        +'</li>';
            table.append(_html);
        }
        //点击评价按钮
		$(".projectWeeklyList a").on("tap",function(){
			mui.openWindow({
				url : $(this).attr("href")
			})
		});
    }, 1500);
}

function addData() {
    var table = $('.projectWeeklyList');
    var cells = $('.projectWeeklyList .mui-table-view-cell');

    for(var i = cells.length, len = i + 5; i < len; i++) {
        _html='<li class="clearfix">'
		        	+'<div class="left projectWeeklyListDes">'
		            	+'<span>第一周（有问题或待协调事宜）</span>'
		            	+'<em>2019-06-24 — 2019-06-30</em>'
		            +'</div>'
		            +'<a href="projectweeklyevaluate.html" class="right">评价</a>'
		            +'<a href="#" class="right">查看</a>'
		        +'</li>';
        //下拉刷新，新纪录插到最前面；
        table.prepend(_html);
    }
    //点击评价按钮
	$(".projectWeeklyList a").on("tap",function(){
		mui.openWindow({
			url : $(this).attr("href")
		})
	});
}