package com.Hugh.dataSourse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ManageSQL {
	// 用于执行查询操作的方法
	public ResultSet exeQuery(final Connection conn, final String strSQL, final Object... params) {
		try {
			PreparedStatement ps = conn.prepareStatement(strSQL);
			for (int i = 0; i < params.length; i++) {
				ps.setObject(i + 1, params[i]);
			}
			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	//
	public int exeUpdate(final Connection conn, final String strSQL, final Object... params) {
		try {
			PreparedStatement ps = conn.prepareStatement(strSQL);
			for (int i = 0; i < params.length; i++) {
				ps.setObject(i + 1, params[i]);
			}
			int affectedRows = ps.executeUpdate();
			System.out.println("21" + affectedRows);
			return affectedRows;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
}
