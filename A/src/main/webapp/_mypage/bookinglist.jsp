<%@page import="com.itwillbs.domain.ReservationDTO"%>
<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>

  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
  <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
   <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
</head>
<body>
<jsp:include page="../_common/header.jsp"></jsp:include>
<main id="main">
<c:if test="${sessionScope.sId == null}">
   <c:redirect url="login.me" />
</c:if>
  <section class="category-section">
    <div class="container has-lnb" data-aos="fade-up">
      <!-- 이곳에 코드작성 -->
      <div class="inner-wrap">

        <jsp:include page="lnb.jsp"></jsp:include>
			
			<div id="contents">
				<h2 class="tit">예매/구매 내역</h2>
			
				<div class="tab-block tab-layer">
					<ul>
						<li data-url="/mypage/bookinglist?tab=01" data-tit="예매/구매 내역" title="예매구매 내역 탭으로 이동" class="on"><a href="#myBokdArea" class="btn">예매 / 구매 </a></li>
					</ul>
				</div>
				<div class="tab-cont-wrap">
			
					<!-- 예매내역 -->
					<div id="myBokdArea" class="tab-cont on"><a href="" class="ir">예매  탭 화면 입니다.</a>
			
						<!-- 예매 조회 조건 -->
						<div class="board-list-search mt20">
							<table summary="예매 조회 조건">
								<colgroup>
									<col style="width:75px;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">구분 </th>
										<td>
											<input type="radio" id="radBokd01" name="radBokd" value="B" checked="checked">
											<label for="radBokd01"><b> 예매내역 </b><small>  </small></label>
										</td>
										<td>
											<input type="radio" id="radBokd02" name="radBokd" value="C">
											<label for="radBokd02"><b> 상품구매내역 </b><small>  </small></label>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 예매 조회 조건 End -->
			
		<%
		ArrayList<ReservationDTO> resBoardList = (ArrayList<ReservationDTO>)request.getAttribute("resBoardList");
		ArrayList<ReservationDTO> resRefundList = (ArrayList<ReservationDTO>)request.getAttribute("resRefundList");
		PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
		%>
						
						<!-- 예매 영화 목록 -->
<!-- 						<div id="bokdList"><div class="no-history-reservation mt20"> 구매 내역이 없습니다. </div></div> -->
						
						<div class="table-relative mt10">
<!-- 							<table class="board-list"> -->
							<table class="table table-bordered border-Info">
<%-- 								<caption>구매일시, 영화명, 극장, 상영일시, 구매금액 항목을 가진 구매내역 목록 표</caption> --%>
								<colgroup>
									<col style="width:120px;">
									<col style="width:110px;">
									<col style="width:90px;">
									<col style="width:90px;">
									<col style="width:90px;">
									<col style="width:70px;">
									<col style="width:105px;">
									<col style="width:70px;">
									<col style="width:75px;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="text-center">예매번호</th>
										<th scope="col" class="text-center">구매일시</th>
										<th scope="col" class="text-center">영화명</th>
										<th scope="col" class="text-center">상영관</th>
										<th scope="col" class="text-center">관람인원</th>
										<th scope="col" class="text-center">좌석</th>
										<th scope="col" class="text-center">상영일시</th>
										<th scope="col" class="text-center">금액</th>
										<th scope="col" class="text-center">환불</th>
									</tr>
								</thead>
								<tbody id="tbody">
								<c:forEach var="reservationDTO" items="${resBoardList}">
									<tr>
										<td class="text-center align-middle">${reservationDTO.merchantUid}</td>
										<td scope="row" class="text-center align-middle">${reservationDTO.payTime}</td>
										<td scope="row" class="text-center align-middle">${reservationDTO.title}</td>
										<td scope="row" class="text-center align-middle">${reservationDTO.cinema} ${reservationDTO.scrIdx }</td>
										<td scope="row" class="text-center align-middle">성인${reservationDTO.p1}명 청소년${reservationDTO.p2}명 경로${reservationDTO.p3}명</td>
										<td scope="row" class="text-center align-middle">${reservationDTO.seat}</td>
										<td scope="row" class="text-center align-middle">${reservationDTO.date} ${reservationDTO.sTime}~${reservationDTO.schEtime}</td>
										<td scope="row" class="text-center align-middle">${reservationDTO.paidAmount}</td>
										<td scope="row" class="text-center align-middle"><button class="btn btn-dark" type="button">환불</button></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							
							<!-- 페이징 처리 -->
							<section class="category-section" id="">
							<div class="container" data-aos="fade-up">
								<div class="pagination-container d-flex justify-content-center">
								  <ul class="pagination" id="searchPaging">
									<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
									    <li class="page-item ">
									      <a class="page-link text-secondary" href="bookinglist.me?pageNum=${pageDTO.startPage - pageDTO.pageBlock }" tabindex="-1" aria-disabled="true">이전</a>
									    </li>
								    </c:if>	
								    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
									    <li class="page-item" aria-current="page">
									      <a class="page-link text-secondary" href="bookinglist.me?pageNum=${i }">${i }</a>
									    </li>
								    </c:forEach>
						    		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
									    <li class="page-item">
									      <a class="page-link text-secondary" href="bookinglist.me?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">다음</a>
									    </li>
								    </c:if>	
								  </ul>
								</div>
							</div>
						</section>
		
						</div>
						
						<h3 class="tit mt70"><b>나의 취소내역</b></h3>
			
						<ul class="dot-list">
							<li>최근 3개월 내역</li>
						</ul>
			
						<!-- 취소한 예매 영화 목록 -->
						<div class="table-wrap mt10">
							<table class="board-list" summary="취소일시, 영화명, 극장, 상영일시, 취소금액 항목을 가진 취소내역 목록 표" id="refundTable">
								<caption>취소일시, 영화명, 극장, 상영일시, 취소금액 항목을 가진 취소내역 목록 표</caption>
								<colgroup>
									<col style="width:160px;">
									<col>
									<col style="width:130px;">
									<col style="width:188px;">
									<col style="width:105px;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="text-center">취소일시</th>
										<th scope="col" class="text-center">영화명</th>
										<th scope="col" class="text-center">상영관</th>
										<th scope="col" class="text-center">상영일시</th>
										<th scope="col" class="text-center">취소금액</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="reservationDTO" items="${resRefundList}">
									<tr>
										<td>취소날짜들어갈곳</td>
										<td>${reservationDTO.title}</td>
										<td>${reservationDTO.cinema} ${reservationDTO.scrIdx }</td>
										<td>${reservationDTO.date} ${reservationDTO.sTime}~${reservationDTO.schEtime}</td>
										<td>${reservationDTO.paidAmount}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							
							<!-- 페이징 처리 -->
<!-- 							<section class="category-section" id=""> -->
<!-- 							<div class="container" data-aos="fade-up"> -->
<!-- 								<div class="pagination-container d-flex justify-content-center"> -->
<!-- 								  <ul class="pagination" id="searchPaging"> -->
<%-- 									<c:if test="${pageDTO.startPage > pageDTO.pageBlock}"> --%>
<!-- 									    <li class="page-item "> -->
<%-- 									      <a class="page-link text-secondary" href="bookinglist.me?pageNum=${pageDTO.startPage - pageDTO.pageBlock }" tabindex="-1" aria-disabled="true">이전</a> --%>
<!-- 									    </li> -->
<%-- 								    </c:if>	 --%>
<%-- 								    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1"> --%>
<!-- 									    <li class="page-item" aria-current="page"> -->
<%-- 									      <a class="page-link text-secondary" href="bookinglist.me?pageNum=${i }">${i }</a> --%>
<!-- 									    </li> -->
<%-- 								    </c:forEach> --%>
<%-- 						    		<c:if test="${pageDTO.endPage < pageDTO.pageCount}"> --%>
<!-- 									    <li class="page-item"> -->
<%-- 									      <a class="page-link text-secondary" href="bookinglist.me?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">다음</a> --%>
<!-- 									    </li> -->
<%-- 								    </c:if>	 --%>
<!-- 								  </ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</section> -->
		
						</div>
			
<!-- 						<nav class="pagination" id="navBokd"><strong class="active">1</strong> </nav> -->
						
						<!-- 예매 안내상황  -->
						
						<div class="box-pulldown mt30">
							<div class="tit">
								<div type="box-polaroid" class="btn-toggle text-center more fs-3">이용안내</div>
							<div class="box-inner" style="padding: 20px;">
								<strong>[예매 안내]</strong>
								<ul class="dot-list mb30">
									<li>만 4세(48개월) 이상부터는 영화티켓을 반드시 구매하셔야 입장 가능합니다.</li>
									<li>예매 변경은 불가능하며, 취소 후 재 예매를 하셔야만 합니다.</li>
									<li>메가박스 모바일앱을 이용할 경우 티켓출력없이 모바일티켓을 통해 바로 입장하실 수 있습니다.</li>
								</ul>
			
								<strong>[티켓교환 안내]</strong>
								<ul class="dot-list mb30">
									<li>극장의 무인발권기(KIOSK)를 통해 예매번호 또는 고객확인번호(생년월일+휴대폰번호)를 입력하여 편리하게 티켓을 발권하실 수 있습니다.</li>
									<li>무인발권기 이용이 어려우신경우, 티켓교환권을 출력하여 매표소에 방문하시면 티켓을 발권하실 수 있습니다.</li>
									<li>(티켓교환권 출력이 어려운경우 예매번호와 신분증을 지참하여 매표소에 방문하시면 티켓을 발권하실 수 있습니다)</li>
								</ul>
			
								<strong>[예매취소 안내]</strong>
								<ul class="dot-list">
									<li>온라인(홈페이지/모바일) 예매 취소는 상영시간 20분전까지 입니다.</li>
									<li>위탁 예매 사이트 이용 시 취소 및 환불 규정은 해당 사이트 규정을 따릅니다.</li>
									<li>LIVE 공연 콘텐트는 취소 기준은 아래와 같습니다.
										<ul class="dash-list">
											<li>관람 4일전 : 취소 가능</li>
											<li>관람 3일 ~ 1일전 : 취소 수수료 부담 후 취소 가능</li>
											<li>관람 당일 : 취소 및 환불 불가</li>
										</ul>
									</li>
									<li>공연 관람시 시작 시간 이후에는 입장이 제한 됩니다.</li>
									<li>발권된 티켓은 상영시간 전까지 현장 방문 시에만 취소가 가능합니다.</li>
								</ul>
							</div>
						</div>
						</div>
						<!-- 예매 안내상황 End -->
					</div>
			
					</div>
				</div>
      </div>
    </div>
  </section>
</main>
<%@include file ="../_common/commonFooterStart.jsp" %>
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
<script type="text/javascript">
$(function(){
	$('#refundTable').DataTable({
		pagingType: 'full_numbers'
	});
	
	$("#tbody").on("click","button",function() {
		 var $row = $(this).closest("tr");
	    // 해당 행 안에 있는 'memId' 셀의 텍스트 내용
	    var mid = $row.find("td:first-child").text();
		if(confirm('정말 취소하시겠습니까?')){
			//window.location.href="";//여기서 res로 가도 되나?
			$.ajax({
					type: "POST",
					url: "res4Pro.re",
					data: {mid: mid},
					dataType: "text"
				})
				.done(function(data){
					debugger;
					if(data == "환불 성공"){
						window.location.href="bookinglist.me";
//		 				$.ajax({
//		 					type: "POST",
//		 					url: "res4ProRF.re",
//		 					data: {mid: rsp.merchant_uid},
//		 					datType: "text"
//		 				})
//		 				.done(function(data){
							
//		 				})
//		 				.fail(function(){})
					}
				})
				.fail(function(){})
		}else {
			alert('취소 싫어')
		}
	    
	});
	$("#radBokd02").on("click",function(){
		window.location.href="bookinglist2.me";
	});
	
});//document ready

</script>
<%@include file ="../_common/commonFooterEnd.jsp" %>