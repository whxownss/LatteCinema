<%@page import="com.itwillbs.domain.CenterBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../_common/commonHeaderStart.jsp" %>
	<link rel="stylesheet" href="_assets/css/hover.css">
<%@include file ="../_common/commonHeaderEnd.jsp" %>
  <main id="main">
    <%@include file="../_common/commonMovieSlide.jsp"%>
<%
ArrayList<CenterBoardDTO> centerBoardList = (ArrayList<CenterBoardDTO>)request.getAttribute("centerBoardList");
%>	
	
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
			          <img src="${movie.poster}" style="width:400px; height: 600px;">
			          <div class="titlee">
			            <a href="${pageContext.servletContext.contextPath}/res1.re?movieCode=${movie.movieCode}" class="moree">예매하기</a>
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

    <!-- 일별 박스오피스 -->

	<section class="category-section">
		<div class="container" data-aos="fade-up">
		  <div class="section-header d-flex justify-content-between align-items-center mb-5">
	        <h2>박스오피스</h2>
	        <div><a href="movie_now.mo" class="more">상영작 보러가기</a></div>
	      </div>
		
	      <div class="container" data-aos="fade-up">
			<div class="owl-carousel owl-theme">
				<c:forEach var="movie" items="${posterNowList}" varStatus="status">
		        <div class="item position-relative" id="wrap">
		          <img src="<c:out value="${movie.poster}" />" style="width:203px; height: 290px;" >
		        <%--   <em class="fs-1 fst-italic text-white ps-2  position-absolute bottom-0 start-0">${status.index + 1}</em>  --%>
		          <!-- <em class="fs-1 fst-italic text-white ps-2  position-absolute bottom-0 start-0">1</em> -->
		          <!-- 순위 매일 변동인데, 매일 뿌릴 방법이 없음 -->
		          <!-- 라떼시네마 자체 누적 관객수로 랭킹 만드는게 차라리 나아보임 -->
					<div class="titleee">
						<a href="${pageContext.servletContext.contextPath}/res1.re?movieCode=${movie.movieCode}" class="moree">예매하기</a>
						<a href="${pageContext.servletContext.contextPath}/movie_view.mo?movieCode=${movie.movieCode}" class="moree">상세정보</a>
					</div>
		        </div>
	     	 	</c:forEach> 
		     </div>
	       </div>
       </div>
     </section>
     
     
     <!-- ======= Lifestyle Category Section ======= -->
    <section class="category-section">
      <div class="container" data-aos="fade-up">

        <div class="section-header d-flex justify-content-between align-items-center mb-5">
          <h2>공지사항</h2>
          <div><a href="cs_center.cs" class="more">더보기 &gt;</a></div>
        </div>

        <div class="row g-5">
           <div class="col-lg-12">
			<c:forEach var="centerBoardDTO" items="${centerBoardList }">
				 <div class="post-entry-1 border-bottom">
	               <div class="post-meta"><span>${centerBoardDTO.createDate }</span></div>
	               <h2 class="mb-2"><a href="cs_center_content.cs?createUser=${centerBoardDTO.createUser }&createDate=${centerBoardDTO.createDate}">${centerBoardDTO.centerSubject }</a></h2>
	             </div>
			</c:forEach>
             
           </div>

        </div> <!-- End .row -->
      </div>
    </section><!-- End Lifestyle Category Section -->
	 
  </main><!-- End #main -->
<%@include file ="../_common/commonFooterStart.jsp" %>
<script type="text/javascript" src="owlcarousel/jquery.min.js"></script>
<script type="text/javascript" src="owlcarousel/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="owlcarousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/aJS/main.js"></script>
<%@include file ="../_common/commonFooterEnd.jsp" %>