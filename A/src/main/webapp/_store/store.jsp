<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@include file="../_common/commonHeaderStart.jsp"%>
<%@include file="../_common/commonHeaderEnd.jsp"%>
<!-- 상단 이미지 -->
<c:set var="storeItemListB" value="${requestScope.storeItemListB}" />
<c:set var="storeItemListS" value="${requestScope.storeItemListS}" />
<c:set var="storeItemListC" value="${requestScope.storeItemListC}" />

<main id="main">

	<!-- 상단 이미지 -->
	
	<div id="visual_top" class="visual_top visual_mall">
		<div class="inner">
			<img
				src="https://cf.lottecinema.co.kr//Media/WebAdmin/f04df114813f45b18e63e06308211d0f.jpg"
				alt="팝콘&amp;음료, 스낵에서 영화 티켓까지 한번에!" width="100%" height="300">
		</div>
	</div>
	
	<!-- 상단 메뉴 -->

	<div class="container border-bottom toptitle" data-aos="fade-up">
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
					<img src="assets/img/free-icon-coffee-5497772.png" alt="coffee"
						width="50" height="60"> <a href="#store3" class="more fs-1">커피</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 테두리 css -->
			
	<style type="text/css">
	
		.toptitle {position: sticky; top:70px;background-color: #fff;}
	
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
								<c:choose>
									<c:when test="${fn:startsWith(itemB.itemImage, 'https://')}">
										<img src="${itemB.itemImage}" alt="${itemB.itemName}">
									</c:when>
									
									<c:otherwise>
										<img src="_assets/img/${itemB.itemImage}" alt="${itemB.itemName}"
										style="width: 280px; height: 250px; margin: 20px;">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="itm_tit">
								<h1 class="text-danger"><i>BEST</i></h1>
								<h4>${itemB.itemName}</h4>
								<p>${itemB.itemDetail}</p>
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
								<c:choose>
									<c:when test="${fn:startsWith(itemS.itemImage, 'https://')}">
										<img src="${itemS.itemImage}" alt="${itemS.itemName}">
									</c:when>
									
									<c:otherwise>
										<img src="_assets/img/${itemS.itemImage}" alt="${itemS.itemName}"
										style="width: 280px; height: 250px; margin: 20px;">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="itm_tit">
								<h4>${itemS.itemName}</h4>
								<p>${itemS.itemDetail}</p>
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
				<h2>커피</h2>
			</div>

			<div class="row g-5">
				<c:forEach var="itemC" items="${storeItemListC}" varStatus="status">
					<div class="col-lg-4">
						<a href="storeList.st?itemIdx=${itemC.itemIdx}" class="text-center">
							<div class="itm_img">
								<c:choose>
									<c:when test="${fn:startsWith(itemC.itemImage, 'https://')}">
										<img src="${itemC.itemImage}" alt="${itemC.itemName}">
									</c:when>
									
									<c:otherwise>
										<img src="_assets/img/${itemC.itemImage}" alt="${itemC.itemName}"
										style="width: 280px; height: 250px; margin: 20px;">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="itm_tit">
								<h4>${itemC.itemName}</h4>
								<p>${itemC.itemDetail}</p>
							</div>
							<div class="txt_price_wrap">
								<span class="txt_price"
									style="font-weight: bold; color: #FF243E;"> <i>${itemC.itemPrice}원</i></span>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	
</main>

<%@include file="../_common/commonFooterStart.jsp"%>
<%@include file="../_common/commonFooterEnd.jsp"%>