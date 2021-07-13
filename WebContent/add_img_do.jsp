<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="com.yumoxuan.pic.utils.JdbcUtils"%>
   
		<%  if (session.getAttribute("nickname") == null) {
			response.sendRedirect("login.html");
			return;
		} 
		request.setCharacterEncoding("UTF-8");
		String imgname = request.getParameter("imgname");
		String imgurl = request.getParameter("imgurl");
		String power = request.getParameter("power") ;
		String userid=(String)session.getAttribute("userid");
		Connection connection = null;
		PreparedStatement prepareStatement= null;
		connection = JdbcUtils.getConnection();
		String sql = "insert into img(imgname,imgurl,userid,power) value(?,?,?,?)";
		try{
		prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1,imgname );
		prepareStatement.setString(2,imgurl);
		prepareStatement.setString(3,userid);
		prepareStatement.setString(4,power);
		prepareStatement.execute();
		connection.close();
		prepareStatement.close();
		}
		catch(SQLException e){
			response.sendRedirect("add_img.jsp");
		}
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加</title>
</head>
<body style="background-color:#DCDCDC;">
	<h1>insert success!</h1>
	<a href="add_img.jsp">继续上传</a>
	<a href="first.jsp">查看照片墙</a>
</body>
</html>