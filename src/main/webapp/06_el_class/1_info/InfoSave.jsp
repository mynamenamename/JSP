<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("UTF-8"); %>
<!-- InfoBean info = new InfoBean();-->
<jsp:useBean id="info" class="info.InfoBean">
	<jsp:setProperty name="info" property="name" />
  <jsp:setProperty name="info" property="id" />
</jsp:useBean>

<!DOCTYPE html>
<HTML>
<HEAD><TITLE> 자료 출력 </TITLE></HEAD>
<BODY>
    <!-- JSP 기초문법의 표현식  -->
    <%= info.getName() %>
    <!-- ACTION 태그의 출력 문법  -->
    <!-- property = beans에서의 변수!! -->
    <jsp:getProperty property = "name" name="info"/>
    <!-- 화면 출력할 때 변수를 활용: 표현언어(EL)-->
    <hr/>
	<H2>  당신의 신상명세서 확인 </H2>
	이   름  : ${info.name}<br/>
	주민번호  :  ${info.id}<br/>
	성  별   :  ${info.gender}<br/>  
	맞습니까????  
</BODY>
</HTML>