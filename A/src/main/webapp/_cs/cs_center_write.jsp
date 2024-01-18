<%@page import="com.itwillbs.domain.LocationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<%
ArrayList<LocationDTO> regionList = (ArrayList<LocationDTO>)request.getAttribute("regionList");
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
		<form action="insertCenterWrite.cs" method="post" name="fr">
		<input type="hidden" name="createUser" value=${sessionScope.sId }>
			<div class="container" data-aos="fade-up">
				<select id="locationSelect" name="loIdx" class="form-select" aria-label="Default select example">
					<option selected value="">지역</option>
<!-- 					<option value="1">서울</option> -->
<!-- 					<option value="2">경기/인천</option> -->
<!-- 					<option value="3">경남/부산/울산</option> -->
				</select>
				<select id="cinemaSelect" name="ciIdx" class="form-select" aria-label="Default select example">
				  <option selected value="">영화관</option>
<!-- 				  <option value="전체">전체</option> -->

				</select>
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
				      <th scope="col">#</th>
				      <th scope="col">영화관</th>
				      <th scope="col">제목</th>
				      <th scope="col">등록일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row"></th>
				      <td style="width: 100px;"><span id="textSpan"></span></td>
				      <td><input type="text" id="centerSubject" name="centerSubject" style="width: 90%;" value="" placeholder="제목을 입력하세요."></td>
				      <td><span></span></td>
				    </tr>
				    <tr>
				    	<td colspan="4">
				    		<textarea class="form-control" id="centerContent" name="centerContent" placeholder="내용을 입력하세요." style="text-align: center; box-sizing: border-box; resize: none; height: 500px;"></textarea>
				   		</td>
				    </tr>
				    <tr>
				    	<td colspan="4">
				    		<div class="d-flex justify-content-around">
<!-- 					            <button class="btn btn-dark" type="button" onclick="check()">작성하기</button> -->
					            <button class="btn btn-dark" type="submit" id="submitCenter">작성하기</button>
					        </div>
				    	</td>
				    </tr>
				  </tbody>
				</table>
			</div>
			</form>
		</section>
		
		
	</main>

<%@include file="../_common/commonFooterStart.jsp"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/csJS/cs_center_write.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>