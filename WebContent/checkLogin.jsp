<%@ page language="java"  import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@ include file="DB.jsp" %>
<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String mid = request.getParameter("mid");
  List<Map<String,String>> list = queryUser(username);
  String s = "";
  String user_id = "";
  if(list.size()==0){
	  user_id = null;
	  s = null;
  }
  else{
	  user_id = list.get(0).get("id");
	  s =  String.valueOf(list.get(0).get("password"));
  }

  if(s == null || !s.equals(password)) {
	  response.sendRedirect("loginFair.jsp?user="+ username + "&pass=" + password + "&mid=" + mid 
			  	+ "&user_id=" + user_id + "&from=" + request.getParameter("from"));
  }else if(s != null && s.equals(password)){
	if(username.equals("manager")){
		session.setAttribute("username", username);
	    session.setAttribute("userId", user_id);
		response.sendRedirect("manager.jsp");
	}
	else{
		session.setAttribute("username", username);
	    session.setAttribute("userId", user_id);
	    if(mid == null || mid.equals("null")) {
	    	if(request.getParameter("from").equals("add")){
	    		response.sendRedirect("addMovie.jsp");
	    	} else
		    	response.sendRedirect("index.jsp");
	    }
	    else {
	    	response.sendRedirect("details.jsp?mid="+mid + "&user_id=" + user_id);
	    } 
	  }
	}
%>
