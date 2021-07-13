package com.yumoxuan.pic.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.tomcat.util.descriptor.tld.TldRuleSet.Variable;

public class JdbcUtils {
	
	static {
		//1���������౻���ص��ڴ��ʱ���Զ�ע������
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//2����ȡ����
	private static String url = "jdbc:mysql://localhost:3306/pic?useUnicode=true&characterEncoding=utf-8&useSSL=false";  
	private static String user = "root";
	private static String password = "662313";
	
	/**
	 * ��ȡ���ݿ�����
	 * @return
	 */
	public static Connection getConnection() {
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("��ȡ���ݿ�ʧ��");
		}
		return connection;
	}
	
	
	
	/**
	 *  �ͷ���Դ
	 * @param connection
	 * @param prepareStatement
	 */
	public static void close( Connection connection ,PreparedStatement prepareStatement  ) {
		if(prepareStatement!=null) {
			try {
				prepareStatement.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(connection!=null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	
	
}
