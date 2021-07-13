<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="com.yumoxuan.pic.utils.JdbcUtils"%>
		<% 
		request.setCharacterEncoding("UTF-8");
		String nickname = request.getParameter("nickname");
		String loginname = request.getParameter("loginname");
		String loginpwd = request.getParameter("loginpwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		Connection connection = null;
		PreparedStatement prepareStatement= null;
		connection = JdbcUtils.getConnection();
		String sql = "insert into user(nickname,loginname,loginpwd,email,phone) value(?,?,?,?,?)";
		String sql1="select * from user where loginname=?";
		prepareStatement = connection.prepareStatement(sql1);
		prepareStatement.setString(1, loginname);
		ResultSet sr1=prepareStatement.executeQuery();
		if(sr1.next()){%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
		<a href="register.html">抱歉，你注册的账号已被注册，请重新注册！</a>
		<% connection.close();
		prepareStatement.close();
		return;
		}
		prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1,nickname );
		prepareStatement.setString(2,loginname);
		prepareStatement.setString(3,loginpwd);
		prepareStatement.setString(4,email);
		prepareStatement.setString(5,phone);
		prepareStatement.execute();
		connection.close();
		prepareStatement.close();
		%>
	<h1>注册成功!</h1>
	<a href="login.html">去登录</a>
</body>
</html>