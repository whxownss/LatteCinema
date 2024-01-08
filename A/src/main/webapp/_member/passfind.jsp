<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
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
			<form id="passFindForm" action="passfindPro.me" method="post" name="fr">
				<div class="table-wrap">
					<table class="board-form">
						<caption>아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표<!--아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표--></caption>
						<colgroup>
							<col style="width:130px;">
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

						</tbody>
					</table>
				</div>


				<div class="btn-member-bottom v1">
					<div id="formCheck"></div>
					<button id="btnFindPass" type="button" class="button purple large" disabled="disabled">비밀번호 찾기<!--비밀번호 찾기--></button>
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
						$("#formCheck").append("<span id='passCheck'> 일치하는 회원정보가 없습니다. </span> ");
						$("#passCheck").css("color", "red");
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
	} else{
		alert('인증 실패');
	}
	
}
</script>

<%@include file ="../_common/commonFooterEnd.jsp" %>