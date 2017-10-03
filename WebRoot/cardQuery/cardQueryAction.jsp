<%@ page import="java.sql.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cardQueryAction.jsp' starting page</title>
    
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

    		String name=request.getParameter("condition");
    	
    		String driver="com.mysql.jdbc.Driver";
    		String url1="jdbc:mysql://localhost:3306/card";
    		String url2="?user=root&password=admin";
    		String url3="&useUnicode=true&characterEncoding=UTF-8";
    		String url=url1+url2+url3;
    		
    		List<Map<String,String>> cardList=new ArrayList<Map<String,String>>();
    		
    		try{
    			Class.forName(driver);
    			Connection  connection=DriverManager.getConnection(url);
    			String sql="select id,name,post from callingcard where isDelete=0 and name like ? and user=?";
    			PreparedStatement ps=connection.prepareStatement(sql);
    			
    			ps.setString(1, "%"+name+"%");
    			ps.setInt(2, (Integer)session.getAttribute("user"));
    		
    			ResultSet rs=ps.executeQuery();
    		
    			rs.beforeFirst();
    			while(rs.next()){
    				Map<String,String> cardMap=new HashMap<String,String>();
    				cardMap.put("id", String.valueOf(rs.getInt(1)));
    				cardMap.put("name",rs.getString(2));
    				cardMap.put("post",rs.getString(3));
    				
    				cardList.add(cardMap);
    			}
    		
    				request.setAttribute("cardList", cardList);
    				rs.close();
					ps.close();
					connection.close();

    %>	
    	<jsp:forward page="cardQuery.jsp?result=1"></jsp:forward>	
    <%
    	}catch(ClassNotFoundException e){
    		throw new RuntimeException(e);
    	}catch(SQLException e){
    		throw new RuntimeException(e);
    	}
    
     %>

  </body>
</html>
