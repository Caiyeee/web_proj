<%@ page language="java"  import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@ include file="DB.jsp" %>
<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String mid = request.getParameter("mid");
  String s = queryUser(username);  
  if(s == null || s.equals("0")) {
	  response.sendRedirect("loginFair.jsp?user="+ username + "&pass=" + password);
  }else {
    session.setAttribute("username", username);
    if(mid == null)
      response.sendRedirect("index.jsp");
    else
      response.sendRedirect("details.jsp?mid="+mid);
  }
%>
