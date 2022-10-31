<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="member.dao.MemberVO" %>
<%@ page import="member.dao.MemberDAO" %>
    
 <% 
 //오류 나면 패키지 이름 확인해보기!!
 //0. 한글 처리 -> method="post"일때!
  request.setCharacterEncoding("utf-8");
 
 //1. 이전 폼의 입력값 얻어오기
 
    String name  = request.getParameter("realname");
    String ename = request.getParameter("nickname");
    String email = request.getParameter("myemail");
    int age      = Integer.parseInt(request.getParameter("myage"));
 
 //2. VO 객체에 저장하기 
 
   MemberVO vo = new MemberVO();
 
    vo.setName(name);
    vo.setEname(ename);
    vo.setEmail(email);
    vo.setAge(age);
 
 
 //3. DB에 입력하기
 
  MemberDAO dao = MemberDAO.getInstance(); //생성된 갯수만큼 계속 만들어지는걸 방지 -클래스를 불러옴
  dao.insert(vo);
 
 
 
 %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 성공적으로 입력되었는지 DB에서 확인합니다 제발 ㅠ
	 <hr/>
	 <!-- 1-2) 얻어온 입력값 출력 -->
	 이름: <%= name %> <br/>
	 별명: <%= ename %> <br/>
	 이메일: <%= email %> <br/>
	 나이: <%= age %> <br/>


</body>
</html>