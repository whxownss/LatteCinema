<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../_common/commonHeaderStart.jsp"%>
<%@include file="../_common/commonHeaderEnd.jsp"%>
<!-- 상단 이미지 -->
<c:set var="storeItemListB" value="${requestScope.storeItemListB}" />
<c:set var="storeItemListS" value="${requestScope.storeItemListS}" />
<c:set var="storeItemListT" value="${requestScope.storeItemListT}" />

<main id="main">

	<!-- 상단 이미지 -->
	
	<div id="visual_top" class="visual_top visual_mall"
		style="margin-top: 40px; margin-bottom: 40px;">
		<div class="inner">
			<img
				src="https://cf.lottecinema.co.kr//Media/WebAdmin/f04df114813f45b18e63e06308211d0f.jpg"
				alt="팝콘&amp;음료, 스낵에서 영화 티켓까지 한번에!" width="100%" height="300">
		</div>
	</div>
	
	<!-- 상단 메뉴 -->

	<div class="container" data-aos="fade-up">
		<div class="container text-center">
			<div class="row">
				<div class="col coll">
					<img src="assets/img/free-icon-hot-1859430.png" alt="hot"
						width="50" height="60"> <a href="#store1" class="more fs-1">베스트</a>
				</div>
				<div class="col coll">
					<img src="assets/img/free-icon-popcorn-864818.png" alt="popcorn"
						width="50" height="60"> <a href="#store2" class="more fs-1">스낵음료</a>
				</div>
				<div class="col coll">
					<img src="assets/img/free-icon-ticket-432312.png" alt="ticket"
						width="50" height="70"> <a href="#store3" class="more fs-1">관람권</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 테두리 css -->
			
	<style type="text/css">
		
		/* 상단메뉴 css */
		.coll {border:#FFF 2px solid; border-radius: 50px;}
		.coll:hover {border:#F00 2px solid;}
		
		/* 메뉴 css */
		.col-lg-4 {border:#FFF 2px solid; border-radius: 25px;}
		.col-lg-4:hover {border:#F00 2px solid;}
		
	</style>
		
	<!-- ////////// 메인 //////////	 -->

	<!-- 베스트 -->

	<section class="category-section fs-5" id="store1">
		<div class="container" data-aos="fade-up">
			<span class="anchor"
				style="display: block; height: 20px; margin-top: 20px; visibility: hidden;"></span>
			<div
				class="section-header d-flex justify-content-between align-items-center mb-5">
				<h2>베스트</h2>
			</div>

			<div class="row g-5">
				<c:forEach var="itemB" items="${storeItemListB}" varStatus="status">
					<div class="col-lg-4">
						<a href="storeList.st?itemIdx=${itemB.itemIdx}" class="text-center">
							<div class="itm_img">
								<img src="${itemB.itemImage}" alt="${itemB.itemName}">
							</div>
							<div class="itm_tit">
								<h4>${itemB.itemName}</h4>
								<p>${itemB.itemDatail}</p>
							</div>
							<div class="txt_price_wrap">
								<span class="txt_price"
									style="font-weight: bold; color: #FF243E;"> <i>${itemB.itemPrice}원</i></span>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	
	<!-- 스낵음료 -->

	<section class="category-section fs-5" id="store2">
		<div class="container" data-aos="fade-up">
			<span class="anchor"
				style="display: block; height: 20px; margin-top: 20px; visibility: hidden;"></span>
			<div
				class="section-header d-flex justify-content-between align-items-center mb-5">
				<h2>스낵음료</h2>
			</div>

			<div class="row g-5">
				<c:forEach var="itemS" items="${storeItemListS}" varStatus="status">
					<div class="col-lg-4">
						<a href="storeList.st?itemIdx=${itemS.itemIdx}" class="text-center">
							<div class="itm_img">
								<img src="${itemS.itemImage}" alt="${itemS.itemName}">
							</div>
							<div class="itm_tit">
								<h4>${itemS.itemName}</h4>
								<p>${itemS.itemDatail}</p>
							</div>
							<div class="txt_price_wrap">
								<span class="txt_price"
									style="font-weight: bold; color: #FF243E;"> <i>${itemS.itemPrice}원</i></span>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- 관람권 -->

	<section class="category-section fs-5" id="store3">
		<div class="container" data-aos="fade-up">
			<span class="anchor"
				style="display: block; height: 20px; margin-top: 20px; visibility: hidden;"></span>
			<div
				class="section-header d-flex justify-content-between align-items-center mb-5">
				<h2>관람권</h2>
			</div>

			<div class="row g-5">
				<c:forEach var="itemT" items="${storeItemListT}" varStatus="status">
					<div class="col-lg-4">
						<a href="storeList.st?itemIdx=${itemT.itemIdx}" class="text-center">
							<div class="itm_img">
								<img src="${itemT.itemImage}" alt="${itemT.itemName}">
							</div>
							<div class="itm_tit">
								<h4>${itemT.itemName}</h4>
								<p>${itemT.itemDatail}</p>
							</div>
							<div class="txt_price_wrap">
								<span class="txt_price"
									style="font-weight: bold; color: #FF243E;"> <i>${itemT.itemPrice}원</i></span>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	
	<!-- 하단 광고 이미지 -->

	<section class="category-section fs-5">
		<div class="container w-100%" data-aos="fade-up">
			<span class="anchor"
				style="display: block; height: 20px; margin-top: 20px; visibility: hidden;"></span>
			<div class="banner_01">
				<!-- 영화 : 트롤 -->
				<!-- <a href="#"><img -->
				<!-- 	src="https://cf2.lottecinema.co.kr/lotte_image/2023/Trolls_BandTogether/1220/Trolls_BandTogether_980180.jpg" -->
				<!-- 	alt="트롤: 밴드 투게더 절찬상영중 전체관람가 12월, 가장 짜릿한 컴백 무대의 시작!" width="100%"></a> -->
				<!-- 영화 : 노량 -->
				<a href="#"><img
					src="https://cf2.lottecinema.co.kr/lotte_image/2023/Noryang_DeadlySea/1220/Noryang_DeadlySea_980180.jpg"
					alt="노량: 죽음의 바다 절찬상영중 12세이상관람가 2023년 12월, 모두를 압도할 최후의 전투가 시작된다"
					width="100%"></a>	
			</div>
	</section>

</main>

<%@include file="../_common/commonFooterStart.jsp"%>
<%@include file="../_common/commonFooterEnd.jsp"%>