<%@page import="com.itwillbs.domain.QnaBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<%
QnaBoardDTO qnaBoardDTO = (QnaBoardDTO)request.getAttribute("qnaBoardDTO");
String responseUser = "ADMIN2477";
%>	
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>1:1 문의</h2>
					<div>
						<a href="cs_qna.cs" class="more" style="font-size: 17px;">
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
			<form id="editForm">
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
				      <th scope="col">카테고리</th>
				      <th scope="col">제목</th>
				      <th scope="col">글쓴이</th>
				      <th scope="col"></th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>${qnaBoardDTO.qnaCategory }</td>
				      <td>${qnaBoardDTO.qnaSubject }</td>
				      <td>${qnaBoardDTO.createUser }</td>
				      <td></td>
				    </tr>
				    <tr>
				    	<td colspan="5">
				    		<pre style="text-align: center;">
${qnaBoardDTO.qnaContent }
				    		</pre>
				   		</td>
				    </tr>
				    <!-- 여기서부터는 답변이 없고 관리자가 아니면 안보이게 만들면 될듯  -->
				    <tr><!-- <a href="cs_lost_content.jsp">삭제</a> 이거 제거함. -->
				    	<td><span>관리자</span>&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${! empty qnaBoardDTO.qnaResponse }"><a href="javascript:edit();" id="editLink">수정</a>&nbsp&nbsp&nbsp&nbsp&nbsp</c:if><p class="mb-0">${qnaBoardDTO.responseDate }</p></td>
				    	<td colspan="4"></td>
				    </tr>
				    <tr>
				    	<td colspan="5"><div class="input-group"><textarea class="form-control" id="editableTextArea" readonly>
${qnaBoardDTO.qnaResponse }
				    	</textarea>
						    	<div class="input-group-append">
						    		<c:if test="${empty qnaBoardDTO.qnaResponse }">
							    		<button class="btn btn-outline-secondary" type="button" id="editButton" style="height: 100%;">댓글 쓰기</button>
							    	</c:if>
						    	</div>
					    	</div>
				    	</td>
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
<!-- 				<button type="submit">저장</button> -->
			</form>	
			</div>
		</section>
		
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script>
    $(document).ready(function() {
        if($('#editableTextArea').val() == '\n\t\t\t\t    \t'){
            $('#editableTextArea').prop('readonly', false);
        }
    	
    	// 수정 링크 클릭 시 이벤트 처리
    	$("#editLink").click(function() {
    	    var isReadonly = $('#editableTextArea').prop('readonly'); // readonly 상태 확인
    	    $('#editableTextArea').prop('readonly', !isReadonly); // readonly 상태 토글
    	    $(this).text(isReadonly ? "저장" : "수정"); // 버튼 텍스트 업데이트

    	    if (!isReadonly) { // 편집 상태이면 저장 작업 수행
    	        $.ajax({
    	            url: 'updateQnaBoard.cs',
    	            type: 'POST',
    	            contentType: 'application/json', // 데이터 타입 명시
    	            data: JSON.stringify({ // 데이터를 JSON 문자열로 변환
    	                'qnaResponse': $('#editableTextArea').val(), // 수정된 내용
    	                'createDate': '${qnaBoardDTO.createDate}',
    	                'createUser': '${qnaBoardDTO.createUser}',
    	                'responseUser': '<%=responseUser%>'
    	            }),
    	            success: function(response) {
    	                alert("저장되었습니다!");
    	                $('#editableTextArea').prop('readonly', true); // 저장 후 readonly 다시 설정
    	                $("#editLink").text("수정"); // 버튼 텍스트 업데이트
    	            },
    	            error: function() {
    	                alert("저장 중 오류가 발생했습니다.");
    	            }
    	        });
    	    }
    	});
    	
	       	// 수정 버튼 클릭 시 이벤트 처리
	    	$("#editButton").click(function() {
    	        $.ajax({
    	            url: 'updateQnaBoard.cs',
    	            type: 'POST',
    	            contentType: 'application/json', // 데이터 타입 명시
    	            data: JSON.stringify({ // 데이터를 JSON 문자열로 변환
    	                'qnaResponse': $('#editableTextArea').val(), // 수정된 내용
    	                'createDate': '${qnaBoardDTO.createDate}',
    	                'createUser': '${qnaBoardDTO.createUser}',
    	                'responseUser': '<%=responseUser%>'
    	            }),
    	            success: function(response) {
    	                alert("저장되었습니다!");
    	                window.location.href = 'cs_qna_content.cs?createUser=${qnaBoardDTO.createUser }&createDate=${qnaBoardDTO.createDate}';
    	            },
    	            error: function() {
    	                alert("저장 중 오류가 발생했습니다.");
    	            }
    	        });
    	    });

    });
    function edit(){
    	
    }
</script>
<%@include file="../_common/commonFooterEnd.jsp"%>