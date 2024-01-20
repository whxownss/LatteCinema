<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
	<link rel="stylesheet" href="_assets/css/res_1.css">
<%@include file ="../_common/commonHeaderEnd.jsp" %>

<c:if test="${sessionScope.sId == null}">
	<c:redirect url="login.me" />
</c:if>

<!-- 인원 선택 Modal1 -->
<div class="modal fade" id="warning" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
<!--       <div class="modal-header"> -->
<!--         <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1> -->
<!--       </div> -->
      <div class="modal-body">
        <div class="text-center mt-5 mb-5 fw-bold">인원을 선택해 주십시오.</div>
      </div>
      <div class="modal-footer ps-0 pe-0 pt-0 pb-0">
        <button type="button" class="btn btn-light w-100 ms-0 me-0 mt-0 mb-0"" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal1 -->
<!-- 좌석 중복 Modal2 -->
<div class="modal fade" id="seatWarning" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
<!--       <div class="modal-header"> -->
<!--         <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1> -->
<!--       </div> -->
      <div class="modal-body">
        <div class="text-center mt-5 mb-5 fw-bold">해당 좌석은 이미 판매가 되었습니다.<br>다른 좌석을 선택하여 주십시오.</div>
      </div>
      <div class="modal-footer ps-0 pe-0 pt-0 pb-0">
        <button type="button" class="btn btn-light w-100 ms-0 me-0 mt-0 mb-0"" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal2 -->

	<main id="main">
			
		<section class="category-section">
			<div class="container" data-aos="fade-up">
				<div class="container text-center">
				<div class="row border border-secondary">
				
					<!-- 젤 바깥 1번 --> 
					<div class="col-1 border border-secondary p-0">
						<ul class="list-group h-100 rounded-0">
							<li class="list-group-item h-100 ps-0 pe-0 done">
								<span class="position-absolute top-50 start-50 translate-middle w-100">01<br>상영시간</span>
							</li>
							<li class="list-group-item h-100 ps-0 pe-0 active">
								<span class="position-absolute top-50 start-50 translate-middle w-100">02<br>인원/좌석</span>
							</li>
							<li class="list-group-item h-100 ps-0 pe-0">
								<span class="position-absolute top-50 start-50 translate-middle w-100">03<br>결제</span>
							</li>
							<li class="list-group-item h-100 ps-0 pe-0">
								<span class="position-absolute top-50 start-50 translate-middle w-100">04<br>결제완료</span>
							</li>
						</ul>
					</div>
					
					<!-- 젤 바깥 2번 -->
					<div class="col">
						<div class="row p-2 bg-black text-white">
							<div class="col-4"></div>
							<div class="col-4 text-center">인원/좌석 선택</div>
							<div class="col-4 text-end"><small>*인원은 최대 8명까지 선택 가능합니다.</small></div>
						</div>
						<div class="d-flex justify-content-between">  
							<div class="p-2 flex-shrink-2 d-flex">
								<div><img src="" style="height: 100px" class="poster"></div>
								<div class="d-flex flex-column p-2 text-start">
									<span>
										<img src="" class="rating">
										<span class="mTitle"></span>
									</span>
									<span>
										<span class="date"></span>
									</span>
									<span>
										<span class="sTime"></span>
										<span class="eTime"></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
										<span class="sIdx"></span>
									</span>
								</div>
							</div>
							<div class="p-2 d-flex align-items-center">
								<ul class="d-flex align-items-center mb-0">
									<li class="d-flex flex-row ms-3">
										<span class="me-1 d-flex align-items-center">성인 </span>
										<div class="count-wrap _count">
										    <button type="button" class="minus d-flex justify-content-center pmBtn">-</button>
										    <span class="inpp align-middle cntPerson" id="pCase1">0</span>
										    <button type="button" class="plus d-flex justify-content-center pmBtn">+</button>
										</div>
									</li>
									<li class="d-flex flex-row ms-3">
										<span class="me-1 d-flex align-items-center">청소년 </span>
										<div class="count-wrap _count">
										    <button type="button" class="minus d-flex justify-content-center pmBtn">-</button>
										    <span class="inpp align-middle cntPerson" id="pCase2">0</span>
										    <button type="button" class="plus d-flex justify-content-center pmBtn">+</button>
										</div>
									</li>
									<li class="d-flex flex-row ms-3">
										<span class="me-1 d-flex align-items-center">경로 </span>
										<div class="count-wrap _count">
										    <button type="button" class="minus d-flex justify-content-center pmBtn">-</button>
										    <span class="inpp align-middle cntPerson" id="pCase3">0</span>
										    <button type="button" class="plus d-flex justify-content-center pmBtn">+</button>
										</div>
									</li>
								</ul>
							</div>
						</div>
						
						<div class="row bg-black text-white">
							<div class="drawSeat" style="height:700px">
								<div class="bg-secondary mt-3 mb-5 fs-5">S C R E E N</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col bg-secondary text-white p-4 text-start fs-4">총 합계 <span class="fs-1" id="mPrice">0</span>원</div>
							<div class="col-2 bg-danger text-white p-4 fs-6 mca myMouse goRes3Btn">결제하기</div>
						</div>
					</div>
					
					
				</div>
			</div>
			</div>
		</section>
	
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/resJS/res2.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>