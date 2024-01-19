<%@page import="com.itwillbs.domain.RecommendDTO"%>
<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.CenterBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<%
	ArrayList<RecommendDTO> recommendList = (ArrayList<RecommendDTO>)request.getAttribute("recommendList");
	PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
	String movieName = (String)request.getAttribute("movieName");
%>			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>옛날영화 추천게시판</h2>
					<div>
						<c:if test="${!empty sessionScope.sId }">
						<a href="cs_recoSubscribe.cs" class="more" style="font-size: 17px;">
							옛날영화 신청
						</a>
						</c:if>
					</div>
				</div>
			</div>
		</section>
		       
<!-- 		<section class="category-section" id=""> -->
<!-- 			<div class="container" data-aos="fade-up"> -->
<!-- 				이곳에 코드작성 -->
<!-- 				  <div class="row"> -->
<!-- 				    <div class="col-md-6 offset-md-3"> -->
<!-- 				      <div class="bg-light"> -->
<!-- 				        <ul class="d-flex flex-wrap justify-content-between list-unstyled"> -->
<!-- 				          <li><a href="cs_center.cs">공지사항</a></li> -->
<!-- 				          <li><a href="cs_exque.cs">자주찾는질문</a></li> -->
<!-- 				          <li><a href="cs_qna.cs">1:1문의</a></li> -->
<!-- 				          <li><a href="cs_lost.cs">분실물</a></li> -->
<!-- 				        </ul> -->
<!-- 				      </div> -->
<!-- 				    </div> -->
<!-- 				  </div> -->
<!-- 			</div> -->
<!-- 		</section> -->

		<!-- 진행상태, 신청영화, 감독, 신청자, 신청일, 추천수, 추천하기버튼, 수정버튼  -->
		<input type="hidden" name="recoUser" id="recoUser" value="${sessionScope.sId }">
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
			<div class="row">
				  <div class="col-md-3">
				  </div>
				  <div class="col-md-2">
				    <div class="input-group mb-3">
				    </div>
				  </div>
				  <div class="col-md-2">
				    <div class="input-group mb-3">
				    </div>
				  </div>
				  <div class="col-md-2">
				    <div class="input-group mb-3">
				    </div>
				  </div>
				  <div class="col-md-3">
				    <div class="input-group mb-3">
				      <input type="text" class="form-control" placeholder="영화명을 검색해주세요." id="recoSearch" name="recoSearch" value="<%=movieName %>" aria-label="input-search" aria-describedby="button-addon2">
				      <button class="btn btn-outline-secondary" type="button" id="recoSearchBtn">검색</button>
				    </div>
				  </div>
				</div>
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
				      <th scope="col">#</th>
				      <th scope="col">진행상태</th>
				      <th scope="col">신청영화</th>
				      <th scope="col">감독</th>
				      <th scope="col">신청자</th>
				      <th scope="col">신청일</th>
				      <th scope="col"><a href="arrangeRecoCount.cs">추천수</a></th>
				      <th scope="col">추천하기</th>
				      <th scope="col">삭제하기</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach var="recommendDTO" items="${recommendList }">
				  
				  	<tr>
				  		<td>${recommendDTO.recommendIdx }</td>
				  		<td>진행중</td>
				  		<td>${recommendDTO.movieName }</td>
				  		<td>${recommendDTO.director }</td>
				  		<td>${recommendDTO.createUser }</td>
				  		<td>${recommendDTO.createDate }</td>
				  		<td>${recommendDTO.countReco }</td>
				  		<c:if test="${empty sessionScope.sId }">
				  			<td><button type="button" class="btn btn-dark" id="recoBtn" disabled>추천</button></td>
				  			<td><button type="button" class="btn btn-secondary" disabled>수정</button></td>
				  		</c:if>
				  		<c:if test="${!empty sessionScope.sId }">
				  			<td><button type="button" class="btn btn-dark" id="recoBtn${recommendDTO.recommendIdx }">추천</button></td>
				  			<td><button type="button" class="btn btn-secondary">삭제</button></td>
				  		</c:if>
				  	</tr>
				  </c:forEach>

				  </tbody>
				</table>
			</div>
		</section>
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<div class="pagination-container d-flex justify-content-center">
				  <ul class="pagination">
					<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
					    <li class="page-item disabled">
					      <a class="page-link text-secondary" href="searchReco.cs?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&movieName=<%=movieName %>" tabindex="-1" aria-disabled="true">이전</a>
					    </li>
				    </c:if>	
				    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					    <li class="page-item" aria-current="page">
					      <a class="page-link text-secondary" href="searchReco.cs?pageNum=${i }&movieName=<%=movieName %>">${i }</a>
					    </li>
				    </c:forEach>
		    		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
					    <li class="page-item">
					      <a class="page-link text-secondary" href="searchReco.cs?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&movieName=<%=movieName %>">다음</a>
					    </li>
				    </c:if>
				  </ul>
				</div>
			</div>
		</section>	
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/csJS/cs_recommend.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>