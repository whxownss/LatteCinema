<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>분실물 문의</h2>
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
				<table class="table table-bordered">
				  <tbody>
				    <tr>
				      <td class="table-secondary">분실장소</td>
				      <td>
					      <select class="form-select" id="inputGroupSelect02">
					        <option selected class="text-muted">영화관 선택</option>
					        <option value="1">부산대</option>
					        <option value="2">강남</option>
					        <option value="3">서귀포</option>
					      </select>		
				      </td>
				      <td>
				      	<select class="form-select" id="inputGroupSelect02">
				        	<option selected class="text-muted">영화관 선택</option>
				        	<option value="1">부산대</option>
				        	<option value="2">강남</option>
				        	<option value="3">서귀포</option>
				      	</select>
				      </td>
				      <td></td>
				    </tr>
				    <tr>
				      <td class="table-secondary">이름</td>
				      <td colspan="3"><input type="text"></td>
				    </tr>
				    <tr>
				      <td class="table-secondary">연락처</td>
				      <td><input type="text"></td>
				      <td>이메일</td>
				      <td><input type="text"></td>
				    </tr>
				    <tr>
				      <td class="table-secondary">제목</td>
				      <td colspan="3">잘 나오는지 확인</td>
				    </tr>
				    <tr>
				      <td class="table-secondary">내용</td>
				      <td colspan="3"><textarea></textarea></td>
				    </tr>
				    <tr>
				      <td class="table-secondary">비밀번호</td>
				      <td><input type="password"></td>
				      <td colspan="2" class="text-danger">*분실물에 대한 고객정보 보호를 위하여 게시글의 비밀번호를 설정하시오.</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</section>
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<div class="pagination-container d-flex justify-content-center">
				  <ul class="pagination">
				    <li class="page-item disabled">
				      <a class="page-link text-secondary" href="#" tabindex="-1" aria-disabled="true">이전</a>
				    </li>
				    <li class="page-item" aria-current="page">
				      <a class="page-link text-secondary" href="#">1</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link text-secondary" href="#">2</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link text-secondary" href="#">3</a>
				    </li>
				    <!-- 나머지 페이지 번호 추가 -->
				    <li class="page-item">
				      <a class="page-link text-secondary" href="#">다음</a>
				    </li>
				  </ul>
				</div>
			</div>
		</section>	
	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>