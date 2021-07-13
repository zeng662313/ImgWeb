<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="com.yumoxuan.pic.utils.*"%>
    <%
    if (session.getAttribute("nickname") == null) {
		response.sendRedirect("login.html");
		return;
	}
    	request.setCharacterEncoding("UTF-8");
		Connection connection = null;
		PreparedStatement prepareStatement= null;
		String userid=(String)session.getAttribute("userid");
		connection = JdbcUtils.getConnection();
		String sql = "select * from img where userid=?";
		prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1, userid);
		ResultSet rs=prepareStatement.executeQuery();%>
		<body style="background-color:#DCDCDC;">
		<h1>编辑信息</h1>
			<%@include file="common/nav.jsp" %>
		<% while(rs.next()){
			%>
		<div style=" float:left ; text-align:center; padding:5px;" >
		<a href="detail.jsp?pid=<%=rs.getInt(1)%>"><img style="height:50px" title="<%=rs.getString(2)%>" alt="<%=rs.getString(2)%>" src="<%=rs.getString(3)%>" /></a><br/>
		<a href="edit_do.jsp?photoid=<%=rs.getInt(1)%>&title=<%=rs.getString(2)%>&address=<%=rs.getString(3)%>" >编辑</a>
		<a href="del_do.jsp?photoid=<%=rs.getInt(1)%>" >删除</a>
		</div>
		</body>
		<%} %>
