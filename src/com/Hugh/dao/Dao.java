package com.Hugh.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Hugh.dataSourse.ManageSQL;
import com.Hugh.entity.StdEntity;

public class Dao {
	public String command;

	// 添加信息
	public int insertStd(final StdEntity std, final Connection conn) {
		String userName = std.getUserName();
		String userNum = std.getUserNum();
		String sex = std.getSex();
		String born = std.getBorn();
		String face = std.getFace();
		String grade = std.getGrade();
		String prof = std.getProf();
		int phone = std.getPhone();
		String email = std.getEmail();
		String addr = std.getAddr();

		command = "insert into info(userNum,userName,sex,born,face,grade,prof,phone,email,addr) values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params = new Object[] { userNum, userName, sex, born, face, grade, prof, phone, email, addr };

		ManageSQL ms = new ManageSQL();
		return ms.exeUpdate(conn, command, params);
	}

	// 通过ID查询
	public StdEntity selectStdById(final int id, final Connection conn) {
		command = "select * from info where id=?";
		Object[] params = new Object[] { id };
		ManageSQL ms = new ManageSQL();
		ResultSet rs = ms.exeQuery(conn, command, params);
		try {
			if (rs.next()) {
				StdEntity std = new StdEntity();
				std.setId(id);
				std.setUserNum(rs.getString("userNum"));
				std.setUserName(rs.getString("userName"));
				std.setSex(rs.getString("sex"));
				std.setBorn(rs.getString("born"));
				std.setFace(rs.getString("face"));
				std.setGrade(rs.getString("grade"));
				std.setProf(rs.getString("prof"));
				std.setPhone(rs.getInt("Phone"));
				std.setEmail(rs.getString("email"));
				std.setAddr(rs.getString("addr"));
				return std;
			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public ResultSet selectStudents(final Connection connection, String sql, final String index) {
		String strSQL = "select * from info where " + index + " like ?";
		sql = "%" + sql + "%";
		String[] params = new String[] { sql };
		ManageSQL sqlManager = new ManageSQL();
		ResultSet rs = sqlManager.exeQuery(connection, strSQL, params);
		return rs;
	}

	// 全查
	public ResultSet selectAllStds(final Connection conn) {
		command = "select * from info";
		Object[] params = new Object[] {};
		ManageSQL msManageSQL = new ManageSQL();

		ResultSet rs = msManageSQL.exeQuery(conn, command, params);
		return rs;
	}

	// 修改操作
	public int updateStdById(final Connection conn, final int id, final StdEntity std) {
		// 1、获取属性
		String userName = std.getUserName();
		String userNum = std.getUserNum();
		String sex = std.getSex();
		String born = std.getBorn();
		String face = std.getFace();
		String grade = std.getGrade();
		String prof = std.getProf();
		int phone = std.getPhone();
		String email = std.getEmail();
		String addr = std.getAddr();

		String command = "update info set  userNum=?, userName=?, sex=?, born=?, face=?, grade=?, prof=?, phone=?, email=?, addr=? where id=?";
		Object[] params = new Object[] { userNum, userName, sex, born, face, grade, prof, phone, email, addr, id };
		ManageSQL msManageSQL = new ManageSQL();
		return msManageSQL.exeUpdate(conn, command, params);
	}

	// 删除操作
	public int delStdById(final Connection conn, final int id) {
		command = "delete from info where id=?";
		Object[] params = new Object[] { id };
		ManageSQL msManageSQL = new ManageSQL();
		int affectedRows = msManageSQL.exeUpdate(conn, command, params);

		return affectedRows;
	}
}
