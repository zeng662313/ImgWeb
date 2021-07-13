package com.yumoxuan.pic.web;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.management.RuntimeErrorException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import com.yumoxuan.pic.utils.*;
@WebServlet("/cmadd_do")
public class CommentAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CommentAdd() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		if(session.getAttribute("nickname")==null) {
			response.sendRedirect("login.html");
		}
		String photopid=request.getParameter("photoid");
		int photoid=Integer.parseInt(photopid);
		String userpid=(String)session.getAttribute("userid");
		int userid=Integer.parseInt(userpid);
		String connent=request.getParameter("connent");

		Connection connection=null;
		connection = JdbcUtils.getConnection();
		String sql="insert into comments(cm_photo_id,cm_content,cm_user_id) values(?,?,?)";
		try {
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, photoid);
			preparedStatement.setString(2, connent);
			preparedStatement.setInt(3, userid);
			preparedStatement.executeUpdate();
			connection.close();
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("评论失败!",e);
		}
		response.sendRedirect("detail.jsp?pid="+photoid);
	}
}
