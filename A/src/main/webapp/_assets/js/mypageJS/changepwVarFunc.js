// 새비밀번호 정규식
var lengthRegexPass = /^[A-Za-z0-9!@#$%]{8,16}$/; // 영문 대소문자 숫자 특수문자 8~16자 규칙(패스워드)
var engUpperRegex = /[A-Z]/; //대문자 규칙 (비밀번호)
var engLowerRegex = /[a-z]/;  //소문자 규칙 (비밀번호)
var numRegex = /[0-9]/;	// 숫자 0~9 규칙 (비밀번호)
var specRegex = /[!@#$%]/;	// 특수문자 규칙 (비밀번호)
// 새비밀번호 유효성
function checkPass(){
	var passwd = $("#newpasswd").val();
	var text =' ** 비밀번호 입력 필수 **';
	var color='red';
	var count = 0;
	
	if(passwd != ""){
		
		if(lengthRegexPass.test(passwd)){
			
			
			if(engUpperRegex.test(passwd))	count ++;
			if(engLowerRegex.test(passwd))	count ++;
			if(numRegex.test(passwd)) 		count ++;
			if(specRegex.test(passwd))		count ++;
			
			switch(count){
				case 4: text = ' **사용 가능 : 안전**';
						color = 'green'; break;
				case 3: text = ' **사용 가능 : 보통**';
						color = 'blue'; break;
				case 2: text = ' **사용 가능 : 위험**';
						color = 'orange'; break;
				default: text = ' **영문자, 숫자, 특수문자 중 2가지 이상 조합 필수!**';
						color = 'red'; break;
			}

		} else{
			text ='영문 대소문자 숫자 특수문자 8~16자 입력'
		}
		
		
	}
	$("#CheckPassword1").text(text).css("color", color);
};

// 새비밀번호 확인 유효성		
function checkConfirmPasswd() {
	var passwd = $("#newpasswd").val();
	var passwd2 = $("#newpasswd2").val();
	
	var text = '**비밀번호 불일치**';
	var color = 'red';
	if( passwd == passwd2 && passwd != ""){
		text='**비밀번호 일치**';
		color='green';
		
	}
	$("#CheckPassword2").text(text).css("color", color);
}		

//유효성 체크 후 submit
function checkSubmit() {
	
	var color = $('#fr span');
	
	var flag = 1;
	
	$.each(color, function(i, v){
		if(this.style.color == "red") {
			flag = 0;
			alert("비밀번호 양식을 확인해 주세요.")
			return false;
		}
	});
	
	return ((flag == 0) ? false : true);
}	