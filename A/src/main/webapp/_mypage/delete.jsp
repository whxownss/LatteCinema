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
        <form action="deletePro.me" id="moveFrm" method="post" name="fr">
			<div id="contents" class="">
				<h2 class="tit">회원탈퇴</h2>
			
				<p class="reset">[주의] 라떼시네마 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
			
				<div class="user-out mt10">
					<ol>
						<li>
							<p class="txt">1. 30일간 회원 재가입이 불가능합니다.</p>
			
							<ul class="dot-list mt10">
								<li>회원 탈퇴 후, 30일 경과 후 재가입할 수 있습니다.</li>
							</ul>
						</li>
						<li>
							<p class="txt">2. 다음에 경우에 회원 탈퇴가 제한됩니다.</p>
			
							<ul class="dot-list mt10">
								<li>영화예매 내역이 있는 경우</li>
								<li>모바일오더 주문건이 있는 경우</li>
								<li>기명식 기프트카드 잔액이 있을 경우</li>
								<li>기명식 기프트카드가 카드정지 상태인 경우</li>
								<li>기명식 기프트카드 환불신청이 진행중인 경우</li>
							</ul>
						</li>
						<li>
							<p class="txt">3. 탈퇴 후 삭제 내역</p>
							<p>(회원 탈퇴하시면 회원정보와 개인 보유 포인트 등 정보가 삭제되며 데이터는 복구되지 않습니다.)</p>
			
							<ul class="dot-list mt10">
								<li>라떼시네마 멤버십 포인트 및 적립/차감 내역</li>
								<li>관람권 및 쿠폰</li>
								<li>영화 관람 내역</li>
								
							</ul>
						</li>
			
						<li>
							<p class="txt">4. 회원님의 비밀번호를 입력하시고 [탈퇴] 버튼을 클릭해주세요.</p>
			
							<div class="table-wrap">
								<table class="board-form">
									<caption>비밀번호 입력 항목을 가진 회원 탈퇴시 비밀번호 확인 표</caption>
									<colgroup>
										<col style="width:180px;">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">
												<label for="pwd_chk">비밀번호</label>
											</th>
											<td>
												<input type="password" class="input-text w160px" id="pwd" name="pass">
											</td>
										</tr>
										<input id="ibxSchPwdLoginId" type="hidden" value="${sessionScope.sId}" name="id"><!--아이디-->
										<input id="ibxSchPwdMbNm" type="hidden" value="${sessionScope.sName}" name="name"><!--이름-->
									</tbody>
								</table>
							</div>
						</li>
					</ol>
				</div>
			
				<div class="btn-group">
					<button class="button large" id="cancelBtn">취소</button>
					<button class="button purple large" id="submitBtn" >탈퇴</button>
				</div>
			</div>
        </form>
      </div>
    </div>
  </section>
</main>
<%@include file ="../_common/commonFooterStart.jsp" %>

<%@include file ="../_common/commonFooterEnd.jsp" %>