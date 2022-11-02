<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.model.*,guest.service.*" %>   
<%@ page import="java.util.List" %>
 
<%
 
   String pNum=request.getParameter("page");
       //맨 밑에 파라미터 지정하면서 가져온 page <<<!
   int pageNo = 1;
   //현재 페이지의 번호
   if( pNum != null ){
      pageNo = Integer.parseInt(pNum);
   }

   // 전체 메세지 레코드 검색 
   ListMessageService service =  ListMessageService.getInstance();
   List <Message> mList =  service.getMessageList(pNum);
       
   int totalPageCount = service.getTotalPage();  
   
%>    
<!DOCTYPE html>
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 목록 </title>
</head>
<body>

   <% if( mList.isEmpty() ) { %>
      남겨진 메세지가 하나도~~없습니다. <br>
   <% } else { %>
   <table border="1">
   
      <% for(Message m : mList) { %>
      <tr>   
         <td><%= m.getMessageId() %> </td> 
         <td><%= m.getGuestName()%> </td> 
         <td><a href='deleteMessage.jsp?messageId=<%= m.getMessageId() %>'> [삭제] </a></td>         
      </tr>
      <tr>
         <td colspan='3'> 
         <!-- text area는 사이에 공백이 있으면 다 스페이스바 공백으로 인식해서 앞에 띄어쓰기로 다 값이 들어간다. 붙혀서 써야함 -->
         <textarea cols=35 rows=3 style="font-family: '돋움', '돋움체'; font-size: 10pt; font-style: normal; line-height: normal; color: #003399;background-color:#D4EBFF;border:1 solid #00009C;"><%= m.getMessage() %></textarea>
         </td>
      </tr>
      <% } // end for  %>
      
   </table>
   
   <% } // end if-else %>

   <a href='insertMessage.jsp'>글쓰기</a>
   <hr/>
   <!-- 맨 처음으로 이동하는 <a> 생성 -->
      <a href="listMessage.jsp?page=1"><button>first</button></a>
      <% if(pageNo>1){ %> <!-- 페이지 번호가 1보다 클 경우 이전 버튼 활성화 -->
         <a href="listMessage.jsp?page=<%=pageNo-1%>"><button>prev</button></a>
      <%}else{ %>
         <a href=""><button>prev</button></a>
      <%} %>
   
      <!-- 페이지번호 <a> 생성 -->
      <%for(int i=1;i<=totalPageCount;i++){ %>
         <a href='listMessage.jsp?page=<%=i%>'>[<%= i %>]</a>
      <%}//end of for %>
   
   <!-- 맨 마지막으로 이동하는 <a> 생성 -->
      <% if(pageNo<totalPageCount){ %> <!-- 페이지 번호가 마지막보다 작을 경우 다음 버튼 활성화 -->
         <a href="listMessage.jsp?page=<%=pageNo+1%>"><button>next</button></a>
      <%}else{ %>
         <a href=""><button>next</button></a>
      <%} %>

<!-- 맨 마지막으로 이동하는 <a> 생성 -->
<a href="listMessage.jsp?page=<%=totalPageCount%>"><button>last</button></a>
</body>
</html>