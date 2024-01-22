<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/find.css">
  <jsp:include page="../_common/header.jsp"></jsp:include>
</head>
<body>
				<c:if test="${sessionScope.sId != null }">
				<c:redirect url="main.me"/>
				</c:if>
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

									<button id="authCodeCheckBtn" onclick="authCodeCheck()" type="button" class="button gray-line w75px ml08">인증확인<!--인증확인--></button>
								</td>
							</tr>

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
											onblur="checkConfirmPasswd()">
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
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/memberJS/passfind.js"></script>
<%@include file ="../_common/commonFooterEnd.jsp" %>