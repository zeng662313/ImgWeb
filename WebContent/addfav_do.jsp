<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.yumoxuan.pic.utils.*, java.sql.*"%>
    <%
	if (session.getAttribute("nickname") == null) {
		response.sendRedirect("login.html");
		return;
	}
    request.setCharacterEncoding("UTF-8");
    String useid=(String)session.getAttribute("userid");
    int userid=Integer.parseInt(useid);
	int photoid = Integer.parseInt(request.getParameter("photoid"));
	Connection connection = JdbcUtils.getConnection();
	String sql = "insert into fav values(default,?,?)";
	PreparedStatement prepareStatement = connection.prepareStatement(sql);
	prepareStatement.setInt(1,photoid );
	prepareStatement.setInt(2,userid);
	prepareStatement.executeUpdate();
	connection.close();
	prepareStatement.close();
	response.sendRedirect("fav_list.jsp");
	%>