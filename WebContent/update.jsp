<%@page import="com.Hugh.service.StdService"%>
<%@page import="com.Hugh.entity.StdEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
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
	int rows = stdService.updateStd(id, std);
	 
	if(rows>0){
		//out.print("<script>alert('更新成功');window.location.href='showBooks.jsp'</script>");
		response.sendRedirect("manager.jsp");
	}else{
		out.print("<script>alert('修改失败');window.location.href='manager.jsp'</script>");
	}
	%>
</body>
</html>