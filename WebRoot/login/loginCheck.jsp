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

  </head>
  
  <body>
    
		<%
			request.setCharacterEncoding("utf8");
			String userName=request.getParameter("userName");
			String password=request.getParameter("password");
			
			/* System.out.println("userName"+userName);
			System.out.println("password"+password); */
			
			String driver="com.mysql.jdbc.Driver";
			String url1="jdbc:mysql://localhost:3306/card";
			String url2="?user=root&password=admin";
			String url3="&useUnicode=true&characterEncoding=UTF-8";
			String url=url1+url2+url3;
			
			try{
				Class.forName(driver);
				Connection connection=DriverManager.getConnection(url);
				String sql="select * from user where userName=? and password=?";
				PreparedStatement ps=connection.prepareStatement(sql);
				
				ps.setString(1,userName);
				ps.setString(2,password);
				
				//System.out.println("userName"+userName);
				//System.out.println("password"+password); 
				
				ResultSet rs=ps.executeQuery();
				
				//System.out.println("boolean"+rs.next());
			
				
				if(rs.next()){
					session.setAttribute("user", new Integer(rs.getInt(1)));
					rs.close();
					ps.close();
					connection.close();
		%>	
					<jsp:forward page="login.jsp?result=1"></jsp:forward>
		<% 	
				}else{
							rs.close();
							ps.close();
							connection.close();
		%>
					<jsp:forward page="login.jsp?result=0"></jsp:forward>		
		<%
				}		
			}catch(SQLException e){
				throw new RuntimeException(e);
			}catch(ClassNotFoundException e){
				throw new RuntimeException(e);
			}
		 %>
		
  </body>
</html>
