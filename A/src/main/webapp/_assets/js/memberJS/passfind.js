document.write('<script type="text/javascript" '+ 
					'src="/' + window.location.pathname.split("/")[1] + '/_assets/js/memberJS/passfindVarFunc.js"></script>');

// 1.아이디,이름,이메일과 일치하는 정보가 있을 때 이메일인증번호 발송버튼 활성화
$(function () {
	// 입력확인 및 버튼 활성화 
	$('.findInput').on('blur', function () {
// 		debugger;
		var id = $("#id").val()
		var name = $("#name").val()
		var email = $("#email").val()
		
		$("#eamilAuthBtn").attr("disabled", true);
		
		if(id != '' && name != '' && email != ''){
// 			debugger;
			$.ajax({
				type : "post",
				data : {memId : id, memName : name, memEmail : email},
				url : "userFindPass.me",
				dataType : "text",
				success:function(data){
// 				debugger;
					if(data != "null"){
						$("#eamilAuthBtn").attr("disabled", false);
						$("#passCheck").remove();
						return true;
					}else{
						debugger;
						alert("일치하는 회원 정보가 없습니다.");
						return false;
					}
				}
			})
		}
		
	});
	
});
