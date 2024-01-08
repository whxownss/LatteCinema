<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h5>옛날 영화 추천 신청</h5>
					<div>
						<a href="cs_center.cs" class="more" style="font-size: 16px;">
							나가기
						</a>
					</div>
				</div>
			</div>
		</section>
		  
		<section class="category-section" id="">
			<div class="container bg-light" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				  <div class="row">
				    <div class="col-md-6 offset-md-3">
				      <div class>
				        <ul class="d-flex flex-wrap justify-content-between mb-4">
				          <li>라떼시네마 옛날영화 추천 신청서 입니다.</li>
				        </ul>
				      </div>
				    </div>
				  </div>
			</div>
		</section>
	
		<section class="category-section" id="">
			<div class="container bg-light" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="row justify-content-center">
			      <div class="col-lg-4 col-md-8 col-sm-10">
			        <h2 class="text-center">신청</h2>
			        <form action="#">
			          <div class="form-group mb-3">
			            <label for="createUser">신청자명</label>
			            <input type="text" class="form-control" id="createUser" name="createUser" value="${sessionScope.sId }" readonly>
			          </div>
<!-- 			          <div class="form-group mb-3"> -->
<!-- 			            <label for="password">비밀번호</label> -->
<!-- 			            <input type="password" class="form-control" id="password" placeholder="비밀번호 입력"> -->
<!-- 			          </div> -->
			          <div class="form-group mb-3">
			            <label for="movieName">신청영화</label>
			            <input type="text" class="form-control" id="movieName" name="movieName" placeholder="영화명 입력">
			          </div>
			          <div class="form-group mb-3">
			            <label for="director">감독</label>
			            <input type="text" class="form-control" id="director" placeholder="이메일 주소 입력">
			          </div>
			          <div class="form-group mb-3">
			            <label for="agreement">신청 시 주의 사항</label>
			            <div>
				            <textarea class="form-control" id="agreement" style="overflow: auto; height: 200px;">만약 다른 분이 이미 작성한 제안 글이 있는 경우, 새로운 글을 작성하시는 것보다 기존 글을 추천해주시는 게 상영 확률이 높아집니다.</textarea>
			            </div>
			          </div>
<!-- 			          <div class="checkbox checkbox-styled" style="margin-bottom: 20px;"> -->
<!-- 							<label> -->
<!-- 								<input type="checkbox" autocomplete="off"> -->
<!-- 								<span>개인정보 수집 및 이용에 동의합니다.</span> -->
<!-- 							</label> -->
<!-- 					  </div> -->
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