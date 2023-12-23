<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>1:1 문의</h2>
					<div>
						<a href="../_cs/cs_qna.jsp" class="more" style="font-size: 17px;">
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
			<form id="editForm">
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
				      <th scope="col">#</th>
				      <th scope="col">카테고리</th>
				      <th scope="col">제목</th>
				      <th scope="col">글쓴이</th>
				      <th scope="col"></th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>기타</td>
				      <td>비밀글입니다.</td>
				      <td>차*****</td>
				      <td></td>
				    </tr>
				    <tr>
				    	<td colspan="5">
				    		<pre style="text-align: center;">
분명히 쿠폰을 적용했는데 적용 안된 금액으로 결제가 되었습니다.
빨리 확인해주시고 환불해주세요. 급합니다!
				    		</pre>
				   		</td>
				    </tr>
				    
				    <tr>
				    	<td><span>관리자</span>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="#" id="editLink">수정</a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="cs_lost_content.jsp">삭제</a><p class="mb-0">2023-12-15 09:05</p></td>
				    	<td colspan="4"></td>
				    </tr>
				    <tr>
				    	<td colspan="5"><textarea class="form-control" id="editableTextArea" readonly="">
*** 고객님, 안녕하세요. 라떼 시네마 입니다. 결제를 확인해보니 쿠폰 오류로 인해 발생한 일입니다.
금일 내로 처리하겠습니다. 정말 죄송합니다. 라떼 시네마 : 010-1111-1111. 재문의를 하시려면 새 문의글을 작성해주세요.
				    	</textarea></td>
				    </tr>
				    
<!-- 				    <tr> -->
<!-- 				    	<td>아이디<input type="text" value="" readonly></td> -->
<!-- 				    	<td>비밀번호<input type="password"></td> -->
<!-- 				    </tr> -->
				    
<!-- 				    <tr> -->
<!-- 					    <td colspan="5"> -->
<!-- 					        <div class="input-group"> -->
<!-- 					            <textarea class="form-control"></textarea> -->
<!-- 					            <div class="input-group-append"> -->
<!-- 					                <button class="btn btn-outline-secondary" type="button" style="height: 100%;">댓글 쓰기</button> -->
<!-- 					            </div> -->
<!-- 					        </div> -->
<!-- 					    </td> -->
<!-- 					</tr> -->
				    
				  </tbody>
				</table>
				<button type="submit">저장</button>
			</form>	
			</div>
		</section>
		
	</main>
<script>
    $(document).ready(function() {
        // 수정 링크 클릭 시 이벤트 처리
        $("#editLink").click(function() {
            // readonly 속성 제거하여 편집 가능 상태로 변경
            $("#editableTextArea").removeAttr("readonly");
        });
        
     	// 폼 제출 시 이벤트 처리
        $("#editForm").submit(function(event) {
            // 폼이 실제로 제출되지 않도록 막음
            event.preventDefault();

            // 수정한 내용을 서버로 전송하는 로직을 추가
            var editedContent = $("#editableTextArea").val();
            console.log("수정된 내용:", editedContent);
            // 이후에 서버로 데이터를 전송하거나 다른 작업을 수행할 수 있음
        });
    });
</script>	
<%@include file ="../_common/commonFooter.jsp" %>