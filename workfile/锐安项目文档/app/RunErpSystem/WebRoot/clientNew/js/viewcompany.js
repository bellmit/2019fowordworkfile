
mui.init({
    swipeBack:true //启用右滑关闭功能
});
mui.ready(function() {
    /**
     * 获取对象属性的值
     * 主要用于过滤三级联动中，可能出现的最低级的数据不存在的情况，实际开发中需要注意这一点；
     * @param {Object} obj 对象
     * @param {String} param 属性名
     */
    var _getParam = function(obj, param) {
        return obj[param] || '';
    };
	getData();
});

function getData(){
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
				$("#legalEntity").val(data.companyName);
				$("#address").val(data.address);
			}else{
				alert("获取数据失败");
			}
		}    
	});
}

function backPre(){
	mui.openWindow({
		url:"custominfo_sub.html",
	});
}