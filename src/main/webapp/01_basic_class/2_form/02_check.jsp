<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 1) 이전 화면에서 사용자 입력값들을 얻어오기
   //   -request.getParameter("") 하나씩
   //   -request.getParameterValues("") 여러개씩
    String name = request.getParameter("name");
    String gender=request.getParameter("gender");
    String occ = request.getParameter("occupation");
    String[] hobby = request.getParameterValues("hobby");
    String h = "";
   /* if(hobby != null) {
    for(int i =0; i<hobby.length;i++ ) {
    	h += hobby[i] + '/';  
      }  
    } */
    for(int i =0; hobby != null && i<hobby.length;i++ ) {
    	h += hobby[i] + '/';   //숏 서킷 로직 사용!!
      }  
    
  for(String k:hobby) {
	   System.out.println(k);
   }
    
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_check.jsp</title>
</head>
<body>
    <!-- 2) 얻어온 입력값들을 화면에 출력하기 -->
    입력한 이름: <%= name %>  <br/>
    입력한 성별: <%= gender %>  <br/>
    입력한 직업: <%= occ %>   <br/>
    입력한 취미 : <%= h %>
    
</body>
</html>