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
						<a href="cs_center.jsp" class="more" style="font-size: 17px;">
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
				          <li><a href="../_cs/cs_center.jsp">공지사항</a></li>
				          <li><a href="../_cs/cs_exque.jsp">자주찾는질문</a></li>
				          <li><a href="../_cs/cs_qna.jsp">1:1문의</a></li>
				          <li><a href="../_cs/cs_lost.jsp">분실물</a></li>
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
				      <td>전체</td>
				      <td>겨울왕국1 교환 안내</td>
				      <td>23.12.01</td>
				    </tr>
				    <tr>
				    	<td colspan="4">
				    		<pre style="text-align: center;">
안녕하세요, 씨네Q입니다.

먼저 씨네Q를 이용해주시는 고객님들께 항상 깊은 감사 드립니다.

 

<겨울왕국 1> 포스터 재입고 완료되어 교환 진행중에 있습니다. 

* 포스터 지참하여 방문시 교환 가능

* 교환 가능 기한 : ~12/31(일)

 

가능 기한 초과시 교환이 어려울 수 있는 점 양해 부탁드립니다.

 

감사합니다.

씨네Q 드림
				    		</pre>
				   		</td>
				    </tr>
				    <tr>
				    	<td colspan="4">
				    		<div class="d-flex justify-content-around">
					            <button class="btn btn-dark" type="button" onclick="location.href='../_cs/cs_center_write.jsp'">수정</button>
					            <button class="btn btn-outline-secondary" type="button">삭제</button>
					        </div>
				    	</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</section>
		
	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>