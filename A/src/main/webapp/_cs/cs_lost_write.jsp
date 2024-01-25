<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<c:if test="${sessionScope.sId == null}">
   <c:redirect url="login.me" />
</c:if>		
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
			<div class="container" data-aos="fade-up" style="width: 50%;">
				<form action="insertCsLost.cs" id="insertLostForm">
					<table class="table table-bordered border-secondary-subtle">
					  <tbody>
					    <tr>
					      <td class="table-secondary">분실장소</td>
					      <td>
						      <select class="form-select" id="locationSelect" name="loIdx">
						        <option selected class="text-muted" value="">지역 선택</option>
						      </select>		
					      </td>
					      <td>
					      	<select class="form-select" id="cinemaSelect" name="ciIdx">
					        	<option selected class="text-muted" value="">영화관 선택</option>
					      	</select>
					      </td>
					      <td></td>
					    </tr>
					    <tr>
					      <td class="table-secondary">아이디</td>
					      <td colspan="3"><input class="form-control" name="createUser" type="text" value="${sessionScope.sId }" readonly></td>
					    </tr>
<!-- 					    <tr> -->
<!-- 					      <td class="table-secondary">연락처</td> -->
<!-- 					      <td><input class="form-control" type="text" placeholder="숫자만 입력하세요."></td> -->
<!-- 					      <td class="table-secondary">이메일</td> -->
<!-- 					      <td><input type="text" class="form-control" placeholder="name@example.com 같은 형식으로 입력하세요."></td> -->
<!-- 					    </tr> -->
					    <tr>
					      <td class="table-secondary">제목</td>
					      <td colspan="3"><input class="form-control" id="lostSubject" name="lostSubject" type="text" placeholder="제목을 입력하세요."></td>
					    </tr>
					    <tr>
					      <td class="table-secondary">내용</td>
					      <td colspan="3"><textarea class="form-control" id="lostContent" name="lostContent" placeholder="내용을 입력하세요." style="height: 100px"></textarea></td>
					    </tr>
<!-- 					    <tr> -->
<!-- 					      <td class="table-secondary">비밀번호</td> -->
<!-- 					      <td><input class="form-control" type="password" placeholder="비밀번호를 입력하세요."></td> -->
<!-- 					      <td colspan="2" class="text-danger">*분실물에 대한 고객정보 보호를 위하여 게시글의 비밀번호를 설정하시오.</td> -->
<!-- 					    </tr> -->
					  </tbody>
					</table>
					<div class="d-flex justify-content-around">
						  <div class="form-group mb-3 mr-auto">
						    <button type="submit" class="btn btn-primary" id="lostSubmit">작성</button>
						  </div>
						  <div class="form-group mb-3 ml-auto">
						    <button type="reset" class="btn btn-outline-secondary">초기화</button>
						  </div>
					</div>
				</form>
			</div>
		</section>
		
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/csJS/cs_lost_write.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>