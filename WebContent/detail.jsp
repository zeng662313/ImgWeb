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
		String pid = request.getParameter("pid");
		int photoid=Integer.parseInt(pid);
		Connection connection = null;
		PreparedStatement prepareStatement= null;
		connection = JdbcUtils.getConnection();
		String sql = "select * from img where imgid=?";
		prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setInt(1,photoid );
		ResultSet rs=prepareStatement.executeQuery();
		while(rs.next()){
			title=rs.getString(2);
			url=rs.getString(3);
		}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>照片册</title>
</head>
<body style="background-color:#DCDCDC;">
	<div>
		<h1>大图欣赏</h1>
		<%@include file="common/nav.jsp" %>
		<hr/>
		<div style="margin:20px auto;width:600px" >
			<h2><%=title %>[<a href="addfav_do.jsp?photoid=<%=photoid%>">收藏</a>]</h2>
			<img src="<%=url%>" width="600px" />
			<h4>评论</h4>
			<hr/>
			<ul>
			<%
			String userpid=(String)session.getAttribute("userid");
			int userid=Integer.parseInt(userpid);
			String sql1="select c.*,u.nickname from comments c join user u on c.cm_user_id=u.id where c.cm_photo_id=?";
			prepareStatement=connection.prepareStatement(sql1);
			prepareStatement.setInt(1, photoid);
			ResultSet rs1=prepareStatement.executeQuery();
			while(rs1.next()){%>
				<li><span><%=rs1.getString(5) %>:</span><%=rs1.getString(3) %></li>
			<% 
			}
			prepareStatement.close();
			connection.close();
			%>
			</ul>
			<form action="cmadd_do" method="post" >
				<input type="hidden"  name="photoid" value="<%=photoid%>"/>
				<textarea rows="3" cols="50" name="connent"></textarea>
				<input type="submit" value="评论"/>
			</form>
		</div>
	</div>
</body>
</html>