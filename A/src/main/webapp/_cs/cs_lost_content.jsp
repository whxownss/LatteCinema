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
				      <th scope="col">접수상태</th>
				      <th scope="col">등록일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>부산대</td>
				      <td>책갈피 분실물 있나요?</td>
				      <td>답변완료</td>
				      <td>23.12.01</td>
				    </tr>
				    <tr>
				    	<td colspan="5">
				    		<pre style="text-align: center;">
어제 1관에서 책갈피를 잃어 버렸어요. 저에게 중요한 책갈피 입니다.
꼭 찾아주세요. 나비 모양이고 책갈피라 크기가 좀 작아요.
				    		</pre>
				   		</td>
				    </tr>
				    <tr>
				    	<td><input type="text" value="관리자" readonly>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="#">수정</a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="cs_lost_content.jsp">삭제</a><p class="mb-0">2023-12-15 09:05</p></td>
				    	<td colspan="4"></td>
				    </tr>
				    <tr>
				    	<td colspan="5"><textarea class="form-control" readonly>
*** 고객님, 안녕하세요. 라떼 시네마 입니다. 고객님께서 찾으시던 책갈피를 찾아서 보관 중입니다.
라떼 시네마에 오셔서 고객센터로 찾아와 주세요. 라떼 시네마 : 010-1111-1111
				    	</textarea></td>
				    </tr>
				    
				    <tr>
				    	<td>아이디<input type="text" value="" readonly></td>
				    	<td>비밀번호<input type="password"></td>
				    </tr>
				    
				    <tr>
					    <td colspan="5">
					        <div class="input-group">
					            <textarea class="form-control"></textarea>
					            <div class="input-group-append">
					                <button class="btn btn-outline-secondary" type="button" style="height: 100%;">댓글 쓰기</button>
					            </div>
					        </div>
					    </td>
					</tr>
				    
				  </tbody>
				</table>
			</div>
		</section>
		
	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>