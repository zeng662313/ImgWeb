<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"
	import="com.yumoxuan.pic.utils.JdbcUtils"%>
<%
if (session.getAttribute("nickname") == null) {
	response.sendRedirect("login.html");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style >
	img:hover{
		transform:scale(1.5,1.5);
		transition:all 2000ms ease;
	}
</style>
</head>
<body style="background-color:#DCDCDC;">
<audio src="music/music.mp3" autoplay="autoplay"></audio>
<h1>图片墙</h1>
	<%@include file="common/nav.jsp" %>
	<% 
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		connection = JdbcUtils.getConnection();
		String userid=(String)session.getAttribute("userid");
		String sql = "select * from img where power=1 or userid=?";
		prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1, userid);
		ResultSet rs = prepareStatement.executeQuery();
		while (rs.next()) {
	%>
	<a href="detail.jsp?pid=<%=rs.getInt(1)%>"><img style="height: 300px"
		title="<%=rs.getString(2)%>" alt="<%=rs.getString(2)%>"
		src="<%=rs.getString(3)%>" /></a>
	<%
	}
	prepareStatement.close();
	connection.close();
	%>
</body>
</html>