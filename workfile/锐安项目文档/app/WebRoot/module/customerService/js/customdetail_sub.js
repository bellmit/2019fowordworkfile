
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
    $(function() {
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
        // 左移列表删除
        $('#OA_task_1').on('tap', 'li', function(event) {
            var e = arguments.callee.caller.arguments[0] || window.event;
            if(e.target.tagName == 'DIV'){
                mui.openWindow({
                    url:"chkcustom.html"
                });
            }

        });
        //监听滚动
        document.addEventListener('touchmove',function(){
            var s = $('.mui-scroll').css('transform').split(',')[5];

            if(parseInt(s.substring(0,s.length-1))<-2){
                $('.fixBox').css('position','fixed');
                $('.fixBox').css('left','0');
                $('.fixBox').css('top','34');
                $('.fixBox').css('width','100%');
                $('.mui-scroll-wrapper').css('top',0);
                $('.fadeBox').hide();
            }else{

                $('.fixBox').css('position','relative');
                $('.fixBox').css('left','0');
                $('.fixBox').css('top','34');
                $('.fixBox').css('width','100%');
                $('.mui-scroll-wrapper').css('top',150);
                $('.fadeBox').show();
            }
        });
    });
    
});
 var count = 0;

/**
 * 上拉加载具体业务实现
 */
function pullupRefresh() {
    setTimeout(function() {
        mui('#pullrefresh').pullRefresh().endPullupToRefresh((++count > 2)); //参数为true代表没有更多数据了。
        var table = $('.mui-table-view.pend');
        var cells = $('.pend .mui-table-view-cell');
        var newCount = cells.length>0?5:20;//首次加载20条，满屏
        var _html = '';
        for (var i = cells.length, len = i + newCount; i < len; i++) {
            _html='<li class="mui-table-view-cell mui-media">'+
                        '<div class="mui-slider-right mui-disabled">'+
                    '<a href="editcustom.html" class="mui-btn mui-btn-blue">编辑</a>'+
                    '<a href="javascript:;" class="mui-btn mui-btn-red">删除</a>'+
                        '</div>'+
                        '<div class="mui-slider-handle">'+
                        '<a href="javascript:;">'+
                        '<img class="mui-media-object mui-pull-left" src="images/personicon.png">'+
                        '<div class="mui-media-body">'+
                        '刘一多'+
                        '<p class="mui-ellipsis clearfix">'+
                        '<span class="left marginR50">部门：<em>KXKXKXKXKX</em></span>'+
                        '<span class="left marginR50">职务：<em>KXKXKX</em> </span>'+
                        '<span class="left">级别：<em>10</em></span>'+
                        '<label class="left marginR20"></label>'+
                        '<label class="left"></label>'+
                        '</p>'+
                        '</div>'+
                        '</a>'+
                     '</div>'+
                    '</li>';
            table.append(_html);
        }
    }, 1500);
}
function addData() {
    var table = $('.mui-table-view.pend');
    var cells = $('.pend .mui-table-view-cell');

    for(var i = cells.length, len = i + 5; i < len; i++) {
        _html='<li class="mui-table-view-cell mui-media">'+
                '<div class="mui-slider-right mui-disabled">'+
                '<a href="editcustom.html" class="mui-btn mui-btn-blue">编辑</a>'+
                '<a href="javascript:;" class="mui-btn mui-btn-red">删除</a>'+
                '</div>'+
                '<div class="mui-slider-handle">'+
                '<a href="javascript:;">'+
                '<img class="mui-media-object mui-pull-left" src="images/personicon.png">'+
                '<div class="mui-media-body">'+
                '刘一多'+
                '<p class="mui-ellipsis clearfix">'+
                '<span class="left marginR50">部门：<em>KXKXKXKXKX</em></span>'+
                '<span class="left marginR50">职务：<em>KXKXKX</em> </span>'+
                '<span class="left">级别：<em>10</em></span>'+
                '<label class="left marginR20"></label>'+
                '<label class="left"></label>'+
                '</p>'+
                '</div>'+
                '</a>'+
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
        //mui.toast("为你推荐了5篇文章");
    }, 1500);
}


