<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%  //--------------------------- 값 지정
	pageContext.setAttribute("name", "KIM"); //현재 페이지
	request.setAttribute("name", "SEUNGMIN");
	session.setAttribute("name", "DOKDO");
	application.setAttribute("name", "KOREA"); //모든 사용자 공유, 정확도 떨어짐
	//application.log("FirstPage.jsp : " + pageContext.getAttribute("name") + "님 접속");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 첫번째 페이지 </title>
</head>
<body>

하나의 페이지 속성 : <%= pageContext.getAttribute("name") %> <br>
하나의 요청 속성 :	 <%= request.getAttribute("name") %> <br>
하나의 세션 속성 :	 <%= session.getAttribute("name") %> <br>
하나의 어플리케이션 속성 : <%= application.getAttribute("name") %> <br>


<!-- 

request.getParameter(" "); 클라이언트 측에서 넘어오는 데이터 받을때

request.getAttribute(" ");  request.setAttribute()에 저장한 경우 <<서버>>


 -->



<!-- #############  -->
<!--  a href='SecondPage.jsp'>다음</a>
<!-- %response.sendRedirect("SecondPage.jsp"); %>

<!-- 페이지 forward 이동된다면  -->
<jsp:forward page="SecondPage.jsp"></jsp:forward>
		

</body>
</html>