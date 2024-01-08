<%@page import="com.itwillbs.domain.LostBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<%
// String responseUser = "ADMIN2477";
LostBoardDTO lostBoardDTO = (LostBoardDTO)request.getAttribute("lostBoardDTO");
%>
			
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
<!-- 				      <th scope="col">#</th> -->
				      <th scope="col">영화관</th>
				      <th scope="col">제목</th>
				      <th scope="col">접수상태</th>
				      <th scope="col">등록일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
<!-- 				      <th scope="row"></th> -->
				      <td>${lostBoardDTO.ciName }</td>
				      <td>${lostBoardDTO.lostSubject }</td>
				      <td>
				      	<c:if test="${lostBoardDTO.lostStatus eq 0 }">미답변</c:if>
				      	<c:if test="${lostBoardDTO.lostStatus eq 1 }">답변완료</c:if>
				      </td>
				      <td><fmt:formatDate value="${lostBoardDTO.createDate }" pattern="yyyy-MM-dd"/></td>
				    </tr>
				    <tr>
				    	<td colspan="4">
				    		<pre style="text-align: center;">
${lostBoardDTO.lostContent }
				    		</pre>
				   		</td>
				    </tr>
				    <tr>
				    	<td><span style="font-weight:bold;">관리자</span><p class="mb-0"><fmt:formatDate value="${lostBoardDTO.responseDate }" pattern="yyyy-MM-dd HH:mm:ss"/></p></td>
<%-- 				    	<td><span style="font-weight:bold;">관리자</span>&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${! empty lostBoardDTO.lostResponse }"><a href="javascript:edit();" id="editLink">수정</a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="#">삭제</a><p class="mb-0"><fmt:formatDate value="${lostBoardDTO.responseDate }" pattern="yyyy-MM-dd HH:mm:ss"/></p></c:if></td> --%>
				    	<td colspan="3"></td>
				    </tr>
				    <tr>
				    	<td colspan="4"><div class="input-group"><textarea class="form-control" id="editableTextArea" readonly>
${lostBoardDTO.lostResponse }
				    	</textarea>
<!-- 					    	<div class="input-group-append"> -->
<%-- 					    		<c:if test="${empty lostBoardDTO.lostResponse }"> --%>
<!-- 						    		<button class="btn btn-outline-secondary" type="button" id="editButton" style="height: 100%;">댓글 쓰기</button> -->
<%-- 						    	</c:if> --%>
<!-- 					    	</div> -->
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
			</div>
		</section>
		
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script src="./jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
// 	if ($("#editableTextArea").val().trim() === '') {
//         $("#editableTextArea").val(''); // 텍스트 영역을 비웁니다.
//     }
//     if($("#editableTextArea").val() === ''){
//         $('#editableTextArea').prop('readonly', false);
//     } //관리자 답변이 비어있을 때 입력가능하도록
    
//  	// 오류해결을 위한 날짜 형식 맞추기.
// 	var formattedCreateDate = new Date('${lostBoardDTO.createDate}').toLocaleString();
    
// 	// 수정 링크 클릭 시 이벤트 처리
// 	$("#editLink").click(function(e) {
		
// 	    var isReadonly = $('#editableTextArea').prop('readonly'); // readonly 상태 확인
// 	    $('#editableTextArea').prop('readonly', !isReadonly); // readonly 상태 토글
// 	    $(this).text(isReadonly ? "저장" : "수정"); // 버튼 텍스트 업데이트
		
// 	    if ($("#editableTextArea").val().trim() === '') {
// 	        $("#editableTextArea").val(''); // 텍스트 영역을 비웁니다.
// 	    }
// 	    if($("#editableTextArea").val() === ''){
// 		    e.preventDefault();
// 		    alert('답변을 하고 등록해주세요.')
// 		} else {
// 			if (!isReadonly) { // 편집 상태이면 저장 작업 수행
// 		        $.ajax({
// 		            url: 'updateLostBoard.cs',
// 		            type: 'POST',
// 		            contentType: 'application/json', // 데이터 타입 명시
// 		            data: JSON.stringify({ // 데이터를 JSON 문자열로 변환
// 		                'lostResponse': $('#editableTextArea').val(), // 수정된 내용
// 		                'createDate': formattedCreateDate,
// 		                'createUser': '${lostBoardDTO.createUser}',
// 		                'responseUser': '${sessionScope.sId}'
// 		            }),
// 		            success: function(response) {
// 		                alert("저장되었습니다!");
// 		                $('#editableTextArea').prop('readonly', true); // 저장 후 readonly 다시 설정
// 		                $("#editLink").text("수정"); // 버튼 텍스트 업데이트
// 		            },
// 		            error: function() {
// 		                alert("저장 중 오류가 발생했습니다.");
// 		            }
// 		        });
// 	    	}
// 		}
// 	});
// 	$("#editButton").on("click", function (e) { 
// 		  if ($("#editableTextArea").val().trim() === '') {
// 	          $("#editableTextArea").val(''); // 텍스트 영역을 비웁니다.
// 	      }
// 		  if($("#editableTextArea").val() === ''){
// 		    e.preventDefault();
// 		    alert('답변을 하고 등록해주세요.')
// 		  } else {
// 		        $.ajax({
// 		            url: 'updateLostBoard.cs',
// 		            type: 'POST',
// 		            contentType: 'application/json', // 데이터 타입 명시
// 		            data: JSON.stringify({ // 데이터를 JSON 문자열로 변환
// 		                'lostResponse': $('#editableTextArea').val(), // 수정된 내용
// 		                'createDate': formattedCreateDate,
// 		                'createUser': '${lostBoardDTO.createUser}',
// 		                'responseUser': '${sessionScope.sId}'
// 		            }),
// 		            success: function(response) {
// 		                alert("저장되었습니다!");
// 		                window.location.href = 'cs_lost_content.cs?createUser=${lostBoardDTO.createUser }&createDate=${lostBoardDTO.createDate}';
// 		            },
// 		            error: function() {
// 		                alert("저장 중 오류가 발생했습니다.");
// 		            }
// 		        });
// 		  }  
// 	});
   	// 수정 버튼 클릭 시 이벤트 처리
// 	$("#editButton").click(function() {
//         $.ajax({
//             url: 'updateLostBoard.cs',
//             type: 'POST',
//             contentType: 'application/json', // 데이터 타입 명시
//             data: JSON.stringify({ // 데이터를 JSON 문자열로 변환
//                 'lostResponse': $('#editableTextArea').val(), // 수정된 내용
//                 'createDate': formattedCreateDate,
//                 'createUser': '${lostBoardDTO.createUser}',
<%--                 'responseUser': '<%=responseUser%>' --%>
//             }),
//             success: function(response) {
//                 alert("저장되었습니다!");
//                 window.location.href = 'cs_lost_content.cs?createUser=${lostBoardDTO.createUser }&createDate=${lostBoardDTO.createDate}';
//             },
//             error: function() {
//                 alert("저장 중 오류가 발생했습니다.");
//             }
//         });
//     });
	
});
</script>
<%@include file="../_common/commonFooterEnd.jsp"%>