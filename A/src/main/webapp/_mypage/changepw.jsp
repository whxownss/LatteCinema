<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
  <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
   <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
 
</head>
<body>


<jsp:include page="../_common/header.jsp"></jsp:include>
<main id="main">
  <section class="category-section">
    <div class="container has-lnb" data-aos="fade-up">
      <!-- 이곳에 코드작성 -->
      <div class="inner-wrap">
        <jsp:include page="lnb.jsp"></jsp:include>
        <form id="moveFrm" method="post" action="changepwPro.me">
			<div id="contents">
				<h2 class="tit">비밀번호 변경</h2>
			
				<ul class="dot-list mb10">
					<li>현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요.</li>
				</ul>
			
				<div class="table-wrap mb20">
					<table class="board-form">
						<caption>현재 비밀번호, 새 비밀번호, 새 비밀번호 확인 항목을 가진 표</caption>
						<colgroup>
							<col style="width:180px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="pwnow">현재 비밀번호</label></th>
								<td>
									<input type="password" id="pwnow" class="input-text w150px">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="pwnew">새 비밀번호</label></th>
								<td>
									<input type="password" id="pwnew" class="input-text w150px"><br>
									<span class="ml10 font-size-14">※ 영문, 숫자, 특수문자 중 2가지 이상 조합하여 8~16자리 이상으로 입력 해 주세요.</span>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="repwnew">새 비밀번호 재입력</label></th>
								<td>
									<input type="password" id="repwnew" class="input-text w150px"><br>
									<span class="ml10 font-size-14">※ 비밀번호 확인을 위해 한 번 더 입력해 주시기 바랍니다.</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			
				<ul class="dot-list">
					<li>생년월일, 전화번호 등 개인 정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수 있으니 사용을 자제해 주세요.</li>
					<li>비밀번호는 3-6개월마다 꼭 바꿔 주세요.</li>
					<li>비밀번호 변경시 모바일 기기와 홈페이지에서 모두 로그아웃됩니다. 변경한 비밀번호로 다시 로그인해주세요.</li>
				</ul>
			
				<div class="btn-group pt40">
					<button class="button large" id="cancelBtn">취소</button>
					<button class="button purple large" data-key="login_6758fffb0fcb4bbc95d178ad1ad35abc" id="updateBtn">수정</button>
				</div>
			</div>
        </form>
      </div>
    </div>
  </section>
</main>
<%@include file ="../_common/commonFooterStart.jsp" %>
<script>
// 비밀번호 정규식
var lengthRegexPass = /^[A-Za-z0-9!@#$%]{8,16}$/; // 영문 대소문자 숫자 특수문자 8~16자 규칙(패스워드)
// 비밀번호 확인 유효성 (새 비밀번호 > 새 비밀번호 재입력 확인 유효성)



</script>
<%@include file ="../_common/commonFooterEnd.jsp" %>