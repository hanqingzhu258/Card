<%@page import="java.awt.Window"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>login</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	
	function login(){
	
		var userName=document.getElementById("userName");
		var password=document.getElementById("password");
		
		if(userName.length>6){
			alert("用户名不得多与六位！！！");
		}else if(userName.value==""){
			alert("用户名不能为空！！！");
		}else if(password.length>10){
			alert("密码不能超过十位！！！");
		}else if(password.value==""){
			alert("密码不能为空！！！");
		}else{
			checkUser();
		}
	
	}
	
	function checkUser(){
		myform.submit();
	}
	
	function register(){
		window.location.href="register/register.jsp";
	}
	
	
	</script>
	

  </head>
  
  <body>
    
    <%
    	request.setCharacterEncoding("utf8");
    	String result=request.getParameter("result");
    	//System.out.print("result"+result);
    	if(result==null){}
    	else if(result.equals("0")){
     %>
     <script type="text/javascript" language="javascript">
		alert("您的用户名或密码错误");
	</script>
    <%
    	}else{
    %>
    <script type="text/javascript" language="javascript">
		alert("登录成功，即将前往主页");
		window.location.href="userHomePage/userHomePage.html";
	</script>
	<%
		}
	 %>
    
    <form method="post" action="login/loginCheck.jsp" name="myform">
    <span>用户名：</span><input type="text" name="userName" id="userName">
    <span>用户名不能为空且不能多于六个字符</span><br/>
    <span>密&nbsp;&nbsp;码：</span>
    <input type="password" name="password" id="password">
    <span>密码不能为空且不多于十个字符</span><br/>
    <input type="button" value="登录" onclick="login()"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="注册" onclick="register()"/>
    </form>

  </body>
</html>
