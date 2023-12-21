<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
	<link rel="stylesheet" href="../_assets/css/res_1.css">
	<script src="../jQuery/jquery-3.6.0.js"></script>
	<script>
	
		$(function(){

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
									  	<img src="../assets/img/post1.jpg" style="height: 200px">
									  </div>
									  <div class="p-2 d-flex flex-column text-start">
										<span class="fs-4 fw-bold">서울의 봄</span>
										<span class="fs-5 fw-semibold">일시</span>
										<span class="mb-1">2020-09-17 (금) 16:11 ~ 23:11</span>
										<span class="fs-5 fw-semibold">영화관 및 좌석</span>
										<span class="mb-1">서면 3관 / B03</span>
										<span class="fs-5 fw-semibold">인원</span>
										<span class="mb-1">성인1</span>
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
															<td><span style="width: 1%">2</span></td>
															<td class="text-start">명</td>
															<td class="text-end"><span id="pTP1">28000</span></td>
														</tr>
														
														<tr>
															<td class="text-start">청소년</td>
															<td><span>3</span></td>
															<td class="text-start">명</td>
															<td class="text-end"><span id="pTP2">21000</span></td>
														</tr>
														
														<tr>
															<td class="text-start">경로</td>
															<td><span>0</span></td>
															<td class="text-start">명</td>
															<td class="text-end"><span id="pTP3">0</span></td>
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
				
			</div>
		</section>
	
	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>