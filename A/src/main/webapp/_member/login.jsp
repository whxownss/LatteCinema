<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
			
		<section class="category-section">
			<div class="container" data-aos="fade-up">
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
	        		<h2>로그인</h2>
	        		<div><a href="category.html" class="more">2023.12.11 기준</a></div>
	      		</div>

			<div class="row g-5">
          <div class="col-lg-6">
            <div class="post-entry-1 lg">
					<form action="loginPro.jsp" method="post">
						<div class="mb-3">
							<label class="form-label" for="id">아이디</label> 
							<input class="form-control" type="text" name="id" id="id" style="width: 300px;">
						</div>
						<div class="mb-3">
							<label class="form-label" for="pwd">비밀번호</label> 
							<input class="form-control" type="password" name="pwd" id="pwd" style="width: 300px;">
						</div>
						<div >
						<button class="btn btn-outline-primary btn-lg" type="submit" >로그인</button>
						</div>
						<div >
						<a href="signup.jsp" >회원가입</a> <a href="">비밀번호 찾기</a>
						</div>
					</form>
						
						
						
            </div>
          </div>

          <div class="col-lg-6">
            <div class="post-entry-1 lg">
					<form action="login.jsp" method="post">
						<div class="sns-login">
							<h6>소셜 로그인</h6>
							<div class="">
								<a href="javaScript:void(0)" lnkgty="NAVER" title="네이버로 로그인 선택"><img src="../assets/img/btnG_완성형.png" alt="네이버" style="width: 183px; height: 45px;"><!--네이버-->   <!--네이버로 로그인--></a>
							</div>
							<div>
								<a href="javaScript:void(0)" lnkgty="KAKAO" title="카카오톡으로 로그인 선택"><img src="../assets/img/kakao_login_medium_narrow.png" alt="카카오톡"><!--카카오톡--> <!--카카오톡으로 로그인--></a>
							</div>
						</div>
					</form>
						
				

            </div>
          </div>
        </div>
		        </div>
			
		</section>
	
	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>