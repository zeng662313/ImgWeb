package com.yumoxuan.pic.web;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.yumoxuan.pic.utils.*;
@WebServlet("/change_do")
public class change_img extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public change_img() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		if(session.getAttribute("nickname")==null) {
			response.sendRedirect("login.html");
		}
		Connection connection = null;
		PreparedStatement prepareStatement= null;
		int photoid=Integer.parseInt(request.getParameter("photoid")) ;
		String title=request.getParameter("title");
		String address=request.getParameter("address");
		String sql="updata img imgname=? imgurl=? where imgid=?";
		try {
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, photoid);
			prepareStatement.setString(2, title);
			prepareStatement.setString(3, address);
			prepareStatement.executeUpdate();
			connection.close();
			prepareStatement.close();
			response.sendRedirect("edit.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
