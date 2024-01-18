<%@page import="com.itwillbs.domain.MovieDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file ="../_common/commonHeaderStart.jsp" %>
	<link rel="stylesheet" href="_assets/css/hover.css">
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
	
		<%@include file="../_common/commonMovieSlide.jsp"%>
			
	<% List<MovieDTO> lattePosterList = (List<MovieDTO>)request.getAttribute("lattePosterList");%>	
	<% List<MovieDTO> posterNowList = (List<MovieDTO>)request.getAttribute("posterNowList");%>
	
	 <section class="category-section">
	  <div class="container" data-aos="fade-up">		     
			<div class="section-header d-flex justify-content-between align-items-center mb-5">
	  		<h3>1월의 라떼..</h3>
			</div>
				
			<div class="row g-5">
			  <c:forEach var="movie" items="${lattePosterList}" varStatus="status">
			    <div class="col-lg-4">
			      <div class="post-entry-1 lg">
			        <div class="item position-relative" id="wrap">
			          <!-- 각 영화의 포스터 이미지를 동적으로 출력 -->
			          <img src="${movie.poster}" style="width: 100%;">
			          <div class="titlee">
			            <a href="#" class="moree">예매하기</a>
			            <!-- 상세정보로 페이지 이동 링크 -->
			            <a href="movie_view.mo?movieCode=${movie.movieCode}" class="moree">상세정보</a>
			          </div>
			        </div>
			      </div>
				 </div>
				</c:forEach>
			</div>     
		</div>
	</section> 
			

	<%-- <section class="category-section">
		<div class="container" data-aos="fade-up">
		  <div class="section-header d-flex justify-content-between align-items-center mb-5">
	        <h2>박스오피스</h2>
	        <div><a href="movie_now.mo" class="more">상영작 보러가기</a></div>
	      </div>
		
	      <div class="container" data-aos="fade-up">
			<div class="owl-carousel owl-theme">
				<c:forEach var="movie" items="${posterNowList}" varStatus="status">
		        <div class="item position-relative" id="wrap">
		          <img src="<c:out value="${movie.poster}" />" > 
					<div class="titleee">
						<a href="" class="moree">예매하기</a>
						<a href="${pageContext.servletContext.contextPath}/movie_view.mo?movieCode=${movie.movieCode}" class="moree">상세정보</a>
					</div>
		        </div>
	     	 	</c:forEach> 
		     </div>
	       </div>
       </div>
     </section>
	 --%>
	 
	 <section class="category-section">
    <div class="container" data-aos="fade-up">
        <div class="section-header d-flex justify-content-between align-items-center mb-5">
            <h3>최신 상영작</h3>
        </div>
        	<c:forEach var="i" begin="1" end="2" step="1">
	        	<c:if test="${i eq 1}">
	        		<div class="row g-5">
	            		<c:forEach var="movie" items="${posterNowList}" varStatus="loop">
			                <c:if test="${loop.index < 5}">
			                	<!-- 수정된 부분: col-lg를 col-lg-2로 변경, 2번째 줄부터는 offset-lg-1 클래스 추가 -->
				                <div class="col-lg">
				                    <div class="post-entry-1 lg">
				                        <div class="item position-relative" id="wrap">
				                            <!-- 각 영화의 포스터 이미지를 동적으로 출력 -->
				                            <img src="${movie.poster}" style="width: 100%;">
				                            <div class="titleeee">
				                                <a href="#" class="moree">예매하기</a>
				                                <!-- 상세정보로 페이지 이동 링크 -->
				                                <a href="movie_view.mo?movieCode=${movie.movieCode}" class="moree">상세정보</a>
				                            </div>
				                        </div>
				                    </div>
				                </div>
			                </c:if>
	            		</c:forEach>
	        		</div>
	        	</c:if>
	        	<c:if test="${i eq 2}">
	        		<div class="row g-5">
	            		<c:forEach var="movie" items="${posterNowList}" varStatus="loop">
			                <c:if test="${loop.index >= 5}">
			                	<!-- 수정된 부분: col-lg를 col-lg-2로 변경, 2번째 줄부터는 offset-lg-1 클래스 추가 -->
				                <div class="col-lg">
				                    <div class="post-entry-1 lg">
				                        <div class="item position-relative" id="wrap">
				                            <!-- 각 영화의 포스터 이미지를 동적으로 출력 -->
				                            <img src="${movie.poster}" style="width: 100%;">
				                            <div class="titleeee">
				                                <a href="#" class="moree">예매하기</a>
				                                <!-- 상세정보로 페이지 이동 링크 -->
				                                <a href="movie_view.mo?movieCode=${movie.movieCode}" class="moree">상세정보</a>
				                            </div>
				                        </div>
				                    </div>
				                </div>
			                </c:if>
	            		</c:forEach>
	        		</div>
	        	</c:if>
			</c:forEach>
        	
    </div>
</section>
	
	</main>
	
<%@include file ="../_common/commonFooterStart.jsp" %>
<%@include file ="../_common/commonFooterEnd.jsp" %>
