<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
<script src="jQuery/jquery-3.6.0.js"></script>
<!-- <script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script> -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 api  -->
<!-- <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script> -->
<!--   <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> -->
<!--   <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
			
		<section class="category-section">
			<div class="container w-50" data-aos="fade-up">
							<h3 class="tit">로그인</h3>
				<div class="row">
<!-- 					<div class="col-2"></div> -->
					<div class="col-8 position-relative">
						<header class="layer-header">
						</header>
<!-- 						<div class="layer-con" style="height: 400px;"> -->
<!-- 							<div class="post-entry-1 lg"> -->
							<div>
								<form action="loginPro.me" method="post" id="login" name="fr">
									<div class="form-floating mb-3" id="idTest">
										<input class="form-control" type="text" name="id" placeholder="아이디" id="id" style="width: 100%;">
										<label class="form-label" for="UserId">아이디</label>
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" type="password" name="pass" placeholder="비밀번호" id="pwd" style="width: 100%;">
										<label class="form-label" for="pwd">비밀번호</label>
									</div>
									
									<div id="formCheck"></div>
									
									<div>
										<button class="btn btn-danger btn-lg" type="submit" style="width: 100%;">로그인</button>
									</div>
								</form>	
							</div>	
									<div class="row ">
										<div class="col-6" style=" text-align: left;">
											<a href="join.me">회원가입</a>
										</div>
										<div class="col-6" style=" text-align: right;">
											<a href="userfind.me">아이디/비밀번호 찾기</a>
										</div>
									</div>
							<div class="position-absolute bottom-0 start-50 translate-middle-x w-50">	
								<h4 class="text-center"> 간편로그인 </h4>
								<form action="login.jsp" method="post">
									<div class="sns-login">
							
										<div class="">
											<a href="javaScript:void(0)" id="naverIdLogin_loginButton" lnkgty="NAVER" title="네이버로 로그인 선택"><img src="assets/img/btnG_완성형.png" alt="네이버" style="width: 100%; height: 70px;">
											<!--네이버--> <!--네이버로 로그인--></a>
										</div>
										<div class="mt-2">
											<a href="javaScript:kakaoLogin()" id="kakao-login-btn" lnkgty="KAKAO" title="카카오톡으로 로그인 선택"><img src="assets/img/kakao_login_medium_narrow.png" alt="카카오 로그인 버튼" style="width: 100%; height: 70px;">
											<!--카카오톡--> <!--카카오톡으로 로그인--></a>
										</div>
									</div>
								</form>	
							</div>									
<!-- 							</div> -->
						
<!-- 						</div> -->
					</div>
					<div class="col-4">
						<div class="login-ad" id="영화포스터">
							<a href="main.me" target="_blank">
								<img id="해당영화포스타" src="assets/img/post20.jpg" alt="영화포스터" clickthrough="" style="height: 450px">
							</a>
						</div>					
					</div>
					
				</div>
				
				
			</div>
		</section>
	
	</main>
	
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">간편 가입</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form  onsubmit="return checkSubmit()" action="joinPro.me" id="fr" >
	      	<div class="modal-body">
       				<div class="form-floating mb-3">
<%--        				${sessionScope.sEmail} --%>
						<input type="text" class="form-control" id="simpleid" placeholder="5자 이상" minlength="5" required 
								onblur="checkId()" name="id"> 
						<label for="id">아이디<span id="simpleCheckId" style="font-size: 15px;"></span></label>

					</div>
					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="simplepasswd" placeholder="비밀번호" required
								onblur="checkPass(); checkConfirmPasswd();" name="pass">
						<label  for="pass">비밀번호<span id="CheckPassword1"></span></label> 

					</div>
					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="passwd2" placeholder="비밀번호 확인" required
								onchange="checkConfirmPasswd()">
						<label for="passwd2">비밀번호 확인<span id="CheckPassword2"></span></label>
					</div>
					<div class="form-floating mb-3 row g-2">
						<div class="col-5">
							<div class="form-floating">
								<input type="text" class="form-control" id="postcode" placeholder="우편번호" readonly name="postcode" >
								<label for="address1">우편번호</label>
							</div>	
						</div>	
						<div class="col-3">	
								<input type="button" class="btn btn-danger btn-lg" type="button" style="height:58px;"
										id="find_button" value="우편번호 찾기">
						</div>
					</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="address1" placeholder="주소" required readonly name="address1">
							<label for="address1">주소</label>
						</div>	
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="address2" placeholder="상세주소 입력" required name="address2">
							<label for="address2">상세주소 입력</label>
						</div>	
					<input id="email" type="hidden"  value="" name="email"><!--이메일-->
					<input id="birth" type="hidden"  value="" name="birth"><!--생년월일-->
					<input id="phone" type="hidden"  value="" name="phone"><!--연락처-->
					<input id="name" type="hidden"  value="" name="name"><!--이름-->
	      	</div>
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        	<button type="submit" class="btn btn-primary" >가입하기</button>
	      	</div>

	      </form>
	    </div>
	  </div>
	</div>
	<!-- Modal -->
	
<%@include file ="../_common/commonFooterStart.jsp" %>
<script>
$(function(){
	$("#find_button").on('click', function() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	            
	        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            var fullAddr= '';
	            var extraAddr='';
	            
	            if(data.userSelectoredType === 'R'){
	            	fullAddr = data.roadAddress;
	            } else{
	            	fullAddr = data.jibunAddress;
	            }
	            
	            // extraAddr 
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }	                    
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraAddr !== ''){
	                extraAddr = ' (' + extraAddr + ')';
	            }		            
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullAddr !== ''){
	                fullAddr += extraAddr;
	            }                    
	            
	            $("#postcode").val(data.zonecode); 
	            $("#address1").val(fullAddr);
	            $("#address2").focus();
	            
	        }
	    }).open();
	});
});

</script>
<script>
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

</script>
<script type="text/javascript">
var naverLogin = new naver.LoginWithNaverId({
	clientId: "k4VcydIgNnToU82jOUPA",
	callbackUrl: "http://localhost:8080/A/login.me",
	isPopup: false, /* 팝업을 통한 연동처리 여부 */
    callbackHandle: true
});

naverLogin.init();/* 설정정보를 초기화하고 연동을 준비 */

window.addEventListener('load', function () {	
	naverLogin.getLoginStatus(function(status) {
		if (status) {
			debugger;
			var naverid = naverLogin.user.getId();
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
// 						 memId : naverid
						 memEmail : naveremail
						,memName : navername
						,memPhone : naverphone
						,memBirth : naveryear + naverday
						},
                success:function(data){
					debugger;
					naverLogin.logout();
					if(data == '1'){
                		window.location = "main.me";		
					}
					$("#staticBackdrop").modal("show");
                },
// 				success:function(data){
// 					debugger;
// 					naverLogin.logout();
// 					window.location = "main.me";
// 					$("#staticBackdrop").modal("show");

// 				},
				error:function(){
					console.log('오류 발생')
            	}
				
			});
		} 
// 		else alert("콜백 실패");
		
	});
});




</script>


<script type="text/javascript">

Kakao.init('44bd94c9c9fc31fcac5bd17dd86e5cba'); // 여기에 애플리케이션에서 발급받은 키를 넣어주세요.
console.log(Kakao.isInitialized()); // sdk초기화여부판단

    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
//                         alert(JSON.stringify(response))
                        console.log(response)
                        var kakaoid = response.id;
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


</script>
<script>
$(() => {
	$("#login").submit(function() {
		if($("#id").val() == ""){
			if(!$("#idCheck").length){
				$("#pwdCheck").remove();
				$("#formCheck").append("<span id='idCheck'>아이디를 입력하세요.</span>");
				$("#idCheck").css("color", "red");
			}
			return false;	
		}
		
		if ($("#pwd").val() == "") {
			if(!$("#pwdCheck").length){
				$("#idCheck").remove();
				$("#formCheck").append("<span id='pwdCheck'>비밀번호를 입력하세오.</span>");
				$("#pwdCheck").css("color","red");
			}
			return false;
		}
		
		return true;
	})
});



</script>
<%@include file ="../_common/commonFooterEnd.jsp" %>