<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
	<link rel="stylesheet" href="_assets/css/res_1.css">
<%@include file ="../_common/commonHeaderEnd.jsp" %>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
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
							<li class="list-group-item h-100 ps-0 pe-0 done">
								<span class="position-absolute top-50 start-50 translate-middle w-100">02<br>인원/좌석</span>
							</li>
							<li class="list-group-item h-100 ps-0 pe-0 active">
								<span class="position-absolute top-50 start-50 translate-middle w-100">03<br>결제</span>
							</li>
							<li class="list-group-item h-100 ps-0 pe-0">
								<span class="position-absolute top-50 start-50 translate-middle w-100">04<br>결제완료</span>
							</li>
						</ul>
					</div>
					
					<!-- 젤 바깥 2번 -->
					<div class="col">
						<div class="row">
							
							<!-- 지역 및 영화관 --> 
							<div class="col border border-secondary hErrorP">  <!-- hErrorP --> 
								<div class="row" >
									<div class="col p-2 bg-black text-white" id="selectedCinema">예매정보</div> <!-- .selected -->
								</div>
								<div class="row hErrorC">  <!-- hErrorC --> 
									<div class="d-flex flex-column">
									  <div class="p-2">
									  	<img src="assets/img/post1.jpg" style="height: 200px">
									  </div>
									  <div class="p-2 d-flex flex-column text-start">
										<span class="mb-1">
											<img src="" class="rating pb-2">
											<span class="fs-4 fw-bold title"></span>
										</span>
										<span class="fs-5 fw-semibold">일시</span>
										<span class="mb-1">
											<span class="date"></span>
											<span class="sTime"></span> ~ 
											<span class="eTime"></span>
										</span>
										<span class="fs-5 fw-semibold">영화관 및 좌석</span>
										<span class="mb-1">
											<span class="cinema"></span>
											<span class="sIdx"></span> / 
											<span class="seat"></span>
										</span>
										<span class="fs-5 fw-semibold">인원</span>
										<span class="mb-1 personType">
										</span>
									  </div>
									</div>
								</div>
							</div>
							
							<!-- 영화 -->
							<div class="col border border-secondary">
								<div class="row">
									<div class="col p-2 bg-black text-white" id="selectedMovie">결제수단</div>
								</div>
								<div class="row bg-body-secondary">
									
									<div class="col" style="height:700px;">
										<div class="row border-bottom border-dark-subtle" style="height:350px;">
											<div class="text-start mt-2" style="height:20px;">할인 / 포인트</div>
											<div class="mt-2"  style="height:100%;">
												<table class="w-100">
													<tr>
														<th class="text-start">보유 포인트</th>
														<td class="text-end"><span id="nowPoint">23,000</span></td>
													</tr>
													
													<tr>
														<th class="text-start">사용 포인트</th>
														<td class="text-end"><input type="text" id="inputPoint" class="text-end"></td>
													</tr>
													
													<tr>
														<th class="text-start">사용 후 포인트</th>
														<td class="text-end"><span id="resultPoint"></span></td>
													</tr>
												</table>
											
											</div>
											
										</div>
									
										<div class="row" style="height:350px;">
											<div class="text-start mt-2" style="height:20px;">결제수단</div>
											<div class="d-flex flex-row mt-2" style="height:100%;">
											  <button type="button" class="btn btn-light btn-outline-secondary me-1 payType">신용/체크카드</button>
											  <button type="button" class="btn btn-light btn-outline-secondary me-1 payType">카카오페이</button>
											  <button type="button" class="btn btn-light btn-outline-secondary payType">토스페이</button>
											</div>
										</div>
									</div>
									
								</div>
							</div>
							
							<!-- 날짜 및 시간 -->
							<div class="col border border-secondary">
								<div class="row">
									<div class="col p-2 bg-black text-white" id="selectedMovie">결제하기</div>
								</div>
								<div class="row bg-body-secondary">
									<div class="col" style="height:700px;">
										<div class="row border-bottom border-dark-subtle" style="height:350px;">
												<div class="text-start mt-2" style="height:20px;">금액</div>
												<div class="mt-2 border-bottom border-dark-subtle"  style="height:155px;">
													<table class="w-100">
														<tr>
															<td class="text-start" style="width: 15%">성인</td>
															<td><span style="width: 1%" class="p1"></span></td>
															<td class="text-start">명</td>
															<td class="text-end"><span id="pTP1"></span></td>
														</tr>
														
														<tr>
															<td class="text-start">청소년</td>
															<td><span class="p2"></span></td>
															<td class="text-start">명</td>
															<td class="text-end"><span id="pTP2"></span></td>
														</tr>
														
														<tr>
															<td class="text-start">경로</td>
															<td><span class="p3"></span></td>
															<td class="text-start">명</td>
															<td class="text-end"><span id="pTP3"></span></td>
														</tr>
														
														<tr>
															<th class="text-start" colspan="3">합계</th>
															<th class="text-end"><span id="sumPrice"></span>원</th>
														</tr>
													</table>
												</div>
											<div style="height: 175px">
												<div class="text-start">할인금액</div>
												<div class="text-danger text-start">-<span id="salePrice"></span>원</div>
											</div>
										</div>
										<div class="row" style="height:350px;">
											<div class="text-start mt-2 fw-bold" style="height:200px;">
<!-- 												총 결제금액<span class="fs-4" id="rsPrice" style="margin-left: 160px"></span>원 -->
												<table class="w-100">
													<tr>
														<th>총 결제금액</th>
<!-- 														<th class="text-end" id="rsPrice" style=""></th> -->
														<th class="text-end"><span id="rsPrice"></span>원</th>
													</tr>
												</table>
											</div>
											<div id="lastPay" class="mca myMouse" style="heigth:40px;">결제하기</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
				</div>
			</div>
				
			<div ><a href="res4.re" style="margin-left: 100%;"><button>res4 이동</button></a></div>
			</div>
		</section>
	
	</main>
<%@include file="../_common/commonFooterStart.jsp"%>
<script src="jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
//구매자 정보
const user_email =  "whxownss@gmail.com" //response.req_user_email
const username = "홍홍길똥" //response.req_username

//결제창 함수 넣어주기
const buyButton = document.getElementById('lastPay')
buyButton.setAttribute('onclick', `kakaoPay('${user_email}', '${username}')`)

var IMP = window.IMP;

var today = new Date();
var hours = today.getHours();
var minutes = today.getMinutes();
var seconds = today.getSeconds();
var milliseconds = today.getMilliseconds();
// var makeMerchantUid = `${hours}` + `${minutes}` + `${seconds}` + `${milliseconds}`;        이거 왜 안 먹지?
var makeMerchantUid = "" + hours + minutes + seconds + milliseconds;


function kakaoPay(useremail, username) {
	debugger;
	var isTimeOver = false;
	// 내가 결제중에 SEAT테이블에 정보가 사라질 때 ******************************
	$.ajax({
		type: "GET",
		url: "res3ProSE.re",
		data: {schDTO: JSON.stringify(schDTO)},
		dataType: "text",
		async: false
	})
	.done(function(data){
		if(data == "true") {
			isTimeOver = true;
			alert('시간이 만료되었습니다.');
		}
		debugger;
	})
	.fail(function(){
		debugger;
	})
	if(isTimeOver) return;
	
	
	debugger;
	
	if (confirm("구매 하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
    if (1 == 1) { // 회원만 결제 가능
//          const emoticonName = document.getElementById('title').innerText

         IMP.init("imp16802722"); // 가맹점 식별코드
         IMP.request_pay({
             pg: 'html5_inicis.INIpayTest', // PG사 코드표에서 선택
             pay_method: 'card', // 결제 방식
             merchant_uid: "IMP" + makeMerchantUid, // 결제 고유 번호
             name: '라떼시네마', // 제품명
             amount: 100, // 가격  parseInt($("#rsPrice").text().replace("," , ""))
             //구매자 정보 ↓
             buyer_email: `${useremail}`,
             buyer_name: '조조태준'
             // buyer_tel : '010-1234-5678',
             // buyer_addr : '서울특별시 강남구 삼성동',
             // buyer_postcode : '123-456'
         }, async function (rsp) { // callback
        	 debugger;
             if (rsp.success) { //결제 성공시
//                  console.log(rsp);
//                  localStorage.setItem('rsp', JSON.stringify(rsp));
//          		 localStorage.setItem('schDTO', JSON.stringify(schDTO));
//          		 window.location = "res4.re";

			$.each(schDTO, (k, v) => {
				if(k == "seat"){
					v = v.join(", ");
				}
				rsp[k] = v;
			})
			debugger;
			
			// 결제 정보 db에 insert
			$.ajax({
				type: "GET",
				url: "res3Pro.re",
				data: {rsp: JSON.stringify(rsp)},
				dataType: "text" 
			})
			.done(function(data){
				alert(data);
				localStorage.setItem('rsp', JSON.stringify(rsp));
        		window.location = "res4.re";
			})
			.fail(function(){
			})
                 //결제 성공시 프로젝트 DB저장 요청
//                  if (response.status == 200) { // DB저장 성공시
//                      alert('결제 완료!')
//                      window.location.reload();
//                  } else { // 결제완료 후 DB저장 실패시
//                      alert(`error:[${response.status}]\n결제요청이 승인된 경우 관리자에게 문의바랍니다.`);
//                      // DB저장 실패시 status에 따라 추가적인 작업 가능성
//                  }
             } else if (rsp.success == false) { // 결제 실패시
                 alert(rsp.error_msg)
             }
         });
     }
     else { // 비회원 결제 불가
         alert('로그인이 필요합니다!')
     }
 } else { // 구매 확인 알림창 취소 클릭시 돌아가기
     return false;
 }
}




var schDTO = JSON.parse(localStorage.getItem("schDTO"));
debugger;
$(function(){
	
	// schDTO 그리기
	$(".rating").attr("src", "_assets/img/grade_" + schDTO.rating + ".png");
	$(".title").text(schDTO.title);
	$(".date").text(schDTO.date);
	$(".sTime").text(schDTO.s_time);
	$(".eTime").text(schDTO.eTime);
	$(".scrIdx").text(schDTO.scr_idx);
	$(".seat").text(schDTO.seat.join(', '));
	$(".date").text(schDTO.date);
	$(".cinema").text(schDTO.cinema);
	var personType = [];
	if(schDTO["p1"] != "0") personType.push("성인 " + schDTO["p1"]);
	if(schDTO["p2"] != "0") personType.push("청소년 " + schDTO["p2"]);
	if(schDTO["p3"] != "0") personType.push("경로 " + schDTO["p3"]);
	$(".personType").append("<span>" + personType.join(', ') + "</span>")
	$(".p1").text(schDTO["p1"]);
	$(".p2").text(schDTO["p2"]);
	$(".p3").text(schDTO["p3"]);
	$("#pTP1").text(schDTO["p1"] * 12000);
	$("#pTP2").text(schDTO["p2"] * 7000);
	$("#pTP3").text(schDTO["p3"] * 5000);
	
	
	// 할인받기전 금액 합
	var sumP = parseInt($("#pTP1").text()) + parseInt($("#pTP2").text()) + parseInt($("#pTP3").text());
	$("#sumPrice").text(sumP.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

	// 처음에 총 금액
	$("#salePrice").text(0);
	$("#rsPrice").text($("#sumPrice").text());
	
	// 호버시 마우서 커서 모양 변경
	$(".myMouse").css({
		"cursor": "pointer"
	});
	
	
	$("#inputPoint").on("keydown", function(e){
		var iPoint = parseInt($("#inputPoint").val().replace(/[^\d]+/g, ""));
		var nPoint = parseInt($("#nowPoint").text().replace(/[^\d]+/g, ""));
		// 				e.key == 'Enter' 일단보류
		if(e.key == 'Delete'     ||
		   e.key == 'ArrowLeft'  ||
		   e.key == 'Backspace'  || 
		   e.key == 'ArrowRight' ||
		   e.key >= 0 && e.key <= 9) {
			return true;
		}
		return false;
	});
	$("#inputPoint").on("change", function(e){
		var tmp = $("#inputPoint").val();
		var result = tmp.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#inputPoint").val(result);
		
		iTmp = parseInt(tmp.replace(/[^\d]+/g, ""));
		var nTmp = parseInt($("#nowPoint").text().replace(/[^\d]+/g, ""));

		$("#resultPoint").text("사용하실 포인트를 다시 입력해주세요.");
		
		if(isNaN(iTmp)) iTmp = 0;
		
		// 굿
		if(!(iTmp <= nTmp)) return;
		var rs = (nTmp - iTmp).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#resultPoint").text(rs);
		
		$("#salePrice").text(iTmp);
		
		// 총금액 합
		var sP = sumP - iTmp; 
		$("#rsPrice").text(sP.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	});
	$("#inputPoint").on("focus", function(){
		$("#inputPoint").val($("#inputPoint").val().replace(/[^\d]+/g, ""));
	});
	
	
	
	
	
});
	
	
	
	</script>
<%@include file="../_common/commonFooterEnd.jsp"%>