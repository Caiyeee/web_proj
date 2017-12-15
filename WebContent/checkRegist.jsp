<%@ page language="java"  import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@ include file="DB.jsp" %>
<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  User user_ = new User(username, password);
  int isValid = insertUser(user_);
  if(isValid != 0) {
    System.out.println("注册成功，请登录！");
    response.sendRedirect("login.jsp");
  } else{
    System.out.println("用户名已存在！");
    response.sendRedirect("registFair.jsp?user="+ username + "&pass=" + password);
  }
%>

