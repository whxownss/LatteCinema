<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h5>1:1문의 글 작성</h5>
					<div>
						<a href="../_cs/cs_qna.jsp" class="more" style="font-size: 17px;">
							나가기
						</a>
					</div>
				</div>
			</div>
		</section>
	
		<section class="category-section" id="" style="padding: 0px;">
			<div class="container bg-light" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="row justify-content-center">
			      <div class="col-lg-4 col-md-8 col-sm-10">
<!-- 			        <h2 class="text-center">신청</h2> -->
			        <form action="#">
			          <div class="form-group mb-3">
			            <label for="username">신청자명</label>
			            <input type="text" class="form-control" id="username" placeholder="신청자명 입력">
			          </div>
			          <div class="form-group mb-3">
			            <label for="password">비밀번호</label>
			            <input type="password" class="form-control" id="password" placeholder="비밀번호 입력">
			          </div>
			          <div class="form-group mb-3">
			            <label for="phone">신청자 연락처</label>
			            <input type="text" class="form-control" id="phone" placeholder="신청자 연락처 입력">
			          </div>
			          <div class="form-group mb-3">
			            <label for="email">이메일 주소</label>
			            <input type="text" class="form-control" id="email" placeholder="이메일 주소 입력">
			          </div>
			          
			         
			          <div class="form-group mb-3">
			            <label for="agreement"></label>
			            <div>
				            <textarea class="form-control" id="agreement" style="overflow: auto; height: 200px;" placeholder="내용을 입력해주세요."></textarea>
			            </div>
			          </div>
			          <div class="d-flex justify-content-around">
				          <div class="form-group mb-3 d-flex justify-content-center">
							  <button type="submit" class="btn btn-primary">작성</button>
						  </div>
						   <div class="form-group mb-3 d-flex justify-content-center">
							  <button type="reset" class="btn btn-outline-secondary">취소</button>
						  </div>
			          </div>	

			        </form>
			      </div>
				
				</div>
			</div>	
		</section>	
	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>