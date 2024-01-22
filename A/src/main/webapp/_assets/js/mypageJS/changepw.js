document.write('<script type="text/javascript" '+ 
					'src="/' + window.location.pathname.split("/")[1] + '/_assets/js/mypageJS/changepwVarFunc.js"></script>');
$(function(){
	
	// 취소버튼 뒤로가기
	$("#cancelBtn").on("click", function(){
		history.back();		
	});
	
	
	// 현재 비밀번호 일치 체크
	$("#pass").on("blur", function(){
		// 현재 비밀번호 일치 체크
	var nowPass = $("#pass").val();
	var text = '** 현재 비밀번호를 입력해주세요.';
	var color= 'red';
	var nowId = $("#ibxSchPwdLoginId").val();
		if(nowPass != ''){
			$.ajax({
				data: {
					 memPass : nowPass,
					 memId : nowId
				},
				type: "post",
				url: "changePassCheck.me",
				dataType:"text",
				async: false
			})
			.done(function(data){
				text = " ** 비밀번호 일치";
				color = "green";
				if(data == '0'){
					text = " ** 현재 비밀번호가 틀렸습니다";
					color = "red";
					return
				}
			})
		}
		$("#checkNowPass").text(text).css("color",color);
	});

	
});
