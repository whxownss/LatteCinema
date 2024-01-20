<%@page import="com.itwillbs.domain.StorePayDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.domain.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                      <div class="mb_name">안녕하세요! ${sessionScope.sName}님</div>
                    </div>
                    <!--// top -->
                  </div>
                    <!--// my-info -->
                    
                    <%
                    ArrayList<StorePayDTO> storeGiftList = 
            			(ArrayList<StorePayDTO>)request.getAttribute("storeGiftList");
					PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
					%>
                    
                    <!-- column -->
                    <div class="myStory">
                      <div class="tit-util mt70">
                        <h2 class="tit small"><b>나의 라떼시네마</b></h2>
                      </div>
                      <div class="box-border link-movie-story align-middle">
                        <a href="bookinglist.me" title="예매/구매 내역 탭으로 이동"><span>예매/구매 내역</span></a>
                        <a href="myinquiry.me" title="나의 문의 내역 탭으로 이동"><span>나의 문의 내역</span></a>
                        <a href="myInfo.me" title="개인정보수정 탭으로 이동"><span>개인정보수정</span>
                        </a>
                      </div>
                    </div>
            
                    <div class="myInq">
                      <div class="tit-util mt70">
                        <h2 class="tit small"><b>선물내역</b></h2>
                      </div>
                      <div class="brd-list">
                      <div class="table-relative mt10">
							<table class="table table-bordered border-Info">
								<thead>
									<tr>
										<th scope="col" class="text-center">보내신분</th>
										<th scope="col" class="text-center">결제번호</th>
										<th scope="col" class="text-center">상품명</th>
										<th scope="col" class="text-center">수량</th>
										<th scope="col" class="text-center">받은날짜</th>
										<th scope="col" class="text-center">받은메시지</th>
									</tr>
								</thead>
								<tbody id="tbody">
								<c:forEach var="storeGiftList" items="${storeGiftList }">
			                      	<tr>
			                      		<td scope="row" class="text-center align-middle">${storeGiftList.buyerName }</td>
			                      		<td scope="row" class="text-center align-middle">${storeGiftList.merchantUid }</td>
			                      		<td scope="row" class="text-center align-middle">${storeGiftList.name }</td>
			                      		<td scope="row" class="text-center align-middle">${storeGiftList.itemCnt }</td>
			                      		<td scope="row" class="text-center align-middle">${storeGiftList.payTime }</td>
			                      		<td scope="row" class="text-center align-middle">
										  <button type="button" class="btn btn-primary" id="liveToastBtn">
										    메시지보기
										  </button>
											
											
<%-- 											 ${storeGiftList.giftMsg } --%>
			                      		</td>
			                      	</tr>
			                      </c:forEach>
								</tbody>
							</table>
							
							<!-- 페이징 처리 -->
							<section class="category-section" id="">
							<div class="container" data-aos="fade-up">
								<div class="pagination-container d-flex justify-content-center">
								  <ul class="pagination" id="searchPaging">
									<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
									    <li class="page-item ">
									      <a class="page-link text-secondary" href="myPage.me?pageNum=${pageDTO.startPage - pageDTO.pageBlock }" tabindex="-1" aria-disabled="true">이전</a>
									    </li>
								    </c:if>	
								    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
									    <li class="page-item" aria-current="page">
									      <a class="page-link text-secondary" href="myPage.me?pageNum=${i }">${i }</a>
									    </li>
								    </c:forEach>
						    		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
									    <li class="page-item">
									      <a class="page-link text-secondary" href="myPage.me?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">다음</a>
									    </li>
								    </c:if>	
								  </ul>
								</div>
							</div>
						</section>
		
						</div>
<!--                         <ul> -->
<%--                             <%if(true){ %> --%>
<!--                              결과 없을 때  -->
<!--                             <li class="no-result">선물받은 내역이 없습니다.</li> -->
<%--                             <%} %> --%>
<!--                         </ul> -->
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