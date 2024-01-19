document.write('<script type="text/javascript" '+ 
					'src="/' + window.location.pathname.split("/")[1] + '/_assets/js/memberJS/passfindVarFunc.js"></script>');

$(function () {
	// 입력확인 및 버튼 활성화 
	$('.findInput').on('keyup', function () {
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
