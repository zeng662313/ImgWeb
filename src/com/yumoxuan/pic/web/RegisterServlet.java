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

import com.yumoxuan.pic.utils.JdbcUtils;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//��ȡǰ�˴������Ĳ���
		request.setCharacterEncoding("UTF-8");
		String nickname = request.getParameter("nickname");
		String loginname = request.getParameter("loginname");
		String loginpwd = request.getParameter("loginpwd");
	
		
		
		//�洢mysql���ݿ�
		Connection connection = null;
		PreparedStatement prepareStatement= null;
		try {
			connection = JdbcUtils.getConnection();
			
			String sql = "insert into user(nickname,loginname,loginpwd,email,phone,address,gender,sumary,hobby) value(?,?,?,?,?,?,?,?,?)";
			prepareStatement = connection.prepareStatement(sql);//ͨ��
			prepareStatement.setString(1,nickname );//�����ձ���滻value���������
			prepareStatement.setString(2,loginname );
			prepareStatement.setString(3,loginpwd );
			prepareStatement.execute();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(connection, prepareStatement);
		}
		
		
		//��Ӧ�����
		response.getWriter().write("register success");
		
		
	}

}
