<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.yumoxuan.pic.utils.*, java.sql.*"%>
    <%
	if (session.getAttribute("nickname") == null) {
		response.sendRedirect("login.html");
		return;
	}
	String useid=(String)session.getAttribute("userid");
    int userid=Integer.parseInt(useid);
	Connection connection = JdbcUtils.getConnection();
	String sql2="select f.*, p.* from fav f join img p on p.imgid=fav_photo_id where fav_user_id=?";
	PreparedStatement prepareStatement = connection.prepareStatement(sql2);
	prepareStatement.setInt(1,userid );
	ResultSet rs =prepareStatement.executeQuery();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>收藏夹</title>
</head>
<body style="background-color:#DCDCDC;">
	<h1>我的收藏</h1>
	<%@include file="common/nav.jsp" %>
	<%while(rs.next()){%>
		<div style=" float:left ; text-align:center; padding:5px;" >
		<a href="detail.jsp?pid=<%=rs.getInt(4)%>"><img style="height:200px" title="<%=rs.getString(5)%>" alt="<%=rs.getString(5)%>" src="<%=rs.getString(6)%>" /></a><br/>
		<a href="cancel.jsp?photoid=<%=rs.getString(1)%>" >取消收藏</a>
		</div>
	<% }
	connection.close();
	prepareStatement.close(); %>
</body>
</html>