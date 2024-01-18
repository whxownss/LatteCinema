<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
  <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
 <jsp:include page="../_common/header.jsp"></jsp:include>
 <% int count1 = 1;
   int count2 = 1;
   int count3 = 1;
 %>
	<main id="main">
		<section class="category-section">
			<div class="container has-lnb" data-aos="fade-up">
        <div class="inner-wrap">
          <jsp:include page="lnb.jsp"></jsp:include>
            <div id="contents">
                <!-- my-megabox-main -->
                <div class="my-megabox-main">
                  <div class="my-magabox-info ">
                    <!-- top -->
                    <div class="top2" style="back-ground color: #dc3545;">
                      <div class="mbimg"></div>
                      <div class="mb_name">안녕하세요! ${sessionScope.sName}님</div>
                      <div class="link"><a href="myInfo.me" title="개인정보수정 페이지로 이동">개인정보수정</a>
                      </div>
                    </div>
                    <!--// top -->
                  </div>
                    <!--// my-info -->
                    
                    <!-- column -->
                    <div class="myStory">
                      <div class="tit-util mt70">
                        <h2 class="tit small"><b>나의 라떼시네마</b></h2>
                      </div>
                      <div class="box-border link-movie-story align-middle">
                        <a href="#" title="관람한 영화 후기 탭으로 이동"><span>예매/구매 내역</span></a>
                        <a href="#" title="보고 싶은 영화 탭으로 이동"><span>나의 문의 내역</span></a>
                        <a href="#" title="OLD MOVIE 제안 게시판 탭으로 이동"><span>개인정보수정</span>
                        </a>
                      </div>
                    </div>
            
                    <div class="myInq">
                      <div class="tit-util mt70">
                        <h2 class="tit small"><b>문의내역</b></h2>
                      </div>
                      <div class="brd-list">
                        <ul>
                            <%if(true){ %>
                            <!--  결과 없을 때  -->
                            <li class="no-result">문의내역이 없습니다.</li>
                            <%} %>
                        </ul>
                      </div>
                    </div>
                    <!--// column -->
                </div>
                <!--// my-megabox-main -->
            </div>
          </div>
			</div>
		</section>
	</main>
<%@include file ="../_common/commonFooterStart.jsp" %>

<%@include file ="../_common/commonFooterEnd.jsp" %>