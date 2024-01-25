

var RegexID = /^[a-zA-Z0-9]{5,16}$/; // 영문 대소문자 숫자 특수문자 5~16자 규칙(아이디)
var lengthRegexPass = /^[A-Za-z0-9!@#$%]{8,16}$/; // 영문 대소문자 숫자 특수문자 8~16자 규칙(패스워드)
var engUpperRegex = /[A-Z]/; //대문자 규칙 (비밀번호)
var engLowerRegex = /[a-z]/;  //소문자 규칙 (비밀번호)
var numRegex = /[0-9]/;	// 숫자 0~9 규칙 (비밀번호)
var specRegex = /[!@#$%]/;	// 특수문자 규칙 (비밀번호)
var numRegex1 = /^[0-9]+$/;	// 숫자만 입력

//아이디 유효성 및 중복체크
function checkId() {
	var id = $("#simpleid").val();
	debugger;
	if(id==""){
		$("#simpleCheckId").text("아이디를 입력하세요").css("color", "red");
		return false;			
	}else if(!RegexID.test(id)){
		$("#simpleCheckId").text("영문 대소문자,숫자 5~16자리 아이디 입력 ").css("color", "red");
		return false;
	}else if(numRegex1.test(id)){
		$("#simpleCheckId").text("영문 대소문자,숫자 5~16자리 아이디 입력1 ").css("color", "red");
		return false;
	}
		
		$.ajax({
			type : "post",
			data : {memId : id}, //입력한 값 변수에 담기
			url : "checkjoin.me", 
			dataType: "text",
			success:function(data){
				debugger;
				if(data == '1'){
					$("#simpleCheckId").text("사용중인 아이디입니다.").css("color", "red");
					return false;
				}else if(data == '0'){
					$("#simpleCheckId").text("사용가능한 아이디입니다.").css("color", "green");
					return true;
				 }		
			},
			error: function(){
			}
		});
	}
// 비밀번호 유효성	
function checkPass(){
	var passwd = $("#simplepasswd").val();
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

//비밀번호 확인 유효성		
function checkConfirmPasswd() {
	var passwd = $("#simplepasswd").val();
	var passwd2 = $("#passwd2").val();
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
			alert("회원가입 양식을 확인해 주세요.")
			return false;
		}
	});
	
	return ((flag == 0) ? false : true);
}	

//최종테스트시 쓸 url
// DDVbYF6ooJQNGc8kCVSP

//http://c2d2309t2.itwillbs.com/A/login.me
//ChGI_ZlTbCS_3gIpvFOZ

//http://localhost:8080/A/login.me
//IeY1eBbgIyceSk3XnoEy

// 네이버 로그인 api
var naverLogin = new naver.LoginWithNaverId({
	clientId: "DDVbYF6ooJQNGc8kCVSP",
	callbackUrl: "http://c2d2309t2.itwillbs.com/A/login.me",
	isPopup: false, /* 팝업을 통한 연동처리 여부 */
    callbackHandle: true
});

naverLogin.init();/* 설정정보를 초기화하고 연동을 준비 */

window.addEventListener('load', function () {	
	naverLogin.getLoginStatus(function(status) {
		if (status) {
			debugger;
//			var naverid = naverLogin.user.getId();
			var naveremail = naverLogin.user.getEmail();
			var navername = naverLogin.user.getName();
			var naverday = naverLogin.user.getBirthday().replaceAll("-","").trim();
			var naveryear = naverLogin.user.getBirthyear();
			var naverphone = naverLogin.user.getMobile().replaceAll("-","").trim();
			
			console.log(naverLogin);
			$("#name").val(navername)
			$("#email").val(naveremail)
			$("#birth").val(naveryear + naverday)
			$("#phone").val(naverphone)
			debugger;
			$.ajax({
				type : "post",
				url : "simplelogin.me",
				dataType : "text",
				data : {
// 						memId : naverid
						memEmail : naveremail,
						memName : navername,
						memPhone : naverphone,
						memBirth : naveryear + naverday
						},
                success:function(data){
					debugger;
					naverLogin.logout();
					if(data == '1'){
                		window.location = "main.me";		
					}
					$("#staticBackdrop").modal("show");
                },
				error:function(){
					console.log('오류 발생')
            	}
				
			});
		} 
// 		else alert("콜백 실패");
		
	});
});

// ec65128c288f00e98cd846130e490ee5 //서버최종테스트
//	298f4267dbcfe84b0fe1ea7009ad8d45 //서버
// 44bd94c9c9fc31fcac5bd17dd86e5cba //로컬
// 카카오로그인 api
Kakao.init('ec65128c288f00e98cd846130e490ee5'); // 여기에 애플리케이션에서 발급받은 키를 넣어주세요.
console.log(Kakao.isInitialized()); // sdk초기화여부판단

    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
//                         alert(JSON.stringify(response))
                        debugger;
                        console.log(response)
//                        var kakaoid = response.id;
						var kakaoemail = response.kakao_account.email;
                        var kakaoname = response.kakao_account.name;
                        var kakaobirthyear = response.kakao_account.birthyear;
                        var kakaobirthday = response.kakao_account.birthday;
                        var kakaophone = response.kakao_account.phone_number.replace("+82 ","0").replaceAll("-","").trim();
//                         var address = resonse.kakao_account.shipping_address;
						$("#name").val(kakaoname)
						$("#email").val(kakaoemail)
						$("#birth").val(kakaobirthyear+kakaobirthday)
						$("#phone").val(kakaophone)
						
                        debugger;
                        $.ajax({
                        	type : "post",
                        	data : {
//                         			memId : kakaoid,
                        			memEmail : kakaoemail,
                        			memName : kakaoname,
                        			memBirth : kakaobirthyear + kakaobirthday,
                        			memPhone : kakaophone
                        			},
                        	url : "simplelogin.me",
                        	dataType : "text",
                        	success:function(data){
								debugger;
								if(data == '1'){
	                         		window.location = "main.me";		
	                         		//session??
								}
								$("#staticBackdrop").modal("show");
                        	},
                        	error:function(){
                        		
                        	}
                        });//ajax
                    },
                    fail: function (error) {
                        alert(JSON.stringify(error))
                    },
                })
            },
            fail: function (error) {
                alert(JSON.stringify(error))
            },
        })
    }
    
    function kakaoLogout() {
		Kakao.Auth.logout(function(response) {
			alert(response + 'logout');
		}); 
    }
