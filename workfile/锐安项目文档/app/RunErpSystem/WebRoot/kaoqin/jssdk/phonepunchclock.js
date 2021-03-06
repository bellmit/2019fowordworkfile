/**
 **  @fileoverView: 手机打卡
 **  @version： V1.0
 **  @Date :    2018-08-03
 **  @author：  youjiti
 **/
 // 打卡信息
var jsonData = {};
var address="";
var map, geolocation;
var str=['定位信息'];
jsonData.fromRunApp = "true";
var phoneNum = "";
var userName = "";
var mUserId = "";
var kaoQinPath = "https://www.wanglin.online";


		
function reloadMap(){
	
/***************************************************************************************************************
由于Chrome、IOS10等已不再支持非安全域的浏览器定位请求，为保证定位成功率和精度，请尽快升级您的站点到HTTPS。
***************************************************************************************************************/	
	//加载地图，调用浏览器定位服务
	map = new AMap.Map('container', {
		resizeEnable: true,
		zoom:14
	});

	map.plugin('AMap.Geolocation', function() {
		
		geolocation = new AMap.Geolocation({
			enableHighAccuracy: true,//是否使用高精度定位，默认:true
			timeout: 1000000,          //超过10秒后停止定位，默认：无穷大
			buttonOffset: new AMap.Pixel(10, 80),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
			zoomToAccuracy: false,      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
			buttonPosition:'RB'
		});
		map.addControl(geolocation);
		geolocation.getCurrentPosition();
		AMap.event.addListener(geolocation, 'complete', onComplete);//返回定位信息
		AMap.event.addListener(geolocation, 'error', onError);      //返回定位出错信息
	});
	//解析定位结果
	function onComplete(data) {

		jsonData.longitude = data.position.getLng();// 经度
		jsonData.latitude = data.position.getLat(); // 纬度
		var location = data.position.getLng()+","+data.position.getLat();

		$.ajax({     
			 //要用post方式      
			 type: "post",     
			 //方法所在页面和方法名      
			 url: "https://restapi.amap.com/v3/geocode/regeo?output=json&location="+location+"&key=1bd747249cad2f541cb7c6cae5224f41&radius=1000&extensions=all&batch=false",     
			 contentType: "charset=utf-8",     
			 dataType: "jsonp",
			 async: false,
			 success: function(data) {
				
				 //返回的数据用data.d获取内容  
				 if(data.status == 1 && data.info == 'OK'){
					
					var addressComponent = data.regeocode.addressComponent;
					jsonData.province = addressComponent.province ;
					jsonData.city = addressComponent.city ;
					
					if(jsonData.city == ""){
						jsonData.city = jsonData.province;
					}
					jsonData.district = addressComponent.district ;
					var streetObj = addressComponent.streetNumber ;
					jsonData.street = streetObj.street ;
					jsonData.streetNumber = streetObj.number ;
					//定位成功
					jsonData.address = jsonData.province + ", " + jsonData.city + ", " + jsonData.district + ", " + jsonData.street + ", " + jsonData.streetNumber;
					str.push('日期：' + showTime());
					address = jsonData.address;
					str.push('位置：' + (jsonData.address));
					document.getElementById('tip').innerHTML=str.join('<br>');
					str=['定位信息'];
				 }else{
					alert("解析地址失败,请重试!");
				 }
			 },
			 error: function(err) { 
				alert("解析地址失败,请重试!");
			 }     
		 });
	}
			
	//解析定位错误信息
	function onError(data) {
		document.getElementById('tip').innerHTML = '定位失败';
	}

	
	
}			
	
		
			
		vrv.ready(function(){
		// init信息验证后会执行ready方法，所有接口调用都必须在init接口获得结果之后，init是一个客户端的异步操作，
		//所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。
		//对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
		
			reloadMap();
			vrv.jssdk.getAccountInfo({
			isEntUser: false,
			success: function (res) {
			
						mUserId = res.mUserId;
						$("#userName").attr("value",res.mUserName);
						jsonData.userName = $("#userName").val();
						phoneNum = res.phoneNumber;
						userName = $("#userName").val();
					if(phoneNum != ''){
						getKaoqinRecord(userName,kaoQinPath);
					}else{
						alert("用户信息获取失败！");
					}
				}
			})
		
		});

		vrv.init({
			debug:false//开启调试模式,调用的所有api的返回值会在客户端alert出来
		});
	
	//弹框1显示
	$('#res1').off().on('click', function(){
		if(!$(this).find('.punch').hasClass('disabled')){
			
			reloadMap();
			setTimeout(function(){
				if(address != ''){
					$('.popWrap1 .msg').html(address);
					$('.btn_load_res1').hide();
				}else{
					$('.popWrap1 .msg').html("定位失败，请重新定位！");
					$('.btn_sure_res1').hide();
				}
				
				$('.popWrap1').show();
				$('#res1').removeClass('cur');
				$(this).addClass('cur');
			},10000)	
		}
	});
	// 确定打卡并关闭弹框1
	$('.btn_sure_res1, .btn_close_res1').off().on('click', function(){
		if($(this).hasClass('btn_sure_res1')){
			if(address != ''){//写入打卡记录
				jsonData.signType = "m-sign";
				userSign(jsonData,kaoQinPath);
				$('.punchClockWrap #res1').removeClass('cur').find('.punch').addClass('disabled');
			}
		}
		$('.popWrap1').hide();
		
	});
	// 重新定位并关闭弹框1
	$('.btn_load_res1').off().on('click', function(){
		if($(this).hasClass('btn_load_res1')){
			reloadMap();//重新加载地图进行定位
		}
		$('.popWrap2').hide();
		
	});
	
	
	
	//弹框2显示
	$('#res2').off().on('click', function(){
		if(!$(this).find('.punch').hasClass('disabled')){
			
			reloadMap();
			setTimeout(function(){
				
				if(address != ''){
					$('.popWrap2 .msg').html(address);
					$('.btn_load_res2').hide();
				}else{
					$('.popWrap2 .msg').html("定位失败，请重新定位！");
					$('.btn_sure_res2').hide();
				}

				$('.popWrap2').show();
				$('#res2').removeClass('cur');
				$(this).addClass('cur');	
			},1000)
		}
	});
	
	// 确定打卡并关闭弹框2
	$('.btn_sure_res2, .btn_close_res2').off().on('click', function(){
		if($(this).hasClass('btn_sure_res2')){
			if(address != ''){//写入打卡记录
				jsonData.signType = "m-sign-out";
				userSign(jsonData,kaoQinPath);
				$('.punchClockWrap #res2').removeClass('cur').find('.punch').addClass('disabled');
			}
		}
		$('.popWrap2').hide();
	});
	
	
	// 重新定位并关闭弹框2
	$('.btn_load_res2').off().on('click', function(){
		if($(this).hasClass('btn_load_res2')){
			reloadMap();//重新加载地图进行定位
		}
		$('.popWrap2').hide();
		
	});
	
	//===========================
	
	//弹框3显示
	$('#res3').off().on('click', function(){
		if(!$(this).find('.punch').hasClass('disabled')){
			
			reloadMap();
			setTimeout(function(){
				if(address != ''){
					$('.popWrap3 .msg').html(address);
					$('.btn_load_res3').hide();
				}else{
					$('.popWrap3 .msg').html("定位失败，请重新定位！");
					$('.btn_sure_res3').hide();
				}
				$('.popWrap3').show();
				$('#res3').removeClass('cur');
				$(this).addClass('cur');
			},1000)	
		}
	});
	
	// 确定打卡并关闭弹框3
	$('.btn_sure_res3, .btn_close_res3').off().on('click', function(){
		if($(this).hasClass('btn_sure_res3')){
			if(address != ''){//写入打卡记录
				jsonData.signType = "a-sign";
				userSign(jsonData,kaoQinPath);
				$('.punchClockWrap #res3').removeClass('cur').find('.punch').addClass('disabled');
			}
		}
		$('.popWrap3').hide();
	});
	
	
	// 重新定位并关闭弹框3
	$('.btn_load_res3').off().on('click', function(){
		if($(this).hasClass('btn_load_res3')){
			reloadMap();//重新加载地图进行定位
		}
		$('.popWrap3').hide();
		
	});
	//=======================
	
	//弹框4显示
	$('#res4').off().on('click', function(){
		if(!$(this).find('.punch').hasClass('disabled')){
			
			reloadMap();
			setTimeout(function(){
				if(address != ''){
					$('.popWrap4 .msg').html(address);
					$('.btn_load_res4').hide();
				}else{
					$('.popWrap4 .msg').html("定位失败，请重新定位！");
					$('.btn_sure_res4').hide();
				}
				$('.popWrap4').show();
				$('#res4').removeClass('cur');
				$(this).addClass('cur');	
			},1000)	
		}
	});
	
	// 确定打卡并关闭弹框4
	$('.btn_sure_res4, .btn_close_res4').off().on('click', function(){
		if($(this).hasClass('btn_sure_res4')){
			if(address != ''){//写入打卡记录
				jsonData.signType = "a-sign-out";
				userSign(jsonData,kaoQinPath);
				$('.punchClockWrap #res4').removeClass('cur').find('.punch').addClass('disabled');
			}
		}
		$('.popWrap4').hide();
	});
	
	
	// 重新定位并关闭弹框4
	$('.btn_load_res4').off().on('click', function(){
		if($(this).hasClass('btn_load_res4')){
			reloadMap();//重新加载地图进行定位
		}
		$('.popWrap4').hide();
		
	});





//==============================================================

function getKaoqinRecord(userName,kaoQinPath){
	$.ajax({
			url:kaoQinPath+"/RunErpSystem/querySignInfo.action",
			type:"post",
			data : {
				 userName:userName
			},
			async:false,/*同步请求*/
			dataType:"jsonp",
			jsonp:"callback",
			jsonpCallback:"flightHandler",
			error : function(){
				alert("警告","加载错误！");
			},
			success:function(data){

				var test = JSON.parse(data);
				var signInfo = test.signInfo;
				var userName = test.userName;

			   if(signInfo.msStatus == "已打卡"){
				  $('.punchClockWrap #res1').removeClass('cur').find('.punch').addClass('disabled');						  
				  $('#res1 .curTime').html(signInfo.msTime.substring(11));
			   }else{
				  
			   }
			   
			   if(signInfo.msoStatus == "已打卡"){
			   
				  $('.punchClockWrap #res2').removeClass('cur').find('.punch').addClass('disabled');                         
				  $('#res2 .curTime').html(signInfo.msoTime.substring(11));
			   }else{
				   
			   }
			  
			   if(signInfo.asStatus == "已打卡"){
				  
				  $('.punchClockWrap #res3').removeClass('cur').find('.punch').addClass('disabled');                         
				  $('#res3 .curTime').html(signInfo.asTime.substring(11));
			   }else{
				   
			   }
			   
			   if(signInfo.asoStatus == "已打卡"){
				   
				  $('.punchClockWrap #res4').removeClass('cur').find('.punch').addClass('disabled');                  
				  $('#res4 .curTime').html(signInfo.asoTime.substring(11));
			   }else{
				   
			   }	
			}    
	});
	
}




//更新打卡记录
function userSign(jsonData,kaoQinPath) {

	$.ajax({
		   url:kaoQinPath+"/RunErpSystem/userSign.action",
		   type:"post",
		   data : jsonData,
		   async:false,/*同步请求*/
		   dataType:"jsonp",
		   jsonp:"callback",
		   jsonpCallback:"flightHandler",
		   error : function(){    
			   alert("警告","打卡错误，请联系管理员！");
		   },
		   success:function(data){
		   
			   data = eval("("+data+")");    //包数据解析为json 格式
			   var signInfo = data.signInfo;
			   
			   if(signInfo.msStatus == "已打卡"){
				  $('.punchClockWrap #res1').removeClass('cur').find('.punch').addClass('disabled');						  
				  $('#res1 .curTime').html(signInfo.msTime.substring(11));
			   }else{
				  
			   }
			   
			   if(signInfo.msoStatus == "已打卡"){
			   
				  $('.punchClockWrap #res2').removeClass('cur').find('.punch').addClass('disabled');                         
				  $('#res2 .curTime').html(signInfo.msoTime.substring(11));
			   }else{
				   
			   }
			  
			   if(signInfo.asStatus == "已打卡"){
				  
				  $('.punchClockWrap #res3').removeClass('cur').find('.punch').addClass('disabled');                         
				  $('#res3 .curTime').html(signInfo.asTime.substring(11));
			   }else{
				   
			   }
			   
			   if(signInfo.asoStatus == "已打卡"){
				   
				  $('.punchClockWrap #res4').removeClass('cur').find('.punch').addClass('disabled');                  
				  $('#res4 .curTime').html(signInfo.asoTime.substring(11));
			   }else{
				   
			   }	
		   }
	});
}
		
	

		
