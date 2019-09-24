var userId="";
var types="";
//mui初始化
mui.init({
	swipeBack: true //启用右滑关闭功能
});
//初始化微信数据
(function($, doc) {
	if(localStorage.wxUser!=null){
		var data = JSON.parse(localStorage.wxUser);
		//userId='3887';
		userId=data.userId;
			
	}else{
		mui.toast('网络异常！');
	}
	$.ready(function() {
		var _getParam = function(obj, param) {
			return obj[param] || '';
		};
		// 时间
		var showTime = new $.PopPicker();
		showTime.setData([{
			value: 'plane',
			text: '近半年'
		}, {
			value: 'train',
			text: '近一年'
		},{
			value: 'car', 
			text: '近两年'
		},{
			value: 'car', 
			text: '全部'
		}]);
		var showTimeButton = doc.getElementById('showTime');
		var timeResult = doc.getElementById('showTime');
		showTimeButton.addEventListener('tap', function(event) {
			showTime.show(function(items) {
				timeResult.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
				getDataInfo();
			});
		}, false);
		//类型
		var showStyle = new $.PopPicker();
		showStyle.setData([
		{
			value: 'plane',
			text: '全部'
		},{
			value: 's',
			text: '年假'
		}, 
		{
			value: 'plane',
			text: '产检假'
		}, {
			value: 'train',
			text: '离职职务假'
		},{
			value: 'car', 
			text: '病假'
		},{
			value: 'car', 
			text: '带薪病假'
		},{
			value: 'car', 
			text: '陪护假'
		},{
			value: 'car', 
			text: '计划生育假'
		},{
			value: 'car', 
			text: '产假'
		},{
			value: 'car', 
			text: '哺乳假'
		},{
			value: 'car', 
			text: '调休假'
		},{
			value: 'car', 
			text: '婚假'
		},{
			value: 'car', 
			text: '事假'
		},{
			value: 'car', 
			text: '丧假'
		},{
			value: 'car', 
			text: '长期病假'
		}
		]);
		var showStyleButton = doc.getElementById('showStyle');
		var styleResult = doc.getElementById('showStyle');
		showStyleButton.addEventListener('tap', function(event) {
			showStyle.show(function(items) {
				styleResult.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
				getDataInfo();
			});
		}, false);
		//状态
		var showStat = new $.PopPicker();
		showStat.setData([{
			value: 'plane',
			text: '审批中'
		}, {
			value: 'train',
			text: '审批通过'
		},{
			value: 'car', 
			text: '草稿'
		}]);
		var showStatButton = doc.getElementById('showStat');
		var statResult = doc.getElementById('showStat');
		showStatButton.addEventListener('tap', function(event) {
			showStat.show(function(items) {
				statResult.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
				getDataInfo();
			});
		}, false);
	});
getDataInfo();
})(mui, document);
// 加载更多
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
	/**
	 * 下拉刷新具体业务实现function pulldownRefresh() {
		getDataInfo();
		mui('#pullrefresh').pullRefresh().endPulldownToRefresh(); //refresh completed
	}
	 */
	
	var currentPage=1;
	var pageCount=0;
	/**
	 * 上拉加载具体业务实现
	 */
	function pullupRefresh() {
		setTimeout(function() {
			//mui('#pullrefresh').pullRefresh().endPullupToRefresh((currentPage >= pageCount)); //参数为true代表没有更多数据了。
			var table = document.body.querySelector('#mui-table-view-list');
			var cells = document.body.querySelectorAll('.mui-table-view-cell');
			
			var leaveType = $("#showStyle").html().trim();
			var applyTime = $("#showTime").html().trim();
			var state = $("#showStat").html().trim();
			if(leaveType=='类型'){
				leaveType='';
			}
			if(applyTime=='时间'){
				applyTime='';
			}
			if(state=='状态'){
				state='';
			}
			$.ajax({
	//			url: 'http://192.168.0.93:8180/YJT_PMS/attend/appLeave/appList',
				url: pathUrl+'/appLeave.action',
				type:"post",
				data:{leaveType:leaveType,pageSize:5,currentPage:currentPage,applyTime:applyTime,state:state},
				async:false,/*同步请求*/
				dataType:'jsonp',
				jsonp:'callback',
				jsonpCallback:'flightHandler',
				success:function(data){
					
				    $.each(data.result,function(i,flow){
			    	var li = document.createElement('li');
						li.className = "mui-table-view-cell mui-media";
						li.innerHTML = "<div class='mui-slider-right mui-disabled'>"+
							"<a class='mui-btn mui-btn-red del' value='"+daily.id +"'>删除</a>"+
						"</div>"+
						"<a href='javascript:#;'  class='addApplyB' id='"+flow.flowId+"' name='"+flow.state+"' value='"+flow.id+"'>"+
							"<div>"+
								"<div class='myui-baobei-list-icon mui-pull-left'><span>"+flow.leaveType+"</span></div>"+
								"<div class='mui-media-body mui-pull-left'>"
									+flow.name+
									"<p class='mui-ellipsis clearfix blue'>"+flow.dept+"</p>"+
								"</div>"+
								"<span class='mui-badge mui-badge-success right'>"+flow.state+"</span>"+
							"</div>"+
							"<div class='clear'></div>"+
							"<div class='mui-media detailMsg fadeBox'>"+
								"<div>请假时间："+flow.startTime+" - "+flow.endTime+"</div>"+
								"<div>请假小时数： "+flow.leaveHours+"</div>"+
								"<div>申请日期："+flow.applyDate+"</div>"+
								"<div>审批人："+flow.current+"  </div>"+
							"</div>"+
						"</a>"
				
				$("#mui-table-view-list").append(li);
				
				});
				currentPage++;
				}
			});
		}, 1500);
	}
	//新增请假
function AddLeave(){
	var obj = {type:"add"};
	var leavelStr = JSON.stringify(obj);
	localStorage.leavelStr = leavelStr;
	mui.openWindow({
		url:"apply.html",
	});
}
//初始化页面数据
function getDataInfo(){
	currentPage=1;
	var leaveType = $("#showStyle").html().trim();
	var applyTime = $("#showTime").html().trim();
	var state = $("#showStat").html().trim();
	if(leaveType=='类型'){
		leaveType='';
	}
	if(applyTime=='时间'){
		applyTime='';
	}
	if(state=='状态'){
		state='';
	}
	$.ajax({
		url: pathUrl+'/appLeave.action',
		type:"post",
		data:{leaveType:leaveType,pageSize:5,currentPage:1,applyTime:applyTime,state:state,userId:userId},
		async:false,/*同步请求*/
		dataType:'json',
		success:function(data){
			var html="";
			var html2="";
			var json = eval(  data ); 
			$("#mui-table-view-list").html('');
		    $.each(json.result,function(i,flow){
		    	if(flow.state == "草稿"){
		    		html="<a class='mui-btn mui-btn-red ' value='' onclick='deletes("+flow.id+")'>删除</a>";
		    	}
		    	if(flow.state == "审批中"){
		    		html="<a class='mui-btn mui-btn-yellow ' value='' onclick='chex("+flow.id+")'>撤销</a>"
		    	}
		    	if(flow.state == "审批通过"){
		    		html="<a class='mui-btn mui-btn-yellow ' value='' onclick='chexs("+flow.id+")'>撤销</a>"
		    	}
		    	if(flow.state == "驳回"){
		    		html="<a class='mui-btn mui-btn-red ' value='' onclick='deletes("+flow.id+")'>删除</a>";
		    	}
		    	if(flow.state > "3" && flow.state < "6"){
		    		flow.state="审批中";
		    		html="<a class='mui-btn mui-btn-yellow ' value='' onclick='viewChex("+flow.id+")'>查看撤销</a>"
		    	}
		    	if(flow.state == "6"){
		    		flow.state="审批通过";
		    		html="<a class='mui-btn mui-btn-yellow ' value='' onclick='viewChex("+flow.id+")'>查看撤销</a>"
		    	}
		    	if(flow.state== "草稿" || flow.state== "驳回" ){
		    		html2="<a href='javascript:#;' onclick='edit("+flow.id+")'  class='addApplyB' id='"+flow.flowId+"' name='"+flow.state+"' value='"+flow.id+"'>";
		    	}else{
		    		html2="<a href='javascript:#;' onclick='lsevaView("+flow.id+","+flow.flowId+")'  class='addApplyB' id='"+flow.flowId+"' name='"+flow.state+"' value='"+flow.id+"'>";
		    	}
		    	types=flow.state;
		    	var li = document.createElement('li');
					li.className = 'mui-table-view-cell mui-media';
					li.innerHTML = "<div class='mui-slider-right mui-disabled'>"+
							html+
						"</div>"+
						"<div class='mui-slider-handle'>"+
						"<div class='myui-list-title mui-pull-left '><span>"+flow.leaveType+"</span></div>"+
						html2+
						"<div>"+
							"<div class='mui-media-body mui-pull-left'>"
								+flow.name+
								"<p class='mui-ellipsis clearfix blue'>"+flow.dept+"</p>"+
							"</div>"+
							"<span class='mui-badge mui-badge-success right'>"+flow.state+"</span>"+
						"</div>"+
						"<div class='clear'></div>"+
						"<div class='mui-media detailMsg fadeBox'>"+
							"<div>请假时间："+flow.startTime+" - "+flow.endTime+"</div>"+
							"<div>请假小时数： "+flow.leaveHours+"</div>"+
							"<div>申请日期："+flow.applyDate+"</div>"+
							"<div>审批人："+flow.current+"  </div>"+
						"</div>"+
						"</a>"+
						"</div>";
			$("#mui-table-view-list").append(li);
		    });
		    
		      //总页数
		    pageCount=data.pageCount;
		    currentPage=2;
		   // mui('#pullrefresh').pullRefresh().endPullupToRefresh((currentPage > pageCount));
		}
	});
}
function chex(id){
if(types == "审批通过"){

}else{
	$.ajax({
		url: pathUrl+'/revokeLeave.action',
		type:"post",
		data:{
			id:id,
			userId:userId
		},
		async:false,/*同步请求*/
		dataType:'json',
		success:function(data){
			var json=JSON.parse(data);
			if(json.msg=="sucess"){
				mui.confirm("撤销成功！", '提示', ['确定'], function(e) {
					mui.openWindow({
						url:"vacation-list.html",
					});
				});	
			}
		}
	});
}
}
//修改请假
function edit(leavelId){
	var obj = {leavelId:leavelId,type:"edit"};
	var leavelStr = JSON.stringify(obj);
	localStorage.leavelStr = leavelStr;
	mui.openWindow({
		url:"apply.html",
	});
}
//请假详情展示
function lsevaView(leavelId,flowId){
	var obj = {leavelId:leavelId,flowId:flowId};
	var leavelStr = JSON.stringify(obj);
	localStorage.leavelStr = leavelStr;
	mui.openWindow({
		url:"apply-detail.html",
	});
}
//删除请假
function deletes(id){
	$.ajax({
		url: pathUrl+'/deleteLeave.action', 
		type:"post",
		data:{
			id:id,
			userId:userId
		},
		async:false,/*同步请求*/
		dataType:'json',
		success:function(data){
			var json=JSON.parse(data);
			if(json.flag == true){
				mui.confirm('删除成功！', '提示', ['确定'], function(e) {
					mui.openWindow({
						url:"vacation-list.html",
					});
				});	
			}
		}
	});
}
//查看详情
function viewChex(id){
	var obj = {leavelId:id,type:"backView"};
	var leavelStr = JSON.stringify(obj);
	localStorage.leavelStr = leavelStr;
	mui.openWindow({
		url:"apply-detail.html",
	});
}
//撤销请假详情
function chexs(id){
	var obj = {leavelId:id,type:"back"};
	var leavelStr = JSON.stringify(obj);
	localStorage.leavelStr = leavelStr;
	mui.openWindow({
		url:"apply-detail.html",
	});
}
