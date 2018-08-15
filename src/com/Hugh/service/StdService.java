package com.Hugh.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Hugh.dao.Dao;
import com.Hugh.dataSourse.LoginConnection;
import com.Hugh.entity.StdEntity;

public class StdService {
	// 添加
	public int addStd(StdEntity std) {
		// 打开数据库
		LoginConnection connectionManager = new LoginConnection();
		Connection conn = connectionManager.openConnection();

		Dao dao = new Dao();
		int affectedRows = dao.insertStd(std, conn);
		// 关闭数据库
		connectionManager.closeConnection(conn);
		return affectedRows;
	}

	// 通过id查询
	public StdEntity findStdById(final int id) {
		LoginConnection connectionManager = new LoginConnection();
		Connection conn = connectionManager.openConnection();
		Dao Dao = new Dao();
		StdEntity std = Dao.selectStdById(id, conn);
		return std;
	}

	// 通过
	public List<StdEntity> findStudents(String sql, final String index) {
		LoginConnection connectionManager = new LoginConnection();
		Connection conn = connectionManager.openConnection();
		List<StdEntity> stdlist = new ArrayList<StdEntity>();
		Dao studentDao = new Dao();
		ResultSet rs = null;
		try {
			rs = studentDao.selectStudents(conn, sql, index);
			while (rs.next()) {
				StdEntity std = new StdEntity();
				std.setId(rs.getInt("id"));
				std.setUserNum(rs.getString("userNum"));
				std.setUserName(rs.getString("userName"));
				std.setSex(rs.getString("sex"));
				std.setBorn(rs.getString("born"));
				std.setFace(rs.getString("face"));
				std.setGrade(rs.getString("grade"));
				std.setProf(rs.getString("prof"));
				std.setPhone(rs.getInt("phone"));
				std.setEmail(rs.getString("email"));
				std.setAddr(rs.getString("addr"));
				stdlist.add(std);
			}
			return stdlist;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			connectionManager.closeConnection(conn);
		}
	}

	// 查找全部
	public List<StdEntity> findAllStds() {
		LoginConnection loginConnection = new LoginConnection();
		Connection conn = loginConnection.openConnection();

		List<StdEntity> stdlist = new ArrayList<StdEntity>();

		Dao Dao = new Dao();
		ResultSet rs = Dao.selectAllStds(conn);
		try {
			while (rs.next()) {
				StdEntity std = new StdEntity();
				std.setId(rs.getInt("id"));
				std.setUserNum(rs.getString("userNum"));
				std.setUserName(rs.getString("userName"));
				std.setSex(rs.getString("sex"));
				std.setBorn(rs.getString("born"));
				std.setFace(rs.getString("face"));
				std.setGrade(rs.getString("grade"));
				std.setProf(rs.getString("prof"));
				std.setPhone(rs.getInt("phone"));
				std.setEmail(rs.getString("email"));
				std.setAddr(rs.getString("addr"));
				stdlist.add(std);
			}
			return stdlist;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			loginConnection.closeConnection(conn);
		}
	}

	// 修改信息
	public int updateStd(final int id, final StdEntity std) {
		LoginConnection connectionManager = new LoginConnection();
		Connection conn = connectionManager.openConnection();

		Dao Dao = new Dao();
		int affectR = -1;
		affectR = Dao.updateStdById(conn, id, std);
		connectionManager.closeConnection(conn);
		return affectR;
	}

	// 删除信息
	public int removeStdById(final int id) {
		LoginConnection connectionManager = new LoginConnection();
		Connection conn = connectionManager.openConnection();

		Dao Dao = new Dao();
		int rows = Dao.delStdById(conn, id);
		connectionManager.closeConnection(conn);
		return rows;
	}
}
