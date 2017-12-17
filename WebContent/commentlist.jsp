<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@ include file="DB.jsp" %>

<%  
	request.setCharacterEncoding("utf-8");
	boolean b = connect();

	List<Map<String,String>> movielist = queryMovie("", 1);
    
    String sub1 = "";
    String sub2 = "";
    String search = "";
    int commentid = -1;
    
    if(request.getMethod().equalsIgnoreCase("post")){
		sub1 = request.getParameter("searchButton");
		sub2 = request.getParameter("deletecomment");
		if(sub1 != null){
			search = request.getParameter("search");
			movielist = queryMovie(search, 1);
		}
		if(sub2 != null){
			commentid = Integer.parseInt(request.getParameter("commentid"));
			deleteComment(commentid);
		}
	}
%>

<html>
	<head>
		<title>评论列表</title>
		<link rel="stylesheet" type="text/css" href="public/css/list.css">
	</head>
	<body>
	    <div class="bg-item bg-blur"></div>
		<div class="tabletitle"><strong>评论列表</strong></div>
		<div class="searchmovie">
		<form action="commentlist.jsp" method = "post">
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
				String moviename = map.get("name");
				int movieid = Integer.parseInt(map.get("id"));%>
				<div class="list">
				<a href="details.jsp?mid=<%= map.get("id")%>"><%= moviename%></a>
				</div>
				<div class="allcomment">
				<%List<Map<String,String>> commentlist = queryComment(movieid);
				if(commentlist != null){
					for(int j = 0; j < commentlist.size(); j++){
						Map<String,String> commentmap = commentlist.get(j);
						String commentuser = queryNameById(String.valueOf(commentmap.get("user_id")));
						String commentcontent = commentmap.get("content");%>
						<div class="comment">
							<div class="commentuser"><strong><%= commentuser%></strong></div>
							<div class="commentcontent"><%= commentcontent%></div>
							<form action="commentlist.jsp?commentid=<%= commentmap.get("id")%>" method = "post">
							<input id="deletecomment" value="删除该条评论" type="submit" name="deletecomment">
							</form>
						</div>
					<%}
				}%>
				</div>
			<%}
		}%>		
		
	</body>
</html>
