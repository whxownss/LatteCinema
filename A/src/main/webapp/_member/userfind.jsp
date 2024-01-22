<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%MemberDTO memberDTO = (MemberDTO)request.getAttribute("memberDTO"); %>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.0/css/bootstrap.min.css">
  <jsp:include page="../_common/header.jsp"></jsp:include>

</head>
<body class="d-flex flex-column min-vh-100">
				<c:if test="${sessionScope.sId != null }">
				<c:redirect url="main.me"/>
				</c:if>

	<main id="main">
		<section class="category-section">
			<div class="container w-50" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->

				<!-- member-wrap -->
				<div class="member-wrap">
			
					<!-- col-wrap -->
					<div class="col-wrap">
						<!-- col -->
						<div class="col">
			
							<p class="tit-member">아이디/비밀번호 찾기<!--아이디/비밀번호 찾기--></p>
			
							<div class="tab-list">
								<ul>
									<li class="on"><a href="javaScript:void(0);" title="아이디찾기 선택">아이디 찾기<!--아이디찾기--></a></li>
									<li><a href="passfind.me" title="비밀번호 찾기 선택">비밀번호 찾기<!--비밀번호 찾기--></a></li>
								</ul>
							</div>
			
							<h2 class="tit mt40">간편찾기<!--간편찾기--></h2>
						<form id="userFindForm" action="userfindPro.me" method="post" name="fr">
							<div class="table-wrap">
								<table class="board-form">
									<caption>이름, 생년월일, 휴대폰 번호 항목을 가진 아이디 찾기 입력 표<!--이름, 생년월일, 휴대폰 번호 항목을 가진 아이디 찾기 입력 표--></caption>
									<colgroup>
										<col style="width:130px;">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="name">이름<!--이름--></label></th>
											<td>
												<input id="name" maxlength="20" type="text" placeholder="이름" class="input-text w240px findInput" name="name"><!--이름-->
											</td>
										</tr>
										<tr>
											<th scope="row"><label for="birth">생년월일<!--생년월일--></label></th>
											<td>
												<input id="birth" maxlength="8" type="text" placeholder="생년월일 8자리" class="input-text w240px findInput" name="birth"><!--생년월일 8자리-->
												<span id="schIdBirthDe-error-text" class="alert"></span>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for="phone">휴대폰 번호<!--휴대폰 번호--></label></th>
											<td>
												<input id="phone"  maxlength="11" type="text" placeholder="'-' 없이 입력" class="input-text w240px findInput" name="phone"><!--'-' 없이 입력-->
												<span id="schIdMblpNo-error-text" class="alert"></span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="btn-member-bottom v1">
<!-- 								<button id="btnFindId" type="button" class="button purple large" disabled="disabled" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="userFind()">아이디 찾기아이디 찾기</button> -->
								<button id="btnFindId" type="button" class="button purple large" disabled="disabled" >아이디 찾기<!--아이디 찾기--></button>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/memberJS/userfind.js"></script>
<%@include file ="../_common/commonFooterEnd.jsp" %>