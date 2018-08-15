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

@WebServlet("/updateMyInfo")
public class updateMyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(">>>>>>id:" + id + "<<<<<<<" + "<br>");
		String userNum = request.getParameter("userNum");
		System.out.println(">>>>>>usernum:" + userNum + "<<<<<<<" + "<br>");
		String userName = request.getParameter("userName");
		System.out.println(">>>>>>username:" + userName + "<<<<<<<" + "<br>");
		String sex = request.getParameter("sex");
		System.out.println(">>>>>>sex:" + sex + "<<<<<<<" + "<br>");
		String born = request.getParameter("born");
		System.out.println(">>>>>>b:" + born + "<<<<<<<" + "<br>");
		String face = request.getParameter("face");
		System.out.println(">>>>>>face:" + face + "<<<<<<<" + "<br>");
		String grade = request.getParameter("grade");
		System.out.println(">>>>>>grade:" + grade + "<<<<<<<" + "<br>");
		String prof = request.getParameter("prof");
		System.out.println(">>>>>>prof:" + prof + "<<<<<<<" + "<br>");
		int phone = Integer.parseInt(request.getParameter("phone"));
		System.out.println(">>>>>>phone:" + phone + "<<<<<<<" + "<br>");
		String email = request.getParameter("email");
		System.out.println(">>>>>>email:" + email + "<<<<<<<" + "<br>");
		String addr = request.getParameter("addr");
		System.out.println(">>>>>>addr:" + addr + "<<<<<<<" + "<br>");

		StdEntity std = new StdEntity(userNum, userName, sex, born, grade, prof, face, phone, email, addr);
		StdService stdService = new StdService();
		int result = stdService.updateStd(id, std);

		if (result > 0) {
			// out.print("<script>alert('更新成功');window.location.href='showBooks.jsp'</script>");
			response.sendRedirect("student.jsp");
		} else {
			out.print("<script>alert('更新失败');window.location.href='student.jsp'</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
