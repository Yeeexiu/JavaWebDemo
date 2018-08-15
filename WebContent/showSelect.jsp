<%@page import="java.util.List"%>
<%@page import="com.Hugh.entity.StdEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="1.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
		<table class="table table-striped">
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年级</th>
                <th>专业</th>
                <th>出生日期</th>
                <th>政治面貌</th>
                <th>联系电话</th>
                <th>电子邮箱</th>
                <th>家庭住址</th>
            </tr>
            </thead>
            <tbody>
	<%
		List<StdEntity> stdlist = (List<StdEntity>) session.getAttribute("stdlist");
	for(int i=0;i<stdlist.size();i++){
		request.setAttribute("id", stdlist.get(i).getId());
		out.println("<tr><td>"+stdlist.get(i).getUserNum()+"</td>"+"<td>"+stdlist.get(i).getUserName()+"</td>"
				+"<td>"+stdlist.get(i).getSex()+"</td>"+"<td>"+stdlist.get(i).getGrade()+"</td>"
				+"<td>"+stdlist.get(i).getProf()+"</td>"+"<td>"+stdlist.get(i).getBorn()+"</td>"
				+"<td>"+stdlist.get(i).getFace()+"</td>"+"<td>"+stdlist.get(i).getPhone()+"</td>"
				+"<td>"+stdlist.get(i).getEmail()+"</td>"+"<td>"+stdlist.get(i).getAddr()+"</td>");
	}
	%>
	       </tbody>
        </table>
</body>
</html>