if(localStorage.wxUser!=null){
	var data = JSON.parse(localStorage.wxUser);
	document.getElementById('userName').innerHTML=data.userName; 
	logInAction(data.userName,data.wXUserId);	
}else{
	alert('授权失败！');
}

mui.init({
    swipeBack:true //启用右滑关闭功能
});
mui.ready(function() {

		var show_day=new Array('星期日','星期一','星期二','星期三','星期四','星期五','星期六'); 
		 var time=new Date(); 
		 var year=time.getFullYear();
		 var month=time.getMonth()+1; 
		 var date=time.getDate(); 
		 var day=time.getDay(); 
		 var hour=time.getHours(); 
		 var minutes=time.getMinutes(); 
		 var second=time.getSeconds(); 
		/*  month<10?month='0'+month:month;  */
		 hour<10?hour='0'+hour:hour; 
		 minutes<10?minutes='0'+minutes:minutes; 
		 second<10?second='0'+second:second; 
		 var showDay= year+'-'+month+'-'+date; 
		 var showWeek = show_day[day];
		 document.getElementById('currDate').innerHTML=showDay; 

    /**
     * 获取对象属性的值
     * 主要用于过滤三级联动中，可能出现的最低级的数据不存在的情况，实际开发中需要注意这一点；
     * @param {Object} obj 对象
     * @param {String} param 属性名
     */
    var _getParam = function(obj, param) {
        return obj[param] || '';
    };
	
	getDynamicSelcet("showProPicker","ProCityRegion",3,cityData3);
	 //行业
    getSelect("showtradePicker","tradeContent",tradeFirstData);

});

function submitForm(status){
var btnArray = ['确定'];
var data = JSON.parse(localStorage.obj);
var id = data.id;
var ProCityRegion= document.getElementById('ProCityRegion').innerHTML;
var tradeContent= document.getElementById('tradeContent').innerHTML;
var companyName= $("#companyName").val();
var address= $("#address").val();
var userName = document.getElementById('userName').innerHTML;

if(userName == null || userName == ''){
	mui.confirm('添加人不能为空！', '', btnArray, function(e) {
	});
	return false;
}
if(status == '0'){//草稿
	if(tradeContent.length>200){
		mui.confirm('行业分类(一级)长度不能超过200！', '', btnArray, function(e) {
		});
		return false;
	}

	if(companyName.length>200){
		mui.confirm('法人单位长度不能超过200！', '', btnArray, function(e) {
		});
		return false;
	}

	if(address.length>200){
		mui.confirm('地址长度不能超过200！', '', btnArray, function(e) {
		});
		return false;
	}
}else{//提交

	if(ProCityRegion == null || ProCityRegion == ''){
		mui.confirm('省份-地市-区县不能为空！', '', btnArray, function(e) {
		});
		return false;
	}
	if(tradeContent == null || tradeContent == ''){
		mui.confirm('行业分类(一级)不能为空！', '', btnArray, function(e) {
		});
		return false;
	}

	if(companyName == null || companyName == ''){
		mui.confirm('法人单位不能为空！', '', btnArray, function(e) {
		});
		return false;
	}else{
		if(companyName.length>200){
			mui.confirm('法人单位长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
	}

	if(address == null || address == ''){
		mui.confirm('地址不能为空！', '', btnArray, function(e) {
		});
		return false;
	}else{
		if(address.length>200){
			mui.confirm('地址长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
	}
}


$.ajax({
		url: pathUrl+'/addClientInfoApp.do',
		type:'post',
		data : {
			status:status,
			ProCityRegion:ProCityRegion,
			tradeContent:tradeContent,
			companyName:companyName,
			address:address,
			userName:userName,
			id:id
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
						url:"custominfo_sub.html"
					});
				});
			}else{
				mui.confirm('操作失败！', '', msgArray, function(e) {
					mui.openWindow({
						url:"custominfo_sub.html"
					});
				});
			}
		}    
	});
	
}

   function getData(userName){
		var data = JSON.parse(localStorage.obj);
		var id = data.id;
		$.ajax({
			url: pathUrl+'/getClientInfoApp.do',
			type:'post',
			data : {
				id: id
			},
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			error : function(){
				alert("获取数据失败！");
			},
			success:function(data){
				var msg= data.msg;
				if(msg.indexOf("操作成功!") != -1){
					document.getElementById('ProCityRegion').innerHTML = data.ProCityRegion;
					document.getElementById('tradeContent').innerHTML = data.tradeContent;
					$("#companyName").val(data.companyName);
					$("#address").val(data.address);
				}else{
					alert("获取数据失败");
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
					getData(userName);
				}else{
					alert("登录失败！");
				}
			}    
		});
   }
