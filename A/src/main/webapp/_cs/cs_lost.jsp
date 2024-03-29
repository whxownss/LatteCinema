<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.LostBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<%
ArrayList<LostBoardDTO> lostBoardList = (ArrayList<LostBoardDTO>)request.getAttribute("lostBoardList");
PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
%>			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>분실물 문의</h2>
					<div>
						<a href="cs_lost_write.cs" class="more " style="font-size: 18px;">
							분실물 문의하기
						</a>
					</div>
				</div>
			</div>
		</section>
		  
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				  <div class="row">
				    <div class="col-md-6 offset-md-3">
				      <div class="bg-light">
				        <ul class="d-flex flex-wrap justify-content-between list-unstyled">
				          <li><a href="cs_center.cs">공지사항</a></li>
				          <li><a href="cs_exque.cs">자주찾는질문</a></li>
				          <li><a href="cs_qna.cs">1:1문의</a></li>
				          <li><a href="cs_lost.cs">분실물</a></li>
				        </ul>
				      </div>
				    </div>
				  </div>
			</div>
		</section>
		
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<div class="row">
				  <div class="col-md-3">
<%-- 				    <p><strong>전체 <span id="totalCnt" class="font-gblue">${pageDTO.count }</span>건</strong></p> --%>
				  </div>
<!-- 				  <form class="row gy-2 gx-3 align-items-center" action="cs_lost_search.cs" method="post" name="fr"> -->
				  <div class="col-md-2">
				    <div class="input-group mb-3">
				      <select class="form-select" id="locationSelect" name="locationSelect">
				        <option selected class="text-muted" value="">지역선택</option>
<!-- 				        <option value="1">서울</option> -->
<!-- 				        <option value="2">부산</option> -->
<!-- 				        <option value="3">제주</option> -->
				      </select>
<!-- 				      <label class="input-group-text" for="inputGroupSelect02">Options</label> -->
				    </div>
				  </div>
				  <div class="col-md-2">
				    <div class="input-group mb-3">
				      <select class="form-select" id="cinemaSelect" name="cinemaSelect">
				        <option selected class="text-muted" value="">영화관 선택</option>
<!-- 				        <option value="1">부산대</option> -->
<!-- 				        <option value="2">강남</option> -->
<!-- 				        <option value="3">서귀포</option> -->
				      </select>
<!-- 				      <label class="input-group-text" for="inputGroupSelect02">Options</label> -->
				    </div>
				  </div>
				  <div class="col-md-2">
				    <div class="input-group mb-3">
				      <select class="form-select" id="lostStatus" name="lostStatus">
				        <option selected class="text-muted" value="">접수상태 선택</option>
				        <option value="0">미답변</option>
				        <option value="1">답변완료</option>
<!-- 				        <option value="3">Three</option> -->
				      </select>
<!-- 				      <label class="input-group-text" for="inputGroupSelect02">Options</label> -->
				    </div>
				  </div>
				  <div class="col-md-3">
				    <div class="input-group mb-3">
				      <input type="text" class="form-control" placeholder="검색어를 입력해주세요." id="lostSubject" name="lostSubject" aria-label="input-search" aria-describedby="button-addon2">
				      <button class="btn btn-outline-secondary" type="button" id="lostSearchBtn">검색</button>
				    </div>
				  </div>
<!-- 				  </form> -->
				</div>
				
				<!-- table -->
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
				      <th scope="col">#</th>
				      <th scope="col">영화관</th>
				      <th scope="col">제목</th>
				      <th scope="col">접수상태</th>
				      <th scope="col">등록일</th>
				    </tr>
				  </thead>
				  <tbody id="tbody">
				  	<c:forEach var="lostBoardDTO" items="${lostBoardList }">
				  		<tr>
				  			<td scope="row">${lostBoardDTO.rn }</td>
				  			<td>${lostBoardDTO.ciName }</td>
				  			<td><a href="cs_lost_content.cs?createUser=${lostBoardDTO.createUser }&createDate=${lostBoardDTO.createDate}">${lostBoardDTO.lostSubject }</a></td>
				  			<td>
				  				<c:if test="${lostBoardDTO.lostStatus eq 0 }">미답변</c:if>
				  				<c:if test="${lostBoardDTO.lostStatus eq 1 }">답변완료</c:if>
				  			</td>
				  			<td><fmt:formatDate value="${lostBoardDTO.createDate }" pattern="yyyy-MM-dd"/></td>
				  		</tr>
				  	</c:forEach>
				  </tbody>
				</table>
			</div>
		</section>
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<div class="pagination-container d-flex justify-content-center">
				  <ul class="pagination" id="searchPaging">
					<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
					    <li class="page-item disabled">
					      <a class="page-link text-secondary" href="cs_lost.cs?pageNum=${pageDTO.startPage - pageDTO.pageBlock }" tabindex="-1" aria-disabled="true">이전</a>
					    </li>
				    </c:if>	
				    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					    <li class="page-item" aria-current="page">
					      <a class="page-link text-secondary" href="cs_lost.cs?pageNum=${i }">${i }</a>
					    </li>
				    </c:forEach>
		    		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
					    <li class="page-item">
					      <a class="page-link text-secondary" href="cs_lost.cs?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">다음</a>
					    </li>
				    </c:if>
				  </ul>
				</div>
			</div>
		</section>	
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/csJS/cs_lost.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>