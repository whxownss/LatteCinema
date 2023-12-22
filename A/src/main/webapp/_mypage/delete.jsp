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
<script type="text/javascript">


</script>

<jsp:include page="../_common/header.jsp"></jsp:include>
<main id="main">
  <section class="category-section">
    <div class="container has-lnb" data-aos="fade-up">
      <!-- 이곳에 코드작성 -->
      <div class="inner-wrap">
        <jsp:include page="lnb.jsp"></jsp:include>
        <form id="moveFrm" method="post">
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
					<li>간편 로그인 연동 정보</li>
				</ul>
			</li>
			<li>
				<p class="txt">4. 고객님께서 불편하셨던 점, 아쉬웠던 점을 알려주시면 앞으로 더 나은 모습으로 찾아 뵙겠습니다.</p>

				<ul class="reason">
					
						<li>
							<input type="radio" name="useroutcheck" id="userout01" value="서비스 장애가 잦아서">
							<label for="userout01">서비스 장애가 잦아서</label>
							
						</li>
					
						<li>
							<input type="radio" name="useroutcheck" id="userout02" value="이벤트 및 무료서비스 혜택이 적어서">
							<label for="userout02">이벤트 및 무료서비스 혜택이 적어서</label>
							
						</li>
					
						<li>
							<input type="radio" name="useroutcheck" id="userout03" value="불만 및 불편사항에 대한 고객응대가 나빠서">
							<label for="userout03">불만 및 불편사항에 대한 고객응대가 나빠서</label>
							
						</li>
					
						<li>
							<input type="radio" name="useroutcheck" id="userout04" value="영화관람시 시설 및 가격등의 불만 때문에">
							<label for="userout04">영화관람시 시설 및 가격등의 불만 때문에</label>
							
						</li>
					
						<li>
							<input type="radio" name="useroutcheck" id="userout05" value="이용빈도가 낮고 개인정보 유출이 우려되어">
							<label for="userout05">이용빈도가 낮고 개인정보 유출이 우려되어</label>
							
						</li>
					
						<li>
							<input type="radio" name="useroutcheck" id="userout06" value="탈퇴 후 재가입을 위해">
							<label for="userout06">탈퇴 후 재가입을 위해</label>
							
						</li>
					
						<li>
							<input type="radio" name="useroutcheck" id="userout07" value="기타">
							<label for="userout07">기타</label>
							
								<input type="text" class="input-text w600px ml10" title="기타 입력" id="etcText">
							
						</li>
					
						<li>
							<input type="radio" name="useroutcheck" id="userout08" value="휴면계정 만료">
							<label for="userout08">휴면계정 만료</label>
							
						</li>
					
				</ul>
			</li>
			<li>
				<p class="txt">5. 회원님의 비밀번호를 입력하시고 [탈퇴] 버튼을 클릭해주세요.</p>

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
									<input type="password" class="input-text w160px" id="pwd">
								</td>
							</tr>
							<input id="ibxSchPwdLoginId" type="hidden" value="goodtime555"><!--아이디-->
							<input id="ibxSchPwdMbNm" type="hidden" value="정기원"><!--이름-->
							<tr>
								<th scope="row"><label for="ibxSchPwdMblpTelno">휴대폰 번호<!--휴대폰 번호--></label></th>
								<td>
									<input type="text" id="ibxSchPwdMblpTelno" maxlength="11" placeholder="'-' 없이 입력" class="input-text w230px"><!--'-' 없이 입력-->
									<button id="btnSchPwdMbCertNoSend" type="button" class="button gray w100px ml08 disabled" disabled="disabled">인증요청<!--인증요청--></button>
								</td>
							</tr>
							<tr id="schPwdMblpCertRow">
								<th scope="row"><label for="ibxSchPwdMblpCharCertNo">인증번호<!--인증번호--></label></th>
								<td>
									<div class="chk-num">
										<div class="line">
											<input maxlength="4" type="text" id="ibxSchPwdMblpCharCertNo" class="input-text w180px" title="인증번호 입력" disabled="disabled"><!--인증번호 입력-->

											<div class="time-limit" id="schPwdtimer">
												3:00
											</div>
										</div>
									</div>

									<button id="btnSchPwdMblpCharCert" type="button" class="button gray-line w100px ml08 disabled" disabled="disabled">인증확인<!--인증확인--></button>
									<div id="schPwdMblpNo-error-text" class="alert"></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</li>
		</ol>
	</div>

	<div class="btn-group">
		<button class="button large" id="cancelBtn">취소</button>
		<button class="button purple large" id="submitBtn" disabled="">탈퇴</button>
	</div>
</div>
        </form>
      </div>
    </div>
  </section>
</main>
<jsp:include page="../_common/footer.jsp"></jsp:include>
</body>
</html>