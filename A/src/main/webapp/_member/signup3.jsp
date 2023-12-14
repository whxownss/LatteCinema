<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../_common/commonHeaderStart.jsp"%>
	
	<link rel="stylesheet" href="../assets/css/signup4.css">
	<style>
		li{
   			list-style:none;
   		}
	</style>

	
<%@include file="../_common/commonHeaderEnd.jsp"%>

<main id="main">

	<section class="category-section">
		<div class="container" data-aos="fade-up">
			<div
				class="section-header d-flex justify-content-between align-items-center mb-5">
				<h2>회원가입</h2>
				<div>
					<a href="category.html" class="more">2023.12.11 기준</a>
				</div>
			</div>
			<div class="row g-5">
				<div class="col-lg-6">
					<form>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="InputID" placeholder="ID"> 
							<label for="InputID">ID</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control" id="inputValid" placeholder="비밀번호">
							<label  for="inputValid">비밀번호</label> 
							<div class="valid-feedback"></div>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control" id="inputInvalid" placeholder="비밀번호 확인">
							<label for="inputInvalid">비밀번호 확인</label>
							<div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="UserName" placeholder="이름">
							<label for="UserName">이름</label>
						</div>
						<div class="form-floating mb-3">
							<input type="tel" class="form-control" id="UserPhoneNumber" placeholder="연락처">
							<label for="UserPhoneNumber">연락처</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="Userbirth" placeholder="생년월일8자" maxlength="10	">
							<label for="Userbirth">생년월일 8자리</label>
						</div>						
						<div class="row g-2">
							<div class="col-md">
								<div class="form-floating">
									<input type="email" class="form-control" id="floatingInputGrid" placeholder="name@example.com" >
									<label for="floatingInputGrid">본인확인 이메일</label>
								</div>							
							</div>
							<div class="col-md">
								<div class="form-floating">
									<select class="form-select" id="floatingSelectGrid">
										<option selected value="naver.com">@naver.com</option>
										<option value="naver.com">@google.com</option>
										<option value="nate.com">@nate.com</option>
										<option value="hanmail.net">@hanmail.net</option>
									</select>
									<label for="floatingSelectGrid">@domain</label>
								</div>
							</div>							
						</div>
						<div class="d-grid gap-2" style="margin-top: 50px">
							<button class="btn btn-outline-primary btn-lg" type="submit">가입</button>
						</div>
					</form>
				</div>
				<div class="col-lg-6">
				<div>
					<h3>간편 가입</h3>
				</div>
			<div class="social_login" style="margin: 0 auto;">
                <ul style="list-style: none;">
                    <li class="other_facebook design_social">
                        <a href="javascript:;">Facebook 계정으로 가입
                            <span class="other_icon"><img src="../assets/img/icon_facebook.png" alt="페이스북 아이콘"></span>
                        </a>
                    </li>
                    <li class="other_kakaotalk design_social">
                        <a href="javascript:;">카카오톡 계정으로 가입
                            <span class="other_icon"><img src="../assets/img/icon_kakaotalk.png" alt="카카오톡 아이콘"></span>
                        </a>
                    </li>
                    <li class="other_naver design_social">
                        <a href="javascript:;">네이버 계정으로 가입
                            <span class="other_icon"><img src="../assets/img/icon_naver.png" alt="네이버 아이콘"></span>
                        </a>
                    </li>
                    <li class="other_google design_social">
                        <a href="javascript:;">Google 계정으로 가입
                            <span class="other_icon"><img src="../assets/img/icon_google.png" alt="구글 아이콘"></span>
                        </a>
                    </li>
                </ul>
            </div>					
				</div>
			</div>
		</div>
	</section>

</main>

<%@include file="../_common/commonFooter.jsp"%>