var wxObjet = {};
var url = window.location.href.split("#")[0];
if(localStorage.wxUser!=null){
	var data = JSON.parse(localStorage.wxUser);
	logInAction(data.userName,data.wXUserId);	
}else{
	getUserDataInfo();	
}

$.ajax({
	url:'http://111.204.211.208:8888/RunErpSystem/getSha1.action',
	type:'post',
	data : {
	url:url,
	AppId:'CUSTOM_DATA'
	},
	async:false,/*同步请求*/
	dataType:'jsonp',
	jsonp:'callback',
	jsonpCallback:'flightHandler',
	success:function(data){
		var test = JSON.parse(data);
		wxObjet.timestamp = test.timestamp;
		wxObjet.nonceStr = test.nonceStr;
		wxObjet.signature = test.signature;

		wx.config({
			beta: true,// 调用wx.invoke形式的接口值时，该值必须为true。
			debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			appId: 'wla377739e7a', // 必填，公众号的唯一标识
			timestamp: wxObjet.timestamp, // 必填，生成签名的时间戳
			nonceStr: wxObjet.nonceStr, // 必填，生成签名的随机串
			signature: wxObjet.signature,// 必填，签名
			jsApiList: ["getLocation","hideOptionMenu"] // 必填，需要使用的JS接口列表
		});
		
		wx.ready(function(){
			init();
			wx.hideOptionMenu();		
		});

		wx.error(function(res){
		});
	}		
});

function getUserDataInfo(){
	//获取code
	var code = getQueryString("code");
	$.ajax({
			url:'http://111.204.211.208:8888/RunErpSystem/queryWXUserInfo.action',
			type:'post',
			data : {
			code:code,
			AppId:'CUSTOM_DATA'
			},
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			error : function(){
				alert('授权失败！');
			},
			success:function(data){
				var userData = JSON.parse(data);
				var message = userData.msg;
				if(message.indexOf("success") != -1){
					localStorage.removeItem("wxUser");
					var wxUser = {userName:userData.userName,wXUserId:userData.wXUserId};
					var str = JSON.stringify(wxUser);
					localStorage.wxUser = str;
					logInAction(userData.userName,userData.wXUserId);
				}
			}    
	});	
}



//获取url？后的参数
function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if (r != null) return unescape(r[2]);
	return null;
}

function init(){

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
		var obj = {id:aid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		mui.openWindow({
			url:"editcompany.html",
		});
	});
	// 查看客户主数据
	$('#OA_task_1').on('tap', '.view', function(event) {
        var aid = $(this).attr("value");
		var obj = {id:aid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		mui.openWindow({
			url:"viewcompany.html",
		});
	});
	// 查看客户联系人
	$('#OA_task_1').on('tap', '.viewlxr', function(event) {
		var aid = $(this).attr("value");
		var obj = {id:aid};
		var str = JSON.stringify(obj);
		localStorage.obj = str;
		mui.openWindow({
			url:"customdetail_sub.html",
		});
	});

}


$('#myform').bind('search',function(){ 
	pulldownRefresh();
	document.activeElement.blur();
});
var count = 0;
/**
 * 上拉加载具体业务实现
 */
function pullupRefresh() {
		setTimeout(function() {
			//mui('#pullrefresh').pullRefresh().endPullupToRefresh((++count > 2)); //参数为true代表没有更多数据了。
			var table = $('.mui-table-view');
			var cells = $('.mui-table-view-cell');
			var newCount = cells.length>0?5:20;//首次加载20条，满屏
			var lastId = $("#OA_task_1 li:last-child").attr("value");
			var condition = $("#condition").val();
			$.ajax({
					url: pathUrl+'/getClientInfoListApp.do',
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
						  if(custom.applyStatus == 'edit'){
							dataList='<li class="mui-table-view-cell mui-media draft" value="'+custom.id+'">'+
										'<div class="mui-slider-right mui-disabled">'+
											'<a href="javascript:;" class="mui-btn mui-btn-blue edit" value="'+custom.id+'">编辑</a>'+
											'<a href="javascript:;" class="mui-btn mui-btn-red del" value="'+custom.id+'">删除</a>'+
										'</div>'+
										'<div class="mui-slider-handle">'+
											'<a href="javascript:;"> <img class="mui-media-object mui-pull-left" src="images/muwu.png">'+
												'<div class="mui-media-body">'+
													'<span class="draftText">草稿</span>'+
													'<a href="javascript:;" class="viewCustom" value="'+custom.id+'">'+custom.name1+'</a>'+
													'<p class="mui-ellipsis clearfix">'+
														'省市：'+custom.regio+'-'+custom.ort01+'&nbsp;&nbsp;&nbsp;&nbsp;行业：'+custom.hyType1+
														'<label class="left marginR20"></label>'+
														'<label class="left"></label>'+
													'</p>'+
												'</div> '+
											'</a>'+
										'</div>'+
									'</li>';
						  }else if(custom.applyStatus == 'over'){
							dataList='<li class="mui-table-view-cell mui-media" value="'+custom.id+'">'+
										'<div class="mui-slider-right mui-disabled">'+
											'<a href="javascript:;" class="mui-btn mui-btn-blue view" value="'+custom.id+'">查看</a>'+
											'<a href="javascript:;" class="mui-btn mui-btn-red viewlxr" value="'+custom.id+'">客户联系人</a>'+
										'</div>'+
										'<div class="mui-slider-handle">'+
											'<a href="javascript:;"> <img class="mui-media-object mui-pull-left" src="images/muwu.png">'+
												'<div class="mui-media-body">'+
													'<a href="javascript:;" class="viewCustom" value="'+custom.id+'">'+custom.name1+'</a>'+
													'<p class="mui-ellipsis clearfix">'+
														'省市：'+custom.regio+'-'+custom.ort01+'&nbsp;&nbsp;&nbsp;&nbsp;行业：'+custom.hyType1+
														'<label class="left marginR20"></label>'+
														'<label class="left"></label>'+
													'</p>'+
												'</div> '+
											'</a>'+
										'</div>'+
									'</li>';
						  }else{
							dataList='<li class="mui-table-view-cell mui-media" value="'+custom.id+'">'+
										'<div class="mui-slider-right mui-disabled">'+
											'<a href="javascript:;" class="mui-btn mui-btn-blue view" value="'+custom.id+'">查看</a>'+
										'</div>'+
										'<div class="mui-slider-handle">'+
											'<a href="javascript:;"> <img class="mui-media-object mui-pull-left" src="images/muwu.png">'+
												'<div class="mui-media-body">'+
													'<a href="javascript:;" class="viewCustom" value="'+custom.id+'">'+custom.name1+'</a>'+
													'<p class="mui-ellipsis clearfix">'+
														'省市：'+custom.regio+'-'+custom.ort01+'&nbsp;&nbsp;&nbsp;&nbsp;行业：'+custom.hyType1+
														'<label class="left marginR20"></label>'+
														'<label class="left"></label>'+
													'</p>'+
												'</div> '+
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
function addData() {
		var table = $('.mui-table-view');
		var cells = $('.mui-table-view-cell');
	
		for(var i = cells.length, len = i + 5; i < len; i++) {
			var _html='<li class="mui-table-view-cell mui-media">'+
					'<div class="mui-slider-right mui-disabled">'+
					'<a href="editcustom.html" class="mui-btn mui-btn-blue">编辑</a>'+
					'<a href="javascript:;" class="mui-btn mui-btn-red">删除</a>'+
					'</div>'+
					'<div class="mui-slider-handle">'+
					'<a href="javascript:;"><img class="mui-media-object mui-pull-left" src="images/muwu.png">'+
					'<div class="mui-media-body">'+
					'东莞SXGXA'+i+
					'<p class="mui-ellipsis clearfix">'+
					'省市：广东-东莞 &nbsp;&nbsp;&nbsp;&nbsp;行业：网信行业'+
					'<label class="left marginR20"></label>'+
					'<label class="left"></label>'+
					'</p>'+
					'</div></a>'+
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
		//addData();
		getDataList();
		mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
		mui('#pullrefresh').pullRefresh().refresh(true);
		mui.toast("刷新成功");
	}, 1500);
}

function getDataList(){
	var condition = $("#condition").val();
	$.ajax({
			url: pathUrl+'/getClientInfoListApp.do',
			type:"post",
			data:{
				condition:condition
			},
			async:false,/*同步请求*/
			dataType:"jsonp",
			jsonp:"callback",
			jsonpCallback:'flightHandler',
			success:function(data){
			  var dataList = "";
			  $("#OA_task_1").html('');
			  $.each(data.dataList,function(i,custom){
				  var spanClass = 'mui-table-view-cell mui-media';
				  if(custom.applyStatus == 'edit'){
					dataList='<li class="mui-table-view-cell mui-media draft" value="'+custom.id+'">'+
								'<div class="mui-slider-right mui-disabled">'+
									'<a href="javascript:;" class="mui-btn mui-btn-blue edit" value="'+custom.id+'">编辑</a>'+
									'<a href="javascript:;" class="mui-btn mui-btn-red del" value="'+custom.id+'">删除</a>'+
								'</div>'+
								'<div class="mui-slider-handle">'+
									'<a href="javascript:;"> <img class="mui-media-object mui-pull-left" src="images/muwu.png">'+
										'<div class="mui-media-body">'+
											'<span class="draftText">草稿</span>'+
											'<a href="javascript:;" class="viewCustom" value="'+custom.id+'">'+custom.name1+'</a>'+
											'<p class="mui-ellipsis clearfix">'+
												'省市：'+custom.regio+'-'+custom.ort01+'&nbsp;&nbsp;&nbsp;&nbsp;行业：'+custom.hyType1+
												'<label class="left marginR20"></label>'+
												'<label class="left"></label>'+
											'</p>'+
										'</div> '+
									'</a>'+
								'</div>'+
							'</li>';
				  }else if(custom.applyStatus == 'over'){
					dataList='<li class="mui-table-view-cell mui-media" value="'+custom.id+'">'+
								'<div class="mui-slider-right mui-disabled">'+
									'<a href="javascript:;" class="mui-btn mui-btn-blue view" value="'+custom.id+'">查看</a>'+
									'<a href="javascript:;" class="mui-btn mui-btn-red viewlxr" value="'+custom.id+'">客户联系人</a>'+
								'</div>'+
								'<div class="mui-slider-handle">'+
									'<a href="javascript:;"> <img class="mui-media-object mui-pull-left" src="images/muwu.png">'+
										'<div class="mui-media-body">'+
											'<a href="javascript:;" class="viewCustom" value="'+custom.id+'">'+custom.name1+'</a>'+
											'<p class="mui-ellipsis clearfix">'+
												'省市：'+custom.regio+'-'+custom.ort01+'&nbsp;&nbsp;&nbsp;&nbsp;行业：'+custom.hyType1+
												'<label class="left marginR20"></label>'+
												'<label class="left"></label>'+
											'</p>'+
										'</div> '+
									'</a>'+
								'</div>'+
							'</li>';
				  }else{
					dataList='<li class="mui-table-view-cell mui-media" value="'+custom.id+'">'+
								'<div class="mui-slider-right mui-disabled">'+
									'<a href="javascript:;" class="mui-btn mui-btn-blue view" value="'+custom.id+'">查看</a>'+
								'</div>'+
								'<div class="mui-slider-handle">'+
									'<a href="javascript:;"> <img class="mui-media-object mui-pull-left" src="images/muwu.png">'+
										'<div class="mui-media-body">'+
											'<a href="javascript:;" class="viewCustom" value="'+custom.id+'">'+custom.name1+'</a>'+
											'<p class="mui-ellipsis clearfix">'+
												'省市：'+custom.regio+'-'+custom.ort01+'&nbsp;&nbsp;&nbsp;&nbsp;行业：'+custom.hyType1+
												'<label class="left marginR20"></label>'+
												'<label class="left"></label>'+
											'</p>'+
										'</div> '+
									'</a>'+
								'</div>'+
							'</li>';
				  }
				 $("#OA_task_1").append(dataList);
				  
			 });
		   }    
   });    
} 
//删除客户主数据
function delCustom(id){
 var btnDelArray = ['确定'];
	$.ajax({
			url:pathUrl+"/delClientInfoApp.do",
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
				if(msg.indexOf("操作成功!") != -1){
					mui.confirm('删除成功！', '', btnDelArray, function(e) {	
						mui.openWindow({
							url:"custominfo_sub.html"
						});
					});	
					//li.parentNode.removeChild(li);
				}else{
					mui.confirm('删除失败！', '', btnDelArray, function(e) {
						mui.openWindow({
							url:"custominfo_sub.html"
						});
					});
				}
				
			}
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
