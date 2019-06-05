
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
	if(localStorage.wxUser!=null){
	 getCustomList();
	}
   
	
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
		//alert(1);
			var aid = $(this).parent().parent().attr("value");
			var obj = {id:aid};
			var str = JSON.stringify(obj);
			localStorage.obj = str;
		    mui.openWindow({
			    url:"custom_chkquestion.html"
			});
		}else if($(this).text()=='确认'){
		//alert(2);
			var aid = $(this).parent().parent().attr("value");
			var obj = {id:aid};
			var str = JSON.stringify(obj);
			localStorage.obj = str;
			mui.openWindow({
				 url:"custom_serverconfirm.html"
			});
		}else if($(this).text()=='评价'){
		//alert(3);
			var aid = $(this).parent().parent().attr("value");
			var obj = {id:aid};
			var str = JSON.stringify(obj);
			localStorage.obj = str;
			mui.openWindow({
				url:"custom_serverevaluate.html"
			});
		}
	});
	//题目点击
	$('.customList .titleText').die().live('touchend',function(){
		$(this).toggleClass('slt');
		if($(this).next().text()=='查看'){
			var aid = $(this).parent().parent().attr("value");
			var obj = {id:aid};
			var str = JSON.stringify(obj);
			localStorage.obj = str;
			mui.openWindow({
				url:"custom_chkquestion.html"
			});
		}else if($(this).next().text()=='确认'){
			var aid = $(this).parent().parent().attr("value");
			var obj = {id:aid};
			var str = JSON.stringify(obj);
			localStorage.obj = str;
			mui.openWindow({
				url:"custom_serverconfirm.html"
			});
		}else if($(this).next().text()=='评价'){
			var aid = $(this).parent().parent().attr("value");
			var obj = {id:aid};
			var str = JSON.stringify(obj);
			localStorage.obj = str;
			mui.openWindow({
				url:"custom_serverevaluate.html"
			});
		}
	});
});

/**
 * 下拉刷新具体业务实现
 */
function pulldownRefresh() {
	setTimeout(function() {
		// addData();
		getCustomList();
		mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
		mui('#pullrefresh').pullRefresh().refresh(true); //上拉后可以再次加载
		// mui.toast("加载了两条数据");
	}, 1500);
}
var count = 0;

$('#myform').bind('search',function(){
	getCustomList();
	document.activeElement.blur();
})

/**
 * 上拉加载具体业务实现
 */
function pullupRefresh() {
	setTimeout(function() {
		
		// mui('#pullrefresh').pullRefresh().endPullupToRefresh((++count > 2)); //参数为true代表没有更多数据了。
		var loginUser = JSON.parse(localStorage.wxUser);
		var loginKhName=loginUser.userName ;
		var table = $('.mui-table-view');
		var cells = $('.customList');
		var newCount = cells.length>0?5:5;//首次加载10条，满屏
		var lastId = $("#clientQuestionList li:last-child").attr("value");
		var condition = $("#condition").val();
		$.ajax({
			url: pathUrl+'/getClientInfoToMobile.action',
			type:"post",
			data:{
				condition:condition,
				name:loginKhName,
				pageSize:10,
				lastId:lastId
			},
			async:false,/*同步请求*/
			dataType:"jsonp",
			jsonp:"callback",
			jsonpCallback:'flightHandler',
			success:function(data){
			//处理数据格式
			  var data = JSON.parse(data);
			  
			  var dataList = "";
			  mui('#pullrefresh').pullRefresh().endPullupToRefresh((data.dataSize == 0)); //参数为true代表没有更多数据了。
			 if(data.dataSize == 0 && condition==null){
  			   $("#tishi").html('');
  			  	 dataList = '<div class="nodata" style="height:'+document.documentElement.clientHeight+'px">'+
							'<P>'+
							'您还未在我司政务微信中提交过客户问题，如需提问请点右上角+'+
							'</P>'+
							'</div>'
  			   	$("#tishi").append(dataList);
  			   }
			  $.each(data.dataList,function(i,custom){			
			  //处理数据格式
		  		 custom = JSON.stringify(custom);
		  		 custom =JSON.parse(custom);
		  		  
				  if(custom.status=='1'){
					    dataList='<li class="customList"  value="'+custom.clientId+'">'+
								 '<div class="listTitle clearfix">'+
								  	'<span class="left status red">已提交</span>'+
									'<h6 class="left titleText hideText">'+custom.title+'</h6>'+
									'<a href="javascript:;" class="right chkBtn" >查看</a>'+
								 '</div>'+
								 '<div class="bordergrey nocolor"></div>'+
								 '</li>';
				  }else if(custom.status=='2'){
						dataList='<li class="customList" value="'+custom.clientId+'">'+
								'<div class="listTitle clearfix">'+
									'<span class="left status yellow">已分配</span>'+
									'<h6 class="left titleText hideText">'+custom.title+'</h6>'+
									'<a href="javascript:;" class="right chkBtn">查看</a>'+
								'</div>'+
								'<div class="bordergrey"></div>'+
								'<dl class="bottomCon">'+
									'<dd class="clearfix">'+
										'<span class="left marginR60">负责人：'+custom.questiongzr+'</span>'+
										'<span class="left">电话：'+custom.questiongzrPho+'</span>'+
									'</dd>'+
								'</dl>'+
								'</li>';
				  }else if(custom.status=='3'){
						dataList='<li class="customList" value="'+custom.clientId+'">'+
								'<div class="listTitle clearfix">'+
									'<span class="left status yellow">处理中</span>'+
									'<h6 class="left titleText hideText">'+custom.title+'</h6>'+
									'<a href="javascript:;" class="right chkBtn">查看</a>'+
								'</div>'+
								'<div class="bordergrey"></div>'+
								'<dl class="bottomCon">'+
									'<dd class="clearfix">'+
										'<span class="left marginR60">负责人：'+custom.questiongzr+'</span>'+
										'<span class="left">电话：'+custom.questiongzrPho+'</span>'+
									'</dd>'+
									'<dd class="clearfix">'+
										'<span class="left">预计完成时间：'+custom.estimatedTime+'</span>'+
									'</dd>'+
								'</dl>'+
								'</li>';
				  }else if(custom.status=='5'){
						dataList='<li class="customList" value="'+custom.clientId+'">'+
								'<div class="listTitle clearfix">'+
									'<span class="left status yellow">待确认</span>'+
									'<h6 class="left titleText hideText">'+custom.title+'</h6>'+
									'<a href="javascript:;" class="right chkBtn">确认</a>'+
								'</div>'+
								'<div class="bordergrey"></div>'+
								'<dl class="bottomCon">'+
									'<dd class="clearfix">'+
										'<span class="left marginR60">负责人：'+custom.questiongzr+'</span>'+
										'<span class="left">电话：'+custom.questiongzrPho+'</span>'+
									'</dd>'+
									'<dd class="clearfix">'+
										'<span class="left">预计完成时间：'+custom.estimatedTime+'</span>'+
									'</dd>'+
									'<dd class="clearfix">'+
										'<span class="left">实际完成时间：'+custom.actualTime+'</span>'+
									'</dd>'+
								'</dl>'+
								'</li>';
				  }else if(custom.status=='6'){
						  dataList='<li class="customList" value="'+custom.clientId+'">'+
										'<div class="listTitle clearfix">'+
											'<span class="left status yellow">待评价</span>'+
											'<h6 class="left titleText hideText">'+custom.title+'</h6>'+
											'<a href="javascript:;" class="right chkBtn">评价</a>'+
										'</div>'+
										'<div class="bordergrey"></div>'+
										'<dl class="bottomCon">'+
											'<dd class="clearfix">'+
												'<span class="left marginR60">负责人：'+custom.questiongzr+'</span>'+
												'<span class="left">电话：'+custom.questiongzrPho+'</span>'+
											'</dd>'+
											'<dd class="clearfix">'+
												'<span class="left">预计完成时间：'+custom.estimatedTime+'</span>'+
											'</dd>'+
											'<dd class="clearfix">'+
												'<span class="left">实际完成时间：'+custom.actualTime+'</span>'+
											'</dd>'+
										'</dl>'+
										'</li>';
				  }else if(custom.status=='4'){
						dataList='<li class="customList" value="'+custom.clientId+'">'+
									'<div class="listTitle clearfix">'+
										'<span class="left status green">已完成</span>'+
										'<h6 class="left titleText hideText wp52">'+custom.title+'</h6>'+
										'<a href="javascript:;" class="right chkBtn">查看</a>'+
										'<span class="right starNum">'+custom.score+'</span>'+
										'<span class="yellowStar right"><img src="images/yellowstar.png" alt=""/></span>'+
									'</div>'+
									'<div class="bordergrey"></div>'+
									
								'</li>';
				  }
				 $("#clientQuestionList").append(dataList);
				  
			 });
			
		   }    
   });
	
	}, 1500);
}



function getCustomList(){
	var condition = $("#condition").val();
	var loginUser = JSON.parse(localStorage.wxUser);
	var loginKhName=loginUser.userName ;
	$.ajax({
			url: pathUrl+'/getClientInfoToMobile.action',
			type:"post",
			data:{
				condition:condition,
				name:loginKhName
			},
			async:false,/*同步请求*/
			dataType:"jsonp",
			jsonp:"callback",
			jsonpCallback:'flightHandler',
			error : function(){
				alert("获取登录用户信息失败！");
			},
			success:function(data){
			  //处理数据格式
			  var data = JSON.parse(data);
			  
			  var dataList = "";
  			  $("#clientQuestionList").html('');
  			   if(data.dataSize == 0 && condition==null){
  			   $("#tishi").html('');
  			  	 dataList = '<div class="nodata" style="height:'+document.documentElement.clientHeight+'px">'+
							'<P>'+
							'您还未在我司政务微信中提交过客户问题，如需提问请点右上角+'+
							'</P>'+
							'</div>'
  			   	$("#tishi").append(dataList);
  			   }
			  
			  $.each(data.dataList,function(i,custom){	
			  //处理数据格式
		  		 custom = JSON.stringify(custom);
		  		 custom =JSON.parse(custom);
		  		 
				  if(custom.status=='1'){
					    dataList='<li class="customList" value="'+custom.clientId+'">'+
								 '<div class="listTitle clearfix">'+
								  	'<span class="left status red">已提交</span>'+
									'<h6 class="left titleText hideText">'+custom.title+'</h6>'+
									'<a href="javascript:;" class="right chkBtn">查看</a>'+
								 '</div>'+
								 '<div class="bordergrey nocolor"></div>'+
								 '</li>';
				  }else if(custom.status=='2'){
						dataList='<li class="customList" value="'+custom.clientId+'">'+
								'<div class="listTitle clearfix">'+
									'<span class="left status yellow">已分配</span>'+
									'<h6 class="left titleText hideText">'+custom.title+'</h6>'+
									'<a href="javascript:;" class="right chkBtn">查看</a>'+
								'</div>'+
								'<div class="bordergrey"></div>'+
								'<dl class="bottomCon">'+
									'<dd class="clearfix">'+
										'<span class="left marginR60">负责人：'+custom.questiongzr+'</span>'+
										'<span class="left">电话：'+custom.questiongzrPho+'</span>'+
									'</dd>'+
								'</dl>'+
								'</li>';
				  }else if(custom.status=='3'){
						dataList='<li class="customList" value="'+custom.clientId+'">'+
								'<div class="listTitle clearfix">'+
									'<span class="left status yellow">处理中</span>'+
									'<h6 class="left titleText hideText">'+custom.title+'</h6>'+
									'<a href="javascript:;" class="right chkBtn">查看</a>'+
								'</div>'+
								'<div class="bordergrey"></div>'+
								'<dl class="bottomCon">'+
									'<dd class="clearfix">'+
										'<span class="left marginR60">负责人：'+custom.questiongzr+'</span>'+
										'<span class="left">电话：'+custom.questiongzrPho+'</span>'+
									'</dd>'+
									'<dd class="clearfix">'+
										'<span class="left">预计完成时间：'+custom.estimatedTime+'</span>'+
									'</dd>'+
								'</dl>'+
								'</li>';
				  }else if(custom.status=='5'){
						dataList='<li class="customList" value="'+custom.clientId+'">'+
								'<div class="listTitle clearfix">'+
									'<span class="left status yellow">待确认</span>'+
									'<h6 class="left titleText hideText">'+custom.title+'</h6>'+
									'<a href="javascript:;" class="right chkBtn">确认</a>'+
								'</div>'+
								'<div class="bordergrey"></div>'+
								'<dl class="bottomCon">'+
									'<dd class="clearfix">'+
										'<span class="left marginR60">负责人：'+custom.questiongzr+'</span>'+
										'<span class="left">电话：'+custom.questiongzrPho+'</span>'+
									'</dd>'+
									'<dd class="clearfix">'+
										'<span class="left">预计完成时间：'+custom.estimatedTime+'</span>'+
									'</dd>'+
									'<dd class="clearfix">'+
										'<span class="left">实际完成时间：'+custom.actualTime+'</span>'+
									'</dd>'+
								'</dl>'+
								'</li>';
				  }else if(custom.status=='6'){
						  dataList='<li class="customList" value="'+custom.clientId+'">'+
										'<div class="listTitle clearfix">'+
											'<span class="left status yellow">待评价</span>'+
											'<h6 class="left titleText hideText">'+custom.title+'</h6>'+
											'<a href="javascript:;" class="right chkBtn">评价</a>'+
										'</div>'+
										'<div class="bordergrey"></div>'+
										'<dl class="bottomCon">'+
											'<dd class="clearfix">'+
												'<span class="left marginR60">负责人：'+custom.questiongzr+'</span>'+
												'<span class="left">电话：'+custom.questiongzrPho+'</span>'+
											'</dd>'+
											'<dd class="clearfix">'+
												'<span class="left">预计完成时间：'+custom.estimatedTime+'</span>'+
											'</dd>'+
											'<dd class="clearfix">'+
												'<span class="left">实际完成时间：'+custom.actualTime+'</span>'+
											'</dd>'+
										'</dl>'+
										'</li>';
				  }else if(custom.status=='4'){
						dataList='<li class="customList" value="'+custom.clientId+'">'+
									'<div class="listTitle clearfix">'+
										'<span class="left status green">已完成</span>'+
										'<h6 class="left titleText hideText wp52">'+custom.title+'</h6>'+
										'<a href="javascript:;" class="right chkBtn">查看</a>'+
										'<span class="right starNum">'+custom.score+'</span>'+
										'<span class="yellowStar right"><img src="images/yellowstar.png" alt=""/></span>'+
									'</div>'+
									'<div class="bordergrey"></div>'+
									'<dl class="bottomCon">'+
										'<dd class="clearfix">'+
											'<span class="left marginR60">负责人：'+custom.questiongzr+'</span>'+
											'<span class="left">电话：'+custom.questiongzrPho+'</span>'+
										'</dd>'+
										'<dd class="clearfix">'+
											'<span class="left">预计完成时间：'+custom.estimatedTime+'</span>'+
										'</dd>'+
										'<dd class="clearfix">'+
											'<span class="left">实际完成时间：'+custom.actualTime+'</span>'+
										'</dd>'+
									'</dl>'+
								'</li>';
				  }
				 $("#clientQuestionList").append(dataList);
				  
			 });
			 
			// var searchList='<div class="relative">'+
			//						'<input type="text" id="condition" class="f_input searchInput" placeholder="请输入关键字搜索"/>'+
			//						'<img src="images/searchicon.png" alt="" class="searchIcon"/>'+
			//					'</div>';
			//alert(2);
			// $("#pullrefresh").append(searchList);
		   }    
   });    
} 
