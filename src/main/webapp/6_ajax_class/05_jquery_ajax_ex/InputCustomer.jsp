<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 고객관리 프로그램 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript" >

$(function(){
	//1.입력 버튼이 눌렸을 때
	$('#btnInsert').click(function(){
		//alert('입');
		//원래 통신
	//  $('form').attr('action','DataInput.jsp') //액션 속성 부여
	//  $('form').submit();   //버튼에 submit 속성이 없어서 여기서 부여!
	
	   //ajax 통신
	   // (1)  사용자  입력값을 객체 형식으로 저장 
	   //            >> 추후에 30개 ... 불가넝 : 폼 객체에 serialize() 참고!
	   
	  var param = {  
			   name : $('#name').val(), 
			    age  : $('#age').val(),
			    tel    : $('#tel').val(),
			   addr : $('#addr').val()
			 }    
	  // alert(param);
	   $.ajax ({
		   url  : 'DataInput.jsp',
		   data : param,
		   success: function(data){
			  //   alert('<'+ data + '>')  공백이 포함되어 있기 때문에 
			  
			  if( data.trim() =='1') {   //요기서 트림으로 제거해줘야 됨
				  alert( '입력 왕성공!')
				  $('#name').val('');   //성공하면 있는거 다 지우기!
				  $('#age').val('');
				 $('#tel').val('');
				  $('#addr').val('');
				  
			  }else {
				  alert( '입력 왕실패...')
			  }
			  
		   }
		   
		   
	   });
	   
	   
		
	});
	
	//2.가져오기 버튼이 눌렸을때
	$('#btnSelect').click(function(){
		//alert('가');
		$.ajax({
			//데이터베이스에서 가지고 오기만!
			
			url : 'DataSelect.jsp',
			dataType: 'xml',
			success : selectResult 
			
		})
		
	});
	
	
	 function  selectResult(data) {
		// alert(data);
	    console.log(data);   //객체 뜨면 콘솔로  확인!
	    var person =  $(data).find('person');   //개발자모드 보면 나옴
	  //  alert(person.length);
	   
	  $('#tbd').empty();  //원래 있던거 지우고 새로고침 느낌으로 
	  
	  
	  
	  person.each(function(){
		   var name =   $(this).find('name').text();
		   var age =   $(this).find('age').text();
		   var tel =   $(this).find('tel').text();
		   var addr =   $(this).find('addr').text();
		   
		   //붙이기
		   $('#tbd').append('<tr>'  
				                            + '<td>' +name + '</td>'  
				                            + '<td>' +age + '</td>'  
				                            + '<td>' +tel + '</td>'  
				                            + '<td>' +addr + '</td>'  
		                                    + '</tr>')
		   
		   
	  })
	  
	  
	  
	  
	  
	 }
	
	
});



</script>

</head>


<!-- <body> -->
<body>

<h2> 고객정보 입력 </h2>

<form name="inForm" method="post">
<table border = 1>
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
	<tr>
		<td align="center"><input type="text" size="8" name="name" id="name"></td>
		<td align="center"><input type="text" size="4" name="age" id="age"></td>
		<td align="center"><input type="text" size="12" name="tel" id="tel"></td>
		<td align="center"><input type="text" size="30" name="addr" id="addr"></td>
	</tr>
	<tr>
		<td colspan="4" align="center"> 
			<input type="button" id='btnInsert' value="입력">
		</td>
	</tr>
</table>

<br>
<hr>

<h2> 고객정보 목록보기  </h2>
<table border='0' width="510"> 
	<tr>
		<td align="right"><input type="button"  id='btnSelect' value="가져오기"></td>
	</tr>
</table>
<table border = 1 id="listTable">
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
	<tbody id='tbd'></tbody>
</table>
<div id="myDiv"> </div>

</form>
</body>
</html>