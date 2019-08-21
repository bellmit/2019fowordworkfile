
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
	var name = data.name;
	//加载客户数据
	$.ajax({
		url: pathUrl+'/getClientInfoLxrApp.do',
		type:"post",
		data : {
			fromAndroid:"true",
			name:name,
			id:id
		},
		async:false,/*同步请求*/
		dataType:"jsonp",
		jsonp:"callback",
		jsonpCallback:"flightHandler",
		error : function(){
			alert("获取数据失败！");
		},
		success:function(data){
			var msg= data.msg;
			if(msg.indexOf("操作成功!") != -1){
				$("#lxrName").val(data.lxrName);
				document.getElementById('adminLevelcontent').innerHTML = data.xzjb;
				$("#ywbm1").val(data.ywbm1);
				$("#ywbm2").val(data.ywbm2);
				$("#hyType2").val(data.hyType2);
				$("#gzzw").val(data.gzzw);
				document.getElementById('sexContent').innerHTML = data.sex;
				document.getElementById('ProCityRegion').innerHTML = data.ProCityRegion;
				$("#getTime").val(data.birthday);
				$("#age").val(data.age);
				$("#grah").val(data.grah);
				$("#xgtd").val(data.xgtd);
				$("#phoneNo").val(data.phoneNo);
				$("#officePhone").val(data.officePhone);
				$("#byyx").val(data.byyx);
				$("#ah").val(data.ah);
				$("#jbs").val(data.jbs);
				$("#xypp").val(data.xypp);
				$("#yjpp").val(data.yjpp);
				$("#ycpp").val(data.ycpp);
				//家庭成员
				$("#jtcy").text('家庭成员：'+"\r\n"+data.jtcy);
				//工作经历
				$("#gzjl").text('工作经历：'+"\r\n"+data.gzjl);
				//备注
				$("#remark").text('备注：'+"\r\n"+data.remark);
			}else{
				alert("获取数据失败");
			}
		} 
	});
}

function backPre(){
	var data = JSON.parse(localStorage.obj);
	var pid = data.pid;
	var obj = {id:pid};
	var str = JSON.stringify(obj);
	localStorage.obj = str;
	mui.openWindow({
		url:"customdetail_sub.html"
	});
}