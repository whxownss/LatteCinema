<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/find.css">
    <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <jsp:include page="../_common/header.jsp"></jsp:include>
<script>



</script>
</head>
<body>

	<main id="main">
		<section class="category-section">
			<div class="container w-50" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->

	<div class="member-wrap">


		<!-- col-wrap -->
		<div class="col-wrap">
			<!-- col -->
			<div class="col">

				<p class="tit-member">아이디/비밀번호 찾기<!--아이디/비밀번호 찾기--></p>

				<div class="tab-list">
					<ul>
						<li><a href="userfind.me" title="아이디찾기 선택">아이디찾기<!--아이디찾기--></a></li>
						<li class="on"><a href="javaScript:void(0);" title="비밀번호 찾기 선택">비밀번호 찾기<!--비밀번호 찾기--></a></li>
					</ul>
				</div>

				<h2 class="tit mt40">간편찾기<!--간편찾기--></h2>
			<form id="passFindForm" action="passfindPro.me" method="post" name="fr"  onsubmit="return checkSubmit()">
				<div class="table-wrap">
					<table class="board-form">
						<caption>아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표<!--아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표--></caption>
						<colgroup>
							<col style="width:140px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="id">아이디<!--아이디--></label></th>
								<td>
									<input id="id" name="id"  type="text" placeholder="아이디" class="input-text w230px findInput"><!--아이디-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="name">이름<!--이름--></label></th>
								<td>
									<input id="name" name="name" maxlength="5" type="text" placeholder="이름" class="input-text w230px findInput"><!--이름-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="email">이메일<!--회원가입시 입력한 이메일--></label></th>
								<td>
									<input type="text" id="email" name="email"  placeholder="example@example.com" class="input-text w230px findInput"><!--'-' 없이 입력-->
									<button onclick="emailAuthentication()" id="eamilAuthBtn" type="button" class="button gray w100px ml08" disabled="disabled">인증번호 발송</button>
<!-- 									<button onclick="emailAuthentication()" id="eamilAuthBtn" disabled="disabled" class="btn btn-danger btn-lg" type="button" style="height:58px;">인증번호 발송</button> -->
								</td>
							</tr>
							<tr id="schPwdMblpCertRow">
								<th scope="row"><label for="emailCheck">인증번호<!--인증번호--></label></th>
								<td>
									<div class="chk-num">
										<div class="line">
											<input  type="text" id="emailCheck" class="input-text w180px" title="인증번호 입력" /><!--인증번호 입력-->
										</div>
									</div>

									<button id="authCodeCheckBtn" type="button" class="button gray-line w75px ml08">인증확인<!--인증확인--></button>
<!-- 									<div id="schPwdMblpNo-error-text" class="alert"></div> -->
								</td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th scope="row"><label for="newPass">새 비밀번호</label> -->
<!-- 												<label for="newPass">비밀번호 확인</label></th> -->
<!-- 								<td> -->
<!-- 									<input type="password" id="passwd1" name="paswd1" class="input-text w230px" placeholder="영문 대소문자 숫자 특수문자 8~16자 입력"><br> -->
<!-- 									<input type="password" id="passwd2" name="passwd2"class="input-text w230px" placeholder=""><br> -->
<!-- 								</td> -->
<!-- 							</tr> -->

						</tbody>
					</table>
				</div>
			<div id="changeNewPass" style="display: none"><!-- 인증확인 성공시 나타내기 -->
				<h2 class="tit mt10">새 비밀번호<!--간편찾기--></h2>
				<div class="table-wrap">
					<table class="board-form">
					 	<colgroup>
							<col style="width:140px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="newpasswd">새 비밀번호</label>
								<td>
									<input id="newpasswd" name="newpasswd"  type="password" placeholder="영문,숫자,특수문자 조합 8~16자" class="input-text w240px"
											onblur="checkPass(); ">
									<span id="checknewpasswd"></span>
								</td>							
							</tr>
							<tr>
								<th scope="row"><label for="newpasswd2">비밀번호 확인</label>
								<td>
									<input id="newpasswd2" name="newpasswd2"  type="password" placeholder="" class="input-text w240px"
											onchange="checkConfirmPasswd()">
									<span id="checknewpasswd2"></span>
								</td>							
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn-member-bottom v1">
					<button id="btnFindPass" type="submit" class="button purple large" >비밀번호 변경<!--비밀번호 찾기--></button>
				</div>
			</div>
			</form>

			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
	<!--// member-wrap -->



			</div>
		</section>
	
	</main>
	
<%@include file ="../_common/commonFooterStart.jsp" %>
<script>
//새비밀번호 정규식
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
	$("#checknewpasswd").text(text).css("color", color);
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
	$("#checknewpasswd2").text(text).css("color", color);
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
</script>
<script type="text/javascript">
$(function () {

// 	var id = $("#id").val()
// 	var name = $("#name").val()
// 	var email = $("#email").val()
	
	
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
				debugger;
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
	
});//

// 이메일 인증번호 발송 및 인증
function emailAuthentication() {
	debugger;
	var checkCode;
	var email = $("#email").val()
	$.ajax({
		type : "post",
		url : "emailCode.me",
		dataType : "text",
		data : {email : email},
		success:function(data){
 			debugger;
			alert("인증번호 보내기 성공");
			checkCode = data;
			
		},
		error: function () {
			
		}
	});
}

// 이메일 인증 번호 확인하기 버튼
function authCodeCheck() {
	debugger;
	if($("#emailCheck").val() == checkCode){
		alert('인증 성공');
		$("#btnFindPass").attr("disabled" , false);
		$("#changeNewPass").css("display", 'block');
		$("#id").attr("readonly" true);
	} else{
		alert('인증 실패');
	}
	
}
</script>


<%@include file ="../_common/commonFooterEnd.jsp" %>