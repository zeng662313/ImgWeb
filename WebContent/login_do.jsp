<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="com.yumoxuan.pic.utils.JdbcUtils"%> 
    <% 
		request.setCharacterEncoding("UTF-8");
		String loginname = request.getParameter("loginname");
		String loginpwd = request.getParameter("loginpwd");
		Connection connection = null;
		PreparedStatement prepareStatement= null;
		connection = JdbcUtils.getConnection();
		String sql = "select * from user where loginname=? and loginpwd=?";
		prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1, loginname);
		prepareStatement.setString(2, loginpwd);
		ResultSet rs=prepareStatement.executeQuery();
		boolean key=false;
		if(rs.next()){
			key=true;
			session.setAttribute("nickname", rs.getString(1));
			session.setAttribute("userid", rs.getString(6));
			System.out.print(rs.getString(6));
		}
		connection.close();
		prepareStatement.close();
		if(key){
			response.sendRedirect("first.jsp");
		}else{
			response.sendRedirect("login.html");
		}
	%>
