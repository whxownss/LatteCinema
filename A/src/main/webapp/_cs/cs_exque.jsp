<%@page import="com.itwillbs.domain.ExqBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.domain.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<%
ArrayList<ExqBoardDTO> exqBoardList = (ArrayList<ExqBoardDTO>)request.getAttribute("exqBoardList");
PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");	
%>			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>자주찾는질문</h2>
					<div>
<!-- 						<a href="#" class="more"> -->
<!-- 							"2023.12.11 기준" -->
<!-- 						</a> -->
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
				  <div class="col-2">
				    <select class="form-select" id="inputGroupSelect01" style="text-align: center;">
				      <option selected class="text-muted">구분 선택</option>
				      <option value="예매">예매</option>
				      <option value="관람권">관람권</option>
				      <option value="멤버십">멤버십</option>
				      <option value="할인혜택">할인혜택</option>
				      <option value="영화관이용">영화관이용</option>
				      <option value="기타">기타</option>
				    </select>
				  </div>
				</div> 		
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
				      <th scope="col">#</th>
				      <th scope="col">구분</th>
				      <th scope="col" colspan="2">질문</th>
				    </tr>
				  </thead>
				  	<tbody>
					  	<c:forEach var="exqBoardDTO" items="${exqBoardList }">
					  		<tr class="table-secondary">
						      <td scope="col">${exqBoardDTO.rn }</td>
						      <td scope="col">${exqBoardDTO.exqSelect }</td>
						      <td scope="col" colspan="2"><a data-bs-toggle="collapse" href="#collapseEx${exqBoardDTO.rn }" role="button" aria-expanded="false" aria-controls="collapseEx1">${exqBoardDTO.exqSubject }</a></td>
						    </tr>
						    <tr class="collapse" id="collapseEx${exqBoardDTO.rn }">
						      <td colspan="4">
						      	  <div class="card card-body">
								    ${exqBoardDTO.exqContent }
								  </div>
						      </td>
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
					      <a class="page-link text-secondary" href="cs_exque.cs?pageNum=${pageDTO.startPage - pageDTO.pageBlock }" tabindex="-1" aria-disabled="true">이전</a>
					    </li>
				    </c:if>	
				    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					    <li class="page-item" aria-current="page">
					      <a class="page-link text-secondary" href="cs_exque.cs?pageNum=${i }">${i }</a>
					    </li>
				    </c:forEach>
		    		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
					    <li class="page-item">
					      <a class="page-link text-secondary" href="cs_exque.cs?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">다음</a>
					    </li>
				    </c:if>	
				  </ul>
				</div>
			</div>
		</section>	
	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>