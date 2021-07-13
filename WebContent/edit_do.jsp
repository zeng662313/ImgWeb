<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="com.yumoxuan.pic.utils.*"%>
    <%
    if (session.getAttribute("nickname") == null) {
		response.sendRedirect("login.html");
		return;
	}
    	request.setCharacterEncoding("UTF-8");
		String photoid = request.getParameter("photoid");
		String address = request.getParameter("address");
		String title = request.getParameter("title");
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改</title>
</head>
<body>
<%@include file="common/nav.jsp" %>
		<form action="change_img.jsp" method="post">
		<input type="hidden" value="<%=photoid%>" name="photoid"/>
		标题:<input type="text" value="<%=title %>" name="title"/><br>
		网址:<input type="text" value="<%=address %>" name="address"/><br/>
		<input type="submit" value="修改"/>
		</form>	
</body>
</html>