<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

    <%
    	//session.removeAttribute("nickname");
    	session.invalidate();
    	response.sendRedirect("login.html");
    	
    %>