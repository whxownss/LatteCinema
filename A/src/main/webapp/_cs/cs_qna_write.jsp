<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<c:if test="${sessionScope.sId == null}">
   <c:redirect url="login.me" />
</c:if>		
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h5>1:1문의 글 작성</h5>
					<div>
						<a href="cs_qna.cs" class="more" style="font-size: 17px;">
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
			        <form action="qnaBoardInsert.cs" method="post" id="insertForm">
			        <div class="pb-2 form-check">
			        	<input class="form-check-input" type="checkbox" name="qnaChk" id="qnaSecretChk" checked/>
			        	<label class="form-check-label" for="qnaSecretChk">비밀글 설정을 하시려면 체크해주세요.</label>
						<input type="hidden" name="qnaSecret" value='1' id="qnaSecret"/>
			        </div>
			        <select class="form-select mb-3" id="qnaCategory" name="qnaCategory">
						<option selected class="text-muted">카테고리</option>
						<option value="상영작">상영작</option>
						<option value="예매">예매</option>
						<option value="기타">기타</option>
					  </select>
			          <div class="form-group mb-3">
			            <label for="createUser">신청자명</label>
			            <input type="text" class="form-control" id="createUser" name="createUser" placeholder="신청자명 입력" value="${sessionScope.sId }" readonly>
			          </div>
			          <div class="form-group mb-3">
			            <label for="qnaSubject">제목</label>
			            <input type="text" class="form-control" id="qnaSubject" name="qnaSubject" placeholder="제목 입력">
			          </div>
<!-- 			          <div class="form-group mb-3"> -->
<!-- 			            <label for="phone">신청자 연락처</label> -->
<!-- 			            <input type="text" class="form-control" id="phone" placeholder="신청자 연락처 입력"> -->
<!-- 			          </div> -->
<!-- 			          <div class="form-group mb-3"> -->
<!-- 			            <label for="email">이메일 주소</label> -->
<!-- 			            <input type="text" class="form-control" id="email" placeholder="이메일 주소 입력"> -->
<!-- 			          </div> -->
			          
			         
			          <div class="form-group mb-3">
			            <label for="qnaContent"></label>
			            <div>
				            <textarea class="form-control" id="qnaContent" name="qnaContent"  style="overflow: auto; height: 200px;" placeholder="내용을 입력해주세요."></textarea>
			            </div>
			          </div>
			          <div class="d-flex justify-content-around">
				          <div class="form-group mb-3 d-flex justify-content-center">
							  <button type="submit" id="insertQnaBoard" class="btn btn-primary">작성</button>
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
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/csJS/cs_qna_write.js"></script>
<%@include file="../_common/commonFooterEnd.jsp"%>