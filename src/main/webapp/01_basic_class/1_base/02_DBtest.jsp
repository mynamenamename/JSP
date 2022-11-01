<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ page errorPage ="02_NormalErrorPage.jsp" %>

<%
	// 1. 드라이버 로딩 -> ojbc6.jar > zip 같음
	  Class.forName("oracle.jdbc.driver.OracleDriver");
      System.out.println("드라이버로딩 성공");   
	
	// 2. 연결객체 얻어오기
	  String url="jdbc:oracle:thin:@localhost:1521:xe";
      String user="scott";
      String pass="tiger";

      Connection con = DriverManager.getConnection(url,user,pass);
      System.out.println("DB 연결 성공");
      

	// 3. sql 문장 만들기
      String sql = "SELECT * FROM emp";

         
    // 4. 전송 객체 얻어오기
       PreparedStatement ps = con.prepareStatement(sql);

    // 5. 전송
         /*    - ResultSet exeucuteQuery() : SELECT 
          *    - Int executeUpdate() : INSERT/DELETE/UPDATE
          */
       ResultSet rs  = ps.executeQuery();
	
%>     
   
    
    

<!DOCTYPE html>
<html><head><title> 디비 테스트 </title>
</head>
<body>
 
<div align=center>
<table border=2 cellSpacing=3>

  <tr class="title">
    <td>사번</td>
    <td>사원명</td>
    <td>업무</td>
    <td>관리자사번</td>
    <td>입사일</td></tr>

	<!-- (6) 결과출력 -->
     <%while(rs.next()){  %>
	  <tr>
		<td><%= rs.getInt("EMPNO") %></td>
		<td><%= rs.getString("ENAME") %></td>
		<td><%= rs.getString("JOB") %></td>
		<td><%= rs.getString("MGR") %></td>
		<td><%= rs.getString("HIREDATE") %></td>
	  </tr>
	  <%} //end of while %>


</table>
</div>
</body>
</html>
