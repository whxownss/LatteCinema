<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
	<link rel="stylesheet" href="_assets/css/res_1.css">
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
		<section class="category-section">
			<div class="container" data-aos="fade-up">
				
				<div class="container text-center">
				<div class="row border border-secondary">
				
					<!-- 젤 바깥 1번 --> 
					<div class="col-1 border border-secondary p-0">
						<ul class="list-group h-100 rounded-0">
							<li class="list-group-item h-100 ps-0 pe-0 done border-bottom">
								<span class="position-absolute top-50 start-50 translate-middle w-100">01<br>상영시간</span>
							</li>
							<li class="list-group-item h-100 ps-0 pe-0 done border-bottom">
								<span class="position-absolute top-50 start-50 translate-middle w-100">02<br>인원/좌석</span>
							</li>
							<li class="list-group-item h-100 ps-0 pe-0 done">
								<span class="position-absolute top-50 start-50 translate-middle w-100">03<br>결제</span>
							</li>
							<li class="list-group-item h-100 ps-0 pe-0 active">
								<span class="position-absolute top-50 start-50 translate-middle w-100">04<br>결제완료</span>
							</li>
						</ul>
					</div>
					
					<!-- 젤 바깥 2번 -->
					<div class="col bg-body-secondary">
						<div class="row">
							<div class="col p-2 bg-black text-white">결제완료</div>
						</div>
						
						
						<div class="row text-center pt-3">
							<img src="_assets/img/payOK.png" class="" style="width:120px; height:100px; margin: 0 auto;"> 
							<div class="pt-3"><span class="buyerName"></span> 회원님, 결제가 성공적으로 완료되었습니다.</div>
						</div>
						
						
						<div class="row bg-white mt-3 w-50" style="margin-left: 25%; ">
							<div  style="margin-top: 4%; margin-bottom: 4%;">
								<div class="d-flex justify-content-center">
								  <div class="p-2">
								  	<img src="assets/img/post1.jpg" style="height: 200px">
								  </div>
								  <div class="p-2">
										<table class="h-100">
											<tr class="border-bottom border-dark-subtle mb-2">
												<th class="text-start pe-3">예매번호</th>
												<th class="text-start resIdx"></th>
											</tr>
											
											<tr>
												<td class="text-start">상영일시</td>
												<td class="text-start">
													<span class="date"></span>
													<span class="sTime"></span> ~ 
													<span class="eTime"></span>
												</td>
											</tr>
											
											<tr>
												<td class="text-start">상영관</td>
												<td class="text-start">
													<span class="cinema"></span>
													<span class="sIdx"></span>
												</td>
											</tr>
											
											<tr>
												<td class="text-start">관람인원</td>
												<td class="text-start personType"></td>
											</tr>
											
											<tr>
												<td class="text-start">좌석</td>
												<td class="text-start seat"></td>
											</tr>
										</table>
								  </div>
								</div>
							</div>
						</div>
						
						
						<div class="row mt-3 " style="margin-left: 25%;">
							<ul class="text-start" style="list-style-type : disc;">
								<li class="text-danger">온라인 예매 내역 취소는 상영 시작 20분 전까지 온라인에서 가능합니다.</li>
								<li class="text-danger">상영시작 20분전 이후 부터는 영화관 현장에서만 취소 가능합니다.</li>
								<li class="text-danger">포토카드는 구매일로부터 30일까지 출력할 수 있습니다.</li>
								<li>전립 예정 포인트는 영화 관람 다음 날 적립 됩니다.</li>
								<li>예고편 상영으로 실제 영화 시작 시간이 10분 정도 차이 날 수 있습니다.</li>
								<li>SMS 수신을 이용하시면 예매내역을 휴대폰으로 받을 수 있습니다.</li>
								<li>개인정보 보호 정책에 따라 주민번호로 예매 티켓을 찾을 수 없습니다.</li>
							</ul>
						</div>
						
						<div class="mt-5 mb-3">
							<button type="button" class="btn btn-light me-2 btn-outline-dark" style="width:200px; height:50px;">결제내역</button>
							<button type="button" class="btn btn-danger ms-2" style="width:200px; height:50px;">홈으로 바로가기</button>
						</div>
						
					</div>
						
						
						
					</div>
					
				</div>



			</div>
		</section>
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>	
<script src="jQuery/jquery-3.6.0.js"></script>
<script>
// var schDTO = JSON.parse(localStorage.getItem("schDTO"));
var rsp = JSON.parse(localStorage.getItem("rsp"));

$(function(){
	debugger;
	$(".buyerName").text(rsp.buyer_name);
	$(".resIdx").text(rsp.merchant_uid);
	$(".sTime").text(rsp.s_time);
	$(".eTime").text(rsp.eTime);
	$(".sIdx").text(rsp.scr_idx);
	$(".seat").text(rsp.seat);
	$(".date").text(rsp.date);
	$(".cinema").text(rsp.cinema);
	var personType = [];
	if(rsp["p1"] != "0") personType.push("성인 " + rsp["p1"]);
	if(rsp["p2"] != "0") personType.push("청소년 " + rsp["p2"]);
	if(rsp["p3"] != "0") personType.push("경로 " + rsp["p3"]);
	debugger;
	$(".personType").append("<span>" + personType.join(', ') + "</span>")
	
})

</script>
<%@include file="../_common/commonFooterEnd.jsp"%>