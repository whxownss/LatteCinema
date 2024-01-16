<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="stillcutArray" value="${fn:split(detail.stillcut, '|')}" />
<!DOCTYPE html>
<html lang="ko">

<%@include file ="../_common/commonHeaderStart.jsp" %>
<link href="${pageContext.servletContext.contextPath }/_assets/css/view.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- <script type="text/javascript" src="../_assets/js/jquery.number.min.js"></script> -->
<!-- <script type="text/javascript" src="../_assets/js/jquery.cookie.min.js"></script> -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/_assets/js/scrollbar.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/_assets/js/swiper.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/_assets/js/front.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/_assets/js/app.js"></script>


<%@include file ="../_common/commonHeaderEnd.jsp" %>
 
  
<main>

<!-- // 영화관찾기 레이어 -->
<div class="mv-info-wrap" style="margin-top:70px;">
  <div class="info1">
    <div class="inner">
      <div class="info-box">
        <div class="btns only-pc">
          <a href="javascript:goLink('/totalView/movie.do', 'MovieCd=023901');" class="btn-type0">예매하기</a>
          <!-- <a href="#" class="btn-type1 movie-open" data-poster="https://img.dtryx.com/poster/2023/12/D3ED4691-3003-4A40-BA15-E029AC980BEF.small.jpg" data-source="https://img.dtryx.com/video/2023/12/45030FA5-DC2D-4702-A4B8-731108559CBA.mp4">예고편 보기</a> -->
          </div>
        <div class="poster">
          <img src="${detail.poster}">
        <i class="age${detaile.rating}"></i>
        </div>
        <div class="mobile mb15">
          <a href="javascript:goLink('/totalView/movie.do', 'MovieCd=023901');" class="btn-type0" style="border-radius:0">예매하기</a>
        </div>
        <i class="age${detail.rating}"></i> 
    
        <h3 class="h3">${detail.title}</h3>
        <%-- <h4 class="h4"><%=movieEngName %></h4> --%>
        <div class="etc">
          <span>${detail.title}</span>
          <span>${detail.openDate}</span>
          <span>${detail.genre}</span>
          <span>${detail.runTime}분</span>
        </div>
        <%--<div class="grade">
          누적 관객 수<strong> <%=totalView %> </strong>
        </div>--%>
        <div class="btns only-m">
          <a href="javascript:goLink('/totalView/movie.do', 'MovieCd=023901');" class="btn-type0">예매하기</a>
          </div>
      </div>
      
      <div class="float-info ">
        <div class="sticky">
          <div class="img"><img src="${detail.poster}" style="width: 80%;" onerror="this.src='/resources/img/common/no-poster.png';"/></div>
          <div class="info">
   			 <i class="age${detail.rating}"></i> 
            <h3 class="h3">${detail.title}</h3>
            <%-- <h4 class="h4"><%=movieEngName %></h4> --%>
            <div class="btns">
              <a href="javascript:goLink('/totalView/movie.do', 'MovieCd=023901');" class="btn-type0">예매하기</a>
              <!-- <a href="#" class="btn-type1 movie-open" data-poster="https://img.dtryx.com/poster/2023/12/D3ED4691-3003-4A40-BA15-E029AC980BEF.small.jpg" data-source="https://img.dtryx.com/video/2023/12/45030FA5-DC2D-4702-A4B8-731108559CBA.mp4">예고편 보기</a> -->
            </div>
          </div>
        </div>
      </div> 
    </div>
  </div>
  
  
  <div class="info2">
    <div class="inner">
      <div class="con-box">
        <div class="cont">
          <div class="col2 mb50">
            <div class="col">
              <div class="tit">줄거리</div>
              <div class="txt">
                <span style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">${detail.synopsis}</span>
<!--                 <span style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">임진왜란 발발로부터 7년이 지난 1598년 12월.</span> -->
                <br style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">
              </div>
            </div>
            <div class="col">
              <div class="tit">배우/제작진</div>
              <div class="txt">
                <dl>
                  <dt>감독</dt>
                  <dd>${detail.director}</dd>
                </dl>
                <dl>
                  <dt>배우</dt>
                  <dd>${detail.actor}</dd>
                </dl>
                <dl>
                  <dt>배급사</dt>
                  <dd>${detail.filmMade}</dd>
                </dl>
              </div>
            </div>
     	 </div>


		
		<c:if test="${not empty stillcutArray}">
		<div class="tit">스틸컷 <span class="pc"></span></div>
		<div class="slider1 mb60 pc">
		
                <div class="swiper-container gallery-top">
                  <div class="swiper-wrapper">
                    
                  <c:forEach var="stillcut"  items="${stillcutArray}">
			          <!-- 값이 null이 아닌 경우에만 이미지 노출 -->
			          <div class="swiper-slide">
			            <img src="${stillcut}">
			          </div>
                    </c:forEach>  
                   <!--  <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/BF923A35-B169-4291-9058-C62D2773F2DA.Large.jpg"></div> -->
                   
                    </div>
                  <!-- Add Arrows -->
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                </div>
                
                <div class="gallery-thumbs">
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                  <div class="swiper-container">
                    <div class="swiper-wrapper">
                    
               		<c:forEach var="stillcut"  items="${stillcutArray}">
                    <div class="swiper-slide">
                    <img src="${stillcut}">
                    </div>
                    </c:forEach>  
                      </div>
                  </div>
                </div>
              </div>
              </c:if>
              
              
            <!-- // 스틸컬 슬라이더 PC -->
<!--           <div class="tit">상영 영화관 (48)</div> -->
<!--             <div class="cines"> -->
<!--               <ul> -->
<!--                 <li><a href="javascript:goLink('/cinema/main.do', 'BrandCd=scinema&amp;CinemaCd=000093');"><img src="https://image.dtryx.com/cinema/2022/05/0916275D-9541-4EF7-9FEE-1A194A7316E0.small.jpg" alt="1939시네마"><p>1939시네마</p></a></li> -->
<!--                 <li><a href="javascript:goLink('/cinema/main.do', 'BrandCd=monoplex&amp;CinemaCd=000137');"><img src="https://image.dtryx.com/cinema/2023/10/45667DB3-B866-4125-A64A-E0FCE8C702B9.small.png" alt="JSW 씨네라운지"><p>JSW 씨네라운지</p></a></li> -->
<!--                 <li><a href="javascript:goLink('/cinema/main.do', 'BrandCd=scinema&amp;CinemaCd=000087');"><img src="https://image.dtryx.com/cinema/2022/04/07AF8CF9-D100-4D60-8819-0C5DC4BF2552.small.png" alt="NH 시네마"><p>NH 시네마</p></a></li> -->
<!--               </ul> -->
<!--             </div> -->
          </div>
        <!-- // 1 주요정보 -->
      </div>
      <!-- // cont-box -->
    </div>
  </div>
</div>

<!-- // mv-info-wrap-->

<c:if test="${not empty stillcutArray}">
<div class="stillcut-fixed" style="display: none">
  <div class="bg"></div>
  <div class="layer">
    <div class="in">
      <div class="swiper-container">
        <div class="swiper-wrapper">
        <c:set var="stillcutArray" value="${fn:split(detail.stillcut, '|')}" />
        <c:forEach var="stillcut"  items="${stillcutArray}">
        	<div class="swiper-slide">
            <img src="${stillcut}">
            </div>
        </c:forEach>  
       	</div>
      </div>
      <div class="swiper-pagination"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-button-next"></div>
    </div>
    <button class="btn-close"></button>
  </div>
</div>
</c:if>

<div class="movie-popup" style="display: none">
  <div class="bg"></div>
  <div class="layer">
    <div class="in">
      <div class="mv">
        <div style="position:relative;height:0;padding-bottom:75%;">
          <video id="videoMainTag" controls="" controlslist="nodownload" width="100%" height="100%" poster="">
            <source id="videoMainTagSrc" src="" type="video/mp4">
          </video>
        </div>
        <a href="#" class="btn-close"></a>
      </div>
    </div>
  </div>
</div>

</main>

<script type="text/javascript">
  var galleryThumbs = new Swiper(".gallery-thumbs .swiper-container", {
    spaceBetween: 10,
    slidesPerView: 6,
    freeMode: true,
    watchSlidesVisibility: true,
    watchSlidesProgress: true,
    observer: true,
    observeParents: true,
  });
    
  var galleryTop = new Swiper(".gallery-top", {
    spaceBetween: 0,
    observer: true,
    observeParents: true,
    navigation: {
      nextEl: ".gallery-thumbs .swiper-button-next",
      prevEl: ".gallery-thumbs .swiper-button-prev",
    },
    thumbs: {
      swiper: galleryThumbs
    }
  });
  
  var stillcutSwiper = new Swiper(".stillcut-fixed .swiper-container", {
    navigation: {
      nextEl: ".stillcut-fixed .swiper-button-next",
      prevEl: ".stillcut-fixed .swiper-button-prev",
    },
    pagination: {
      el: ".stillcut-fixed .swiper-pagination",
      type: "fraction",
    },
    observer: true,
    observeParents: true,
  });
  
  if ($(".thums .swiper-slide").length > 3) {
    $(".thums").removeClass("if");
    var previewMovieSwiper = new Swiper(".thums .swiper-container", {
      navigation: {
        nextEl: ".thums .swiper-button-next",
        prevEl: ".thums .swiper-button-prev",
      },
      slidesPerView: "2",
      spaceBetween: 5,
      observer: true,
      observeParents: true,
      breakpoints: {
        1023: {
          slidesPerView: "3",
          spaceBetween: 16,
        }
      }
    });
  }
  
  $(function() {
    $(".btn-prev").on("click", function(e) {
      history.back();
    });
    
    $(".sticky").sticky({topSpacing: 20});
    
    // 메인배너 클릭시 영상 팝업
    $(".movie-open").on("click", function(e) {
      e.preventDefault();
      $("#videoMainTagSrc").attr("src", $(this).data("source"));
      $("#videoMainTag").attr("poster", $(this).data("poster"));
      $("#videoMainTag").get(0).load();
      $(".movie-popup").fadeIn(300);
      $("#videoMainTag").get(0).play();
    });
    $(".movie-popup .btn-close, .movie-popup .bg").on("click", function(e) {
      e.preventDefault();
      $("#videoMainTag").get(0).pause();
      $(".movie-popup").fadeOut(300);
    });
    
    $(".still-cut a").on("click", function(e) {
      e.preventDefault();
      var idx = $(".still-cut a").index(this);
      stillcutSwiper.slideTo(idx);
      $(".stillcut-fixed").fadeIn(300);
    });
    $(".stillcut-fixed .btn-close, .stillcut-fixed .bg").on("click", function(e) {
      e.preventDefault();
      $(".stillcut-fixed").fadeOut(300);
    });
  });
</script>
	
<%@include file ="../_common/commonFooter.jsp" %>


</html> 



<%-- 

<%@page import="com.itwillbs.domain.MovieDTO"%>
<%@page import="com.itwillbs.service.MovieService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<%@include file ="../_common/commonHeaderStart.jsp" %>
<link href="${pageContext.servletContext.contextPath }/_assets/css/view.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/_assets/js/scrollbar.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/_assets/js/swiper.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/_assets/js/front.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/_assets/js/app.js"></script>

<%@include file ="../_common/commonHeaderEnd.jsp" %>
  
<main>

<%
 // MOVIE_IDX 가져오기
 int movieIdx = 0; // 적절한 값으로 설정
 try {
     movieIdx = Integer.parseInt(request.getParameter("MOVIE_IDX")); // 적절한 파라미터 이름으로 변경
 } catch (NumberFormatException e) {
     e.printStackTrace();
     // 예외 처리 - 파라미터를 정상적으로 얻을 수 없는 경우의 기본 값 설정
 }

 // 여기에서는 예시로 MovieService를 사용하여 영화 정보를 가져온다고 가정하겠습니다.
 MovieService movieService = new MovieService(); // 실제로는 해당 서비스 클래스에 맞게 변경
 MovieDTO movie = movieService.movieDetail(movieIdx);

 // 영화 정보가 존재할 경우에만 값을 설정
 if (movie != null) {
     String movieName = movie.getTitle();
   /*   String movieEngName = movie.getEngTitle(); */
     String date = movie.getStartDate();
     String genre = movie.getGenre();
     String runTime = movie.getRunTime();
     // 나머지 필요한 정보도 마찬가지로 설정
 }
%>

<!-- 나머지 코드는 동일하게 유지 -->

</main>

<script type="text/javascript">
  // 나머지 스크립트 코드는 동일하게 유지
</script>
	
<%@include file ="../_common/commonFooter.jsp" %>

</html> --%>