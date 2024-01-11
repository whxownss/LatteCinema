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
	    
    

    <!-- ======= Culture Category Section ======= -->
    <  <!-- ======= Culture Category Section ======= -->
  <section class="category-section">
    <div class="container" data-aos="fade-up">

      <div class="section-header d-flex justify-content-between align-items-center mb-5">
        <h3>1월의 라떼..</h3>
      </div>

		<div class="row g-5">
		  <c:forEach var="movie" items="${lattePosterList}" varStatus="status">
		    <div class="col-lg">
		      <div class="post-entry-1 lg">
		        <div class="item position-relative" id="wrap">
		          <!-- 각 영화의 포스터 이미지를 동적으로 출력 -->
		          <img src="<c:out value="${movie.poster}" />" style="width: 100%;">
		          <div class="titlee">
		            <a href="#" class="moree">예매하기</a>
		            <a href="#" class="moree">상세정보</a>
		          </div>
		        </div>
		      </div>
		    </div>
		  </c:forEach>
		
		
		    

    <!-- 일별 박스오피스 -->

	<section class="category-section">
		<div class="container" data-aos="fade-up">
		  <div class="section-header d-flex justify-content-between align-items-center mb-5">
	        <h2>박스오피스</h2>
	        <div><a href="movie_now.mo" class="more">2023.12.11 기준</a></div>
	      </div>
		
	      <div class="container" data-aos="fade-up">
			<div class="owl-carousel owl-theme">
		        <div class="item position-relative" id="wrap">
		          <img src="assets/img/post1.jpg" > img kmdb 들어올 곳
		          <em class="fs-1 fst-italic text-white ps-2  position-absolute bottom-0 start-0">1</em>
					<div class="titleee">
						<a href="" class="moree">예매하기</a>
						<a href="" class="moree">상세정보</a>
					</div>
		        </div>
		     </div>
		        <div id="movie-names">영화제목자리</div>
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


	<script src="owlcarousel/jquery.min.js"></script>
	<script src="owlcarousel/jquery.mousewheel.min.js"></script>
	<script src="owlcarousel/owl.carousel.min.js"></script>	
	<script>
            $(document).ready(function() {
              var owl = $('.owl-carousel');
              owl.owlCarousel({
                loop: true,
                nav: true,
                margin: 10,
                responsive: {
                  0: {
                    items: 1
                  },
                  600: {
                    items: 3
                  },
                  960: {
                    items: 5
                  },
                  1200: {
                    items: 6
                  }
                }
              });
              owl.on('mousewheel', '.owl-stage', function(e) {
                if (e.deltaY > 0) {
                  owl.trigger('next.owl');
                } else {
                  owl.trigger('prev.owl');
                }
                e.preventDefault();
              });
            })
          </script>

			<!-- 일별 박스오피스 순위 1~10위  -->
		    <script type="text/javascript">
			$(function(){
				$.ajax({
					url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
					type : 'GET',
					data : {
							key : "ee9ed756bb3f15468dceccf766e69e7b",
							targetDt : "20190900"                         //날짜형식이 틀리면 최신날짜를 보여주는걸로 알고있음
					},
					async : false,                              //비동기식인 ajax를 동기식으로 만들어줌 만약 출력해야될 결과가 많거나 제대로 출력되지 않을때, 이 옵션을 사용
					success : function(data) {                        //data에 들어오는 값들은 앞에서 출력되던 예시와 같음
						  var text = '';
			                for (var i = 0; i < data.boxOfficeResult.dailyBoxOfficeList.length; i++) {
			                    text += data.boxOfficeResult.dailyBoxOfficeList[i].movieNm + '<br>';
			                }
			                $('#movie-names').html(text);
					}
				});
			});
			</script>	
			

<%@include file ="../_common/commonFooter.jsp" %>