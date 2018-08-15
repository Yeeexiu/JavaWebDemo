package com.Hugh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Hugh.entity.StdEntity;
import com.Hugh.service.StdService;

@WebServlet("/updateInfo")
public class updateInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		int id = Integer.parseInt(request.getParameter("id"));
		String userNum = request.getParameter("userNum");
		String userName = request.getParameter("userName");
		String sex = request.getParameter("sex");
		String born = request.getParameter("born");
		String face = request.getParameter("face");
		String grade = request.getParameter("grade");
		String prof = request.getParameter("prof");
		int phone = Integer.parseInt(request.getParameter("phone"));
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");

		StdEntity std = new StdEntity(userNum, userName, sex, born, grade, prof, face, phone, email, addr);
		StdService stdService = new StdService();
		int result = stdService.updateStd(id, std);

		if (result > 0) {
			// out.print("<script>alert('更新成功');window.location.href='showBooks.jsp'</script>");
			response.sendRedirect("manager.jsp");
		} else {
			out.print("<script>alert('更新失败');window.location.href='manager.jsp'</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
