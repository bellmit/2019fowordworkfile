$(function () {
	//获取客户主数据
	if(localStorage.wxUser!=null){
		var data = JSON.parse(localStorage.wxUser);
		logInAction(data.userName,data.wXUserId);	
	}else{
		alert('授权失败！');
	}

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
	$('#OA_task_1').on('tap', '.del', function(event) {
		var id = $(this).attr("value");
		var elem = this;
		var li = elem.parentNode.parentNode;
		mui.confirm('确认删除该条记录？', '', btnArray, function(e) {
			if (e.index == 0) {
				li.parentNode.removeChild(li);
				delCustom(id);
			} else {
				setTimeout(function() {
					mui.swipeoutClose(li);
				}, 0);
			}
		});
	});
	// 左移列表编辑
	$('#OA_task_1').on('tap', '.edit', function(event) {
		var aid = $(this).attr("value");
		var data = JSON.parse(localStorage.obj);
		var pid = data.id;
		var obj = {id:aid,pid:pid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		mui.openWindow({
			url:"editcustom.html"
		});
	});
	// 左移列表查看
	$('#OA_task_1').on('tap', '.view', function(event) {
		var aid = $(this).attr("value");
		var data = JSON.parse(localStorage.obj);
		var pid = data.id;
		var name = userName;
		var obj = {id:aid,pid:pid,name:name};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		mui.openWindow({
			url:"viewcustom.html"
		});
	});
	// 左移列表修改
	$('#OA_task_1').on('tap', '.change', function(event) {
		var aid = $(this).attr("value");
		var data = JSON.parse(localStorage.obj);
		var pid = data.id;
		var obj = {id:aid,pid:pid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		mui.openWindow({
			url:"changecustom.html"
		});
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

 var count = 0;

/**
 * 上拉加载具体业务实现
 */
function pullupRefresh() {
    setTimeout(function() {
        //mui('#pullrefresh').pullRefresh().endPullupToRefresh((++count > 2)); //参数为true代表没有更多数据了。
        var table = $('.mui-table-view.pend');
        var cells = $('.pend .mui-table-view-cell');
        var newCount = cells.length>0?5:20;//首次加载20条，满屏
        var lastId = $("#OA_task_1 li:last-child").attr("value");
			var condition = $("#condition").val();
			$.ajax({
					url: pathUrl+'/getClientInfoLxrListApp.do',
					type:"post",
					data:{
						condition:condition,
						pageSize:5,
						lastId:lastId
					},
					async:false,/*同步请求*/
					dataType:"jsonp",
					jsonp:"callback",
					jsonpCallback:'flightHandler',
					success:function(data){
					  var dataList = "";
					  mui('#pullrefresh').pullRefresh().endPullupToRefresh((data.dataSize == 0)); //参数为true代表没有更多数据了。
					  
					  $.each(data.dataList,function(i,custom){
						  var spanClass = 'mui-table-view-cell mui-media';
						  if(custom.status == '0' || custom.status == 0){
							dataList='<li class="mui-table-view-cell mui-media draft" value="'+custom.id+'">'+
								'<div class="mui-slider-right mui-disabled">'+
								'<a href="javascript:;" class="mui-btn mui-btn-blue edit">编辑</a>'+
								'<a href="javascript:;" class="mui-btn mui-btn-red del">删除</a>'+
								'</div>'+
								'<div class="mui-slider-handle">'+
								'<a href="javascript:;">'+
								'<img class="mui-media-object mui-pull-left" src="images/personicon.png">'+
								'<div class="mui-media-body">'+
								custom.lxrName+
								'<p class="mui-ellipsis clearfix">'+
								'<span class="left marginR50">性别：<em>'+ custom.sex +'</em></span>'+
								'<span class="left marginR50">职务：<em>' + custom.gzzw + '</em> </span>'+
								'<span class="left">级别：<em>'+ custom.xzjb +'</em></span>'+
								'<label class="left marginR20"></label>'+
								'<label class="left"></label>'+
								'</p>'+
								'</div>'+
								'</a>'+
								'</div>'+
								'</li>';
						  }else {
							dataList='<li class="mui-table-view-cell mui-media" value="'+custom.id+'">'+
								'<div class="mui-slider-right mui-disabled">'+
								'<a href="javascript:;" class="mui-btn mui-btn-blue change">修改</a>'+
								'<a href="javascript:;" class="mui-btn mui-btn-red view">查看</a>'+
								'</div>'+
								'<div class="mui-slider-handle">'+
								'<a href="javascript:;">'+
								'<img class="mui-media-object mui-pull-left" src="images/personicon.png">'+
								'<div class="mui-media-body">'+
								custom.lxrName+
								'<p class="mui-ellipsis clearfix">'+
								'<span class="left marginR50">性别：<em>'+ custom.sex +'</em></span>'+
								'<span class="left marginR50">职务：<em>' + custom.gzzw + '</em> </span>'+
								'<span class="left">级别：<em>'+ custom.xzjb +'</em></span>'+
								'<label class="left marginR20"></label>'+
								'<label class="left"></label>'+
								'</p>'+
								'</div>'+
								'</a>'+
								'</div>'+
								'</li>';
						  }
						 $("#OA_task_1").append(dataList);
					 });
				   }    
		   }); 
    }, 1500);
}

/**
 * 下拉刷新具体业务实现
 */
function pulldownRefresh() {
    setTimeout(function() {
        getDataList();
        mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
		mui('#pullrefresh').pullRefresh().refresh(true);
    }, 1500);
}

function getDataList(){
	var data = JSON.parse(localStorage.obj);
	var pid = data.id;
	$.ajax({
		url: pathUrl+'/getClientInfoLxrListApp.do',
		type:"post",
		data:{condition:pid},
		async:false,/*同步请求*/
		dataType:"jsonp",
		jsonp:"callback",
		jsonpCallback:'flightHandler',
		success:function(data){
			var sDkh = data.sDkh;
			document.getElementById('clientNameH').innerHTML = sDkh.name1;
			document.getElementById('clientName').innerHTML =sDkh.name1;
			document.getElementById('hyType1').innerHTML = sDkh.hyType1;
			document.getElementById('province').innerHTML = sDkh.regio;
			document.getElementById('city').innerHTML = sDkh.ort01;
			document.getElementById('street1').innerHTML = sDkh.street1;
		    var dataList = "";
		  $("#OA_task_1").html('');
		   $.each(data.dataList,function(i,custom){
			  var spanClass = 'mui-table-view-cell mui-media';
			  if(custom.status == '0' || custom.status == 0){
				dataList='<li class="mui-table-view-cell mui-media draft" value="'+custom.id+'">'+
					'<div class="mui-slider-right mui-disabled">'+
					'<a href="javascript:;" class="mui-btn mui-btn-blue edit" value="'+custom.id+'">编辑</a>'+
					'<a href="javascript:;" class="mui-btn mui-btn-red del" value="'+custom.id+'">删除</a>'+
					'</div>'+
					'<div class="mui-slider-handle">'+
					'<a href="javascript:;">'+
					'<img class="mui-media-object mui-pull-left" src="images/personicon.png">'+
					'<div class="mui-media-body">'+
					custom.lxrName+
					'<p class="mui-ellipsis clearfix">'+
					'<span class="left marginR50">性别：<em>'+ custom.sex +'</em></span>'+
					'<span class="left marginR50">职务：<em>' + custom.gzzw + '</em> </span>'+
					'<span class="left">级别：<em>'+ custom.xzjb +'</em></span>'+
					'<label class="left marginR20"></label>'+
					'<label class="left"></label>'+
					'</p>'+
					'</div>'+
					'</a>'+
					'</div>'+
					'</li>';
			  }else {
				dataList='<li class="mui-table-view-cell mui-media" value="'+custom.id+'">'+
					'<div class="mui-slider-right mui-disabled">'+
					'<a href="javascript:;" class="mui-btn mui-btn-blue change">修改</a>'+
					'<a href="javascript:;" class="mui-btn mui-btn-blue view" value="'+custom.id+'">查看</a>'+
					'</div>'+
					'<div class="mui-slider-handle">'+
					'<a href="javascript:;">'+
					'<img class="mui-media-object mui-pull-left" src="images/personicon.png">'+
					'<div class="mui-media-body">'+
					custom.lxrName+
					'<p class="mui-ellipsis clearfix">'+
					'<span class="left marginR50">性别：<em>'+ custom.sex +'</em></span>'+
					'<span class="left marginR50">职务：<em>' + custom.gzzw + '</em> </span>'+
					'<span class="left">级别：<em>'+ custom.xzjb +'</em></span>'+
					'<label class="left marginR20"></label>'+
					'<label class="left"></label>'+
					'</p>'+
					'</div>'+
					'</a>'+
					'</div>'+
					'</li>';
			  }
			 $("#OA_task_1").append(dataList);
		 });
	   }    
   });    
} 

//删除客户联系人
function delCustom(id){

	$.ajax({
			url:pathUrl+"/delClientInfoLxrApp.do",
			type:"post",
			data : {
				fromAndroid:"true",
				id:id
			},
			async:false,/*同步请求*/
			dataType:"jsonp",
			jsonp:"callback",
			jsonpCallback:'flightHandler',
			error : function(){
				alert("删除失败！");
			},
			success:function(data){
				var msg= data.msg;
				var btnDelArray = ['确定'];
				if(msg.indexOf("操作成功!") != -1){
				
					mui.confirm('删除成功！', '', btnDelArray, function(e) {	
						mui.openWindow({
							url:"customdetail_sub.html"
						});
					});	
				}else{
					mui.confirm('删除失败！', '', btnDelArray, function(e) {
						mui.openWindow({
							url:"customdetail_sub.html"
						});
					});
				}
			}
	});
}

//添加客户联系人
function addcustom(){
	var data = JSON.parse(localStorage.obj);
	var pid = data.id;
	var obj = {id:pid};
	var str = JSON.stringify(obj);
	localStorage.obj = str;
	mui.openWindow({
		url:"addcustom.html",
	});
}
//登录验证
function logInAction(userName,wxUserId){
	$.ajax({
			url: pathUrl+'/firstLogin.do',
			type:'post',
			data : {
				fromYJTApp:'true',
				name:userName,
				wxUserId:preId+wxUserId
			},
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			error : function(){
				alert("获取登录用户信息失败！");
			},
			success:function(data){
				var msg= data.msg;
				if(msg.indexOf("欢迎回来!") != -1){
					getDataList();
				}else{
					alert("登录失败！");
				}
			}    
		});
   }
