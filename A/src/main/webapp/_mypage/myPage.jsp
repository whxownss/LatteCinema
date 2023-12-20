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
<% String name = "김나혜";
   int count1 = 1;
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
                      <div class="mb_name">안녕하세요! <%=name %><span>님</span></div>
                      <div class="link"><a href="#" title="개인정보수정 페이지로 이동">개인정보수정</a>
                      </div>
                    </div>
                    <!--// top -->
                  </div>
                    <!--// my-info -->
                    
                    <!-- column -->
                    <div class="myStory">
                      <div class="tit-util mt70">
                        <h2 class="tit small">나의 무비스토리</h2>
                        <div class="right">
                          <a href="#" class="button gray-line small btn-modal-open" w-data="600" h-data="470" title="본 영화 등록">본 영화 등록</a>
                        </div>
                      </div>
                      <div class="box-border link-movie-story">
                        <a href="#" title="관람한 영화 후기 탭으로 이동"><em><%=count1 %></em><span>관람한 영화 후기</span></a>
                        <a href="#" title="보고 싶은 영화 탭으로 이동"><em><%=count2 %></em><span>보고 싶은 영화</span></a>
                        <a href="#" title="OLD MOVIE 제안 게시판 탭으로 이동"><em><%=count3 %></em><span>OLD MOVIE 제안 게시판</span>
                        </a>
                      </div>
                    </div>
                    <!--// column -->
                    <div id="myBokd">
                      <div class="tit-util mt70">
                        <h2 class="tit small">나의 예매내역</h2>
                        <a href="#" class="more" title="나의 예매내역 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
                      </div>
                      <!-- my-reserve-history -->
                      <div class="my-reserve-history">
                        <ul>
                            
                            <%if(true){ %>
                            <!-- 결과 없을 때 -->
                            <li class="no-result">
                                <div class="no-history-reservation">예매 내역이 없습니다!</div>
                            </li>
                            <%} %>
                            
                        </ul>
                      </div>
                      <!--// my-reserve-history -->
                    </div>
            
                    <div id="myPurc">
                      <div class="tit-util mt70">
                        <h2 class="tit small">나의 구매내역</h2>
                        <a href="#" class="more" title="나의 구매내역 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
                      </div>
          
                      <div class="table-wrap">
                        <table class="board-list line" summary="나의 구매내역 요약 표">
                          <caption>나의 구매내역 요약 표</caption>
                          <colgroup>
                              <col style="width:160px;">
                              <col style="width:140px;">
                              <col>
                              <col style="width:120px;">
                              <col style="width:80px;">
                          </colgroup>
                          <tbody>
                              <%if(true){ %>
                              <!--  결과 없을 때  -->
                              <tr>
                                <td colspan="6" class="a-c">구매내역이 없습니다.</td>
                              </tr>
                              <%} %>
                          </tbody>
                        </table>
                      </div>
                    </div>
                    <!-- column -->
                    <div class="myInq">
                      <div class="tit-util mt70">
                        <h2 class="tit small">문의내역</h2>
                        <a href="#" class="more" title="문의내역 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
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
  <jsp:include page="../_common/commonFooter.jsp"></jsp:include>
</body>
</html>