//初始化页面
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
	    $("#customReceptoinList").html('');
	    setTimeout(function () { getCustomList();}, 500);
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
	//编辑按钮
	$('.edit').die().live('touchend',function(){
		$(this).toggleClass('slt');
		//取得当前记录的主键
		var aid = $(this).attr("value");
		//生成json格式，并缓存起来
		var obj = {id:aid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		
		//取得当前记录的状态
		var statsText=$(this).parent().parent().text();
		var statusNum=-99;
		if(statsText.indexOf("草稿")!=-1){
			statusNum=4;
		}
		//生成json格式，并缓存起来
		var statusObj = {status:statusNum};
		var statusObjStr = JSON.stringify(statusObj);
		localStorage.statusObj = statusObjStr;
		
		mui.openWindow({url:"updata_customReception.html"});		
	});	
	//编辑已经提交按钮
	$('.existedEdit').die().live('touchend',function(){
		$(this).toggleClass('slt');
		//取得当前记录的主键
		var aid = $(this).attr("value");
		//生成json格式，并缓存起来
		var obj = {id:aid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		
		//取得当前记录的状态
		var statsText=$(this).parent().parent().text();
		var statusNum=-99;
		if(statsText.indexOf("草稿")!=-1){
			statusNum=4;
		}
		//生成json格式，并缓存起来
		var statusObj = {status:statusNum};
		var statusObjStr = JSON.stringify(statusObj);
		localStorage.statusObj = statusObjStr;
		
		mui.openWindow({url:"update_oldcustRecept.html"});		
	});	
	
	//查看按钮
	$('.view').die().live('touchend',function(){
		$(this).toggleClass('slt');
		//取得当前记录的主键
		var aid = $(this).attr("value");
		//生成json格式，并缓存起来
		var obj = {id:aid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		mui.openWindow({url:"view_customReception.html"});		
	});
	//完成
	$('.complete').die().live('touchend',function(){
		$(this).toggleClass('slt');
		//取得当前记录的主键
		var aid = $(this).attr("value");
		//生成json格式，并缓存起来
		var obj = {id:aid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		mui.openWindow({url:"complete_customReception.html"});		
	});
	//执行
	$('.implement').die().live('touchend',function(){
		$(this).toggleClass('slt');
		//取得当前记录的主键
		var aid = $(this).attr("value");
		//生成json格式，并缓存起来
		var obj = {id:aid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		mui.openWindow({url:"accept_customReception.html"});		
	});
	//审批按钮
	$('.audit').die().live('touchend',function(){
		$(this).toggleClass('slt');
		//取得当前记录的主键
		var aid = $(this).attr("value");
		//生成json格式，并缓存起来
		var obj = {id:aid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		mui.openWindow({url:"audit_customerReception.html"});		
	});
	//删除按钮
	$('.delete').die().live('touchend',function(){
		$(this).toggleClass('slt');
		//取得当前记录的主键
		var aid = $(this).attr("value");
		//生成json格式，并缓存起来
		var elem = this;
        var li = elem.parentNode.parentNode.parentNode;
		var btnArray = ['确认', '取消'];
        mui.confirm('确认删除该条记录？', '', btnArray, function(e) {
            if (e.index == 0) {
			    delCustomRecept(aid);
            } else {
                setTimeout(function() {
                    mui.swipeoutClose(li);
                }, 0);
            }
        });	
	});	
	//接受按钮
	$('.accept').die().live('touchend',function(){
		$(this).toggleClass('slt');
		//取得当前记录的主键
		var aid = $(this).attr("value");
		//生成json格式，并缓存起来
		var obj = {id:aid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		mui.openWindow({url:"accept_chkquestion.html"});		
	});

	//确认按钮
	$('.confirm').die().live('touchend',function(){
		$(this).toggleClass('slt');
		//取得当前记录的主键
		var aid = $(this).attr("value");
		//生成json格式，并缓存起来
		var obj = {id:aid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		mui.openWindow({url:"accept_chkquestion.html"});
	});
	
	//评价按钮
	$('.eveluate').die().live('touchend',function(){
		$(this).toggleClass('slt');
		//取得当前记录的主键
		var aid = $(this).attr("value");
		//生成json格式，并缓存起来
		var obj = {id:aid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		mui.openWindow({url:"evaluate_customReception.html"});			
	});
});

/**
 * 下拉刷新具体业务实现
 */
function pulldownRefresh() {
	setTimeout(function() {
		getCustomList();
		mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
		mui('#pullrefresh').pullRefresh().refresh(true); //上拉后可以再次加载
	}, 1500);
}

$('#myform').bind('search',function(){
	getCustomList();
	document.activeElement.blur();
})


//删除客户接待任务
function delCustomRecept(id){
    var btnDelArray = ['确定'];
	$.ajax({
			url:pathUrl+"/deleteCustomerRecption.action",
			type:"post",
			data : {
				id:id
			},
			async:false,/*同步请求*/
			dataType:"jsonp",
			jsonp:"callback",
			jsonpCallback:'flightHandler',
			error : function(){
				mui.toast('删除失败！');
			},
			success:function(data){
			    var data = JSON.parse(data);
				var msg= data.msg;
				if(msg.indexOf("操作成功!") != -1){
					mui.confirm('删除成功！', '', btnDelArray, function(e) {	
						mui.openWindow({
							url:"customerReception.html"
						});
					});	
					//li.parentNode.removeChild(li);
				}else{
					mui.confirm('删除失败！', '', btnDelArray, function(e) {
						mui.openWindow({
							url:"customerReception.html"
						});
					});
				}
				
			}
	});
}

/**
 * 上拉加载具体业务实现
 */
function pullupRefresh() {
	setTimeout(function() {
		var pageSize = 10;
		//取得缓存微信用户对象
		var loginUser = JSON.parse(localStorage.wxUser);
		//取得当前微信登录用户名
		var loginKhName =loginUser.userName ;
		//获取当页最后一条记录的rowNumber
		var lastId = $("#customReceptoinList li:last-child").attr("value");
		//取得查询框输入内容
		var condition = $("#condition").val();
		var passUserName = loginKhName;
		var isDept = 0;
		//如果是市场部员工，那么可以看到所欲提交的客户审批记录
	    if ('市场部' == loginUser.company || '市场部' == loginUser.parentCompany) {
		//if ('市场部' == loginUser.company) {
			passUserName = "";
			isDept = 1;
		}
		//ajax调用查询当前客户能看到的客户接待申请列表
		$.ajax({
			url: pathUrl+'/queryCustomerReceptionList.action',
			type:"post",
			data:{
				condition:condition,  //客户单位查询条件
				name:passUserName,  //用户查询条件
				pageSize:10,    //每页显示记录条数
				lastId:lastId   //当页最后一条记录的rownNumber
			},
			async:false,/*同步请求*/
			dataType:"jsonp",
			jsonp:"callback",
			jsonpCallback:'flightHandler',
			success:function(data){
			    //处理数据格式
			    var data = JSON.parse(data);
			    $("#customReceptoinList").html('');  //将当前列表置空
			    var dataList = "";
			    mui('#pullrefresh').pullRefresh().endPullupToRefresh((data.dataSize == 0));  //参数为true代表没有更多数据了

			    $.each(data.dataList,function(i,custom){ //循环处理返回的客户信息列表，将记录以html输出到页面上		
			    //处理数据格式
		  		custom = JSON.stringify(custom);
		  		custom =JSON.parse(custom);	 
		  		dataList = '';
                if(custom.status==4 && loginKhName==custom.applicantUserName){ //如果是草稿状态, 只用申请人能够编辑和删除
				    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
							     '<div class="mui-slider-handle">'+
								     '<div class="myui-list-title mui-pull-left"><span class="span">&nbsp草稿&nbsp;</span></div>'+
							         '<div class="mui-media-body mui-pull-left">'+
								         '<div class="left">' + custom.customerUnit +'</div>'+
									     '<div class="clear"></div>'+
									     '<p class="mui-ellipsis clearfix"> 申请人:<span>' + custom.currentNodeUser + '</span> </p>'+
								     '</div>'+
								     '<div class="mui-media-body mui-pull-right">'+
								         '<a href="javascript:;" class="right mui-btn mui-btn-outlined edit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp' +
									     '<a href="javascript:;" class="right mui-btn mui-btn-outlined mui-btn-danger delete" value="'+custom.receptionId+'">删除</a>'+
								     '</div>'+
								 '</div>'+
							 '</li>';
				  } else if(custom.status==1){ //直接上级审批状态
					    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
								     '<div class="mui-slider-handle">'+
									     '<div class="myui-list-title mui-pull-left"><span>审批中</span></div>'+
									     '<div class="mui-media-body mui-pull-left">'+
										     '<div class="left">' + custom.customerUnit +'</div>'+
											 '<div class="clear"></div>'+
											 '<p class="mui-ellipsis clearfix"> 节点审批人:<span>' + custom.currentNodeUser + '</span> </p>'+
										 '</div>' + 
									     '<div class="mui-media-body mui-pull-right">';								
								             if (loginKhName==custom.currentNodeUser) { //如果当前登录用户与当前节点处理用户一致，显示审批操作
								                 dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined audit" value="'+custom.receptionId+'">审批</a>'+'&nbsp';
								             }
								             if(loginKhName==custom.applicantUserName){ //如果当前登录用户与任务申请用户一致，显示编辑操作
									             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined existedEdit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp';
								             }
								             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
										 '</div>'+
									 '</div>'+
								 '</li>';
				  } else if(custom.status==2){ //市场部领导审批状态
					    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
								     '<div class="mui-slider-handle">'+
									     '<div class="myui-list-title mui-pull-left"><span>审批中</span></div>'+
										 '<div class="mui-media-body mui-pull-left">'+
										     '<div class="left">' + custom.customerUnit +'</div>'+
											 '<div class="clear"></div>'+
											 '<p class="mui-ellipsis clearfix"> 市场总经理:<span>' + custom.currentNodeUser + '</span> </p>'+
										 '</div>'+
										 '<div class="mui-media-body mui-pull-right">';					                     
								             if (loginKhName==custom.currentNodeUser) { //如果当前登录用户与当前节点处理用户一致，显示审批操作
								                 dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined audit" value="'+custom.receptionId+'">审批</a>'+'&nbsp';
								             }
								             if(loginKhName==custom.applicantUserName){ //如果当前登录用户与任务申请用户一致，显示编辑操作
									             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined existedEdit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp';
								             }
				                             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
									    '</div>'+
									 '</div>'+
								 '</li>';
				  } else if(custom.status==3){ //总经理审批状态
					    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
								     '<div class="mui-slider-handle">'+
									     '<div class="myui-list-title mui-pull-left"><span>审批中</span></div>'+
										 '<div class="mui-media-body mui-pull-left">'+
										     '<div class="left">' + custom.customerUnit +'</div>'+
											 '<div class="clear"></div>'+
											 '<p class="mui-ellipsis clearfix"> 总经理:<span>' + custom.currentNodeUser + '</span> </p>'+
										 '</div>'+
										 '<div class="mui-media-body mui-pull-right">';
								             if (loginKhName==custom.currentNodeUser) { //如果当前登录用户与当前节点处理用户一致，显示审批操作
								                 dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined audit" value="'+custom.receptionId+'">审批</a>'+'&nbsp';
								             }
								             if(loginKhName==custom.applicantUserName){ //如果当前登录用户与任务申请用户一致，显示编辑操作
									             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined existedEdit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp';
								             }
				                             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
										 '</div>'+
									 '</div>'+
								 '</li>';											
				  } else if(custom.status==5){ //待执行状态
					    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
								     '<div class="mui-slider-handle">'+
									     '<div class="myui-list-title mui-pull-left"><span>待执行</span></div>'+
										 '<div class="mui-media-body mui-pull-left">'+
										     '<div class="left">' + custom.customerUnit +'</div>'+
											 '<div class="clear"></div>'+
											 '<p class="mui-ellipsis clearfix"> 市场经理:<span>' + custom.currentNodeUser + '</span> </p>'+
										 '</div>'+
										 '<div class="mui-media-body mui-pull-right">';
								             if (loginKhName==custom.currentNodeUser || isDept) { //如果当前登录用户与当前节点处理用户一或者该用户是市场部的，显示执行操作
								                 dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined implement" value="'+custom.receptionId+'">执行</a>'+'&nbsp';
								             }
								             if(loginKhName==custom.applicantUserName){ //如果当前登录用户与任务申请用户一致，显示编辑操作
									             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined existedEdit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp';
								             }
				                             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
										 '</div>'+
									 '</div>'+
								 '</li>';
				  } else if(custom.status==6){ //执行中状态
					    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
								     '<div class="mui-slider-handle">'+
									     '<div class="myui-list-title mui-pull-left"><span class="span">执行中</span></div>'+
										 '<div class="mui-media-body mui-pull-left">'+
										     '<div class="left">' + custom.customerUnit +'</div>'+
											 '<div class="clear"></div>'+
											 '<p class="mui-ellipsis clearfix"> 市场经理:<span>' + custom.currentNodeUser + '</span> </p>'+
										 '</div>'+
										 '<div class="mui-media-body mui-pull-right">';
								             if (loginKhName==custom.currentNodeUser) { //如果当前登录用户与当前节点处理用户一致，显示完成操作
								                 dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined complete" value="'+custom.receptionId+'">完成</a>'+'&nbsp';
								             }
								             if(loginKhName==custom.applicantUserName){ //如果当前登录用户与任务申请用户一致，显示编辑操作
									             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined existedEdit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp';
								             }
				                             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
										 '</div>'+
									 '</div>'+
								 '</li>';				
				  } else if(custom.status==7){ //待评价状态
					    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
								     '<div class="mui-slider-handle">'+
									     '<div class="myui-list-title mui-pull-left"><span>待评价</span></div>'+
										 '<div class="mui-media-body mui-pull-left">'+
										     '<div class="left">' + custom.customerUnit +'</div>'+
										     '<div class="clear"></div>'+
											 '<p class="mui-ellipsis clearfix"> 申请人:<span>' + custom.currentNodeUser + '</span> </p>'+
										 '</div>'+
										 '<div class="mui-media-body mui-pull-right">';
								             if (loginKhName==custom.currentNodeUser) { //如果当前登录用户与当前节点处理用户一致，显示评价操作
								                 dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined eveluate" value="'+custom.receptionId+'">评价</a>'+'&nbsp';
								             }
				                             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
										 '</div>'+
									 '</div>'+
								 '</li>';					    
				  }else if(custom.status==8){ //已完成状态
					    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
								     '<div class="mui-slider-handle">'+
									     '<div class="myui-list-title mui-pull-left"><span>已完成</span></div>'+
										 '<div class="mui-media-body mui-pull-left">'+
										     '<div class="left">' + custom.customerUnit +'</div>'+
											 '<div class="clear"></div>'+
											 '<p class="mui-ellipsis clearfix"> 申请人:<span>' + custom.currentNodeUser + '</span> </p>'+
										 '</div>'+
										 '<div class="mui-media-body mui-pull-right">';
										     if (custom.averageScoce) {
										         dataList = dataList +  '<i class="mui-icon mui-icon-star-filled"></i>' + custom.averageScoce +'&nbsp';
										     }
										     dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
										 '</div>'+
									 '</div>'+
								 '</li>';
				  }else if(custom.status==9){ //直接上级驳回状态
					    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
								     '<div class="mui-slider-handle">'+
									     '<div class="myui-list-title mui-pull-left"><span id="span">已驳回</span></div>'+
										 '<div class="mui-media-body mui-pull-left">'+
										     '<div class="left">' + custom.customerUnit +'</div>'+
											 '<div class="clear"></div>'+
											 '<p class="mui-ellipsis clearfix"> 申请人:<span>' + custom.currentNodeUser + '</span> </p>'+
										 '</div>'+
										 '<div class="mui-media-body mui-pull-right">'+
										     '<a href="javascript:;" class="right mui-btn mui-btn-outlined edit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp'+
											 '<a href="javascript:;" class="right mui-btn mui-btn-outlined mui-btn-danger delete" value="'+custom.receptionId+'">删除</a>'+
										 '</div>'+
									 '</div>'+
								 '</li>';			    
				  }else if(custom.status==10){ //市场总经理驳回状态
					    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
								     '<div class="mui-slider-handle">'+
									     '<div class="myui-list-title mui-pull-left"><span>已驳回</span></div>'+
										 '<div class="mui-media-body mui-pull-left">'+
										     '<div class="left">' + custom.customerUnit +'</div>'+
											 '<div class="clear"></div>'+
											 '<p class="mui-ellipsis clearfix"> 申请人:<span>' + custom.currentNodeUser + '</span> </p>'+
										 '</div>'+
										 '<div class="mui-media-body mui-pull-right">'+
										     '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
										 '</div>'+
									 '</div>'+
								 '</li>';
				  }
				  $("#customReceptoinList").append(dataList); 
			  });
		   }    
       });
	
	}, 1500);
}

//获取客户接待列表
function getCustomList() {
	//获取客户单位查询条件
	var condition = $("#condition").val();
	var loginUser = JSON.parse(localStorage.wxUser);
	var loginKhName=loginUser.userName;
	var passUserName = loginKhName;
	var isDept = 0;
	//if ('有机体产品线' == loginUser.company) {
	if ('市场部' == loginUser.company || '市场部' == loginUser.parentCompany) {
	//if ('市场部' == loginUser.company) {
		passUserName = "";
		isDept = 1;
	}
	$.ajax({
			url: pathUrl+'/queryCustomerReceptionList.action',
			type:"post",
			data:{
				condition:condition,
				name:passUserName,
				pageSize:10
			},
			async:false,/*同步请求*/
			dataType:"jsonp",
			jsonp:"callback",
			jsonpCallback:'flightHandler',
			error : function(){
				mui.toast('网络异常！');
			},
			success:function(data){
			    //处理数据格式
			    var data = JSON.parse(data);
			    var dataList = "";
  			    $("#customReceptoinList").html('');
  			    if(data.dataSize == 0 && condition==''){		  
  			        $("#tishi").html('');
  			  	    dataList = '<div class="nodata" style="height:'+document.documentElement.clientHeight+'px">'+
							       '<P>'+
							           '您还未在政务微信中提交过客户接待任务，如需提交客户接待任务请点右上角+'+
							       '</P>'+
							   '</div>'
  			   	    $("#tishi").append(dataList);
  			    }
			    $.each(data.dataList,function(i,custom){ //循环处理返回的客户信息列表，将记录以html输出到页面上			    
				    //处理数据格式
			  		custom = JSON.stringify(custom);
			  		custom =JSON.parse(custom);
			  		dataList = '';
	                if(custom.status==4 && loginKhName==custom.applicantUserName){ //如果是草稿状态
					    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
								     '<div class="mui-slider-handle">'+
									     '<div class="myui-list-title mui-pull-left"><span class="span">&nbsp草稿&nbsp;</span></div>'+
								         '<div class="mui-media-body mui-pull-left">'+
									         '<div class="left">' + custom.customerUnit +'</div>'+
										     '<div class="clear"></div>'+
										     '<p class="mui-ellipsis clearfix"> 申请人:<span>' + custom.currentNodeUser + '</span> </p>'+
									     '</div>'+
									     '<div class="mui-media-body mui-pull-right">'+
									         '<a href="javascript:;" class="right mui-btn mui-btn-outlined edit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp' +
										     '<a href="javascript:;" class="right mui-btn mui-btn-outlined mui-btn-danger delete" value="'+custom.receptionId+'">删除</a>'+
									     '</div>'+
									 '</div>'+
								 '</li>';
					  } else if(custom.status==1){ //直接上级审批状态
						    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
									     '<div class="mui-slider-handle">'+
										     '<div class="myui-list-title mui-pull-left"><span>审批中</span></div>'+
										     '<div class="mui-media-body mui-pull-left">'+
											     '<div class="left">' + custom.customerUnit +'</div>'+
												 '<div class="clear"></div>'+
												 '<p class="mui-ellipsis clearfix"> 节点审批人:<span>' + custom.currentNodeUser + '</span> </p>'+
											 '</div>' + 
										     '<div class="mui-media-body mui-pull-right">';								
									             if (loginKhName==custom.currentNodeUser) { //如果当前登录用户与当前节点处理用户一致，显示审批操作
									                 dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined audit" value="'+custom.receptionId+'">审批</a>'+'&nbsp';
									             }
									             if(loginKhName==custom.applicantUserName){ //如果当前登录用户与任务申请用户一致，显示编辑操作
										             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined existedEdit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp';
									             }
									             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
											 '</div>'+
										 '</div>'+
									 '</li>';
					  } else if(custom.status==2){ //市场部领导审批状态
						    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
									     '<div class="mui-slider-handle">'+
										     '<div class="myui-list-title mui-pull-left"><span>审批中</span></div>'+
											 '<div class="mui-media-body mui-pull-left">'+
											     '<div class="left">' + custom.customerUnit +'</div>'+
												 '<div class="clear"></div>'+
												 '<p class="mui-ellipsis clearfix"> 市场总经理:<span>' + custom.currentNodeUser + '</span> </p>'+
											 '</div>'+
											 '<div class="mui-media-body mui-pull-right">';					                     
									             if (loginKhName==custom.currentNodeUser) { //如果当前登录用户与当前节点处理用户一致，显示审批操作
									                 dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined audit" value="'+custom.receptionId+'">审批</a>'+'&nbsp';
									             }
									             if(loginKhName==custom.applicantUserName){ //如果当前登录用户与任务申请用户一致，显示编辑操作
										             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined existedEdit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp';
									             }
					                             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
										    '</div>'+
										 '</div>'+
									 '</li>';
					  } else if(custom.status==3){ //总经理审批状态
						    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
									     '<div class="mui-slider-handle">'+
										     '<div class="myui-list-title mui-pull-left"><span>审批中</span></div>'+
											 '<div class="mui-media-body mui-pull-left">'+
											     '<div class="left">' + custom.customerUnit +'</div>'+
												 '<div class="clear"></div>'+
												 '<p class="mui-ellipsis clearfix"> 总经理:<span>' + custom.currentNodeUser + '</span> </p>'+
											 '</div>'+
											 '<div class="mui-media-body mui-pull-right">';
									             if (loginKhName==custom.currentNodeUser) { //如果当前登录用户与当前节点处理用户一致，显示审批操作
									                 dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined audit" value="'+custom.receptionId+'">审批</a>'+'&nbsp';
									             }
									             if(loginKhName==custom.applicantUserName){ //如果当前登录用户与任务申请用户一致，显示编辑操作
										             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined existedEdit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp';
									             }
					                             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
											 '</div>'+
										 '</div>'+
									 '</li>';											
					  } else if(custom.status==5){ //待执行状态
						    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
									     '<div class="mui-slider-handle">'+
										     '<div class="myui-list-title mui-pull-left"><span>待执行</span></div>'+
											 '<div class="mui-media-body mui-pull-left">'+
											     '<div class="left">' + custom.customerUnit +'</div>'+
												 '<div class="clear"></div>'+
												 '<p class="mui-ellipsis clearfix"> 市场经理:<span>' + custom.currentNodeUser + '</span> </p>'+
											 '</div>'+
											 '<div class="mui-media-body mui-pull-right">';
									             if (loginKhName==custom.currentNodeUser || isDept) { //如果当前登录用户与当前节点处理用户一或者该用户是市场部的，显示执行操作
									                 dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined implement" value="'+custom.receptionId+'">执行</a>'+'&nbsp';
									             }
									             if(loginKhName==custom.applicantUserName){ //如果当前登录用户与任务申请用户一致，显示编辑操作
										             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined existedEdit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp';
									             }
					                             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
											 '</div>'+
										 '</div>'+
									 '</li>';
					  } else if(custom.status==6){ //执行中状态
						    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
									     '<div class="mui-slider-handle">'+
										     '<div class="myui-list-title mui-pull-left"><span class="span">执行中</span></div>'+
											 '<div class="mui-media-body mui-pull-left">'+
											     '<div class="left">' + custom.customerUnit +'</div>'+
												 '<div class="clear"></div>'+
												 '<p class="mui-ellipsis clearfix"> 市场经理:<span>' + custom.currentNodeUser + '</span> </p>'+
											 '</div>'+
											 '<div class="mui-media-body mui-pull-right">';
									             if (loginKhName==custom.currentNodeUser) { //如果当前登录用户与当前节点处理用户一致，显示完成操作
									                 dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined complete" value="'+custom.receptionId+'">完成</a>'+'&nbsp';
									             }
									             if(loginKhName==custom.applicantUserName){ //如果当前登录用户与任务申请用户一致，显示编辑操作
										             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined existedEdit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp';
									             }
					                             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
											 '</div>'+
										 '</div>'+
									 '</li>';				
					  } else if(custom.status==7){ //待评价状态
						    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
									     '<div class="mui-slider-handle">'+
										     '<div class="myui-list-title mui-pull-left"><span>待评价</span></div>'+
											 '<div class="mui-media-body mui-pull-left">'+
											     '<div class="left">' + custom.customerUnit +'</div>'+
											     '<div class="clear"></div>'+
												 '<p class="mui-ellipsis clearfix"> 申请人:<span>' + custom.currentNodeUser + '</span> </p>'+
											 '</div>'+
											 '<div class="mui-media-body mui-pull-right">';
									             if (loginKhName==custom.currentNodeUser) { //如果当前登录用户与当前节点处理用户一致，显示评价操作
									                 dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined eveluate" value="'+custom.receptionId+'">评价</a>'+'&nbsp';
									             }
					                             dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
											 '</div>'+
										 '</div>'+
									 '</li>';					    
					  }else if(custom.status==8){ //已完成状态
						    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
									     '<div class="mui-slider-handle">'+
										     '<div class="myui-list-title mui-pull-left"><span>已完成</span></div>'+
											 '<div class="mui-media-body mui-pull-left">'+
											     '<div class="left">' + custom.customerUnit +'</div>'+
												 '<div class="clear"></div>'+
												 '<p class="mui-ellipsis clearfix"> 申请人:<span>' + custom.currentNodeUser + '</span> </p>'+
											 '</div>'+
											 '<div class="mui-media-body mui-pull-right">';
											      if (custom.averageScoce) {
										              dataList = dataList +  '<i class="mui-icon mui-icon-star-filled"></i>' + custom.averageScoce +'&nbsp';
										          }
										          dataList = dataList + '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
											 '</div>'+
										 '</div>'+
									 '</li>';
					  }else if(custom.status==9){ //直接上级驳回状态
						    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
									     '<div class="mui-slider-handle">'+
										     '<div class="myui-list-title mui-pull-left"><span id="span">已驳回</span></div>'+
											 '<div class="mui-media-body mui-pull-left">'+
											     '<div class="left">' + custom.customerUnit +'</div>'+
												 '<div class="clear"></div>'+
												 '<p class="mui-ellipsis clearfix"> 申请人:<span>' + custom.currentNodeUser + '</span> </p>'+
											 '</div>'+
											 '<div class="mui-media-body mui-pull-right">'+
											     '<a href="javascript:;" class="right mui-btn mui-btn-outlined edit" value="'+custom.receptionId+'">编辑</a>'+'&nbsp'+
												 '<a href="javascript:;" class="right mui-btn mui-btn-outlined mui-btn-danger delete" value="'+custom.receptionId+'">删除</a>'+
											 '</div>'+
										 '</div>'+
									 '</li>';			    
					  }else if(custom.status==10){ //市场总经理驳回状态
						    dataList='<li class="customList mui-media relative mui-table-view-cell" value="'+custom.receptRowNumber+'">'+
									     '<div class="mui-slider-handle">'+
										     '<div class="myui-list-title mui-pull-left"><span>已驳回</span></div>'+
											 '<div class="mui-media-body mui-pull-left">'+
											     '<div class="left">' + custom.customerUnit +'</div>'+
												 '<div class="clear"></div>'+
												 '<p class="mui-ellipsis clearfix"> 申请人:<span>' + custom.currentNodeUser + '</span> </p>'+
											 '</div>'+
											 '<div class="mui-media-body mui-pull-right">'+
											     '<a href="javascript:;" class="right mui-btn mui-btn-outlined view" value="'+custom.receptionId+'">查看</a>'+
											 '</div>'+
										 '</div>'+
									 '</li>';
					  }
					  $("#customReceptoinList").append(dataList); 
			      });   
		      }    
         });    
    } 
