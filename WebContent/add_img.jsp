<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%if (session.getAttribute("nickname") == null) {
		response.sendRedirect("login.html");
		return;
	} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加图片</title>
</head>
<body style="background-color:#DCDCDC;">
	<h1>添加图片</h1>
	<%@include file="common/nav.jsp" %>
	<form action="add_img_do.jsp" method="post" >
		图片名:<input type="text" name="imgname" size="50px"><br/>
		网　址:<input type="text" name="imgurl"  size="50px"><br/>
		<input type="radio" name="power" value="1" checked/>公开
		<input type="radio" name="power" value="2"/>私有
		<input type="submit" value="上传" />
	</form>
</body>
</html>