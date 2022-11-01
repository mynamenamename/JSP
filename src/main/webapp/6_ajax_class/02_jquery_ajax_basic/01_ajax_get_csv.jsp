<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
 
 <script type="text/javascript">
 $(function(){
    var param = {cate : 'book', name : 'hong'}; //이게 json형식 
   
   /* $.ajax({
    	  type: 'get',    //브라우저별로 타입이 다름	백에서 처리하는거라 별 상관없음
    	  data: param,    //위에 선언거 그대로 써도 됨 {cate : 'book', name : 'hong'}
    	  url   : '01_server.jsp',
    	  success:  parseData,
    	  error    : function(err){
    		     alert('error');
    		     console.log(err);
    	  }
    }); */
    
    $.get('01_server.jsp', param,  parseData); //축약형 있지만 잘 안씀
    
    
	 
	function parseData(strText){
		
		// alert( strText );
		
		var aryData = strText.split("|");
					
		for(var i=0;i<aryData.length;i++){
			var param  = aryData[i].split("=");				
			if( param[0].trim() == 'cate'){  // 공백제거를 하지 않으면 처음에 공백에 들어와서 cate를 찾지 못함
				 document.getElementById("cate").value = param[1];
			}
			
			if( param[0].trim() == 'name'){
				document.getElementById("name").value = param[1];
			}
		
		}
		
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


