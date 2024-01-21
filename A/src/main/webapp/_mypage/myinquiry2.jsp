<%@page import="com.itwillbs.domain.LostBoardDTO"%>
<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.QnaBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
  <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
 
</head>
<body class="d-flex flex-column min-vh-100">


<jsp:include page="../_common/header.jsp"></jsp:include>
<main id="main">
<c:if test="${sessionScope.sId == null}">
   <c:redirect url="login.me" />
</c:if>
  <section class="category-section">
    <div class="container has-lnb" data-aos="fade-up">
    <%
    ArrayList<LostBoardDTO> lostBoardList = (ArrayList<LostBoardDTO>)request.getAttribute("lostBoardList");
    PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
    int lostCount = pageDTO.getCount();
    %>
      <!-- 이곳에 코드작성 -->
      <div class="inner-wrap">
        <jsp:include page="lnb.jsp"></jsp:include>
        

		
			<div id="contents">
				<h2 class="tit">나의 문의내역</h2>
			
				<div class="tab-block">
					<ul>
<!-- 						<li data-url="/mypage/myinquiry?cd=INQD01"><a href="myinquiry.me" class="btn" data-cd="INQD01" title="1:1 문의내역 탭으로 이동">1:1 문의내역</a></li> -->
						<li><a href="myinquiry.me" class="btn" title="1:1 문의내역 탭으로 이동">1:1 문의내역</a></li>
<!-- 						<li data-url="/mypage/myinquiry?cd=INQD03"><a href="#" class="btn" data-cd="INQD03" title="단체관람/대관 문의내역 탭으로 이동">단체관람/대관문의내역</a></li> -->
						<li data-url="/mypage/myinquiry?cd=INQD02" class="on"><a href="#" class="btn" data-cd="INQD02" title="분실물 문의내역 탭으로 이동">분실물 문의내역</a></li>
					</ul>
				</div>
			
				<div class="mypage-infomation mt20">
					<ul class="dot-list mb20">
						<li id="tabDesc">고객센터를 통해 남기신 분실물 문의내역을 확인하실 수 있습니다.</li>
						<!-- <li>문의하시기 전 <a href="/support/faq" class="a-link"><strong>자주묻는질문</strong></a>을 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다</li> -->
					</ul>
			
					<div class="btn-group right">
						<a href="#" class="button" id="inqBtn" title="분실물 문의하기">분실물 문의하기</a>
					</div>
				</div>
			
				<div class="board-list-util mb10">
					<p class="result-count">
						<!-- to 개발 : 검색을 안한 경우 -->
						<strong>전체 (<b id="totalCnt"><%=lostCount %></b>건)</strong>
						<input type="hidden" value="${sessionScope.sId }" id="userId">
					</p>
			
					<div class="dropdown bootstrap-select bs3"><select id="myLostStatusSel" class="" tabindex="-98">
						<option value="">전체</option>
						
								<option value="0">미답변</option>
								<option value="1">답변완료</option>
						
					</select>
<!-- 					<button type="button" class="btn dropdown-toggle btn-default bs-placeholder" data-toggle="dropdown" role="button" data-id="custInqStatCd" title="전체"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">전체</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button> -->
					<div class="dropdown-menu open" role="combobox"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1"><ul class="dropdown-menu inner "></ul></div></div></div>
			
<!-- 					<div class="board-search ml07"> -->
<!-- 						<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text" id="searchTxt" value=""> -->
<!-- 						<button type="button" class="btn-search-input" id="searchBtn">검색</button> -->
<!-- 					</div> -->
				</div>
			
				<div class="table-wrap" id="tableWrap"><!-- table-wrap부분이 바뀌어야함. data-url이 바뀔 때 마다.  -->
					<table class="board-list a-c">
						<caption>1:1 문의 내역 표입니다</caption>
						<colgroup>
							<col style="width:80px">
<%-- 							<col style="width:140px;"> --%>
							<col style="width:120px;">
							<col>
							<col style="width:160px;">
							<col style="width:100px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
<!-- 								<th scope="col">영화관</th> -->
								<th scope="col">영화관</th>
								<th scope="col">제목</th>
								<th scope="col">답변상태</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody id="tbody">
<!-- 							<tr><td colspan="6">목록이 없습니다.</td></tr> -->
							<c:forEach var="lostBoardDTO" items="${lostBoardList}">
								<tr>
									<td>${lostBoardDTO.rn }</td>
									<td>${lostBoardDTO.ciName }</td>
									<td><a href="cs_lost_content.cs?createUser=${lostBoardDTO.createUser }&createDate=${lostBoardDTO.createDate}">${lostBoardDTO.lostSubject }</a></td>
									<c:if test="${empty lostBoardDTO.responseUser }">
							        	<td>미답변</td>
							        </c:if>
							        <c:if test="${! empty lostBoardDTO.responseUser }">
							        	<td>답변완료</td>
							        </c:if>
							        <td>
									<fmt:parseDate value="${lostBoardDTO.createDate}" pattern="yy-MM-dd HH:mm:ss" var="parsedDate"/>
									<fmt:formatDate value="${parsedDate}" pattern="yy-MM-dd HH:mm:ss" />
							        </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- pagination -->
<!-- 				<nav class="pagination"></nav> -->
				<section class="category-section" id="">
						<div class="container" data-aos="fade-up">
							<div class="pagination-container d-flex justify-content-center">
							  <ul class="pagination" id="searchPaging">
								<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
								    <li class="page-item disabled">
								      <a class="page-link text-secondary" href="myinquiry2.me?pageNum=${pageDTO.startPage - pageDTO.pageBlock }" tabindex="-1" aria-disabled="true">이전</a>
								    </li>
							    </c:if>	
							    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
								    <li class="page-item" aria-current="page">
								      <a class="page-link text-secondary" href="myinquiry2.me?pageNum=${i }">${i }</a>
								    </li>
							    </c:forEach>
					    		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
								    <li class="page-item">
								      <a class="page-link text-secondary" href="myinquiry2.me?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">다음</a>
								    </li>
							    </c:if>
							  </ul>
							</div>
						</div>
					</section>	
				<!--// pagination -->
			</div>
      </div>
    </div>
  </section>
</main>
<%@include file ="../_common/commonFooterStart.jsp" %>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/mypageJS/myinquiry2.js"></script>
<%@include file ="../_common/commonFooterEnd.jsp" %>