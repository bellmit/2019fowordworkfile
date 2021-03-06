var userId="";
mui.init({
swipeBack:true //启用右滑关闭功能
});

//初始化微信用户
(function($) {
$.init();
	if(localStorage.wxUser!=null){
		var data = JSON.parse(localStorage.wxUser);
		userId=data.userId;
	}else{
		mui.toast('网络异常！');
	}
	initView();
})(mui);

//查看详情
function initView(leavelId) {
	$.ajax({
		url: pathUrl+'/getholidays.action',
		type:"post",
		data:{userId:userId},
		async:false,/*同步请求*/
		dataType:'json',
		success:function(data){
			var jsonData = JSON.parse(data);
			
		  	$.each(jsonData.data,function(i,flow){
		  				var html='<li class="mui-table-view-cell mui-media detailMsg fadeBox">'+
							'<div>'+
								'当前登陆人： <span id="reason">'+flow.userName+'</span>'+
							'</div>'+
							'<div>'+
								'总小时数：<span id="replaceUserName">'+flow.totalHours+'</span>'+
							'</div>'+
							'<div>'+
								'剩余小时数：<span id="replaceUserName">'+flow.restHours+'</span>'+
							'</div>'+
							'<div>'+
								'假期类型：<span id="replaceUserName">'+flow.holidayType+'</span>'+
							'</div>'+
							'<div>'+
								'有效期：<span id="replaceUserName">'+flow.startValidity+'-'+flow.endValidity+'</span>'+
							'</div>'+
						'</li>';
			    	$("#datas").append(html);
			 });
		}
	});
}
