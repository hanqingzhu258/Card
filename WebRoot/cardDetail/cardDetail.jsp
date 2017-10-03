<%@page import="java.sql.*"%>
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
	
		function updateCard(){
		
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
    		request.setCharacterEncoding("utf8");
    		String result=request.getParameter("result");
    		//System.out.print(result);
    		if(result==null){}
    		else if(result.equals("1")){
     	%>
     	<script type="text/javascript" language="javascript">
			alert("名片修改成功！点击确定查看名片列表！");
			window.location.href="cardList/cardListAction.jsp";
		</script>
    	<%
    		}
    	 %>
    
		<%
			int id=Integer.parseInt(request.getParameter("id"));
			
			String driver="com.mysql.jdbc.Driver";
    		String url1="jdbc:mysql://localhost:3306/card";
    		String url2="?user=root&password=admin";
    		String url3="&useUnicode=true&characterEncoding=UTF-8";
    		String url=url1+url2+url3;
   
    		try{
    			Class.forName(driver);
    			Connection connection=DriverManager.getConnection(url);
    			
    			String sql="select * from callingcard where id=?";
    			PreparedStatement ps=connection.prepareStatement(sql);
    			
    			ps.setInt(1, id);
    			
    			ResultSet rs=ps.executeQuery();
    			
    			rs.beforeFirst();
    			if(rs.next()){
    	%>	
			<form action="cardDetail/cardUpdateAction.jsp?" name="myform">
				<input type="hidden" name="id" id="id" value="<%=rs.getString(1)%>"><br/>
				<span>姓名：</span>
				<input type="text" name="name" id="name" value="<%=rs.getString(2)%>"><br/>
				<span>职务：</span>
				<input type="text" name="post" id="post" value="<%=rs.getString(3)%>"><br/>
				<span>邮箱：</span>
				<input type="text" name="email" id="email" value="<%=rs.getString(4)%>"><br/>
				<span>公司：</span>
				<input type="text" name="company" id="company" value="<%=rs.getString(5)%>"><br/>
				<span>地址：</span>
				<input type="text" name="location" id="location" value="<%=rs.getString(6)%>"><br/>
				<span>电话：</span>
				<input type="text" name="phone" id="phone" value="<%=rs.getString(7)%>"><br/>
				<span>手机：</span>
				<input type="text" name="mobilePhone" id="mobilePhone" value="<%=rs.getString(8)%>"><br/>
				<input type="button" value="修改" onclick="updateCard()">

		</form>   	
    		<%
    			}
    		}catch(ClassNotFoundException e){
    			throw new RuntimeException(e);
    		}catch(SQLException e){
    			throw new RuntimeException(e);
    		}
    		 %>
    	

  </body>
</html>
