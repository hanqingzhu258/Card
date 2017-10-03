<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>register</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script type="text/javascript">
	
		function register(){
			var userName=document.getElementById("userName");
			var password=document.getElementById("password");
			var password2=document.getElementById("password2");
		
			if(userName.length>6){
				alert("用户名不得多与六位！！！");
			}else if(userName.value==""){
				alert("用户名不能为空！！！");
			}else if(password.length>10){
				alert("密码不能超过十位！！！");
			}else if(password.value==""){
				alert("密码不能为空！！！");
			}else if(password.value!=password2.value){
				alert("两次密码不一致！！！");
			}else{
				myform.submit();
			}
	
		}
	
	</script>

  </head>
  
  <body>
    
    <%
    	request.setCharacterEncoding("utf8");
    	String result=request.getParameter("result");
    	//System.out.print(result);
    	if(result==null){}
    	else if(result.equals("1")){
     %>
     <script type="text/javascript" language="javascript">
		alert("注册成功！点击确定返回登录页面！");
		window.location.href="login/login.jsp";
	</script>
    <%
    	}
     %>
    
    
    <form method="post" action="register/registerAction.jsp" name="myform">
    <span>请输入您的用户名：</span><input type="text" name="userName" id="userName">
    <span>用户名不能为空且不能多于六个字符</span><br/>
    <span>请输入您的密&nbsp;&nbsp;码：</span>
    <input type="password" name="password" id="password">
    <span>密码不能为空且不多于十个字符</span><br/>
    <span>请确认您的密&nbsp;&nbsp;码：</span>
    <input type="password" name="password2" id="password2"><br/>
    <input type="button" value="注册" onclick="register()"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" value="重置"/>
    </form>
<a href="login/login.jsp">点击此处返回登录页面</a>
  </body>
</html>
