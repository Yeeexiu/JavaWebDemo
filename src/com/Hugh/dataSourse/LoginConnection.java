package com.Hugh.dataSourse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class LoginConnection {
	// 1、打开一个数据库连接
	public Connection openConnection() {
		final String url = "jdbc:mysql://localhost:3306/stdDB";
		final String account = "root";
		final String password = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, account, password);
			return connection;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	// 2、关闭一个数据库链接
	public void closeConnection(final Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
