<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@ include file="DB.jsp" %>

<%  
	request.setCharacterEncoding("utf-8");
	Object user = session.getAttribute("username");
	String user_ = "";
	if(user != null)
		user_ = user.toString();
	if(!user_.equals("manager")) {
		response.sendRedirect("index.jsp");
	}
%>

<html>
	<head>
		<title>管理员</title>
		<link rel="stylesheet" type="text/css" href="public/css/manager.css">
	</head>
	<body>
	    <div class="bg-item bg-blur"></div>
		<div class="welcome_manager"><strong>管 理 员 ，你 好！</strong></div>
		<div class="choosetable">
			<div class="movietable"><a href = "movielist.jsp">电影列表</a></div>
			<div class="commenttable"><a href = "commentlist.jsp">评论列表</a></div>
			<div class="usertable"><a href = "userlist.jsp">用户列表</a></div>
		</div>
	</body>
</html>
