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

	List<Map<String,String>> userlist = queryAllUser();
    
    String sub1 = "";
    String sub2 = "";
    String sub3 = "";
    String search = "";
    String getuserid = "";
    String getcommentid = "";
    
    if(request.getMethod().equalsIgnoreCase("post")){
		sub1 = request.getParameter("searchButton");
		sub2 = request.getParameter("deleteuser");
		sub3 = request.getParameter("deletecomment");
		if(sub1 != null){
			search = request.getParameter("search");
			userlist = queryUser(search);
		}
		if(sub2 != null){
			getuserid = request.getParameter("userid");
			deleteUser(Integer.parseInt(getuserid));
			userlist = queryAllUser();
		}
		if(sub3 != null){
			getcommentid = request.getParameter("commentid");
			deleteComment(Integer.parseInt(getcommentid));
			userlist = queryAllUser();
		}
	}
%>

<html>
	<head>
		<title>用户列表</title>
		<link rel="stylesheet" type="text/css" href="public/css/list.css">
	</head>
	<body>
	    <div class="bg-item bg-blur"></div>
		<div class="tabletitle"><strong>用户列表</strong><span><a  class="return" href="manager.jsp">返回</a></span></div>
		<div class="searchmovie">
		<form action="userlist.jsp" method = "post">
		<div class="search">
	        <span><input type="text" name="search" autocomplete="off" placeholder="搜索用户" class="text" value=<%=search %>></span>
	        <span><input type="submit" name="searchButton" id="searchButton" class="search-button" value=""></span>
        </div>
         </form>
         </div>
         

		<% 
	    if(userlist != null){
			for(int i=0; i<userlist.size(); i++){
				Map<String,String> map = userlist.get(i);
				String username = map.get("name");
				String userid = String.valueOf(map.get("id"));
			    %>
				<%if(!username.equals("manager")){ %>
				<div class="ulist">
					<div><%= username%></div>
					
					<form action="userlist.jsp?userid=<%= userid%>" method = "post">
						<input type="submit" id="deletecomment" name="deleteuser" value="删除该用户">
					</form>
				</div><%}%>
				<div class="allcomment">
				<%List<Map<String,String>> commentlist = queryCommentById(userid);
				if(commentlist != null&&!username.equals("manager")){
					for(int j = 0; j < commentlist.size(); j++){
						Map<String,String> commentmap = commentlist.get(j);
						String commentuser = queryNameById(String.valueOf(commentmap.get("user_id")));
						String commentcontent = commentmap.get("content");
						String getmovieid = String.valueOf(commentmap.get("movie_id"));
						String getthismoviename = queryMovieToGetName(getmovieid);
						%>
						<div class="comment">
							<div class="commentcontent"><%= commentcontent%><strong>《<%= getthismoviename%>》</strong></div>
							<form action="userlist.jsp?commentid=<%= commentmap.get("id")%>" method = "post">
							<input id="deletecomment" value="删除该条评论" type="submit" name="deletecomment">
							</form>
						</div>
					<%}%>
				<%}%>
				</div>
			<%}
		}%>		
		
	</body>
</html>
