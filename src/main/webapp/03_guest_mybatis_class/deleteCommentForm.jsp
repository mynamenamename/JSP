
 <%@ page language="java" contentType="text/html; charset=utf-8" %>
 <%@ page import="java.util.*" %>
 <%@ page import="mybatis.guest.model.Comment" %>    
 <%@ page import="mybatis.guest.service.CommentService" %>     
    
    
<%
int cId = Integer.parseInt( request.getParameter("cId")) ;
 CommentService.getInstance().deleteComment(cId);

%>      
    
    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 삭제 </title>
</head>
<body>
   <%=cId%> 번을 삭제했습니다.
   
   <br/><br/>
	<a href="listComment.jsp"> [ 목록보기 ] </a>

   
   

</body>
</html>