// 회원가입 정규식
var empJ = /\s/g; // 공백 정규식
var RegexID = /^[a-zA-Z0-9]{5,16}$/; // 영문 대소문자 숫자 특수문자 5~16자 규칙(아이디)
//var RegexID = /^(?=.*[a-z0-9])[a-z0-9]{3,16}$/; // 영문 대소문자 숫자 특수문자 5~16자 규칙(아이디)
var lengthRegexPass = /^[A-Za-z0-9!@#$%]{8,16}$/; // 영문 대소문자 숫자 특수문자 8~16자 규칙(패스워드)
var engUpperRegex = /[A-Z]/; //대문자 규칙 (비밀번호)
var engLowerRegex = /[a-z]/;  //소문자 규칙 (비밀번호)
var numRegex = /[0-9]/;	// 숫자 0~9 규칙 (비밀번호)
var numRegex1 = /^[0-9]+$/;	// 숫자만 입력
var specRegex = /[!@#$%]/;	// 특수문자 규칙 (비밀번호)
var nameRegex = /^[가-힣]{2,5}$/; // 한글 2~5자 규칙 (이름)
var phoneRegex =/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/; // 모든 전화번호 규칙 (연락처)
var birthRegex1 = /^\d{4}\d{2}\d{2}$/; //? YYYYMMDD 형식의 정규식 (생년월일)
var birthRegex2 = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/; //YYYYMMDD 각 자리에 유효한 생년월일인지 확인 (생년월일)
var emailRegex =  /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; // 이메일형식 규칙(이메일)

var checkCodee;

// 변수저장
// var id = $("#id").val();
// var passwd = $("#passwd").val();
// var passwd2 = $("#passwd2").val();


// 아이디 유효성 및 중복체크
function checkId() {
	var id = $("#id").val();
// 	debugger;
	if(id==""){
		$("#CheckId").text("아이디를 입력하세요").css("color", "red");
		return false;			
	}else if(!RegexID.test(id)){
		$("#CheckId").text("영문 대소문자,숫자 5~16자리 아이디 입력 ").css("color", "red");
		return false;
	}else if(numRegex1.test(id)){
		$("#CheckId").text("영문 대소문자,숫자 5~16자리 아이디 입력1 ").css("color", "red");
		return false;
	}
		
		$.ajax({
			type : "post",
			// get or post
			
			data : {memId : id}, //입력한 값 변수에 담기
			url : "checkjoin.me", 
			dataType: "text",
			success:function(data){
// 				debugger;

				// 중요 복습필수(지우지마시오)
// 				$("#CheckId").text(data.text).css("color", data.color);
// 				return data.bool

				if(data == '1'){
					$("#CheckId").text("사용중인 아이디입니다.").css("color", "red");
					return false;
				}else if(data == '0'){
					$("#CheckId").text("사용가능한 아이디입니다.").css("color", "green");
					return true;
				 }		
			},
			error: function(){
			}
		});
	}
// }

// 이메일 유효성 체크 및 인증번호체크
function checkEmail() {
	var email = $("#email").val();
	if(email == ""){
		$("#CheckEmail").text("** 본인인증 이메일 입력 필수 **").css("color", "red");
		return false;
	}else if(!emailRegex.test(email)){
		$("#CheckEmail").text("** name@example.com 형식에 맞게 입력! **").css("color", "red");
		return false;
	}
	
	$.ajax({
		type : "post",
		data : {memEmail : email},
		url	 : "checkemail.me",
		dataType : "text",
		success:function(data){
			debugger;
			if(data == '1'){
				$("#CheckEmail").text("사용중인 이메일입니다").css("color", "red");
				return false;
			}else if(data == '0'){
				$("#CheckEmail").text("사용가능한 이메일입니다").css("color", "green");
// 				debugger;
				$("#eamilAuthBtn").attr("disabled" , false);
				
				return true;
			}
		},
		error: function(){
			
		}
		
	});
		
}


// 이메일 인증번호 발송 및 인증
function emailAuthentication() {
	var email = $("#email").val()
	$.ajax({
		type : "post",
		url : "emailCode.me",
		dataType : "text",
		data : {email : email},
		success:function(data){
// 			debugger;
			alert("인증번호 보내기 성공");
			checkCodee = data;
			
		},
		error: function () {
			
		}
	});
}



// 이메일 인증 번호 확인하기 버튼
function authCodeCheck() {
	debugger;
	if($("#emailCheck").val() == checkCodee){
		alert('인증 성공');
		$("#joinbtn").attr("disabled" , false);
	} else{
		alert('인증 실패');
	}
	
}


// 비밀번호 유효성
function checkPass(){
	var passwd = $("#passwd").val();
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

// 비밀번호 확인 유효성		
function checkConfirmPasswd() {
	var passwd = $("#passwd").val();
	var passwd2 = $("#passwd2").val();
	var text = '**비밀번호 불일치**';
	var color = 'red';
	if( passwd == passwd2 && passwd != ""){
		text='**비밀번호 일치**';
		color='green';
		
	}
	$("#CheckPassword2").text(text).css("color", color);
}		

// 이름 정규식 유효성
function checkName() {
	var name = $("#name").val();
	var text = "** 이름 입력 필수! **";
	var color = "red";
	
	if(name != ""){
		text = "** 2~5자 이상 한글이름 입력!**";
		if(nameRegex.test(name)){
			text = "** 사용가능 **";
			color = "green";
		}
	}
	$("#CheckName").text(text).css("color",color);
}

// 연락처 정규식 유효성 중복체크
function checkPhone() {
	var phone = $("#phone").val();
	var text = "** 연락처 입력 필수! **"
	var color = "red";
	
	if(phone != ""){
		text = "** 알맞은 연락처 형식으로 입력! '-' 생략가능!! **";
		debugger;
		// 정규식 유효성 일치 > 연락처 중복체크
		if(phoneRegex.test(phone)){
			debugger;
			$.ajax({
				type : "post",
				data : {memPhone : phone},
				url : "checkPhone.me",
				dataType: "text",
				// 동기식으로 변경 async
				async: false
				
			})
			.done(function(data){
				debugger;
				text = "** 사용가능한 연락처! ** ";
				color = "green";
				if(data == '1'){
					text= "** 이미 사용중인 연락처 입니다. ** ";
					color= "red";
					return
				}
			})

		}
	}
	$("#CheckPhone").text(text).css("color",color);
}

// 생년월일 8자 정규식 유효성
function checkBirth() {
	var birth = $("#birth").val();
	var text = "** 생년월일 필수 입력! **";
	var color = "red";
	
	if(birth != "" || !birthRegex1.test(birth)){
		text = "** YYYYMMDD 형식의 유효한 생년월일 입력!";
		
		if(birthRegex2.test(birth)){
			text = "** 유효한 생년월일 **";
			color = "green";
		}
	}
	$("#CheckBirth").text(text).css("color", color);
}


// 유효성 체크 후 submit
function checkSubmit() {
	
	var color = $('#fr span');
	
	var flag = 1;
	
	$.each(color, function(i, v){
		if(this.style.color == "red") {
			flag = 0;
			alert("회원가입 양식을 확인해 주세요.")
			return false;
		}
	});
	
	return ((flag == 0) ? false : true);
}	