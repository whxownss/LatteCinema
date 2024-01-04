<%@page import="com.itwillbs.domain.ExqBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.domain.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<%
ArrayList<ExqBoardDTO> exqBoardList = (ArrayList<ExqBoardDTO>)request.getAttribute("exqBoardList");
PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");	
%>			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>자주찾는질문</h2>
					<div>
<!-- 						<a href="#" class="more"> -->
<!-- 							"2023.12.11 기준" -->
<!-- 						</a> -->
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
				<div class="row">
				  <div class="col-2">
				    <select class="form-select" id="exqSelect" name="exqSelect" style="text-align: center;">
				      <option selected class="text-muted" value="">구분 선택</option>
				      <option value="예매">예매</option>
				      <option value="관람권">관람권</option>
				      <option value="멤버십">멤버십</option>
				      <option value="할인혜택">할인혜택</option>
				      <option value="영화관이용">영화관이용</option>
				      <option value="기타">기타</option>
				    </select>
				  </div>
				</div> 		
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
				      <th scope="col">#</th>
				      <th scope="col">구분</th>
				      <th scope="col" colspan="2">질문</th>
				    </tr>
				  </thead>
				  	<tbody id="tbody">
					  	<c:forEach var="exqBoardDTO" items="${exqBoardList }">
					  		<tr class="table-secondary">
						      <td scope="col">${exqBoardDTO.rn }</td>
						      <td scope="col">${exqBoardDTO.exqSelect }</td>
						      <td scope="col" colspan="2"><a data-bs-toggle="collapse" href="#collapseEx${exqBoardDTO.rn }" role="button" aria-expanded="false" aria-controls="collapseEx1">${exqBoardDTO.exqSubject }</a></td>
						    </tr>
						    <tr class="collapse" id="collapseEx${exqBoardDTO.rn }">
						      <td colspan="4">
						      	  <div class="card card-body">
								    ${exqBoardDTO.exqContent }
								  </div>
						      </td>
						    </tr>
					  	</c:forEach>
				  </tbody>
				</table>
			</div>
		</section>
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<div class="pagination-container d-flex justify-content-center">
				  <ul class="pagination" id="searchPaging">
					<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
					    <li class="page-item ">
					      <a class="page-link text-secondary" href="cs_exque.cs?pageNum=${pageDTO.startPage - pageDTO.pageBlock }" tabindex="-1" aria-disabled="true">이전</a>
					    </li>
				    </c:if>	
				    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					    <li class="page-item" aria-current="page">
					      <a class="page-link text-secondary" href="cs_exque.cs?pageNum=${i }">${i }</a>
					    </li>
				    </c:forEach>
		    		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
					    <li class="page-item">
					      <a class="page-link text-secondary" href="cs_exque.cs?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">다음</a>
					    </li>
				    </c:if>	
				  </ul>
				</div>
			</div>
		</section>	
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script src="./jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#exqSelect').on('change',function(){
		//alert("이벤트연결");
		$.ajax({
	 	    url: 'cs_exq_search.cs',  // 서버의 URL을 입력
	 	    type: 'GET',  // 요청 유형을 'GET'으로 설정
	 	    data: {'exqSelect': $('#exqSelect').val()},
	 	    success: function(response) {
	 	    	if($('#exqSelect').val() == ''){
	 	    		window.location.href = 'cs_exque.cs';
	 	    		return;
	 	    	}
		// 'response' 객체에서 'qnaBoardList'와 'pageDTO' 데이터 추출
		        var exqBoardList = response.exqBoardList;
		        var pageDTO = response.pageDTO;
				var exqSelects = exqBoardList.map(function(item) {
				    return item.exqSelect;
				});
				$('#tbody').empty();
				exqBoardList.forEach(function(search) {
	                // 새로운 행(<tr>)을 생성하고 각 칼럼(<td>)에 데이터 추가
	                var newRow1 = $('<tr class="table-secondary"></tr>');
	                newRow1.append($('<td></td>').text(search.rn));  
	                newRow1.append($('<td></td>').text(search.exqSelect));  
	                var htmlString = '<td scope="col" colspan="2">' +
	                 '<a data-bs-toggle="collapse" href="#collapseEx' + search.rn + 
	                 '" role="button" aria-expanded="false" aria-controls="collapseEx1">' +
	                 search.exqSubject +
	                 '</a></td>';
					// 문자열을 jQuery 객체로 변환
					var newTd = $(htmlString);
					// newRow에 새로운 TD 요소를 추가
					newRow1.append(newTd);
	                
					// HTML 내용을 문자열로 생성
					var trHtml = '<tr class="collapse" id="collapseEx' + search.rn + '">' +
					             '<td colspan="4">' +
					             '<div class="card card-body">' +
					             search.exqContent +
					             '</div>' +
					             '</td>' +
					             '</tr>';
					// 문자열을 jQuery 객체로 변환
					var newRow2 = $(trHtml);
					// 원하는 위치에 새로운 TR 요소를 추가
					$('#tbody').append(newRow1);
	                // 완성된 행을 tbody에 추가
	                $('#tbody').append(newRow2);
	            });
				$('#searchPaging').empty();  // 페이지네이션 영역 비우기
				    // '이전' 버튼
				    if(pageDTO.startPage > pageDTO.pageBlock) {
				        $('#searchPaging').append(
				            '<li class="page-item ">' +
				            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage - pageDTO.pageBlock) + ', \'' + $('#exqSelect').val() + '\'); return false;">' + '이전' + '</a>' +
				            '</li>'
				        );
				    }
				    // 페이지 번호 버튼
				    for(var i = pageDTO.startPage; i <= pageDTO.endPage; i++) {
				        $('#searchPaging').append(
				            '<li class="page-item" aria-current="page">' +
				            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + i + ', \'' + $('#exqSelect').val() + '\'); return false;">' + i + '</a>' +
				            '</li>'
				        );
				    }
				    // '다음' 버튼
				    if(pageDTO.endPage < pageDTO.pageCount) {
				        $('#searchPaging').append(
				            '<li class="page-item">' +
				            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage + pageDTO.pageBlock) + ', \'' + $('#exqSelect').val() + '\'); return false;">' + '다음' + '</a>' +
				            '</li>'
				        );
				    }
	  	    },
	 	    error: function() {
	 	        alert("요청 중 오류가 발생했습니다.");
	 	    }
	 	});//ajax 끝
	});//"exqSelect" onChange
	
});//document ready
function searchPageNm(pageNum,exqSelect){
	// AJAX 요청을 통해 서버로부터 새로운 페이징 데이터를 가져옴
	debugger;
	 $.ajax({
	     url: 'cs_exq_search.cs',
	     type: 'GET',
	     data: {
	         pageNum: pageNum
	        ,exqSelect: exqSelect
	     },
	     success: function(response) {
	         // 서버로부터 받은 새로운 페이징 데이터로 '#searchPaging' 업데이트
	         // response는 새로운 페이징 데이터를 포함하고 있어야 함
	         updatePagination(response);
	     },
	     error: function(xhr, status, error) {
	         console.error("An error occurred: " + status + "\nError: " + error);
	         // 사용자에게 오류 알림
	         alert("문제가 발생했습니다. 관리자에게 문의하세요.");
	     }
	 });
}//searchPageNm
function updatePagination(response){
// 	debugger;
	var exqBoardList = response.exqBoardList;
    var pageDTO = response.pageDTO;
	var exqSelects = exqBoardList.map(function(item) {
	    return item.exqSelect;
	});
	$('#tbody').empty();
	exqBoardList.forEach(function(search) {
        // 새로운 행(<tr>)을 생성하고 각 칼럼(<td>)에 데이터 추가
        var newRow1 = $('<tr class="table-secondary"></tr>');
        newRow1.append($('<td></td>').text(search.rn));  
        newRow1.append($('<td></td>').text(search.exqSelect));  
        var htmlString = '<td scope="col" colspan="2">' +
         '<a data-bs-toggle="collapse" href="#collapseEx' + search.rn + 
         '" role="button" aria-expanded="false" aria-controls="collapseEx1">' +
         search.exqSubject +
         '</a></td>';
		// 문자열을 jQuery 객체로 변환
		var newTd = $(htmlString);
		// newRow에 새로운 TD 요소를 추가
		newRow1.append(newTd);
        
		// HTML 내용을 문자열로 생성
		var trHtml = '<tr class="collapse" id="collapseEx' + search.rn + '">' +
		             '<td colspan="4">' +
		             '<div class="card card-body">' +
		             search.exqContent +
		             '</div>' +
		             '</td>' +
		             '</tr>';
		// 문자열을 jQuery 객체로 변환
		var newRow2 = $(trHtml);
		// 원하는 위치에 새로운 TR 요소를 추가
		$('#tbody').append(newRow1);
        // 완성된 행을 tbody에 추가
        $('#tbody').append(newRow2);
    });
	$('#searchPaging').empty();  // 페이지네이션 영역 비우기
	    // '이전' 버튼
	    if(pageDTO.startPage > pageDTO.pageBlock) {
	        $('#searchPaging').append(
	            '<li class="page-item ">' +
	            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage - pageDTO.pageBlock) + ', \'' + $('#exqSelect').val() + '\'); return false;">' + '이전' + '</a>' +
	            '</li>'
	        );
	    }
	    // 페이지 번호 버튼
	    for(var i = pageDTO.startPage; i <= pageDTO.endPage; i++) {
	        $('#searchPaging').append(
	            '<li class="page-item" aria-current="page">' +
	            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + i + ', \'' + $('#exqSelect').val() + '\'); return false;">' + i + '</a>' +
	            '</li>'
	        );
	    }
	    // '다음' 버튼
	    if(pageDTO.endPage < pageDTO.pageCount) {
	        $('#searchPaging').append(
	            '<li class="page-item">' +
	            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage + pageDTO.pageBlock) + ', \'' + $('#exqSelect').val() + '\'); return false;">' + '다음' + '</a>' +
	            '</li>'
	        );
	    }
    
}//updatePagination

</script>
<%@include file="../_common/commonFooterEnd.jsp"%>