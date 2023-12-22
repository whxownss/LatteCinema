<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../_common/commonHeaderStart.jsp"%>
<%@include file="../_common/commonHeaderEnd.jsp"%>

<main id="main">
<script src="../jQuery/jquery-3.6.0.js"></script>

   <script>
      $(function(){
         
         // 수량 옵션
         $('._count :button').on({
             'click' : function(e){

                 e.preventDefault();
                 var count = $(this).parent('._count').find('.inpp').text();
                 var now = parseInt(count);
                 var min = 1;
                 var max = 5;
                 var num = now;
                 
                 if($(this).hasClass('minus')){
                     var type = 'm';
                 }else{
                     var type = 'p';
                 }
                 if(type=='m'){
                     if(now>min){
                         num = now - 1;
                     }
                 }else{
                     if(now<max){
                         num = now + 1;
                     }
                 }
                 if(num != now){
                     $(this).parent('._count').find('.inpp').text(num);
                 }
             }
         });
         
         // 상품금액
         $(".inpp").on("DOMSubtreeModified", function(){
				// 좌석 선택 다 해야 뜨는걸로
				var p1 = parseInt($("#price").text().replace(/[^\d]+/g, ""));
				var p2 = parseInt($(".inpp").text());
				
				var sum = p1 * p2;
				
				var sPrice = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				
				$("#sPrice").text(sPrice);
				
			});
		
         // 3자리 콤마
         var price = $('#price').text();
         var money = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         $('#price').text(money);
         
      });
   </script>

	<section class="category-section">
		<div class="container" data-aos="fade-up">

			<!-- 메인 -->

			<section class="contents d-flex">
				<div class="col-6" style="display: flex; justify-content: center;">
					<img
						src="https://img.megabox.co.kr/SharedImg/store/2020/12/29/M8qiScDr6orSchgFPCRCcCtLPVenv6tm_280.png"
						alt="더 부티크 스위트 전용관람권" onerror="noImg(this);">
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
									<h3 class="section-header fs-1">
										<i>5만 관람권</i>
									</h3>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th colspan="2" scope="row" class="text-center"><span
									class="fs-3" id="price">50000</span>원</th>
							</tr>
							<tr>
								<th scope="row">구성품</th>
								<td class="text-end">5만원 상품권</td>
							</tr>
							<tr>
								<th scope="row">구매제한</th>
								<td class="text-end">제한없음</td>
							</tr>
							<tr>
								<th scope="row">유효기간</th>
								<td class="text-end">24 개월</td>
							</tr>
							<tr>
								<th scope="col" style="padding-top: 3%">총 상품금액</th>
								<td class="text-end" style="font-weight: bold; color: #FF243E;">
									<span class="fs-2" id="sPrice">50,000</span>원
								</td>
							</tr>
							<tr class="border border-bottom-0 border-white">
								<td scope="row" class="text-center" colspan="4">
									<div class="input-group mb-3 container _count"
										style="width: 400px; padding-top: 4%; text-align: center;">
										<button class="minus btn btn-outline-secondary"
										style="text-align: center; padding-left: 20px; padding-right: 20px;">-</button>
										<label class="inpp input-group-text border border-secondary fs-5" for="inputGroupFile01"
											style="text-align: center; padding-left: 133px; padding-right: 133px;">1</label>
										<button class="plus btn btn-outline-secondary"
										style="text-align: center; padding-left: 20px; padding-right: 20px;">+</button>
									</div>
								</td>
							</tr>
							<tr class="border border-0 border-white">
								<td scope="row" class="text-center" colspan="4">
									<button class="btn btn-secondary btn-lg"
										style="text-align: center; padding-left: 60px; padding-right: 60px;">선물하기</button>
									<button class="btn btn-danger btn-lg"
										style="text-align: center; padding-left: 60px; padding-right: 60px;">구매하기</button>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
		</div>
	</section>
	<!-- 메인 -->

	<!-- 정보	 -->

	<section class="category-section">
		<div class="container" data-aos="fade-up">

			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button collapsed fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="false" aria-controls="collapseOne">
							<font style="vertical-align: inherit;"><h3>사용방법</h3></font>
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
										쿠폰함에서 확인 후 롯데시네마 홈페이지, 모바일 웹/앱에서 사용 가능합니다.<br>- 선물한
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
							<font style="vertical-align: inherit;"><h3>유의사항</h3></font>
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
	</section>
	<!-- 정보	 -->
</main>

<%@include file="../_common/commonFooter.jsp"%>