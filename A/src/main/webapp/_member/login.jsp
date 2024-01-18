<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../_common/commonHeaderStart.jsp" %>


<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
			
		<section class="category-section">
			<div class="container w-50" data-aos="fade-up">
							<h3 class="tit">로그인</h3>
				<div class="row">
					<div class="col-8 position-relative">
						<header class="layer-header">
						</header>
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
						
					</div>
					<div class="col-4">
						<div class="login-ad" id="영화포스터">
							<a href="movie_view.mo?movieCode=${requestScope.movieCode}">
								<img id="해당영화포스타" src="<c:out value='${requestScope.moviePoster}' />" alt="영화포스터" clickthrough="" style="height: 450px">
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
<script src="jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/memberJS/login.js"></script>
<%@include file ="../_common/commonFooterEnd.jsp" %>