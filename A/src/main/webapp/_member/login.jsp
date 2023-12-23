<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
<script src="jQuery/jquery-3.6.0.js"></script>
<script>
$(() => {
	
	$("#login1").submit(function() {
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
								<form action="loginPro.jsp" method="post" id="login1">
									<div class="form-floating mb-3" id="idTest">
										<input class="form-control" type="text" name="UserId" placeholder="아이디" id="id" style="width: 100%;">
										<label class="form-label" for="UserId">아이디</label>
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" type="password" name="pwd" placeholder="비밀번호" id="pwd" style="width: 100%;">
										<label class="form-label" for="pwd">비밀번호</label>
									</div>
									
									<div id="formCheck"></div>
									
									<div>
										<button class="btn btn-secondary btn-lg" type="submit" style="width: 100%;">로그인</button>
									</div>
								</form>	
							</div>	
									<div class="row ">
										<div class="col-6" style=" text-align: left;">
											<a href="signup3.me">회원가입</a>
										</div>
										<div class="col-6" style=" text-align: right;">
											<a href="">아이디/비밀번호 찾기</a>
										</div>
									</div>
							<div class="position-absolute bottom-0 start-50 translate-middle-x w-50">	
								<h4 class="text-center"> 소셜로그인 </h4>
								<form action="login.jsp" method="post">
									<div class="sns-login">
							
										<div class="">
											<a href="javaScript:void(0)" lnkgty="NAVER" title="네이버로 로그인 선택"><img src="assets/img/btnG_완성형.png" alt="네이버" style="width: 100%; height: 70px;">
											<!--네이버--> <!--네이버로 로그인--></a>
										</div>
										<div class="mt-2">
											<a href="javaScript:void(0)" lnkgty="KAKAO" title="카카오톡으로 로그인 선택"><img src="assets/img/kakao_login_medium_narrow.png" alt="카카오톡" style="width: 100%; height: 70px;">
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
	
<%@include file ="../_common/commonFooter.jsp" %>