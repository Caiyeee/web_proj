<%@ page language="java"  import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@ include file="DB.jsp" %>
<%@ include file="MD5.jsp" %>
<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String mid = request.getParameter("mid");
  String from = request.getParameter("from");
  String MD5_psw = getMD5(password);
  User user_ = new User(username, MD5_psw);
  int isValid = insertUser(user_);
  if(isValid != 0) {
    System.out.println("注册成功，请登录！");
    if(mid == null)
    	response.sendRedirect("login.jsp?from="+from);
    else
     response.sendRedirect("login.jsp?mid="+mid+"&from="+from);
  } else{
    System.out.println("用户名已存在！");
    response.sendRedirect("registFair.jsp?user="+ username + "&pass=" + password+"&from="+from);
  }
%>


