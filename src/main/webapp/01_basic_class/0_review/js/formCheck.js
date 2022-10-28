window.onload = function(){

		var frm = document.getElementById('frm');
		//var inputs = document.querySelectorAll("input");
		frm.onsubmit = function(evt) {
			 evt.stopPropagation();  
			 evt.preventDefault();
		     
		// alert(frm.agree.checked);    
		
		if(!frm.agree.checked) { //체크 안했을 때
			alert('반드시 체크 해주세요'); 
			return;             //밑에 있는거 실행 못하게
		}
		
		frm.submit();         //서브로 날릴때
		}

	}