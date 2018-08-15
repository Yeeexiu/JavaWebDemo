package com.Hugh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Hugh.entity.StdEntity;
import com.Hugh.service.StdService;

public class showAllStdsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		StdService stdService = new StdService();
		List<StdEntity> std = stdService.findAllStds();

		if (std.size() > 0) {
			request.getSession().setAttribute("booklist", std);
			request.getRequestDispatcher("manager.jsp").forward(request, response);
		} else {
			out.println("没有学生信息");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
