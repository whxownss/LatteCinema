<%@page import="com.itwillbs.domain.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<%@include file ="../_common/commonHeaderEnd.jsp" %>
 
  
<main>

<!-- // 영화관찾기 레이어 -->
<div class="mv-info-wrap" style="margin-top:70px;">
  <div class="info1">
    <div class="inner">
      <div class="info-box">
        <div class="btns only-pc">
          <a href="${pageContext.servletContext.contextPath}/res1.re?movieCode=${movie.movieCode}" class="btn-type0">예매하기</a>
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
          <a href="${pageContext.servletContext.contextPath}/res1.re?movieCode=${movie.movieCode}" class="btn-type0">예매하기</a>
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
              <a href="${pageContext.servletContext.contextPath}/res1.re?movieCode=${movie.movieCode}" class="btn-type0">예매하기</a>
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
              
              
          </div>
        <!-- // 1 주요정보 -->
      </div>
      <!-- // cont-box -->
    </div>
    <!-- 관람평 쓰기 -->
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>한줄평</h2>
					<div>
						<a href="cs_center.cs" class="more" style="font-size: 17px;">
							나가기
						</a>
					</div>
				</div>
			</div>
		</section>

		<section class="category-section" id="">
			<div class="container bg-light aos-init aos-animate" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="row justify-content-center">
				<div>
			      <!-- <div class="col-lg-4 col-md-8 col-sm-10"> -->
			        <form action="reviewInsert.mo" name="revfr" id="revfr">
			          <div class="form-group mb-3">
<!-- 			            <label for="agreement">관람평 쓰기</label> -->
			            <div>
							
				            <textarea class="form-control" id="viewComment" name="viewComment" style="overflow: auto; height: 200px; font-size : 25px;"  
				            placeholder="10자 이상 한줄평 쓰기">${myReview.revComment}</textarea>
			            
			            </div>
			          </div>

					  <div class="d-flex justify-content-around" name="revsubmit" id="revsubmit">
				          <div class="form-group mb-3 d-flex justify-content-center">
							  <button type="button" id="write" name="revbtn" class="btn-type0" style="width: 100px;">작성</button>
						  </div>
						   <div class="form-group mb-3 d-flex justify-content-center">
							  <button type="button" id="revDelete" name="revDelete" class="btn-type0" style="width: 100px; " disabled="disabled">삭제</button>
						  </div>
			          </div>	
			        </form>
			      </div>
				<!--관람평 게시판 -->
				</div>
			</div>
		</section>
<%ArrayList<ReviewDTO> boardList = (ArrayList<ReviewDTO>) request.getAttribute("reviewList"); %>
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<table class="table" id="revTable">
				  <thead>
				    <tr class="table-secondary" style="text-align: center; ">
				      <th scope="col" style="width: 25px; ">#</th>
				      <th scope="col" style="width: 150px; text-align: center;">아이디</th>
				      <th scope="col" STYLE="text-align: center;">한줄평</th>
				      <th scope="col" style="width: 130px; text-align: center;">등록일</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach var="reviewDTO" items="${reviewList}">
				    <tr  style="height: 70px; vertical-align:middle; border-bottom: 1px solid black; text-align: center;">
				      <th scope="row" style="text-align: center;">${reviewDTO.revNum }</th>
				      <td style="text-align: center;">${reviewDTO.memId }</td>
				      <td><div id="titleArea">${reviewDTO.revComment }</div></td>
				      <td style="text-align: center;">${reviewDTO.revDate }</td>
				    </tr>
				</c:forEach>
						</tbody>
				</table>
			</div>
		</section> 

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
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/movieJS/movie_view.js"></script>
	
<%@include file ="../_common/commonFooter.jsp" %>

</html> 