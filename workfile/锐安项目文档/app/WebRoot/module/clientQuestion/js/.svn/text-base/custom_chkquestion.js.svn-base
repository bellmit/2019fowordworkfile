//$(function () {
//	
//    //头部展开收起
//    $('.rightToggle').die().live('touchend',function(){
//        if($(this).hasClass('slt')){
//            $(this).removeClass('slt');
//            $(this).attr('src','images/toparr.png');
//            $('.toggleHeight').addClass('hideText');
//        }else{
//            $(this).addClass('slt');
//            $(this).attr('src','images/toparrslt.png');
//            $('.toggleHeight').removeClass('hideText');
//        }
//    });
//	getQueLogList();
//});

function getQueLogList(){
	var id = JSON.parse(localStorage.obj).id;
	$.ajax({
			url: pathUrl+'/getClientListToMobile.do',
			type:"post",
			data:{
				id:id
			},
			async:false,/*同步请求*/
			dataType:"jsonp",
			jsonp:"callback",
			jsonpCallback:'flightHandler',
			success:function(data){
			  var dataList = "";
			  $("#custom_chk").html('');
			  $.each(data.dataList,function(i,custom){			 
				  if(custom.status=='1'){
						$("#titleClient").html(custom.title);
						$("#descClient").html('问题描述：'+custom.desc);
					       dataList='<li class="red relative">'+
									'<div class="outline"></div>'+
									'<img src="images/route_1.png" alt="" class="imageCircle"/>'+
									'<div class="clearfix">'+
										'<span class="listStatus left">已提交</span>'+
										'<span class="right colorGrey">'+custom.createTimeStr+'</span>'+
									'</div>'+
									'<div class="routeDes">您的问题我们已经收到，正在紧急处理中...</div>'+
									'</li>';
				  }else if(custom.status=='2'){
						   dataList='<li class="yellow relative">'+
									'<img src="images/route_2.png" alt="" class="imageCircle"/>'+
									'<div class="clearfix">'+
										'<span class="listStatus left yellow">已分配</span>'+
										'<span class="right colorGrey">'+custom.createTimeStr+'</span>'+
									'</div>'+
									'<div class="routeDes clearfix">'+
										'<span class="left marginR50">问题负责人：'+custom.questiongzr+'</span><span class="left">联系电话：'+custom.questiongzrPho+'</span>'+
									'</div>'+
									'</li>';
				  }else if(custom.status=='3'){
					    	dataList='<li class="yellow relative">'+
										'<img src="images/route_2.png" alt="" class="imageCircle"/>'+
										'<div class="clearfix">'+
											'<span class="listStatus left yellow">处理中</span>'+
											'<span class="right colorGrey">'+custom.createTimeStr+'</span>'+
										'</div>'+
										'<div class="routeDes clearfix">预计完成时间：'+custom.bmcntime+'</div>'+
									'</li>';
				  }else if(custom.status=='5'){
						    dataList='<li class="blue relative">'+
										'<img src="images/route_3.png" alt="" class="imageCircle"/>'+
										'<div class="clearfix">'+
											'<span class="listStatus left yellow">待确认</span>'+
											'<span class="right colorGrey">'+custom.createTimeStr+'</span>'+
										'</div>'+
										'<div class="routeDes clearfix">'+
											'<div>您的问题负责人已经处理</div>'+
											'<div>实际完成时间：'+custom.questionReal+'</div>'+
										'</div>'+
									'</li>';
				  }else if(custom.status=='6'){
						    dataList='<li class="blue relative">'+
										'<img src="images/route_3.png" alt="" class="imageCircle"/>'+
										'<div class="clearfix">'+
											'<span class="listStatus left yellow">待评价</span>'+
											'<span class="right colorGrey">'+custom.createTimeStr+'</span>'+
										'</div>'+
										'<div class="routeDes clearfix">请您对我们的服务做出评价！</div>'+
									'</li>';
				  }else if(custom.status=='4'){
							dataList='<li class="green relative">'+
										'<img src="images/route_4.png" alt="" class="imageCircle"/>'+
										'<div class="clearfix">'+
											'<span class="listStatus left yellow">已完成</span>'+
											'<span class="right colorGrey">'+custom.createTimeStr+'</span>'+
										'</div>'+
										'<div class="routeDes clearfix">您的问题已处理完毕，感谢您对我们工作的支持</div>'+
									'</li>';
				  }
				 $("#custom_chk").append(dataList);
				  
			 });
		   }    
   });
}

function submitPingJian(){
	var data = JSON.parse(localStorage.obj);
	var pid = data.id;
	var xiaolv=0;//计算服务效率评分
	$('a[name="xiaolv"]').each(function(i,item){
		xiaolv+=1;
		if($(this).attr("class").indexOf('slt')!=-1){
			xiaolv=6-xiaolv;
			return false;
		}
		if(xiaolv==5&&$(this).attr("class").indexOf('slt')==-1){
			xiaolv=0;
		}
	})
	var taidu=0;//计算服务态度评分
	$('a[name="taidu"]').each(function(i,item){
		taidu+=1;
		if($(this).attr("class").indexOf('slt')!=-1){
			taidu=6-taidu;
			return false;
		}
		if(taidu==5&&$(this).attr("class").indexOf('slt')==-1){
			taidu=0;
		}
	})
	var zhuanye=0;//计算服务专业性评分
	$('a[name="zhuanye"]').each(function(i,item){
		zhuanye+=1;
		if($(this).attr("class").indexOf('slt')!=-1){
			zhuanye=6-zhuanye;
			return false;
		}
		if(zhuanye==5&&$(this).attr("class").indexOf('slt')==-1){
			zhuanye=0;
		}
	})
	$.ajax({
		url: pathUrl+'/addEstimateFromMobile.do',
		type:'post',
		data : {
			id:pid,
			xiaolv:xiaolv,
			taidu:taidu,
			zhuanye:zhuanye
		},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		error : function(){
		},
		success:function(data){
			var msg= data.msg;
			var msgArray = ['确定'];
			if(msg.indexOf("提交成功!") != -1){
				mui.confirm('操作成功！', '', msgArray, function(e) {
					mui.openWindow({
						url:"custom_system.html"
					});
				});
				
			}else{
				mui.confirm('操作失败！', '', msgArray, function(e) {
					mui.openWindow({
						url:"custom_system.html"
					});
				});
			}
			
			
		}    
	});
}

function submitResult(result){
	var data = JSON.parse(localStorage.obj);
	var pid = data.id;
	$.ajax({
		url: pathUrl+'/addResultFromMobile.do',
		type:'post',
		data : {
			id:pid,
			result:result
		},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		error : function(){
		},
		success:function(data){
			var msg= data.msg;
			var msgArray = ['确定'];
			if(msg.indexOf("提交成功!") != -1){
				mui.confirm('操作成功！', '', msgArray, function(e) {
					mui.openWindow({
						url:"custom_system.html"
					});
				});
				
			}else{
				mui.confirm('操作失败！', '', msgArray, function(e) {
					mui.openWindow({
						url:"custom_system.html"
					});
				});
			}
			
		}    
	});
}