<%@page import="com.Hugh.entity.StdEntity"%>
<%@page import="java.util.List"%>
<%@page import="com.Hugh.service.StdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>用户管理系统</title>
    <link rel="stylesheet" href="bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="1.css" type="text/css">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		if(session.getAttribute("userNum")==null){
			out.print("<script>alert('请先登录！');window.location.href='login.html';</script>");
		}
		else{
			request.setCharacterEncoding("UTF-8");
			StdService stdService = new StdService();
			//List<BookEntity> bookList = bookService.findAllBooks(); 
			List<StdEntity> stdlist = stdService.findAllStds();
	%>
<div  id="backg"></div>
    <a href="exit.jsp"><input class="btn-primary exit" type="button" value="注销" id="exit"></a>
    <!--导航栏-->
    <div class="container">
        <div class="htmlHead">
            <div class="navbar-header">
                <a class="navbar-brand">学生信息管理系统</a>
            </div>
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#info" data-toggle="tab">学生信息</a>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown">
                        查询信息
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#name_select" data-toggle="tab">按姓名查询</a></li>
                        <li><a href="#num_select" data-toggle="tab">按学号查询</a></li>
                        <li><a href="#sex_select" data-toggle="tab">按性别查询</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#insert" data-toggle="tab">添加信息</a>
                </li>
            </ul>
        </div>
    </div>

    <!--tab-->
    <div class="tab-content">
    
        <!--学生信息-->
        <div id="info" class="tab-pane fade in active">
            <div class="text-primary h3">欢迎您,管理员</div>
            <div id="outer"></div>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>年级</th>
                    <th>专业</th>
                    <th>出生日期</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                	<%
                	
                	for(int i=0;i<stdlist.size();i++){
                		request.setAttribute("id", stdlist.get(i).getId());
        				out.println("<tr><td>"+stdlist.get(i).getUserNum()+"</td>"+"<td>"+stdlist.get(i).getUserName()+"</td>"
        						+"<td>"+stdlist.get(i).getSex()+"</td>"+"<td>"+stdlist.get(i).getGrade()+"</td>"
        						+"<td>"+stdlist.get(i).getProf()+"</td>"+"<td>"+stdlist.get(i).getBorn()+"</td>"
        						+"<td><input type='button' class='btn-primary table_btn' value='更多' id='detail"
        						+stdlist.get(i).getId()+"'>&nbsp;"
        						+"<input type='button' class='btn-info table_btn' value='编辑' id='up"
        						+stdlist.get(i).getId()+"'>&nbsp;"
        						+"<a href='delete.jsp?id="+stdlist.get(i).getId()+"'><input type='button' class='btn-danger table_btn' value='删除' id='delete"
        						+stdlist.get(i).getId()+"'></a>&nbsp;</td><tr>");
        				
        				out.print("<script>"
        		                +"document.getElementById('up"+stdlist.get(i).getId()+"').onclick= function () {"
        		                 +"   document.getElementById('outer').style.display='block';"
        		                 +"   document.getElementById('update_alert"+stdlist.get(i).getId()+"').style.display='block';"

        		                 +"   document.getElementById('cancel"+stdlist.get(i).getId()+"').onclick=function(){"
        		                 +"       document.getElementById('outer').style.display='none';"
        		                 +"       document.getElementById('update_alert"+stdlist.get(i).getId()+"').style.display='none';"
        		                 +"   };"

        		                 +"   document.getElementById('outer').onclick=function(){"
        		                 +"       document.getElementById('outer').style.display='none';"
        		                 +"       document.getElementById('update_alert"+stdlist.get(i).getId()+"').style.display='none';"
        		                 +"   };"
        		                +"};"

        		               +" document.getElementById('detail"+stdlist.get(i).getId()+"').onclick= function () {"
        		               +"     document.getElementById('outer').style.display='block';"
        		               +"     document.getElementById('check_alert"+stdlist.get(i).getId()+"').style.display='block';"

        		               +"     document.getElementById('closeBtn"+stdlist.get(i).getId()+"').onclick=function(){"
        		               +"         document.getElementById('outer').style.display='none';"
        		               +"         document.getElementById('check_alert"+stdlist.get(i).getId()+"').style.display='none';"
        		               +"     };"

        		               +"     document.getElementById('outer').onclick=function(){"
        		               +"          document.getElementById('outer').style.display='none';"
        		               +"         document.getElementById('check_alert"+stdlist.get(i).getId()+"').style.display='none';"
        		               +"     };"
        		               +" };"

        		               +" document.getElementById('delete"+stdlist.get(i).getId()+"').onclick = function(){"
        		               +"  	if(confirm('确定删除该条信息?')){"
		        		       +"return true;"
        		            		   +"     }else {return false;"   
        		            		   +"   }"
        		            		   +"  }"
        		           +" </script>");
        				
        				out.print("<div id='update_alert"+stdlist.get(i).getId()+"' class='update_alert'>"
        					   +" <h3 class='text-center'>编辑信息</h3>"
        					    +" <form action='updateInfo?id="+stdlist.get(i).getId()+"' method='post' id='update_table'>"
						   +"   <div class='member'>"
						   +"         <span class='sp'>学号:</span>"
						   +"        <span class='prompt'></span>"
						   +"       <input type='text' class='form-control'  name='userNum' value='"+stdlist.get(i).getUserNum()+"'>"
						   +"   </div>"
        					   

        					   +"   <div class='member'>"
        					   +"       <span class='sp'>姓名:</span>"
        					   +"       <span class='prompt'></span>"
        					   +"       <input type='text' class='form-control'  name='userName' value='"+stdlist.get(i).getUserName()+"' >"
        					   +"   </div>"
        					   
 
							+" <div class='member'>"
							+" <span>性别:</span>"
							 +"<span class='form_radio'><input type='radio' name='sex' value='男'>&nbsp;男</span>"
							+" <span class='form_radio'><input type='radio' name='sex' value='女'>&nbsp;女</span>"
							+"</div>"
        					   

        					   +"   <div class='member'>"
        					   +"       <span>出生日期:</span>"
        					   +"       <span class='prompt'></span>"
        					   +"       <input  type='date' class='form-control' value='"+stdlist.get(i).getBorn()+"' name='born'>"
        					   +"   </div>"

        					   +"   <div class='member'>"
        					   +"       <span>年级:</span>"
        					   +"       <select class='form-control' name='grade'>"
        					   +"           <option>--请选择--</option>"
        					   +"           <option>2012</option>"
        					   +"           <option>2013</option>"
        					   +"           <option>2014</option>"
        					   +"           <option>2015</option>"
        					   +"           <option>2016</option>"
        					   +"           <option>2017</option>"
        					   +"       </select>"
        					   +"   </div>"

        					   +"   <div class='member'>"
        					   +"       <span class='sp'>专业:</span>"
        					   +"       <span class='prompt'></span>"
        					   +"       <input type='text' class='form-control' name='prof' value='"+stdlist.get(i).getProf()+"'>"
        					   +"   </div>"

        					   +"   <div class='member'>"
        					   +"       <span>政治面貌:</span>"
        					   +"       <select class='form-control' name='face'>"
        					   +"           <option>--请选择--</option>"
        					   +"           <option>群众</option>"
        					   +"           <option>共青团员</option>"
        					   +"           <option>中共预备党员</option>"
        					   +"           <option>中共党员</option>"
        					   +"       </select>"
        					   +"   </div>"

        					   +"   <div class='member'>"
        					   +"       <span class='sp'>联系电话:</span>"
        					   +"       <span class='prompt'></span>"
        					   +"       <input type='text' class='form-control' name='phone' value='"+stdlist.get(i).getPhone()+"'>"
        					   +"   </div>"

        					   +"   <div class='member'>"
        					   +"       <span class='sp'>电子邮箱:</span>"
        					   +"       <span class='prompt'></span>"
        					   +"       <input type='text' class='form-control' name='email' value='"+stdlist.get(i).getEmail()+"'>"
        					   +"   </div>"

        					   +"   <div class='member'>"
        					   +"       <span class='sp'>家庭住址:</span>"
        					   +"       <span class='prompt'></span>"
        					   +"       <input type='text' class='form-control' name='addr' value='"+stdlist.get(i).getAddr()+"'>"
        					   +"   </div>"
        					   +"   <!--按钮-->"
        					   +"   <input type='submit' value='确认修改' class='form-control btn-primary member'>"
        					   +"   <input type='button' value='取消' class='form-control btn-primary member' id='cancel"+stdlist.get(i).getId()+"'>"
        					   +" </form>"
        					   +"</div>"

        					   +"<!--更多-->"
        					   +"<div class='check_alert container' id='check_alert"+stdlist.get(i).getId()+"'>"
        					   +"<div class='text-right clos'><button class='closeBtn' id='closeBtn"+stdlist.get(i).getId()+"'>×</button></div>"
        					   +"    <div class='row' style='margin-top: 0px'>"
        					   +"   <div class='col-xs-4 col-xs-offset-1 text-right' style=	'font-size: 18px'>学号:</div>"
        					   +"   <div class='col-xs-6 text-center' style='font-size:18px;overflow: hidden'>"+stdlist.get(i).getUserNum()+"</div>"
        					   +" </div>"
        					   +"<div class='row' style='margin-top: 25px'>"
        					   +"   <div class='col-xs-4 col-xs-offset-1 text-right' style='font-size: 18px'>姓名:</div>"
        					   +"   <div class='col-xs-6 text-center' style='font-size: 18px;overflow: hidden'>"+stdlist.get(i).getUserName()+"</div>"
        					   +"</div>"
        					   +"<div class='row' style='margin-top: 25px'>"
        					   +"     <div class='col-xs-4 col-xs-offset-1 text-right' style='font-size: 18px'>性别:</div>"
        					   +"<div class='col-xs-6 text-center' style='font-size: 18px;overflow: hidden'>"+stdlist.get(i).getSex()+"</div>"
        					        +" </div>"
        					        +"    <div class='row' style='margin-top: 25px'>"
        					        +"        <div class='col-xs-4 col-xs-offset-1 text-right' style='font-size: 18px'>年级:</div>"
        					        +"        <div class='col-xs-6 text-center' style='font-size: 18px;overflow: hidden'>"+stdlist.get(i).getGrade()+"</div>"
        					        +"  </div>"
        					        +"    <div class='row' style='margin-top: 25px'>"
        					        +"      <div class='col-xs-4 col-xs-offset-1 text-right' style='font-size: 18px'>专业:</div>"
        					        +"      <div class='col-xs-6 text-center' style='font-size: 18px;overflow: hidden;'>"+stdlist.get(i).getProf()+"</div>"
        					        +" </div>"
        					        +" <div class='row' style='margin-top: 25px'>"
        					        +"<div class='col-xs-4 col-xs-offset-1 text-right' style='font-size: 18px'>出生日期:</div>"
        					        +"<div class='col-xs-6 text-center' style='font-size: 18px;overflow: hidden'>"+stdlist.get(i).getBorn()+"</div>"
        					        +"</div>"
        					        +"<div class='row' style='margin-top: 25px'>"
        					        +"     <div class='col-xs-4 col-xs-offset-1 text-right' style='font-size: 18px'>政治面貌:</div>"
        					        +"        <div class='col-xs-6 text-center' style='font-size: 18px;overflow: hidden'>"+stdlist.get(i).getFace()+"</div>"
        					        +"    </div>"
        					        +"  <div class='row' style='margin-top: 25px'>"
        					        +"      <div class='col-xs-4 col-xs-offset-1 text-right' style='font-size: 18px'>联系电话:</div>"
        					        +"     <div class='col-xs-6 text-center' style='font-size: 18px;overflow: hidden'>"+stdlist.get(i).getPhone()+"</div>"
        					        +"  </div>"
        					        +"  <div class='row' style='margin-top: 25px'>"
        					        +" <div class='col-xs-4 col-xs-offset-1 text-right' style='font-size: 18px'>电子邮箱:</div>"
        					        +"   <div class='col-xs-6 text-center' style='font-size: 18px;overflow: hidden'>"+stdlist.get(i).getEmail()+"</div>"
        					        +"   </div>"
        					        +"  <div class='row' style='margin-top: 25px'>"
        					        +"    <div class='col-xs-4 col-xs-offset-1 text-right' style='font-size: 18px'>家庭住址:</div>"
        					        +"    <div class='col-xs-6 text-center' style='font-size: 18px;overflow: hidden'>"+stdlist.get(i).getAddr()+"</div>"
        					        +"  </div>"
        					        +"</div>");
        			}
                	%>
                </tbody>
            </table>
        </div>

    <!--按姓名查询-->
    <div id="name_select" class="tab-pane fade select">
        <span style="float: left;margin-top: 6px;margin-right:20px;font-size: 20px" class="text-primary">请输入姓名:</span>
        <form action="selectByNameServlet?index=userName" method="post">
            <input type ="text" class="form-control table_ipt" name="user">
            <input type="submit" class="btn-primary pos update_btn" value="确认">
        </form>
    </div>

    <!--按学号查询-->
    <div id="num_select" class="tab-pane fade select">
        <span style="float: left;margin-top: 6px;margin-right:20px;font-size: 20px" class="text-primary">请输入学号:</span>
        <form action="selectByNameServlet?index=userNum" method="post">
            <input type ="text" class="form-control table_ipt" name="user">
            <input type="submit" class="btn-primary pos update_btn" value="确认">
        </form>
    </div>

    <!--按性别查询-->
    <div id="sex_select" class="tab-pane fade select">
        <span style="float: left;margin-top: 6px;margin-right:20px;font-size: 20px" class="text-primary">请选择性别:</span>
        <form action="selectByNameServlet?index=sex" method="post">
            <input type="radio" name="user" value="男" style="margin-left: 60px;margin-top: 13px;">&nbsp;&nbsp;男
            <input type="radio" name="user" value="女" style="margin-left: 50px">&nbsp;&nbsp;女
            <input type="submit" class="btn-primary pos update_btn" value="确认">
        </form>
    </div>
        
		<!--添加信息-->
        <div id="insert" class="tab-pane fade">
            <form method="post" action="AddStdServlet" id="insert_table" name="upd">
                <div class="member">
                    <span class="sp">学号:</span>
                    <span class="prompt" id="pro1"></span>
                    <input type="text" class="form-control" id="userNum" name="userNum">
                </div>

                <div class="member">
                    <span class="sp">姓名:</span>
                    <span class="prompt" id="pro2"></span>
                    <input type="text" class="form-control" id="userName" name="userName">
                </div>

                <div class="member">
                    <span>性别:</span>
                    <span class="form_radio"><input type="radio" name="sex" value="男">&nbsp;男</span>
                    <span class="form_radio"><input type="radio" name="sex" value="女">&nbsp;女</span>
                </div>

                <div class="member">
                    <span>出生日期:</span>
                    <span class="prompt" id="pro3"></span>
                    <input  type="date" class="form-control" id="sure" name="born">
                </div>

                <div class="member">
                    <span>年级:</span>
                    <select class="form-control" name="grade">
                        <option>--请选择--</option>
                        <option>2012</option>
                        <option>2013</option>
                        <option>2014</option>
                        <option>2015</option>
                        <option>2016</option>
                        <option>2017</option>
                    </select>
                </div>

                <div class="member">
                    <span class="sp">专业:</span>
                    <span class="prompt" id="pro5"></span>
                    <input type="text" class="form-control" id="userProf" name="prof">
                </div>

                <div class="member">
                    <span>政治面貌:</span>
                    <select class="form-control" name="face" >
                        <option>--请选择--</option>
                        <option>群众</option>
                        <option>共青团员</option>
                        <option>中共预备党员</option>
                        <option>中共党员</option>
                    </select>
                </div>

                <div class="member">
                    <span class="sp">联系电话:</span>
                    <span class="prompt" id="pro6"></span>
                    <input type="text" class="form-control" id="userPho" name="phone">
                </div>

                <div class="member">
                    <span class="sp">电子邮箱:</span>
                    <span class="prompt" id="pro7"></span>
                    <input type="text" class="form-control" id="userEm" name="email">
                </div>

                <div class="member">
                    <span class="sp">家庭住址:</span>
                    <span class="prompt" id="pro8"></span>
                    <input type="text" class="form-control" id="userAdd" name="addr">
                </div>
                <!--按钮-->
                <input type="button" value="添加" class="form-control btn-primary member" id="btn" onclick="test()" style="margin-bottom: 20px">
            </form>
            <script>
                function test(){
                	 	if(document.getElementById("userNum").value != ""){
                         document.getElementById("pro1").innerHTML="&nbsp";
                     }
                     if(document.getElementById("userName").value != ""){
                         document.getElementById("pro2").innerHTML="&nbsp";

                     }
                     if(document.getElementById("userNum").value == ""){
                         document.getElementById("pro1").innerHTML="* 请输入学号";
                         window.location.href="#pro1";
                         return false;
                     }
                     if(document.getElementById("userName").value == ""){
                         document.getElementById("pro2").innerHTML="* 请输入姓名";
                         window.location.href="#pro1";
                         return false;
                     }
             	    document.forms['upd'].submit();
                }
            </script>
        </div>
    </div>
    <%
		}
    %>
</body>
</html>