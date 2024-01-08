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
									<input id="id" name="id" maxlength="20" type="text" placeholder="아이디" class="input-text w230px findInput"><!--아이디-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="name">이름<!--이름--></label></th>
								<td>
									<input id="name" name="name" maxlength="20" type="text" placeholder="이름" class="input-text w230px findInput"><!--이름-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="email">이메일<!--회원가입시 입력한 이메일--></label></th>
								<td>
									<input type="text" id="email" name="email" maxlength="11" placeholder="example@example.com" class="input-text w230px findInput"><!--'-' 없이 입력-->
									<button onclick="emailAuthentication()" id="eamilAuthBtn" type="button" class="button gray w100px ml08" disabled="disabled">인증번호 발송<!--인증요청--></button>
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
	// 입력확인 및 버튼 활성화 
	$('.findInput').on('keyup', function () {
// 		debugger;
		var id = $("#id").val()
		var name = $("#name").val()
		var email = $("#email").val()
		
		$("#eamilAuthBtn").attr("disabled", true);
		
		if(id != '' && name != '' && email != ''){
			debugger;
			$.ajax({
				type : "post",
				data : {memId : id, memName : name, memEmail : email},
				url : "userFindPass.me",
				dataType : "text",
				success:function(data){
					if(data == '1'){
						$("#eamilAuthBtn").attr("disabled", false);
						$("#passCheck").remove();
					}else if(data == '0'){
						$("#formCheck").append("<span id='passCheck'> 일치하는 회원정보가 없습니다. </span> ");
						$("#passCheck").css("color", "red");
					}
				}
			})
		}
		
	});
	
	// 발송버튼 클릭시 (입력한 정보가 일치하는 회원이 있으면 이메일인증번호 보내기 없으면 X)
// 	function emailAuthentication() {
// 		var id = $("#id").val()
// 		var name = $("#name").val()
// 		var email = $("#email").val()
// 		$.ajax({
// 			type : "post",
// 			data : {memId : id, memName : name, memEmail : email},
// 			url : "userFindPass.me",
// 			dataType : "text",
// 			success:function(data){
				
// 			}
// 		});
	
// 	}
	
// 	$("#btnFindPass").on("click", function () {
// 		var id = $("#id").val()
// 		var name = $("#name").val()
// 		var email = $("#email").val()
// 		debugger;
// 		$.ajax({
// 			type : "post",
// 			data : {memId : id, memName : name, memEmail : email},
// 			url : "userFindPass.me",
// 			dataType : "text",
// 			success:function(data){
// 				if(data == '1'){
					
// 				}
// 			}
// 		})// ajax
// 	});//on click
	
	
});//
</script>

<%@include file ="../_common/commonFooterEnd.jsp" %>