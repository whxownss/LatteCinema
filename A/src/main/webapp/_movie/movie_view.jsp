<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<%
 String movieName = "노량: 죽음의 바다";
 String movieEngName = "Noryang: Deadly Sea";
 String grade = "12세이상관람가";
 String date = "2023.12.20";
 String genre = "액션,드라마";
 String runTime = "152분";
 String totalView = "2,659,893명";
 String synopsys = "";
%>

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
          <img src="https://img.dtryx.com/poster/2023/12/5E0206A2-7177-4466-A25F-2B6726844F6A.small.jpg" onerror="this.src='/resources/img/common/no-poster.png';">
          <i class="age12"></i>
        </div>
        <div class="mobile mb15">
          <a href="javascript:goLink('/totalView/movie.do', 'MovieCd=023901');" class="btn-type0" style="border-radius:0">예매하기</a>
        </div>
        <i class="age12"></i>
        <h3 class="h3"><%=movieName %></h3>
        <h4 class="h4"><%=movieEngName %></h4>
        <div class="etc">
          <span><%=movieName %></span>
          <span><%=date %></span>
          <span><%=genre %></span>
          <span><%=runTime %></span>
        </div>
        <div class="grade">
          누적 관객 수<strong><%=totalView %></strong>
        </div>
        <div class="btns only-m">
          <a href="javascript:goLink('/totalView/movie.do', 'MovieCd=023901');" class="btn-type0">예매하기</a>
          <a href="#" class="btn-type1 movie-open" data-poster="https://img.dtryx.com/poster/2023/12/D3ED4691-3003-4A40-BA15-E029AC980BEF.small.jpg" data-source="https://img.dtryx.com/video/2023/12/45030FA5-DC2D-4702-A4B8-731108559CBA.mp4">예고편 보기</a></div>
      </div>
      
      <div class="float-info ">
        <div class="sticky">
          <div class="img"><img src="https://img.dtryx.com/poster/2023/12/5E0206A2-7177-4466-A25F-2B6726844F6A.small.jpg" style="width: 80%;" onerror="this.src='/resources/img/common/no-poster.png';"/></div>
          <div class="info">
            <i class="age12"></i>
            <h3 class="h3"><%=movieName %></h3>
            <h4 class="h4"><%=movieEngName %></h4>
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
                <span style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">임진왜란 발발로부터 7년이 지난 1598년 12월.</span>
                <br style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">
                <span style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">이순신(김윤석)은 왜군의 수장이던 도요토미 히데요시가 갑작스럽게 사망한 뒤</span>
                <br style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">
                <span style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">왜군들이 조선에서 황급히 퇴각하려 한다는 것을 알게 된다.</span>
                <br style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">
                <br style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">
                <span style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">“절대 이렇게 전쟁을 끝내서는 안 된다”</span>
                <br style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">
                <br style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">
                <span style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">왜군을 완벽하게 섬멸하는 것이 이 전쟁을 올바르게 끝나는 것이라 생각한 이순신은</span>
                <br style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">
                <span style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">명나라와 조명연합함대를 꾸려 왜군의 퇴각로를 막고 적들을 섬멸하기로 결심한다.</span>
                <br style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">
                <br style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">
                <span style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">하지만 왜군의 뇌물 공세에 넘어간 명나라 도독 진린(정재영)은 왜군에게 퇴로를 열어주려 하고,</span>
                <br style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">
                <span style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">설상가상으로 왜군 수장인 시마즈(백윤식)의 살마군까지 왜군의 퇴각을 돕기 위해 노량으로 향하는데…</span>
                <br style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">
                <br style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">
                <span style="color: rgb(85, 85, 85); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 14px;">2023년 12월, 모두를 압도할 최후의 전투가 시작된다!</span></div>
            </div>
            <div class="col">
              <div class="tit">배우/제작진</div>
              <div class="txt">
                <dl>
                  <dt>감독</dt>
                  <dd>김한민</dd>
                </dl>
                <dl>
                  <dt>배우</dt>
                  <dd> 김윤석 | 백윤식 | 정재영 </dd>
                </dl>
                <dl>
                  <dt>배급사</dt>
                  <dd>(주)롯데컬처웍스</dd>
                </dl>
              </div>
            </div>
          </div>
          
            <div class="tit">스틸컷 <span class="pc">(9)</span></div>
              <div class="slider1 mb60 pc">
                <div class="swiper-container gallery-top">
                  <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/122850C6-D716-4BF1-95F1-09AD1B0FCA8C.Large.jpg"></div>
                    <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/BF923A35-B169-4291-9058-C62D2773F2DA.Large.jpg"></div>
                    <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/D3ED4691-3003-4A40-BA15-E029AC980BEF.Large.jpg"></div>
                    <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/4782C053-7A5B-4EF0-8BAD-7F537A2FF3D7.Large.jpg"></div>
                    <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/37D42A9E-24A6-493B-B7E8-A5A86FDD23BE.Large.jpg"></div>
                    <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/F8C17E52-2B94-4C68-9C36-84F8EEF0006E.Large.jpg"></div>
                    <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/731D4061-7BE0-478E-8460-64235578A0DA.Large.jpg"></div>
                    <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/515A4746-48B7-4000-B1BA-15810D452A78.Large.jpg"></div>
                    <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/15C6633D-B037-408B-886B-9753BC91289F.Large.jpg"></div>
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
                      <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/122850C6-D716-4BF1-95F1-09AD1B0FCA8C.small.jpg"></div>
                      <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/BF923A35-B169-4291-9058-C62D2773F2DA.small.jpg"></div>
                      <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/D3ED4691-3003-4A40-BA15-E029AC980BEF.small.jpg"></div>
                      <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/4782C053-7A5B-4EF0-8BAD-7F537A2FF3D7.small.jpg"></div>
                      <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/37D42A9E-24A6-493B-B7E8-A5A86FDD23BE.small.jpg"></div>
                      <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/F8C17E52-2B94-4C68-9C36-84F8EEF0006E.small.jpg"></div>
                      <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/731D4061-7BE0-478E-8460-64235578A0DA.small.jpg"></div>
                      <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/515A4746-48B7-4000-B1BA-15810D452A78.small.jpg"></div>
                      <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/15C6633D-B037-408B-886B-9753BC91289F.small.jpg"></div>
                      </div>
                  </div>
                </div>
                
              </div>
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
<div class="stillcut-fixed" style="display: none">
  <div class="bg"></div>
  <div class="layer">
    <div class="in">
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/122850C6-D716-4BF1-95F1-09AD1B0FCA8C.Large.jpg"></div>
          <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/BF923A35-B169-4291-9058-C62D2773F2DA.Large.jpg"></div>
          <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/D3ED4691-3003-4A40-BA15-E029AC980BEF.Large.jpg"></div>
          <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/4782C053-7A5B-4EF0-8BAD-7F537A2FF3D7.Large.jpg"></div>
          <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/37D42A9E-24A6-493B-B7E8-A5A86FDD23BE.Large.jpg"></div>
          <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/F8C17E52-2B94-4C68-9C36-84F8EEF0006E.Large.jpg"></div>
          <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/731D4061-7BE0-478E-8460-64235578A0DA.Large.jpg"></div>
          <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/515A4746-48B7-4000-B1BA-15810D452A78.Large.jpg"></div>
          <div class="swiper-slide"><img src="https://img.dtryx.com/poster/2023/12/15C6633D-B037-408B-886B-9753BC91289F.Large.jpg"></div>
          </div>
      </div>
      <div class="swiper-pagination"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-button-next"></div>
    </div>
    <button class="btn-close"></button>
  </div>
</div>

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


</html> --%>





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

</html>