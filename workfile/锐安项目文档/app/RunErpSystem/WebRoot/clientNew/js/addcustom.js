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
    
    //性别
    var sexData = [{
        value: '0',
        text: '男'
    }, {
        value: '1',
        text: '女'
    }];
	//级别
	 var levelData = [{
        value: '0',
        text: '乡科级副职'
    }, {
        value: '1',
        text: '乡科级正职'
    }, {
        value: '2',
        text: '县处级副职'
    },{
        value: '3',
        text: '县处级正职'
    }, {
        value: '4',
        text: '厅局级副职'
    }, {
        value: '5',
        text: '厅局级正职'
    }, {
        value: '6',
        text: '省部级副职'
    },{
        value: '7',
        text: '省部级正职'
    }, {
        value: '8',
        text: '其他'
    }];

	 getSelect("showSexPicker","sexContent",sexData);
	 getDynamicSelcet("showProPicker","ProCityRegion",2,cityData);
	//getTradeSelcet("showtradePicker","tradeContent",2);
	//行政级别
    getSelect("adminLevelPicker","adminLevelcontent",levelData);
	getTime('getTime');
	
});

function submitForm(status){
	var data = JSON.parse(localStorage.obj);
	var pid = data.id;
	var lxrName= $("#lxrName").val();
	var xzjb= document.getElementById('adminLevelcontent').innerHTML;
	var gzzw = $("#gzzw").val();
	var ywbm1= $("#ywbm1").val();
	var ywbm2= $("#ywbm2").val();
	var hyType2 = $("#hyType2").val();
	var sex = document.getElementById('sexContent').innerHTML;
	var ProCityRegion = document.getElementById('ProCityRegion').innerHTML;
	var birthday= $("#getTime").val();
	var age= $("#age").val();
	var grah= $("#grah").val();
	var xgtd= $("#xgtd").val();
	var phoneNo= $("#phoneNo").val();
	var officePhone= $("#officePhone").val();
	var byyx= $("#byyx").val();
	var ah= $("#ah").val();
	var jbs= $("#jbs").val();
	var xypp= $("#xypp").val();
	var yjpp= $("#yjpp").val();
	var ycpp= $("#ycpp").val();
	var jtcy= $("#jtcy").val();
	var gzjl= $("#gzjl").val();
	var remark= $("#remark").val();
	
	var btnArray = ['确定'];
	var userName = document.getElementById('userName').innerHTML;
	if(userName == null || userName == ''){
		mui.confirm('添加人不能为空！', '', btnArray, function(e) {
		});
		return false;
	}
	
	if(status == '0'){//草稿
		
		if(lxrName.length>50){
			mui.confirm('姓名长度不能超过50！', '', btnArray, function(e) {
			});
			return false;
		}
	
		if(ywbm1.length>200){
			mui.confirm('业务部门(一级)长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
		if(ywbm2.length>200){
			mui.confirm('业务部门(二级)长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
		if(hyType2.length>200){
			mui.confirm('行业分类(二级)长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
	
		if(gzzw.length>200){
			mui.confirm('工作职务长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
	}else{//提交
	
		if(lxrName == null || lxrName == ''){
			mui.confirm('姓名长度不能为空！', '', btnArray, function(e) {
			});
			return false;
		}else if(lxrName.length>50){
			mui.confirm('姓名长度不能超过50！', '', btnArray, function(e) {
			});
			return false;
		}
		
		if(ywbm1 == null || ywbm1 == ''){
			mui.confirm('业务部门(一级)长度不能为空！', '', btnArray, function(e) {
			});
			return false;
		}else if(ywbm1.length>200){
			mui.confirm('业务部门(一级)长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
		
		if(ywbm2.length>200){
			mui.confirm('业务部门(二级)长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}

		if(hyType2 == null || hyType2 == ''){
			mui.confirm('行业分类(二级)长度不能为空！', '', btnArray, function(e) {
			});
			return false;
		}else if(hyType2.length>200){
			mui.confirm('行业分类(二级)长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}

		if(gzzw == null || gzzw == ''){
			mui.confirm('工作职务长度不能为空！', '', btnArray, function(e) {
			});
			return false;
		}else if(gzzw.length>200){
			mui.confirm('工作职务长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}

	}
	
	
	$.ajax({
		url: pathUrl+'/addClientLxrInfoApp.do',
		type:'post',
		data : {
			fromRunApp:'true',
			lxrName:lxrName,
			xzjb:xzjb,
			gzzw:gzzw,
			ywbm1:ywbm1,
			ywbm2:ywbm2,
			hyType2:hyType2,
			sex:sex,
			ProCityRegion:ProCityRegion,
			birthday:birthday,
			age:age,
			grah:grah,
			xgtd:xgtd,
			phoneNo:phoneNo,
			officePhone:officePhone,
			byyx:byyx,
			ah:ah,
			jbs:jbs,
			xypp:xypp,
			yjpp:yjpp,
			ycpp:ycpp,
			jtcy:jtcy,
			gzjl:gzjl,
			remark:remark,
			pid:pid,
			status:status,
			userName:userName
		},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		error : function(){
		},
		success:function(data){
			var msgArray = ['确定'];
			var obj = {id:pid};
			var str = JSON.stringify(obj);
			localStorage.obj = str;
			var msg= data.msg;
			if(msg.indexOf("提交成功!") != -1){
				mui.confirm('操作成功！', '', msgArray, function(e) {
					mui.openWindow({
						url:"customdetail_sub.html"
					});
				});
			}else{
				mui.confirm('操作失败！', '', msgArray, function(e) {
					mui.openWindow({
						url:"customdetail_sub.html"
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
				}else{
					alert("登录失败！");
				}
			}    
		});
   }
