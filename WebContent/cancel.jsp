<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.yumoxuan.pic.utils.*, java.sql.*"%>
    
    <%
	if (session.getAttribute("nickname") == null) {
		response.sendRedirect("login.html");
		return;
	}
    request.setCharacterEncoding("UTF-8");
	int photoid = Integer.parseInt( request.getParameter("photoid"));
	Connection connection = JdbcUtils.getConnection();
	String sql = "delete from fav where fav_id=?";
	PreparedStatement prepareStatement = connection.prepareStatement(sql);
	prepareStatement.setInt(1,photoid );
	prepareStatement.executeUpdate();
	connection.close();
	prepareStatement.close();
	connection.close();
	prepareStatement.close();
	response.sendRedirect("fav_list.jsp");
	%>

