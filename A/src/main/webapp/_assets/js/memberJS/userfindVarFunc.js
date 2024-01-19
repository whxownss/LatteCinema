	/* 이름 입력 */
	$("#name").on("keyup", function () {
		var partton = /[^가-힣\s]{2,5}$/g; 
		if(partton.test($(this).val())){
			var value = $(this).val().replace(/[^가-힣\s]{2,5}$/g,"");
			$("#name").val(value);
		}
	});
	
	/* 생년월일 입력 */
	$("#birth").on("blur", function(e){
		var partton = /[^0-9]/g;
		$('#schIdBirthDe-error-text').text('');
		if($("#birth").val() == ""){
			$('#schIdBirthDe-error-text').text('생년월일을 입력해주세요.');
			return false;
		}
		if(partton.test($(this).val())){
			var value = $(this).val($(this).val().replace(/[^0-9]/g,""));
			$('#schIdBirthDe-error-text').text('');
			$("#birth").val(value);
		}
		
	});
	
	/* 연락처 입력 */
	$("#phone").on("blur", function(e){
		var partton = /[^0-9]/g;
		$('#schIdMblpNo-error-text').text('');
		if($("#phone").val() == ""){
			$('#schIdMblpNo-error-text').text('연락처 입력해주세요.');
			return false;
		}
		if(partton.test($(this).val())){
			var value = $(this).val($(this).val().replace(/[^0-9]/g,""));
			$('#schIdMblpNo-error-text').text('');
			$("#phone").val(value);
		}
	});
	

	
	
	
	
	$(".findInput").on("keyup", function(){
// 		debugger;
		if($("#name").val() != "" && $("#birth").val() != "" && $("#phone").val() != ""){
// 			debugger;
			$("#btnFindId").attr("disabled", false);
			var name = $("#name").val()
			var birth = $("#birth").val()
			var phone = $("#phone").val()
			$('#schIdBirthDe-error-text').text('');
			$('#schIdMblpNo-error-text').text('');
		}
		
	});
			
	$("#btnFindId").on("click", function() {
		debugger;
		$.ajax({
			type : "post",
			data : {
				memName : $("#name").val(), 
				memBirth : $("#birth").val(), 
				memPhone : $("#phone").val()
				},
			url : "userFindId.me",
			dataType : "text",
			success:function(data){
				var msg = '해당정보로 가입한 회원 아이디가 없습니다.';
				if(data != '0')
					msg = '회원님이 가입하신 아이디는 ' + data + ' 입니다.';
				
					alert(msg);
			},
			error : function() {
				
			}
		})	
			
	});
