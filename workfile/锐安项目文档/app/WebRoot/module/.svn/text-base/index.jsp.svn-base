<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		function ajaxLogin(){
			var username = "王嘉凌";
			var password = "123456";
			//
			$.ajax({
					url:"login.action",
					type:"post",
					data:{
						name:username,
			            password:password,
			            fromAndroid:"true"
					},
					dataType:"jsonp",
					async:false,/*同步请求*/
					jsonp:"callback",
		        	jsonpCallback:"flightHandler",
					success:function(data){
						alert(data);
						data = eval("("+data+")");
						var str = "";
						for(var i in data){
							var pp = data[i];
							str +=i+"= "+pp+"\n";
						}
						alert(str);
						querySignInfo();
					}
				});
			/**
			$.ajax({
		        //url:App.getWebUrl()+"/firstLogin.do",
		       	url:"login.action",
		        type:"post",
		        data : {
		            client:"szlib",
		            name:username,
		            password:password,
		            fromAndroid:"true",
		            command:"login"
		        },
				async:false,//同步请求
		        dataType:"jsonp",
		        jsonp:"callback",
		        jsonpCallback:"flightHandler",
		        error : function(){
		        	alert("有误！");
		        	//showAlertMsg("警告","登录错误，请检查网络和VPN！",doNothing,['确定']);
		        },
		        success:function(data){
		        	alert(1);
		        	alert(data.resultType);
		        	if(data.resultType == "login"){
		        		alert(data.resultType);
		        	}else{
		        		//showAlertMsg("警告","用户名或密码错误！",doNothing,['确定']);
		        	}
		        }
		    });
			*/
		}
		
		function querySignInfo(){
			$.ajax({
				url:"querySignInfo.action",
				type:"post",
				data:{
		            fromAndroid:"true"
				},
				dataType:"jsonp",
				async:false,/*同步请求*/
				jsonp:"callback",
	        	jsonpCallback:"flightHandler",
				success:function(data){
					alert(data);
					data = eval("("+data+")");
					var str = "";
					for(var i in data){
						var pp = data[i];
						str +=i+"= "+pp+"\n";
					}
					alert(str);
				}
			});
		}
		
		function ajaxSign(signType){
			$.ajax({
					url:"userSign.action",
					type:"post",
					data:{
						signType:signType,
			            fromAndroid:"true"
					},
					dataType:"jsonp",
					async:false,/*同步请求*/
					jsonp:"callback",
		        	jsonpCallback:"flightHandler",
					success:function(data){
						alert(data);
						data = eval("("+data+")");
						/*
						var str = "";
						for(var i in data){
							var pp = data[i];
							str +=i+"= "+pp+"\n";
						}
						alert(str);
						*/
						alert(data.msg);
					}
				});
		}
	</script>
  </head>
  
  <body>
    <a href="exhibition.jsp">XXXXXXXXXXXXX</a>
    <input type="button" onclick="ajaxLogin();" value="ajax登录" />
    <input type="button" onclick="ajaxSign('m_sign');" value="上午上班" />
    <input type="button" onclick="ajaxSign('m_sign_out');" value="上午下班" />
    <input type="button" onclick="ajaxSign('a_sign');" value="下午上班" />
    <input type="button" onclick="ajaxSign('a_sign_out');" value="下午下班" />
  </body>
</html>
