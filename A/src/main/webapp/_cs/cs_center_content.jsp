<%@page import="com.itwillbs.domain.CenterBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file ="../_common/commonHeaderStart.jsp" %>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
	
<%
CenterBoardDTO centerBoardDTO = (CenterBoardDTO)request.getAttribute("centerBoardDTO");
// String user = "ADMIN2477";
%>

			  
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>공지사항</h2>
					<div>
						<a href="cs_center.cs" class="more" style="font-size: 17px;">
							나가기
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
				<input type="hidden" value="${sessionScope.sId }" name="updateUser" id="updateUser">
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
<!-- 				      <th scope="col">#</th> -->
				      <th scope="col">영화관</th>
				      <th scope="col">제목</th>
				      <th scope="col">등록일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
<!-- 				      <th scope="row">1</th> -->
				      <td>${centerBoardDTO.ciName }</td>
				      <td><div id="titleArea">${centerBoardDTO.centerSubject }</div></td>
				      <td><fmt:formatDate value="${centerBoardDTO.createDate }" pattern="yyyy-MM-dd"/></td>
				    </tr>
				    <tr>
				    	<td colspan="4">
				    		<pre id="contentArea" style="text-align: center;">
${centerBoardDTO.centerContent }
				    		</pre>
				   		</td>
				    </tr>
				    <tr>
				    	<td colspan="4">
				    		<div class="d-flex justify-content-around">
<!-- 					            <button id="editButton" class="btn btn-dark" type="button">수정</button> -->
<!-- 					            <button id="deleteButton" class="btn btn-outline-secondary" type="button">삭제</button> -->
					        </div>
				    	</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</section>
		
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/csJS/cs_center_content.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>