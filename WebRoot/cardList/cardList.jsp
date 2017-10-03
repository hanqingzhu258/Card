<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cardListAction.jsp' starting page</title>
    
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
    		@SuppressWarnings("unchecked")
    		List<Map<String,String>> cardList=(List<Map<String,String>>)request.getAttribute("cardList");
    		if(cardList!=null){
    			for(Map<String,String> map:cardList){
    	%>
    			<span><%=map.get("name")%></span>
    			<span><%=map.get("post")%></span>
    			<span><a href="cardDetail/cardDetail.jsp?id=<%=map.get("id")%>">详情</a></span>
    			<span><a href="cardList/cardDeleteAction.jsp?id=<%=map.get("id")%>">删除</a></span>
    			<br/><br/>
		<%
				}
			}else{}	
		 %>
  </body>
</html>
