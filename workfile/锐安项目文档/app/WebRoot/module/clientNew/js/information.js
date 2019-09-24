var wxObjet = {};
var url = window.location.href.split("#")[0];
if(localStorage.wxUser!=null){
	var data = JSON.parse(localStorage.wxUser);
	document.getElementById('userName').innerHTML=data.userName; 
	logInAction(data.userName,data.wXUserId);	
}else{
	getUserDataInfo();	
}

$.ajax({
	url:'http://111.204.211.208:8888/RunErpSystem/getSha1.action',
	type:'post',
	data : {
	url:url,
	AppId:'CUSTOM_INFO'
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
			jsApiList: ["getLocation","hideOptionMenu","closeWindow"] // 必填，需要使用的JS接口列表
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
			AppId:'CUSTOM_INFO'
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
					document.getElementById('userName').innerHTML=userData.userName; 
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
    getTradeSelcet("showtradePicker","tradeContent",2);
	getTypeSelcet();

});

function init(){
	$('.autoDiv').height($(window).height() - $('.mui-bar').height()-$('.f_input').height()-$('.formList').css('margin-top'));
	$('.autoDiv').css('top',$('.mui-bar').height()+$('.f_input').height()+20);

	 //键盘操作
	 $("#autoInput").keyup(function(event) {
		 //处理键盘操作
		 var that = $(this);
		 var myEvent = event || window.event;
		 var keyCode = myEvent.keyCode;
		 
		 if (keyCode == 13) { //回车键
			 if ($("#auto_div").is(":visible")) {
				 $("#auto_div").css("display", "none");
				 $('.submitBtn.save').attr('href','chkcustom.html');
				 $('.submitBtn.saveAs').attr('href','custominfo.html');
			 }
		 } else {
			 if ($("#autoInput").val() == "") {
				 $("#auto_div").hide();
				 $('.submitBtn.save').attr('href','chkcustom.html');
				 $('.submitBtn.saveAs').attr('href','custominfo.html');
				 $('.closeIcon').removeClass('mui-icon-clear').addClass('mui-icon-search');
			 } else {   //有文字输入时获取提示词
				 $('.submitBtn.save').attr('href','javascript:;');
				 $('.submitBtn.saveAs').attr('href','javascript:;');
				 $('.closeIcon').removeClass('mui-icon-search').addClass('mui-icon-clear');
				 AutoComplete("auto_div", "autoInput");
			 }
		 }
	 });
	//点击页面隐藏自动补全提示框
	document.onclick = function(e) {
		var e = e ? e : window.event;
		var tar = e.srcElement || e.target;
		if (tar.id != "autoInput") {
			if ($("#auto_div").is(":visible")) {
				$("#auto_div").css("display", "none");
				$('.submitBtn.save').attr('href','javascript:;');
				$('.submitBtn.saveAs').attr('href','javascript:;');
			}
		}
	}
}


function submitForm(){
if(!$("#file-ing").hasClass("hidden-node")){
	alert("上传中,请稍等...");
	return false;
}
var clientUnitName= $("#autoInput").val();
var tradeContent= document.getElementById('tradeContent').innerHTML;
var typeContent = document.getElementById('typeContent').innerHTML;
//var businessInfo= $("#businessInfo").val();
//var alliesInfo= $("#alliesInfo").val();
var workText= $("#workText").val();
var userName = document.getElementById('userName').innerHTML;
if(clientUnitName==null || clientUnitName==''){
	alert("请输入客户单位！");
	return false;
}else if(clientUnitName.length > 200){
	alert("客户单位不能超过200字！");
	return false;
}
if(tradeContent==null || tradeContent=='' || tradeContent=='行业'){
	alert("请选择行业分类！");
	return false;
}
if(typeContent==null || typeContent=='' || typeContent=='类型'){
	alert("请选择资讯类型！");
	return false;
}
if(workText==null || workText==''){
	alert("请输入资讯内容！");
	return false;
}else if(workText.length > 2000){
	alert("资讯内容不能超过2000字！");
	return false;
}
/*
if(businessInfo==null || businessInfo==''){
	alert("请输入商机资讯！");
	return false;
}else if(businessInfo.length > 200){
	alert("商机资讯不能超过2000字！");
	return false;
}
if(alliesInfo==null || alliesInfo==''){
	alert("请输入友商资讯！");
	return false;
}else if(alliesInfo.length > 200){
	alert("友商资讯不能超过2000字！");
	return false;
}
*/
var fileNames = "";
$.each($("input[name='filePath']"),function(){
	var filePath = $(this).val();		
	if(filePath.length != 0){
		if(fileNames.length != 0){
			fileNames = fileNames + ",";
		}
		fileNames = fileNames + filePath;
	}	
});
$.ajax({
		url: pathUrl + '/clientWorkInfoApp.do',
		type:'post',
		data : {
			fromRunApp:'true',
			state:'1',
			clientUnitName:clientUnitName,
			tradeContent:tradeContent,
			//businessInfo:businessInfo,
			//alliesInfo:alliesInfo,
			businessFiles:fileNames,
			infoType:typeContent,
			workText:workText,
			userName:userName
		},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		error : function(){
			wx.closeWindow();
		},
		success:function(data){
		
		var msg= data.msg;
		if(msg.indexOf("提交成功!") != -1){
			alert("提交成功！");
		}else{
			alert("提交失败！");
		}
			wx.closeWindow();
		}    
	});
	
}




/**
* AutoComplete 输入框自动搜索
* @param auto 下拉框id
* @param search 搜索框id
* @constructor
*/
function AutoComplete(auto, search) {
var autoInput= $("#autoInput").val();
     if ($("#" + search).val() != "") {
         var autoNode = $("#" + auto); //缓存对象（弹出框）
         var carlist = new Array();
         var n = 0;
         var mylist = [];
         var maxTipsCounts = 100; // 最大显示条数
         var aj = $.ajax({
			 url: pathUrl+'/getClientInfoListApp.do', // 跳转到后台
			  //url: 'http://192.168.0.88'+'/getClientInfoListApp.do', // 跳转到后台
             data: {condition:autoInput}, 
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
             cache: false,
             success: function(data) {
			
				//console.log(JSON.stringify(data))
                 if (data.error == undefined) {
                     mylist = data;
                     if (mylist == null) {
                         autoNode.hide();
                         return;
                     }
                     autoNode.empty(); //清空上次的记录
					 
					 for(var i = 0 ; i < mylist.dataSize ; i++){
						if (i < maxTipsCounts) {
						 //console.log(1);
                             var wordNode = mylist.dataList[i].name1; //弹出框里的每一条内容
                             var newDivNode = $("<div>").attr("id", i); //设置每个节点的id值

                             document.querySelector("#auto_div").style.width = $("#search_text").outerWidth(true) + 'px'; //设置提示框与输入框宽度一致
                             newDivNode.html(wordNode).appendTo(autoNode); //追加到弹出框
                             //鼠标点击文字上屏
                             newDivNode.off().on('tap',function() {
                                 //取出选中节点的文本内容
                                 var comText = $(this).text();
                                 //文本框中的内容变成高亮节点的内容
                                 $("#" + search).val(comText);
                                 $("#" + auto).css("display", "none");
                                 $('.submitBtn.save').attr('href','chkcustom.html');
                                 $('.submitBtn.saveAs').attr('href','custominfo.html');
                             });
                             //关闭按钮
                             $('.closeIcon').off().on('click',function(){
                                 $(this).removeClass('mui-icon-clear').addClass('mui-icon-search');
                                 $("#" + search).val('');
                                 $("#" + auto).css("display", "none");
                                 $('.submitBtn.save').attr('href','chkcustom.html');
                                 $('.submitBtn.saveAs').attr('href','custominfo.html');
                             });
                             if (mylist.dataSize > 0) { //如果返回值有内容就显示出来
                                 autoNode.show();
                             } else { //服务器端无内容返回 那么隐藏弹出框
                                 autoNode.hide();
                             }
                         }
					 }

                 }
             }
         });
     }
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
				alert("获取用户信息失败！");
			},
			success:function(data){
				var msg= data.msg;
				if(msg.indexOf("欢迎回来!") != -1){
				}else{
					alert("获取用户信息失败！");
				}
			}    
		});
   }
