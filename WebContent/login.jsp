<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("userNum", request.getParameter("userNum"));
	
		String userNum = request.getParameter("userNum");
		String userPwd = request.getParameter("userPwd");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/stdDB","root", "");
		
		PreparedStatement ps = connection.prepareStatement("select * from login where userNum=?");
		ps.setString(1, userNum);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			if(rs.getString("userPwd").equals(userPwd)){
				if(rs.getInt("ifManager")==1)
					out.print("<script>window.location.href='manager.jsp?id="+rs.getInt("id")+"'</script>");
				else
					out.print("<script>window.location.href='student.jsp?id="+rs.getInt("id")+"'</script>");
			}else{
				out.print("<script>alert('学号或密码错误！');window.location.href='login.html'</script>");
			}
		}else{
			out.print("<script>alert('学号或密码错误！');window.location.href='login.html'</script>");
		}
		
	%>
</body>
</html>