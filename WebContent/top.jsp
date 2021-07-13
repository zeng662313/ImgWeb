<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.yumoxuan.pic.utils.*, java.sql.*"%>
    <%
	if (session.getAttribute("nickname") == null) {
		response.sendRedirect("login.html");
		return;
	}
	Connection connection = JdbcUtils.getConnection();
	String sql="select fav_photo_id,count(*) as count from fav group by fav_photo_id order by count desc limit 5";
	PreparedStatement prepareStatement = connection.prepareStatement(sql);
	ResultSet rs =prepareStatement.executeQuery();
  	%>
  	<body style="background-color:#DCDCDC;">
	<h1>收藏排行榜</h1>
	<%@include file="common/nav.jsp" %>
	<%while(rs.next()){
		connection = JdbcUtils.getConnection();
		String sql1 = "select * from img where imgid="+rs.getInt(1);
		prepareStatement = connection.prepareStatement(sql1);
		ResultSet rs1=prepareStatement.executeQuery();
		if(rs1.next()){
		%>
		<div style=" float:left ; text-align:center; padding:5px;" >
		<a href="detail.jsp?pid=<%=rs1.getInt(1)%>"><img style="height:200px" title="<%=rs1.getString(2)%>" alt="<%=rs1.getString(2)%>" src="<%=rs1.getString(3)%>" /></a><br/>
		<span>收藏量:<%=rs.getInt(2)%></span>
		</div>
	</body>
	<% 
		}
	}
	connection.close();
	prepareStatement.close(); %>
