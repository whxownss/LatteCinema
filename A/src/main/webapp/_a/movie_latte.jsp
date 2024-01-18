
<%@page import="com.itwillbs.domain.MovieDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>>
  <link rel="stylesheet" href="_assets/css/hover.css">
  
<%@include file ="../_common/commonHeaderEnd.jsp" %>

<main id="main">

  <%@include file="../_common/commonMovieSlide.jsp"%>




<section class="category-section" id="vote">
    <div class="container" data-aos="fade-up">
      <div class="section-header d-flex justify-content-between align-items-center mb-5">
        <h3>라떼 무비 - 3월의 상영 유력 후보</h3>
         <a href="cs_recommend.cs" class="more">투표하러 가기</a>
      </div> 
      <div class="row g-5">
      <c:forEach var="recommend" items="${recommendList}" varStatus="status">
        <div class="col-lg">
          <div class="post-entry-1 lg">
            <label for="vote-1"><img src="${recommend.poster }" class="img-fluid" style="width: 100%;"></label>
            <div>
	            <div>${recommend.movieName }</div> 
	            <div> 추천 수: ${recommend.countReco }</div>
            </div>
           </div>
        </div>
       </c:forEach>
        
	  </div>
	</div>
</section>
	<!-- End Lifestyle Category Section -->
	
	 <section class="category-section">
	  <div class="container" data-aos="fade-up">		     
			<div class="section-header d-flex justify-content-between align-items-center mb-5">
	  		<h3>1월의 라떼</h3>
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













</main>

<%@include file ="../_common/commonFooterStart.jsp" %>
<%@include file ="../_common/commonFooterEnd.jsp" %>
