<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>快乐时间</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/exhibition.css">

</head>

<body>
	<div id="body_div">
		<!-- 头部 -->
		<div id="body_head_div">
			<div id="body_head_logo_div">头部logo及用户信息</div>
			<div id="body_head_tool_div">头部菜单</div>
		</div>

		<!-- 内容 -->
		<div id="body_content_div">
			<div id="body_content_title_div">内容区title</div>
			<div id="body_content_image_div">
				内容区图片 <br /> <img class="" src="F:\Photos\1\自行车之旅\自行车之旅-53.JPG"
					width="1000px" height="750px" alt="文本注释" />
				<!-- src="H:\上网必备\content\tp\20111224\023b5bb5c9ea15ce6015d743b6003af33b87b284.jpg" -->
				<h5></h5>

				<table border="0">
					<tr>
						<td>图片组名字</td>
						<td>图片数量</td>
						<td>发布时间</td>
					</tr>

					<s:iterator value="folders" var="folder">
						<tr>
							<td><a
								href="<s:url action="showfile"><s:param name="folderId" value="#folder.folderId"></s:param></s:url>">
									<s:property value="#folder.folderName" />
							</a></td>
							<td><s:property value="#folder.fileNumber" /> <!-- 
									<s:date name="#folder.fileNumber" format="yyyy年MM月dd日" />
									 --></td>
							<td><s:property value="#folder.folderReleaseTime" /></td>
						</tr>
					</s:iterator>
				</table>


			</div>
		</div>

		<!-- 尾部 -->
		<div id="body_remark_div">网页尾部</div>
	</div>
</body>
</html>
