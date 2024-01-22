<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.QnaBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<%
	ArrayList<QnaBoardDTO> qnaBoardList = (ArrayList<QnaBoardDTO>)request.getAttribute("qnaBoardList");
	PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
	
	String sId = (String)session.getAttribute("sId");
	boolean isUserAdmin = sId != null && sId.startsWith("admin");
	request.setAttribute("isUserAdmin", isUserAdmin);
%>	
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>1:1문의</h2>
					<div>
					<c:if test="${! empty sessionScope.sId }">
						<a href="cs_qna_write.cs" class="more " style="font-size: 18px;">
							1:1문의 글쓰기
						</a>
					</c:if>	
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
		
		<section class="category-section" id="" style="padding: 0px;">
			<div class="container" data-aos="fade-up">
				<div class="d-flex justify-content-between">
				  <div class="col-md-2">
					<div class="input-group mb-3">
					  <select class="form-select" id="qnaCategory" name="qnaCategory">
						<option selected class="text-muted" value="">카테고리</option>
						<option value="상영작">상영작</option>
						<option value="예매">예매</option>
						<option value="기타">기타</option>
					  </select>
					</div>
				  </div>
				  <div class="col-md-3">
				    <div class="input-group mb-3">
<!-- 				      <input type="text" class="form-control" placeholder="검색어를 입력해주세요." aria-label="input-search" aria-describedby="button-addon2"> -->
<!-- 				      <button class="btn btn-secondary" type="button" id="button-addon2">검색</button> -->
				    </div>
				  </div>
				</div>
			</div>
		</section>
		
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
			<input type="hidden" value="${sessionScope.sId }" id="sId" name="sId">
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
				      <th scope="col">#</th>
				      <th scope="col">카테고리</th>
				      <th scope="col">제목</th>
				      <th scope="col">접수상태</th>
				      <th scope="col">글쓴이</th>
				    </tr>
				  </thead>
				  <tbody id="tbody">
				  	<c:forEach var="qnaBoardDTO" items="${qnaBoardList }">
<%-- 				  	<c:out value="${sessionScope.sId}"/><br/> --%>
<%-- 					<c:out value="${qnaBoardDTO.createUser}"/><br/> --%>
				  	 <tr> 
				  		<th scope="row">${qnaBoardDTO.rn }</th>
				  		<td>${qnaBoardDTO.qnaCategory }</td><!-- 이 글을 클릭 가능하게 하는 것은 운영자와 당사자만 가능하게 하자.  -->
				  		
				  		<c:if test="${qnaBoardDTO.qnaSecret eq 0 }">
				  			<td><a href="cs_qna_content.cs?createUser=${qnaBoardDTO.createUser }&createDate=${qnaBoardDTO.createDate}">${qnaBoardDTO.qnaSubject } </a></td>
				  		</c:if>
				  		<c:if test="${isUserAdmin || sessionScope.sId eq qnaBoardDTO.createUser}">
					  		<c:if test="${qnaBoardDTO.qnaSecret eq 1 }">
					  			<td><a href="cs_qna_content.cs?createUser=${qnaBoardDTO.createUser }&createDate=${qnaBoardDTO.createDate}"><img alt="lock" src="${pageContext.servletContext.contextPath }/_assets/img/lock.png" style="width: 20px;height: 20px;">${qnaBoardDTO.qnaSubject } </a></td>
					  		</c:if>
				  		</c:if>
				  		<c:if test="${!isUserAdmin && sessionScope.sId ne qnaBoardDTO.createUser }">
					  		<c:if test="${qnaBoardDTO.qnaSecret eq 1 }">
					  			<td><img alt="lock" src="${pageContext.servletContext.contextPath }/_assets/img/lock.png" style="width: 20px;height: 20px;">비밀글로 설정되어 있습니다.</td>
					  		</c:if>
				  		</c:if>
				  		
				        <c:if test="${empty qnaBoardDTO.responseUser }">
				        	<td>미답변</td>
				        </c:if>
				        <c:if test="${!empty qnaBoardDTO.responseUser }">
				        	<td>답변완료</td>
				        </c:if>
				        <td class="name">${qnaBoardDTO.createUser }</td>
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
					      <a class="page-link text-secondary" href="cs_qna.cs?pageNum=${pageDTO.startPage - pageDTO.pageBlock }" tabindex="-1" aria-disabled="true">이전</a>
					    </li>
				    </c:if>
				    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					    <li class="page-item" aria-current="page" id="pageSet">
					      <a class="page-link text-secondary" href="cs_qna.cs?pageNum=${i }">${i }</a>
					    </li>
				    </c:forEach>
		    		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
					    <li class="page-item">
					      <a class="page-link text-secondary" href="cs_qna.cs?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">다음</a>
					    </li>
				    </c:if>
				  </ul>
				</div>
			</div>
		</section>
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/csJS/cs_qna.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>