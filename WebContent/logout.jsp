<%@ page language="java"  import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
    String mid = request.getParameter("mid");
    session.invalidate();
    
    if(mid == null)
        response.sendRedirect("index.jsp");
      else
        response.sendRedirect("details.jsp?mid="+mid);
   // response.sendRedirect("index.jsp");
%>
