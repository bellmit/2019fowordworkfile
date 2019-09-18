<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%
session.removeAttribute("edu.yale.its.tp.cas.client.filter.user");
response.sendRedirect("http://192.168.0.149/sso/logout?service=http://192.168.0.149:8000/YJT_Admin");
%>
<html>
<head>
<title>退出</title>


<script type=”text/javascript”>
/**
window.onload=function (){

    window.location.href="http://192.168.0.149/sso/logout?service=http://192.168.0.105:8080/webroot/decision" ;
}
**/
</script>



</head>
<body>
</body>
</html>