package com.Hugh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Hugh.entity.StdEntity;
import com.Hugh.service.StdService;

@WebServlet("/selectByNameServlet")
public class selectByNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String user = request.getParameter("user");
		String index = request.getParameter("index");
		StdService stdService = new StdService();
		List<StdEntity> stdlist = stdService.findStudents(user, index);
		if (stdlist != null) {
			request.getSession().setAttribute("stdlist", stdlist);
			request.getRequestDispatcher("showSelect.jsp").forward(request, response);
		} else {
			out.println("<script>alert('查询失败');location.href='maneger.jsp'</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
