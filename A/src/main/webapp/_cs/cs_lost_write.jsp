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
						<a href="cs_lost.cs" class="more" style="font-size: 17px;">
							나가기
						</a>
					</div>
				</div>
			</div>
		</section>
		  
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up" style="width: 50%;">
				<form action="#">
					<table class="table table-bordered border-secondary-subtle">
					  <tbody>
					    <tr>
					      <td class="table-secondary">분실장소</td>
					      <td>
						      <select class="form-select" id="inputGroupSelect01">
						        <option selected class="text-muted">지역 선택</option>
						        <option value="서울">서울</option>
						        <option value="부산">부산</option>
						        <option value="제주도">제주도</option>
						      </select>		
					      </td>
					      <td>
					      	<select class="form-select" id="inputGroupSelect02">
					        	<option selected class="text-muted">영화관 선택</option>
					        	<option value="부산대">부산대</option>
					        	<option value="강남">강남</option>
					        	<option value="서귀포">서귀포</option>
					      	</select>
					      </td>
					      <td></td>
					    </tr>
					    <tr>
					      <td class="table-secondary">이름</td>
					      <td colspan="3"><input class="form-control" type="text" placeholder="이름을 입력하세요."></td>
					    </tr>
					    <tr>
					      <td class="table-secondary">연락처</td>
					      <td><input class="form-control" type="text" placeholder="숫자만 입력하세요."></td>
					      <td class="table-secondary">이메일</td>
					      <td><input type="text" class="form-control" placeholder="name@example.com 같은 형식으로 입력하세요."></td>
					    </tr>
					    <tr>
					      <td class="table-secondary">제목</td>
					      <td colspan="3"><input class="form-control" type="text" placeholder="제목을 입력하세요."></td>
					    </tr>
					    <tr>
					      <td class="table-secondary">내용</td>
					      <td colspan="3"><textarea class="form-control" placeholder="내용을 입력하세요." style="height: 100px"></textarea></td>
					    </tr>
					    <tr>
					      <td class="table-secondary">비밀번호</td>
					      <td><input class="form-control" type="password" placeholder="비밀번호를 입력하세요."></td>
					      <td colspan="2" class="text-danger">*분실물에 대한 고객정보 보호를 위하여 게시글의 비밀번호를 설정하시오.</td>
					    </tr>
					  </tbody>
					</table>
					<div class="d-flex justify-content-around">
						  <div class="form-group mb-3 mr-auto">
						    <button type="submit" class="btn btn-primary">작성</button>
						  </div>
						  <div class="form-group mb-3 ml-auto">
						    <button type="reset" class="btn btn-outline-secondary">취소</button>
						  </div>
					</div>
				</form>
			</div>
		</section>
		
	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>