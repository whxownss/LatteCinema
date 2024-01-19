<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../_common/commonHeaderStart.jsp"%>
<%@include file="../_common/commonHeaderEnd.jsp"%>

<c:set var="storeItem" value="${requestScope.storeItemJson}" />

<main id="main">

	<!-- 메인 -->

	<section class="category-section">
		<div class="container" data-aos="fade-up">

			<section class="contents d-flex">
				<div class="col-6" style="display: flex; justify-content: center;">
					<img id="itemImage" alt="itemName" style="width: 400px; height: 450px;">
				</div>
				<article class="col-4">
					<table class="pd_table fs-5 table table-sm">
						<colgroup>
							<col style="width: 35%;">
							<col style="width: auto;">
						</colgroup>
						<thead>
							<tr>
								<th scope="row" class="text-center border-bottom-0" colspan="4">
									<h3 class="section-header fs-1" id="itemName">
									</h3>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th colspan="2" scope="row" class="text-center"><span
									class="fs-3" id="price"></span>원</th>
							</tr>
							<tr>
								<th scope="row">구성품</th>
								<td class="text-end" id="detail"></td>
							</tr>
							<tr>
								<th scope="row">사용방법</th>
								<td class="text-end">오프라인</td>
							</tr>
							<tr>
								<th scope="row">유효기간</th>
								<td class="text-end">무제한</td>
							</tr>
							<tr>
								<th scope="col" style="padding-top: 3%">총 상품금액</th>
								<td class="text-end" style="font-weight: bold; color: #FF243E;">
									<span class="fs-2" id="sPrice"></span>원 
								</td>
							</tr>
							<tr class="border border-bottom-0 border-white">
								<td scope="row" class="text-center" colspan="4">
									<div class="input-group mb-3 container _count"
										style="width: 400px; padding-top: 4%; text-align: center;">
										<button class="minus btn btn-outline-secondary"
											style="text-align: center; padding-left: 20px; padding-right: 20px;">-</button>
										<label
											class="inpp input-group-text border border-secondary fs-5"
											for="inputGroupFile01"
											style="text-align: center; padding-left: 133px; padding-right: 133px;">1</label>
										<button class="plus btn btn-outline-secondary"
											style="text-align: center; padding-left: 20px; padding-right: 20px;">+</button>
									</div>
								</td>
							</tr>
							<tr class="border border-0 border-white">
								<td scope="row" class="text-center" colspan="4">
									<button class="btn btn-secondary btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo"
										style="text-align: center;">
										 <img src="assets/img/free-icon-gift-box-4108395.png" alt="선물하기"
												width="30" height="30"/></button>
									<button class="btn btn-danger btn-lg" onclick="requestPay()"
										style="text-align: center; padding:10px; padding-left: 130px; padding-right: 130px;"><b>구매하기</b></button>
								</td>
							</tr>
						</tbody>
					</table>
					
					<!-- 선물하기 모달 내용 -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-2" id="exampleModalLabel">선물하기</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form onsubmit="return false">
										<div class="form-floating mb-3">
											<input type="tel" class="form-control" id="phone"
												placeholder="연락처" onblur="checkPhone()" required> <label
												for="phone">받으시는 분 (휴대폰 번호) <span id="checkPhone"></span>
											</label>
										</div>
										<div class="mb-3">
											<label for="message-text" class="col-form-label">
												메시지 (최대 100글자) :</label>
											<textarea class="form-control" rows="5" id="msg" maxlength="100"
												placeholder="즐거운 관람 되세요~"></textarea>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
									<button type="button" id="btn_gift" class="btn btn-danger"
										onclick="requestPay('gift')">선물보내기</button>
								</div>
							</div>
						</div>
					</div>

				</article>
			</section>
		</div>
	</section>

	<!-- 정보	 -->

	<section class="category-section">
		<div class="container" data-aos="fade-up">

			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button collapsed fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="false" aria-controls="collapseOne">
							<font style="vertical-align: inherit;">사용방법</font>
						</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse"
						aria-labelledby="headingOne" data-bs-parent="#accordionExample"
						style="">
						<div class="accordion-body">
							<div
								class="section-header d-flex justify-content-between align-items-center mb-5">
								<h2>사용방법</h2>
							</div>

							<div class="tab_con">
								<ul class="list_txt">
									<p>
										- 스토어 상품은 회원만 구매할 수 있습니다.<br>- 일반관람권의 경우 2D 일반영화에 사용
										가능합니다. (스페셜관 및 특수좌석 사용 불가)<br>- 영화관람권은 L.POINT 적립이 불가합니다.<br>-
										유효기간은 24개월로 관람일 기준입니다.<br>- 구매한 영화관람권은 마이시네마 &gt; 나의
										쿠폰함에서 확인 후 라떼시네마 홈페이지, 모바일 웹/앱에서 사용 가능합니다.<br>- 선물한
										영화관람권은 문자쿠폰(MMS)으로 발송되며 롯데시네마 홈페이지, 모바일 웹/앱에서 사용 가능합니다.<br>-
										선물한 상품은 마이시네마 &gt; 예매/구매내역 &gt; 선물내역 메뉴에서 30일 내 1회 재발송 가능합니다.
										단, 받는 사람 번호는 변경 불가합니다.<br>- 관람권 사용 시 VIP 승급금액은 관람권 구매금액으로
										반영됩니다.<br>- 관람권 구매금액보다 낮은 금액의 티켓 구매 시 구매금액이 아닌 티켓 금액으로
										VIP 승급금액이 반영됩니다. (예; 조조, 심야, 문화의 날 등)
									</p>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">
							<font style="vertical-align: inherit;">유의사항</font>
						</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse"
						aria-labelledby="headingTwo" data-bs-parent="#accordionExample"
						style="">
						<div class="accordion-body">
							<div
								class="section-header d-flex justify-content-between align-items-center mb-5">
								<h2>유의사항</h2>
							</div>

							<div class="tab_con">
								<h5 class="sec_tit fw-bold">취소/환불</h5>
								<ul class="list_txt">
									<p>
										- 스토어 상품의 취소기한은 구매일로부터 70일 입니다.<br>- 구매취소는 취소기한 내 마이시네마
										&gt; 예매/구매내역에서만 가능합니다.(현장취소 불가)<br>- 구매하신 상품은 부분환불 및
										현금환불이 불가합니다.<br>- 여러 상품을 한 번에 구매한 경우 일괄 취소만 가능하며, 사용한 상품이
										있을 때는 환불 불가합니다.
									</p>
								</ul>
								<h5 class="sec_tit fw-bold">기타</h5>
								<ul class="list_txt ">
									<p>
										- 본 관람권은 기재된 유효기간까지 (관람일 기준) 사용할 수 있습니다. <br>- 유효기간 만료 시
										고객센터(1544-8855)를 통해 발급일로부터 5년까지 연장할 수 있으며, 1회 연장 시 단위는 3개월입니다.
										<br>- 고객센터: 1544-8855<font face="맑은 고딕"> 유료</font>
									</p>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
</main>

<!-- ///// 자바스크립트 ///// -->

<%@include file="../_common/commonFooterStart.jsp"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/storeJS/storeList.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>