<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>공지사항</h2>
					<div>
						<a href="cs_center_write.cs" class="more" style="font-size: 17px;">
							공지사항 작성
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
				      <th scope="col">#</th>
				      <th scope="col">영화관</th>
				      <th scope="col">제목</th>
				      <th scope="col">등록일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>전체글</td>
				      <td><a href="cs_center_content.cs">임시 겨울왕국1 교환 안내</a></td>
				      <td>23.12.01</td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>전체글</td>
				      <td><a href="#">씨네큐 영화관람료 소득공제 제도 시행</a></td>
				      <td>23.06.26</td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>부산서면점</td>
				      <td><a href="#">부산서면점 휴무일 안내</a></td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">4</th>
				      <td>부산서면점</td>
				      <td><a href="#">부산서면점 휴무일 안내</a></td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">5</th>
				      <td>부산서면점</td>
				      <td><a href="#">부산서면점 휴무일 안내</a></td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">6</th>
				      <td>부산서면점</td>
				      <td><a href="#">부산서면점 휴무일 안내</a></td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">7</th>
				      <td>부산서면점</td>
				      <td><a href="#">부산서면점 휴무일 안내</a></td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">8</th>
				      <td>부산서면점</td>
				      <td><a href="#">부산서면점 휴무일 안내</a></td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">9</th>
				      <td>부산서면점</td>
				      <td><a href="#">부산서면점 휴무일 안내</a></td>
				      <td>23.05.26</td>
				    </tr>
				    <tr>
				      <th scope="row">10</th>
				      <td>부산서면점</td>
				      <td><a href="#">부산서면점 휴무일 안내</a></td>
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