<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.yumoxuan.pic.utils.*, java.sql.*"%>
    <%request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("nickname")==null) {
		response.sendRedirect("login.html");
	}
		Connection connection = null;
		PreparedStatement prepareStatement= null;
		int photoid=Integer.parseInt(request.getParameter("photoid")) ;
		String title=request.getParameter("title");
		String address=request.getParameter("address");
		String sql="update img set imgname=?, imgurl=? where imgid=?";
		connection = JdbcUtils.getConnection();
		prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1, title);
		prepareStatement.setString(2, address);
		prepareStatement.setInt(3, photoid);
		prepareStatement.executeUpdate();
		connection.close();
		prepareStatement.close();
		response.sendRedirect("edit.jsp");
		%>
