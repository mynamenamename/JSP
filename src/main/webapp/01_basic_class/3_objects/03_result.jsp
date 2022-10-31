<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");		// name 파라미터의 값을 받음
	String [] pet = request.getParameterValues("pet");		// dog 파라미터의 값을 받음
	
	String choosePet = "";
	for(int i =0; pet!=null && i<pet.length; i++){
		choosePet += pet[i] + " ";
	}
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03.result.jsp</title>
</head>
<body>
<!--  이전 화면에서 사용자 입력값 얻어와서 화면 출력
			-requst.getParameter("")
			-requst.getParameterValue("") 
			-->
			
			이름 : <%= name %>
			좋아하는 동물 : <%= choosePet %>
</body>
</html>