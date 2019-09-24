$(function () {
    getCommentList();
});


function getCommentList(){
    var taskObj =  JSON.parse(localStorage.taskObj);
    localStorage.removeItem("taskObj");
    var dataList = "";
    $.ajax({
        url: URL_PATH + '/getTaskHistory.action',
        type: "post",
        data: {
            processInstanceId: taskObj.processInstanceId
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
            dataList+='<li class="yellow relative">'+
            '<img src="../../images/route_3.png" alt="" class="imageCircle"/>'+
            '<div class="clearfix">'+
                '<span class="listStatus left yellow">处理中</span>'+
                '<span class="right colorGrey">'+taskObj.time+'</span>'+
            '</div>'+
            '<div class="routeDes clearfix">'+
            '<span class="left marginR50">执行人：'+taskObj.tasker+'</span>'+
            '</div>'+
        '</li>';
            var list=JSON.parse(data).list;
            for(var i = 0;i<list.length;i++){

                var comment = (list[i].attitude==1?"同意":"不同意")+"  "+list[i].message;
                dataList+='<li class="yellow relative">'+
                '<img src="../../images/route_2.png" alt="" class="imageCircle"/>'+
                '<div class="clearfix">'+
                    '<span class="listStatus left yellow">已处理</span>'+
                    '<span class="right colorGrey">'+list[i].taskFinishTime+'</span>'+
                '</div>'+
                '<div class="routeDes clearfix">'+
                '<span class="left marginR50">执行人：'+list[i].taskFinishUser+'</span>'+
                '</div>'+
                '<div class="routeDes clearfix">'+comment+'</div>'+
            '</li>'
            }
             dataList+='<li class="red relative">'+
            '<div class="outline"></div>'+
            '<img src="../../images/route_1.png" alt="" class="imageCircle"/>'+
            '<div class="clearfix">'+
                '<span class="listStatus left">已提交</span>'+
                '<span class="right colorGrey">'+taskObj.startTime+'</span>'+
            '</div>'+
            '<div class="routeDes">流程发起</div>'+
            '</li>';
            $("#myTask_history").append(dataList);
        }
    })
}