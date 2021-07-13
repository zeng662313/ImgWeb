<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="com.yumoxuan.pic.utils.*"%>
    <%
    if (session.getAttribute("nickname") == null) {
		response.sendRedirect("login.html");
		return;
	}
    	String title=null;
    	String url=null;
    	request.setCharacterEncoding("UTF-8");
		String pid = request.getParameter("photoid");
		int photoid=Integer.parseInt(pid);
		Connection connection = null;
		int userid=Integer.parseInt((String)session.getAttribute("userid")) ;
		PreparedStatement prepareStatement= null;
		connection = JdbcUtils.getConnection();
		String sql1="delete from img where imgid=? and userid=?";
		prepareStatement = connection.prepareStatement(sql1);
		prepareStatement.setInt(1,photoid );
		prepareStatement.setInt(2,userid );
		boolean key=prepareStatement.execute();
		String sql2="delete from fav where fav_photo_id=?";
		prepareStatement = connection.prepareStatement(sql2);
		prepareStatement.setInt(1,photoid );
		prepareStatement.execute();
		connection.close();
		prepareStatement.close();
		response.sendRedirect("edit.jsp");
	%>
