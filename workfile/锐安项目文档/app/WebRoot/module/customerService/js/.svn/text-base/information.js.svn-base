 mui.init({
    swipeBack:true //启用右滑关闭功能
});
mui.ready(function() {
    /**
     * 获取对象属性的值
     * 主要用于过滤三级联动中，可能出现的最低级的数据不存在的情况，实际开发中需要注意这一点；
     * @param {Object} obj 对象
     * @param {String} param 属性名
     */
    var _getParam = function(obj, param) {
        return obj[param] || '';
    };
    //普通示例
    //性别
    var sexData = [{
        value: '0',
        text: '男'
    }, {
        value: '1',
        text: '女'
    }];
    //部门
    getSelect("workPicker","workContent",sexData);
    //行业
    getSelect("showtradePicker","tradeContent",sexData);
    //-----------------------------------------
});
$(function(){
    $('.autoDiv').height($(window).height() - $('.mui-bar').height()-$('.f_input').height()-$('.formList').css('margin-top'));
    $('.autoDiv').css('top',$('.mui-bar').height()+$('.f_input').height()+20);
 //键盘操作
 $("#autoInput").keyup(function(event) {
     //处理键盘操作
     var that = $(this);
     var myEvent = event || window.event;
     var keyCode = myEvent.keyCode;
     if (keyCode == 13) { //回车键
         if ($("#auto_div").is(":visible")) {
             $("#auto_div").css("display", "none");
             $('.submitBtn.save').attr('href','chkcustom.html');
             $('.submitBtn.saveAs').attr('href','custominfo.html');
         }
     } else {
         if ($("#autoInput").val() == "") {
             $("#auto_div").hide();
             $('.submitBtn.save').attr('href','chkcustom.html');
             $('.submitBtn.saveAs').attr('href','custominfo.html');
             $('.closeIcon').removeClass('mui-icon-clear').addClass('mui-icon-search');
         } else {   //有文字输入时获取提示词
             $('.submitBtn.save').attr('href','javascript:;');
             $('.submitBtn.saveAs').attr('href','javascript:;');
             $('.closeIcon').removeClass('mui-icon-search').addClass('mui-icon-clear');
             AutoComplete("auto_div", "autoInput");
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
            $('.submitBtn.save').attr('href','javascript:;');
            $('.submitBtn.saveAs').attr('href','javascript:;');
        }
    }
}
});

/**
* AutoComplete 输入框自动搜索
* @param auto 下拉框id
* @param search 搜索框id
* @constructor
*/
function AutoComplete(auto, search) {
     if ($("#" + search).val() != "") {
         var autoNode = $("#" + auto); //缓存对象（弹出框）
         var carlist = new Array();
         var n = 0;
         var mylist = [];
         var maxTipsCounts = 100; // 最大显示条数
         var aj = $.ajax({
             url: 'json/input.json', // 跳转到后台
             data: {},
             type: 'post',
             cache: false,
             dataType: 'json',
             success: function(data) {
                 if (data.error == undefined) {
                     mylist = data;
                     if (mylist == null) {
                         autoNode.hide();
                         return;
                     }
                     autoNode.empty(); //清空上次的记录
                     for (i in mylist) {
                         if (i < maxTipsCounts) {
                             var wordNode = mylist[i]; //弹出框里的每一条内容
                             var newDivNode = $("<div>").attr("id", i); //设置每个节点的id值

                             document.querySelector("#auto_div").style.width = $("#search_text").outerWidth(true) + 'px'; //设置提示框与输入框宽度一致
                             newDivNode.html(wordNode).appendTo(autoNode); //追加到弹出框
                             //鼠标点击文字上屏
                             newDivNode.off().on('tap',function() {
                                 //取出选中节点的文本内容
                                 var comText = $(this).text();
                                 //文本框中的内容变成高亮节点的内容
                                 $("#" + search).val(comText);
                                 $("#" + auto).css("display", "none");
                                 $('.submitBtn.save').attr('href','chkcustom.html');
                                 $('.submitBtn.saveAs').attr('href','custominfo.html');
                             });
                             //关闭按钮
                             $('.closeIcon').off().on('click',function(){
                                 $(this).removeClass('mui-icon-clear').addClass('mui-icon-search');
                                 $("#" + search).val('');
                                 $("#" + auto).css("display", "none");
                                 $('.submitBtn.save').attr('href','chkcustom.html');
                                 $('.submitBtn.saveAs').attr('href','custominfo.html');
                             });
                             if (mylist.length > 0) { //如果返回值有内容就显示出来
                                 autoNode.show();
                             } else { //服务器端无内容返回 那么隐藏弹出框
                                 autoNode.hide();
                             }
                         }
                     }
                 }
             }
         });
     }
 }