<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeader.jsp" %>

	<main id="main">
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>분실물 문의</h2>
					<div>
						<a href="#" class="more " style="font-size: 18px;">
							분실물 문의하기
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
		
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<div class="row">
				  <div class="col-md-3">
				    <p><strong>전체 <span id="totalCnt" class="font-gblue">7,727</span>건</strong></p>
				  </div>
				  <div class="col-md-2">
				    <div class="input-group mb-3">
				      <select class="form-select" id="inputGroupSelect02">
				        <option selected class="text-muted">지역선택</option>
				        <option value="1">서울</option>
				        <option value="2">부산</option>
				        <option value="3">제주</option>
				      </select>
<!-- 				      <label class="input-group-text" for="inputGroupSelect02">Options</label> -->
				    </div>
				  </div>
				  <div class="col-md-2">
				    <div class="input-group mb-3">
				      <select class="form-select" id="inputGroupSelect02">
				        <option selected class="text-muted">영화관 선택</option>
				        <option value="1">부산대</option>
				        <option value="2">강남</option>
				        <option value="3">서귀포</option>
				      </select>
<!-- 				      <label class="input-group-text" for="inputGroupSelect02">Options</label> -->
				    </div>
				  </div>
				  <div class="col-md-2">
				    <div class="input-group mb-3">
				      <select class="form-select" id="inputGroupSelect02">
				        <option selected class="text-muted">접수상태 선택</option>
				        <option value="1">미답변</option>
				        <option value="2">답변완료</option>
<!-- 				        <option value="3">Three</option> -->
				      </select>
<!-- 				      <label class="input-group-text" for="inputGroupSelect02">Options</label> -->
				    </div>
				  </div>
				  <div class="col-md-3">
				    <div class="input-group mb-3">
				      <input type="text" class="form-control" placeholder="검색어를 입력해주세요." aria-label="input-search" aria-describedby="button-addon2">
				      <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
				    </div>
				  </div>
				</div>
				
				<!-- table -->
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
				      <th scope="col">#</th>
				      <th scope="col">영화관</th>
				      <th scope="col">제목</th>
				      <th scope="col">접수상태</th>
				      <th scope="col">등록일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>부산대</td>
				      <td><a href="#">책갈피 분실물 있나요?</a></td>
				      <td>답변완료</td>
				      <td>23.12.01</td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>부산대</td>
				      <td><a href="#">토스유스카드 분실</a></td>
				      <td>답변완료</td>
				      <td>23.06.26</td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>부산대</td>
				      <td><a href="#">아디다스 검정점퍼 분실</a></td>
				      <td>답변완료</td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">4</th>
				      <td>부산대</td>
				      <td><a href="#">분실물 문의드립니다</a></td>
				      <td>답변완료</td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">5</th>
				      <td>부산대</td>
				      <td><a href="#">열쇠</a></td>
				      <td>답변완료</td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">6</th>
				      <td>부산대</td>
				      <td><a href="#">시계분실</a></td>
				      <td>답변완료</td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">7</th>
				      <td>부산대</td>
				      <td><a href="#">종이가방 분실했어요.</a></td>
				      <td>미답변</td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">8</th>
				      <td>부산대</td>
				      <td><a href="#">신용카드를 잃어버렸어요</a></td>
				      <td>답변완료</td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">9</th>
				      <td>부산대</td>
				      <td><a href="#">버즈분실요ㅠ</a></td>
				      <td>미답변</td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">10</th>
				      <td>부산대</td>
				      <td><a href="#">아들이 지갑을 잃어버렸어요</a></td>
				      <td>미답변</td>
				      <td>23.05.26</td>
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