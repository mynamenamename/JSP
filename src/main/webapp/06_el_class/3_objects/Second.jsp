<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> 데이타 받는 페이지 </title>
</head>
<body>
<!--String param=  request.getParameter("data") 
    session. < jsp 
    sessionScope < 표현식
-->
파라메터 값(전 페이지에서 넘어오는 값) : ${param.data}  <br/> 

세션의 값 :  ${sessionScope.login}<br/> <!-- ************* -->

쿠키의 값 : ${cookie.isFlag.value} <br/> <!-- 쿠키값 가져올때는 value까지 가져와야됨 -->


<hr>


</body>
</html>