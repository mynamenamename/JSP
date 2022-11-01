<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
	<script>
	
	$(function(){
		   var param = {cate : 'book', name : 'hong'}; //이게 json형식 
		
		   $.ajax({
			   data        : param,  //보내는 데이터
			   url           : '04_server.jsp',
			   dataType :  'text',  //지금은 text,추후에는 json //받았을 때의 타입
			   success   : parseData
			   
		   });
		
		   
		   function parseData(result) {
			   //************************
			   // 추후에 json 라이브러리를 이용해 json 객체 변환
			   
			   var obj = {};
			   obj = eval("(" + result + ")");    //객체로 변환해주는 함수 eva 남용하면 안됨!
			   $('#cate').val(obj.first);
			   $('#name').val(obj.second);
		   }
		
	})
	
	
	</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


