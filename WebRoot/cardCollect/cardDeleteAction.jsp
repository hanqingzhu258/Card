<%@ page import="java.sql.*"%>
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
			
			int id=Integer.parseInt(request.getParameter("id"));
			String driver="com.mysql.jdbc.Driver";
    		String url1="jdbc:mysql://localhost:3306/card";
    		String url2="?user=root&password=admin";
    		String url3="&useUnicode=true&characterEncoding=UTF-8";
    		String url=url1+url2+url3;
    		
    		try{
    			Class.forName(driver);
    			Connection  connection=DriverManager.getConnection(url);
    			String sql="delete from callingcard where id=?";
    			PreparedStatement ps=connection.prepareStatement(sql);
    		
    			ps.setInt(1,id);
 
    			ps.executeUpdate();
    		
    			ps.close();
    			connection.close();
    		
    %>	
    	<jsp:forward page="cardCollectAction.jsp"></jsp:forward>	
    <%
    	}catch(ClassNotFoundException e){
    		throw new RuntimeException(e);
    	}catch(SQLException e){
    		throw new RuntimeException(e);
    	}
    
     %>

  </body>
</html>
