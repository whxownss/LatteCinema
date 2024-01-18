<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.itwillbs.domain.ScheduleDTO"%>
<%@page import="com.itwillbs.domain.CinemaDTO"%>
<%@page import="com.itwillbs.domain.LocationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../_common/commonHeaderStart.jsp"%>
	<link rel="stylesheet" href="_assets/css/res_1.css">
<%@include file="../_common/commonHeaderEnd.jsp"%>

<c:set var="locationList" value="${requestScope.locationList}" />
<c:set var="cinemaListJson" value="${requestScope.cinemaListJson}" />

<!-- Modal1 -->
<div class="modal fade" id="warning" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
<!--       <div class="modal-header"> -->
<!--         <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1> -->
<!--       </div> -->
      <div class="modal-body">
        <div class="text-center mt-5 mb-5 fw-bold">영화관을 선택해 주십시오.</div>
      </div>
      <div class="modal-footer ps-0 pe-0 pt-0 pb-0">
        <button type="button" class="btn btn-light w-100 ms-0 me-0 mt-0 mb-0"" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal1 -->

<!-- Modal2 -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <input type="hidden" id="schDTO"></input>
      <div class="modal-header d-flex justify-content-between pt-2 pb-2 bg-secondary-subtle" >
      	<div style="width: 32px"></div>
        <div><h1 class="modal-title fs-5 text-center" id="modalTitle"></h1></div>
        <div class="ppa"><button type="button" class="btn-close pt-0 pb-0 vca" data-bs-dismiss="modal" aria-label="Close"></button></div>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="text-center" id="modalSeat">
        		잔여좌석
        		<span class="fw-bold fs-4 cSeat"></span>
        		/
        		<span class="aSeat"></span>
        	</div>
        </div>
        <div class="row">
        	<div class="text-center mainTitle mb-1">
        		<img class="modalRating pb-1" src=""/>
        		<span class="">본 영화는 </span>
        		<span class="ratingText"></span>
        		<span class=""> 영화입니다.</span>
        	</div>
        	
        	<div class="text-center subTitle">
        		<div class="subText " style='font-size: small'></div>
        	</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger goRes2Btn">인원/좌석 선택</button>
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
							<li class="list-group-item h-100 ps-0 pe-0 active" aria-current="true" id="test1">
								<span class="position-absolute top-50 start-50 translate-middle w-100">01<br>상영시간</span>
							</li>
							<li class="list-group-item h-100 ps-0 pe-0">
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
						<div class="row">
							
							<!-- 지역 및 영화관 --> 
							<div class="col-3 border border-secondary hErrorP">  <!-- hErrorP --> 
								<div class="row" >
									<div class="col p-2 bg-black text-white" id="selectedCinema">지역 및 영화관</div> <!-- .selected -->
								</div>
								<div class="row hErrorC" style="">  <!-- hErrorC --> 
									<div class="col p-0 bg-body-secondary">
										<ul class="list-group text-start mb-0 ps-0 rounded-0">
											<c:forEach var="location" items="${locationList}" varStatus="status">
												<li class="list-group-item border border-0 bg-body-secondary myLocation myMouse" 
													id="lo${status.index + 1}">${location.loName}</li>
											</c:forEach>
										</ul>
									</div>
									<div class="col p-0">
										<ul class="list-group border border-0 text-start mb-0 ps-0 rounded-0 showLocations ">
										</ul>
									</div>
								</div>
							</div>
							
							<!-- 영화 -->
							<div class="col-4 border border-secondary hErrorP">
								<div class="row">
									<div class="col p-2 bg-black text-white" id="selectedMovie">영화</div>
								</div>
								<div class="row hErrorC" style="">
									<div class="col p-0 bg-body-secondary">
										<ul class="list-group text-start mb-0 ps-0 rounded-0">
											<li class="list-group-item border border-0 bg-body-secondary myMovie myMouse" id="OLD">옛날영화</li>
											<li class="list-group-item border border-0 bg-body-secondary myMovie myMouse" id="NOW">최신영화</li>
										</ul>
									</div>
									<div class="col p-0">
										<ul class="list-group border border-0 text-start mb-0 ps-0 rounded-0 showMovies scrollable" style="height: 450px; overflow: auto;">
										</ul>
									</div>
								</div>
							</div>
							
							<!-- 날짜 및 시간 -->
							<div class="col-5 border border-secondary">
								<div class="row">
									<div class="col p-2 bg-black text-white" id="selectedDate">날짜 및 시간</div>
								</div>
								<div class="row">
									<div class="col p-0">
										<input type='date' name='date' value="날짜" min="" max="" id="myCalendar" class="w-100 text-center border border-0 bg-body-secondary"/>
									</div>
								</div>
								<div class="row" >
									<div class="col" id="showTimeTable" style="height: 450px; overflow: auto;">								
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
				</div>
			</div>
			<div><button id="forTest" style="margin-left: 100%;">TEST</button></div>
			<div ><a href="res2.re" style="margin-left: 100%;"><button>res2 이동</button></a></div>

		</div>
	</section>

</main>

<%@include file="../_common/commonFooterStart.jsp"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/resJS/res1.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>