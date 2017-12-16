<%@ page language="java"  import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
    session.invalidate(); 
    response.sendRedirect("index.jsp");
%>
