<%@ page language="java" pageEncoding="UTF-8"%>

	<div style="background:#87CEEB;line-height:40px;color:white;border-radius:10px">
		<a style="color:white;text-decoration:none;" href="first.jsp;">首页</a> 
		<a style="color:white;text-decoration:none;" href="add_img.jsp;">上传图片</a> 
		<a style="color:white;text-decoration:none;" href="fav_list.jsp">收藏夹</a> 
		<a style="color:white;text-decoration:none;" href="edit.jsp">我的相册</a>
		<a style="color:white;text-decoration:none;" href="top.jsp">收藏榜</a>
		<a style="color:white;text-decoration:none;float:right;margin-right:40px; " href="login_out_do.jsp">注销</a> 
		<sapn style="float:right;margin-right:5px;">欢迎您:<a href="userdetail.jsp?userid=<%=session.getAttribute("userid") %>" style="text-decoration:none; color:white"><%=session.getAttribute("nickname") %></a></sapn>
	</div>
	<hr />
	