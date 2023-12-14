<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>1:1문의</h2>
					<div>
						<a href="cs_qna_write.jsp" class="more " style="font-size: 18px;">
							1:1문의 글쓰기
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
				          <li><a href="cs_center.jsp">공지사항</a></li>
				          <li><a href="#">자주찾는질문</a></li>
				          <li><a href="cs_qna.jsp">1:1문의</a></li>
				          <li><a href="cs_lost.jsp">분실물</a></li>
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
					  <select class="form-select" id="inputGroupSelect02">
						<option selected class="text-muted">카테고리</option>
						<option value="1">상영작</option>
						<option value="2">예매</option>
						<option value="3">기타</option>
					  </select>
					</div>
				  </div>
				  <div class="col-md-3">
				    <div class="input-group mb-3">
				      <input type="text" class="form-control" placeholder="검색어를 입력해주세요." aria-label="input-search" aria-describedby="button-addon2">
				      <button class="button-lost" type="button" id="button-addon2">검색</button>
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
				      <th scope="col">#</th>
				      <th scope="col">카테고리</th>
				      <th scope="col">제목</th>
				      <th scope="col">글쓴이</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>기타</td>
				      <td><a href="#"> 비밀글입니다. </a></td>
				      <td>차*****</td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>상영작</td>
				      <td><a href="#"> 비밀글입니다. </a></td>
				      <td>차*****</td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>예매</td>
				      <td><a href="#"> 비밀글입니다. </a></td>
				      <td>차*****</td>
				    </tr>
				    <tr>
				      <th scope="row">4</th>
				      <td>기타</td>
				      <td><a href="#"> 비밀글입니다. </a></td>
				      <td>차*****</td>
				    </tr>
				    <tr>
				      <th scope="row">5</th>
				      <td>상영작</td>
				      <td><a href="#"> 비밀글입니다. </a></td>
				      <td>차*****</td>
				    </tr>
				    <tr>
				      <th scope="row">6</th>
				      <td>예매</td>
				      <td><a href="#"> 비밀글입니다. </a></td>
				      <td>차*****</td>
				    </tr>
				    <tr>
				      <th scope="row">7</th>
				      <td>기타</td>
				      <td><a href="#"> 비밀글입니다. </a></td>
				      <td>차*****</td>
				    </tr>
				    <tr>
				      <th scope="row">8</th>
				      <td>상영작</td>
				      <td><a href="#"> 비밀글입니다. </a></td>
				      <td>차*****</td>
				    </tr>
				    <tr>
				      <th scope="row">9</th>
				      <td>예매</td>
				      <td><a href="#"> 비밀글입니다. </a></td>
				      <td>차*****</td>
				    </tr>
				    <tr>
				      <th scope="row">10</th>
				      <td>기타</td>
				      <td><a href="#"> 비밀글입니다. </a></td>
				      <td>차*****</td>
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
				      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
				    </li>
				    <li class="page-item active" aria-current="page">
				      <a class="page-link" href="#">1</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">2</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">3</a>
				    </li>
				    <!-- 나머지 페이지 번호 추가 -->
				    <li class="page-item">
				      <a class="page-link" href="#">다음</a>
				    </li>
				  </ul>
				</div>
			</div>
		</section>	
	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>