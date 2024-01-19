<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../_common/commonHeaderStart.jsp"%>
<link rel="stylesheet" href="_assets/css/signup4.css">
<%@include file="../_common/commonHeaderEnd.jsp"%>

<main id="main">

	<section class="category-section">
		<div class="container col-5" data-aos="fade-up">
			<div class="section-header d-flex justify-content-between align-items-center mb-5">
				<h2>회원가입</h2>
			</div>
			<div class="container">
					<form  class=""  onsubmit="return checkSubmit()" action="joinPro.me" id="fr">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="id" placeholder="5자 이상" minlength="5" required 
									onblur="checkId()" name="id"> 
							<label for="id">아이디<span id="CheckId" style="font-size: 15px;"></span></label>
	
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control" id="passwd" placeholder="비밀번호" required
									onblur="checkPass(); checkConfirmPasswd();" name="pass">
							<label  for="passwd">비밀번호<span id="CheckPassword1"></span></label> 
	
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control" id="passwd2" placeholder="비밀번호 확인" required
									onchange="checkConfirmPasswd()">
							<label for="passwd2">비밀번호 확인<span id="CheckPassword2"></span></label>
	
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="name" placeholder="이름" required
									onblur="checkName()" name="name">
							<label for="name">이름<span id="CheckName"></span></label>
						</div>
						<div class="form-floating mb-3">
							<input type="tel" class="form-control" id="phone" placeholder="연락처" required
									onblur="checkPhone()" name="phone">
							<label for="phone">연락처<span id="CheckPhone"></span></label>
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
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="birth" placeholder="생년월일8자" maxlength="10" required
									onblur="checkBirth()" name="birth">
							<label for="birth">생년월일 8자리<span id="CheckBirth"></span></label>
						</div>
						
												
						<div class="row">
							<div class="col-9">
								<div class="form-floating mb-3">
									<input type="email" class="form-control" id="email" placeholder="name@example.com" required
											onblur="checkEmail()" name="email">
									<label for="email">이메일<span id="CheckEmail"></span></label>
								</div>	
							</div>	
							<div class="col-3">	
								<button onclick="emailAuthentication()" id="eamilAuthBtn" disabled="disabled" class="btn btn-danger btn-lg" type="button" style="height:58px;">인증번호 발송</button>
							</div>
						</div>
						
						
						<div class="row justify-content-md-center">
							<div class="col-4">
								<div class="form-floating mb-3">
									<input type="text" class="form-control" id="emailCheck" placeholder="인증번호 입력" >
									<label for="emailCheck">인증번호 입력</label>
								</div>	
							</div>	
							<div class="col-3">	 
								<button onclick="authCodeCheck()" id="authCodeCheckBtn" class="btn btn-danger btn-lg" type="button" style="height:58px;">인증하기</button>
							</div>
						</div>
						<div class="d-grid gap-2" style="margin-top: 50px">
							<button class="btn btn-danger btn-lg" type="submit" id="joinbtn" disabled="disabled">가입</button>
						</div>
					</form>
			</div>
		</div>
	</section>

</main>

<%@include file="../_common/commonFooterStart.jsp"%>
<script src="jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/memberJS/join.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>