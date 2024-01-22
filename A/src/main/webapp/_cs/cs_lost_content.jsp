<%@page import="com.itwillbs.domain.LostBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<%
// String responseUser = "ADMIN2477";
LostBoardDTO lostBoardDTO = (LostBoardDTO)request.getAttribute("lostBoardDTO");
%>
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>분실물 문의</h2>
					<div>
						<a href="cs_lost.cs" class="more" style="font-size: 17px;">
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
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
<!-- 				      <th scope="col">#</th> -->
				      <th scope="col">영화관</th>
				      <th scope="col">제목</th>
				      <th scope="col">접수상태</th>
				      <th scope="col">등록일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
<!-- 				      <th scope="row"></th> -->
				      <td>${lostBoardDTO.ciName }</td>
				      <td>${lostBoardDTO.lostSubject }</td>
				      <td>
				      	<c:if test="${lostBoardDTO.lostStatus eq 0 }">미답변</c:if>
				      	<c:if test="${lostBoardDTO.lostStatus eq 1 }">답변완료</c:if>
				      </td>
				      <td><fmt:formatDate value="${lostBoardDTO.createDate }" pattern="yyyy-MM-dd"/></td>
				    </tr>
				    <tr>
				    	<td colspan="4">
				    		<pre style="text-align: center;">
${lostBoardDTO.lostContent }
				    		</pre>
				   		</td>
				    </tr>
				    <tr>
				    	<td><span style="font-weight:bold;">관리자</span><p class="mb-0"><fmt:formatDate value="${lostBoardDTO.responseDate }" pattern="yyyy-MM-dd HH:mm:ss"/></p></td>
<%-- 				    	<td><span style="font-weight:bold;">관리자</span>&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${! empty lostBoardDTO.lostResponse }"><a href="javascript:edit();" id="editLink">수정</a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="#">삭제</a><p class="mb-0"><fmt:formatDate value="${lostBoardDTO.responseDate }" pattern="yyyy-MM-dd HH:mm:ss"/></p></c:if></td> --%>
				    	<td colspan="3"></td>
				    </tr>
				    <tr>
				    	<td colspan="4"><div class="input-group"><textarea class="form-control" id="editableTextArea" readonly>
${lostBoardDTO.lostResponse }
				    	</textarea>
<!-- 					    	<div class="input-group-append"> -->
<%-- 					    		<c:if test="${empty lostBoardDTO.lostResponse }"> --%>
<!-- 						    		<button class="btn btn-outline-secondary" type="button" id="editButton" style="height: 100%;">댓글 쓰기</button> -->
<%-- 						    	</c:if> --%>
<!-- 					    	</div> -->
				    	</div>
				    	</td>
				    </tr>
				    
<!-- 				    <tr> -->
<!-- 				    	<td>아이디<input type="text" value="" readonly></td> -->
<!-- 				    	<td>비밀번호<input type="password"></td> -->
<!-- 				    </tr> -->
				    
<!-- 				    <tr> -->
<!-- 					    <td colspan="5"> -->
<!-- 					        <div class="input-group"> -->
<!-- 					            <textarea class="form-control"></textarea> -->
<!-- 					            <div class="input-group-append"> -->
<!-- 					                <button class="btn btn-outline-secondary" type="button" style="height: 100%;">댓글 쓰기</button> -->
<!-- 					            </div> -->
<!-- 					        </div> -->
<!-- 					    </td> -->
<!-- 					</tr> -->
				    
				  </tbody>
				</table>
			</div>
		</section>
		
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/csJS/cs_lost_content.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>