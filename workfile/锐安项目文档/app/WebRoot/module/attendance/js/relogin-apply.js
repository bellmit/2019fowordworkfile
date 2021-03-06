var appUserInfo={};
//mui初始化
mui.init({
	swipeBack: true //启用右滑关闭功能
});
//初始化微信数据
(function($,doc) {
	var obj = JSON.parse(localStorage.obj);
	var id = obj.id;
	setTimeout(function () {
		if(localStorage.wxUser!=null) {
		    var data = JSON.parse(localStorage.wxUser);
		    appUserInfo.mUserName=data.userName;
			appUserInfo.mWxUserId = data.wXUserId;
	        appUserInfo.applyUserId = data.userId;
			getData(id);
		}else{
	        mui.toast('网络异常！');
        }
	});
})(mui,document);
//时间选择器
(function($) {
	$.init();
})(mui);
//考勤记录选择器
function addTimePicker(clickId) {
    var btn = document.getElementById(clickId);
    if (btn) {

    	btn.addEventListener('tap', function() {
			var _self = this;
			if(_self.picker) {

				_self.picker.show(function (rs) {
					btn.innerText = rs.text;
					_self.picker.dispose();
					_self.picker = null;
				});
			} else {
				var optionsJson = this.getAttribute('data-options') || '{}';
				var options = JSON.parse(optionsJson);
				var id = this.getAttribute('id');
				_self.picker = new mui.DtPicker(options);
				_self.picker.show(function(rs) {
					btn.innerText = rs.text;
					_self.picker.dispose();
					_self.picker = null;
				});
			}
		}, false);
    }
}

/**
 * 获取考勤记录
 */
function getData(id){
	$.ajax({
		url:pathUrl+'/attendanceView.action',
		type:'post',
		data:{id:id},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		success:function(data){
			var jsonData = JSON.parse(data);
			var attend = jsonData.data;
			localStorage.attend = JSON.stringify(attend);
			document.getElementById('applyUser').innerHTML = appUserInfo.mUserName;
			document.getElementById('time').innerHTML = attend.appTime;
			if(attend.describe1 != '正常'){
				$("#appAmAttend").css("color","red");
				$("#formList1").css("display","block");
				addTimePicker('appAmAttend');
			}
			if(attend.describe2 != '正常'){
				$("#appAmClosing").css("color","red");
				$("#formList2").css("display","block");
				addTimePicker('appAmClosing');
			} 
			if(attend.describe3 != '正常'){
				$("#appPmAttend").css("color","red");
				$("#formList3").css("display","block");
				addTimePicker('appPmAttend');
			} 
			if(attend.describe4 != '正常'){
				$("#appPmClosing").css("color","red");
				$("#formList4").css("display","block");
				addTimePicker('appPmClosing');
			} 
			$("#appAmAttend").html(attend.appAmAttend);
			$("#appAmClosing").html(attend.appAmClosing);
			$("#appPmAttend").html(attend.appPmAttend);
			$("#appPmClosing").html(attend.appPmClosing);
	   	}    
   	});    
} 

/**
 * 补登提交
 */
$("#submitApply").click(function(){
	var msgArray = ['确定'];
	var applyUser = $("#applyUser").text();
	var userId = appUserInfo.applyUserId;
	var time = document.getElementById('time').innerHTML;
	var attend = JSON.parse(localStorage.attend);
	var appAmAttends = $("#appAmAttend").html();
	var appAmClosings = $("#appAmClosing").html();
	var appPmAttends = $("#appPmAttend").html();
	var appPmClosings = $("#appPmClosing").html();
	var appAmAttend;
	var appAmClosing;
	var appPmAttend;
	var appPmClosing;
	var cause1 = $("#cause1").val();
	var cause2 = $("#cause2").val();
	var cause3 = $("#cause3").val();
	var cause4 = $("#cause4").val();
	if(appAmAttends.length == 5){
		appAmAttend = appAmAttends+":00";
	}else{
		appAmAttend = appAmAttends;
	}
	if(appAmClosings.length == 5){
		appAmClosing = appAmClosings+":00";
	}else{
		appAmClosing = appAmClosings;
	}
	if(appPmAttends.length == 5){
		appPmAttend = appPmAttends+":00";
	}else{
		appPmAttend = appPmAttends;
	}
	if(appPmClosings.length == 5){
		appPmClosing = appPmClosings+":00";
	}else{
		appPmClosing = appPmClosings;
	 }
	if(attend.describe1 != '正常'){
		if(cause1 == null || cause1 == ''){
			mui.confirm('请输入上午上班补登理由！', '', msgArray, function(e) {
			});
			return false;
		}else if(cause1.length > 50){
			mui.confirm('上午上班补登理由不能超过50字！', '', msgArray, function(e) {
			});
			return false;
		}
	}
	if(attend.describe2 != '正常'){
		//appAmClosing = "12:00:00";
		if(cause2 == null || cause2 == ''){
			mui.confirm('请输入上午下班补登理由！', '', msgArray, function(e) {
			});
			return false;
		}else if(cause2.length > 50){
			mui.confirm('上午下班补登理由不能超过50字！', '', msgArray, function(e) {
			});
			return false;
		}
	}
	if(attend.describe3 != '正常'){
		//appPmAttend = "13:30:00";
		if(cause3 == null || cause3 == ''){
			mui.confirm('请输入下午上班补登理由！', '', msgArray, function(e) {
			});
			return false;
		}else if(cause3.length > 50){
			mui.confirm('下午上班补登理由不能超过50字！', '', msgArray, function(e) {
			});
			return false;
		}
	}
	if(attend.describe4 != '正常'){
		//appPmClosing = "18:00:00";
		if(cause4 == null || cause4 == ''){
			mui.confirm('请输入下午下班补登理由！', '', msgArray, function(e) {
			});
			return false;
		}else if(cause4.length > 50){
			mui.confirm('下午下班补登理由不能超过50字！', '', msgArray, function(e) {
			});
			return false;
		}
	}
	$.ajax({
		url:pathUrl+'/attendanceRelogin.action',
		type:'post',
		data:{
			applyUser:applyUser,
			userId:userId,
			time:time,
			appAmAttend:appAmAttend,
			appAmClosing:appAmClosing,
			appPmAttend:appPmAttend,
			appPmClosing:appPmClosing,
			cause1:cause1,
			cause2:cause2,
			cause3:cause3,
			cause4:cause4
		},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		success:function(data){
			var jsonData = JSON.parse(data);
			if(jsonData.code == 'SUCCESS'){
				mui.confirm('操作成功！', '', msgArray, function(e) {
					mui.openWindow({
						url:"attendance-list.html"
					});
				});
			}else if(jsonData.code == 'FAIL'){
				mui.confirm(jsonData.message, '', msgArray, function(e) {
					mui.openWindow({
						url:"attendance-list.html"
					});
				});
			}else{
				mui.confirm('操作失败！', '', msgArray, function(e) {
					mui.openWindow({
						url:"attendance-list.html"
					});
				});
			}
	   	}    
   	}); 

})