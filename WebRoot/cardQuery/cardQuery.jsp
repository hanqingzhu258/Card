<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cardQuery.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  		<script type="text/javascript">
  			
  			function query(){
  				
  				var condition=document.getElementById("condition");
  				if(condition==null){
  					alert("您没有输入任何字符！");
  				}else{
  					myform.submit();
  				}
  				
  			}
  		
  		</script>
  
  <body>
   
		<form action="cardQuery/cardQueryAction.jsp" name="myform">
		
		<input type="text" name="condition" id="condition">&nbsp;&nbsp;
		<input type="button" onclick="query()" value="按姓名查询">
		
		</form>
		
		<%
		
			String result=request.getParameter("result");
			if(result!=null){
    			request.setCharacterEncoding("utf8");
    			@SuppressWarnings("unchecked")
    			List<Map<String,String>> cardList=(List<Map<String,String>>)request.getAttribute("cardList");
    			if(cardList!=null){
    				for(Map<String,String> map:cardList){
    	%>
    				<span><%=map.get("name")%></span>
    				<span><%=map.get("post")%></span>
    				<span><a href="cardDetail/cardDetail.jsp?id=<%=map.get("id")%>">详情</a></span>
    				<br/><br/>
		<%
					}
				}else{	
		 %>
		 		<script type="text/javascript">
  					alert("未查询到数据！！！");
  				</script>
		 <%
		 		}
		 	}
		  %>

  </body>
</html>
