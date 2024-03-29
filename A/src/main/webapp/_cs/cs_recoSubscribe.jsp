<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>
<c:if test="${sessionScope.sId == null}">
   <c:redirect url="login.me" />
</c:if>
	<main id="main">
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h5>옛날 영화 추천 신청</h5>
					<div>
						<a href="cs_recommend.cs" class="more" style="font-size: 16px;">
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
				          <li class="text-center">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;라떼시네마 옛날영화 추천 신청서 입니다.</li>
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
			        <form action="insertRecommend.cs" method="post">
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
			          	<%
						   java.util.Calendar now = java.util.Calendar.getInstance();
						   int currentYear = now.get(java.util.Calendar.YEAR);
						%>
							<select class="form-select" id="movieYear">
							  <%
							    for (int year = 1980; year <= currentYear - 20; year++) {
							  %>
							    <option><%= year %></option>
							  <%
							    }
							  %>
							</select>
			            <input type="text" class="form-control" name="movieName" id="movieName" list="movieList" placeholder="연도 선택 후 영화명 입력" autocomplete="off">
			            <datalist id="movieList">
<!-- 				           	<option>영화1</option> -->
<!-- 				           	<option>영화2</option> -->
<!-- 				           	<option>영화3</option> -->
<!-- 				           	<option>영화4</option> -->
<!-- 				           	<option>서울4</option> -->
<!-- 				           	<option>서울4</option> -->
<!-- 				           	<option>서울4</option> -->
<!-- 				           	<option>서울4</option> -->
				        </datalist>
<!-- 			            <input type="text" class="form-control" id="movieName" name="movieName" placeholder="영화명 입력"> -->
			          </div>
			          <div class="form-group mb-3">
			            <label for="director">감독</label>
			            <input type="text" class="form-control" id="director" name="director" placeholder="감독명 입력"  autocomplete="off" readonly>
			          </div>
			          <div class="form-group mb-3">
			            <label for="poster">포스터</label>
			            <input type="hidden" class="form-control" id="poster" name="poster" placeholder=""  autocomplete="off" readonly>
			            <img alt="영화 포스터" src="" style="width: 100%;" id="posterImg">
			          </div>
			          <div class="form-group mb-3">
			            <label for="agreement">신청 시 주의 사항</label>
			            <div>
				            <textarea class="form-control" id="agreement" style="overflow: auto; height: 300px; text-align: left;" readonly>
라떼시네마 옛날영화 추천 신청 안내

안녕하세요, 라떼시네마입니다! 영화를 사랑하는 여러분들의 의견을 듣고, 원하는 영화를 상영하기 위해 옛날 영화 추천 신청을 받고 있습니다. 여러분이 원하는 영화를 상영하고자 한다면, 아래의 안내를 따라서 제안하실 수 있습니다.

1. 영화 선택 범위
옛날 영화 추천은 1980년부터 현재 연도에서 20년 전까지의 영화를 대상으로 합니다. 따라서 1980년부터 현재 연도에서 20년 전까지의 어떤 영화든 신청하실 수 있습니다.

2. 이미 작성된 제안 글 확인
다른 분들이 이미 제안한 영화가 있는지 확인해보세요. 이미 작성된 제안 글이 있다면, 그 글을 추천해주시는 것이 상영 확률을 높일 수 있습니다.

3. 신규 제안 작성
만약 검색 시 없는 영화라도 걱정하지 마세요. 직접 영화명과 감독명을 입력하여 새로운 제안 글을 작성하실 수 있습니다.

이제 여러분의 영화 추천을 기다리고 있습니다! 영화 제안은 라떼시네마의 다양한 프로그램에 기여할 수 있으며, 우리 모두가 함께 즐길 수 있는 영화를 찾는 데 도움이 될 것입니다.

감사합니다!
라떼시네마 드림
				            </textarea>
			            </div>
			          </div>
<!-- 			          <div class="checkbox checkbox-styled" style="margin-bottom: 20px;"> -->
<!-- 							<label> -->
<!-- 								<input type="checkbox" autocomplete="off"> -->
<!-- 								<span>개인정보 수집 및 이용에 동의합니다.</span> -->
<!-- 							</label> -->
<!-- 					  </div> -->
					  <div class="d-flex justify-content-around">
					  <c:if test="${!empty sessionScope.sId }">
				          <div class="form-group mb-3 d-flex justify-content-center">
							  <button type="submit" class="btn btn-primary" id="submitReco">작성</button>
						  </div>
						   <div class="form-group mb-3 d-flex justify-content-center">
							  <button type="reset" class="btn btn-outline-secondary">취소</button>
						  </div>
					  </c:if>	  
			          </div>	
			        </form>
			      </div>
				
				</div>
			</div>	
		</section>	
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/csJS/cs_recoSubscribe.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>