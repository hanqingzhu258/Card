
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
	
		function newCard(){
		
			var name=document.getElementById("name");
			var post=document.getElementById("post");
			var email=document.getElementById("email");
			var company=document.getElementById("company");
			var location=document.getElementById("location");
			var phone=document.getElementById("phone");
			var mobilePhone=document.getElementById("mobilePhone");
			
			if(name.value==""||post.value==""||email==""||company==""
			||location==""||location==""||phone==""||mobilePhone==""){
				alert("您所设置的参数有空值！！！");
			}else{
				
				myform.submit();
			}
			
		}
	</script>


  </head>
  
  <body>
    	
    	<%
    		request.setCharacterEncoding("UTF-8");
    		String result=request.getParameter("result");
    		//System.out.print(result);
    		if(result==null){}
    		else if(result.equals("1")){
     	%>
     	<script type="text/javascript" language="javascript">
			alert("名片新建成功！点击确定查看名片列表！");
			window.location.href="cardList/cardListAction.jsp";
		</script>
    	<%
    		}
    	 %>
    	
    	
    	<form action="cardNew/cardNewAction.jsp" name="myform" method="post">
		<span>姓名：</span>
		<input type="text" name="name" id="name"><br/>
		<span>职务：</span>
		<input type="text" name="post" id="post"><br/>
		<span>邮箱：</span>
		<input type="text" name="email" id="email"><br/>
		<span>公司：</span>
		<input type="text" name="company" id="company"><br/>
		<span>地址：</span>
		<input type="text" name="location" id="location"><br/>
		<span>电话：</span>
		<input type="text" name="phone" id="phone"><br/>
		<span>手机：</span>
		<input type="text" name="mobilePhone" id="mobilePhone"><br/>
		<input type="button" value="提交" onclick="newCard()">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value="重置">
		</form>

  </body>
</html>
