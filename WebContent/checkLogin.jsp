<%@ page language="java"  import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@ include file="DB.jsp" %>
<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String mid = request.getParameter("mid");
  String s = queryUser(username);  
  System.out.print("密码是:"+s);
  System.out.print("用户名："+ username + "密码："+password);
  if(s == null || s.equals("0") || !s.equals(password)) {
	  response.sendRedirect("loginFair.jsp?user="+ username + "&pass=" + password + "&mid=" + mid);
  }else if(s != null && s.equals(password)){
    session.setAttribute("username", username);
    // session.setAttribute("userId", )
    if(mid == null || mid.equals("null")) {
    	response.sendRedirect("index.jsp");
    }
    else
      response.sendRedirect("details.jsp?mid="+mid);
  }
%>
