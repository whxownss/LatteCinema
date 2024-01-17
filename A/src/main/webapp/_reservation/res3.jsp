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
									  	<img src="" class="poster" style="height: 200px">
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
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/resJS/res3.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>