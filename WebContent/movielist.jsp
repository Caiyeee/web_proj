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
	
	request.setCharacterEncoding("utf-8");
	boolean b = connect();

    List<Map<String,String>> movielist = queryMovie("", 1);
    
    String sub1 = "";
    String sub2 = "";
    String search = "";
    String mid = "";
    
    if(request.getMethod().equalsIgnoreCase("post")){
		sub1 = request.getParameter("searchButton");
		sub2 = request.getParameter("deletemovie");
		if(sub1 != null){
			search = request.getParameter("search");
			movielist = queryMovie(search, 1);
		}
		if(sub2 != null)
		{
			mid = request.getParameter("mid");
			deleteMovie(Integer.parseInt(mid));
			deleteCommentsByMid(Integer.parseInt(mid));
			movielist = queryMovie("", 1);
		}
	}
%>

<html>
	<head>
		<title>电影列表</title>
		<link rel="stylesheet" type="text/css" href="public/css/list.css">
	</head>
	<body>
	    <div class="bg-item bg-blur"></div>
		<div class="tabletitle"><strong>电影列表</strong><span><a  class="return" href="manager.jsp">返回</a></span></div>
		<div class="searchmovie">
		<form action="movielist.jsp" method = "post">
		<div class="search">
	        <span><input type="text" name="search" autocomplete="off" placeholder="搜索影片" class="text" value=<%=search %>></span>
	        <span><input type="submit" name="searchButton" id="searchButton" class="search-button" value=""></span>
        </div>
         </form>
         
         </div>
		<% String movie = "";
	    if(movielist != null){
			for(int i=0; i<movielist.size(); i++){
				Map<String,String> map = movielist.get(i);
				movie = map.get("id") + map.get("name");%>
				<form action="movielist.jsp?mid=<%= map.get("id")%>" method="post">
				<div class="ulist">
				
				<div><a href="details.jsp?mid=<%= map.get("id")%>"><%= map.get("name")%></a></div>
				<input type="submit" id="deletecomment" name="deletemovie" value="删除">
				
				</div>
				</form>
				
			<%}
		}else {movie="null";}%>	
	
		
	</body>
</html>
