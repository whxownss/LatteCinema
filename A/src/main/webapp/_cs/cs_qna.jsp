<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.QnaBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<%
	ArrayList<QnaBoardDTO> qnaBoardList = (ArrayList<QnaBoardDTO>)request.getAttribute("qnaBoardList");
	PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
%>	
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>1:1문의</h2>
					<div>
					<c:if test="${! empty sessionScope.sId }">
						<a href="cs_qna_write.cs" class="more " style="font-size: 18px;">
							1:1문의 글쓰기
						</a>
					</c:if>	
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
		
		<section class="category-section" id="" style="padding: 0px;">
			<div class="container" data-aos="fade-up">
				<div class="d-flex justify-content-between">
				  <div class="col-md-2">
					<div class="input-group mb-3">
					  <select class="form-select" id="qnaCategory" name="qnaCategory">
						<option selected class="text-muted" value="">카테고리</option>
						<option value="상영작">상영작</option>
						<option value="예매">예매</option>
						<option value="기타">기타</option>
					  </select>
					</div>
				  </div>
				  <div class="col-md-3">
				    <div class="input-group mb-3">
<!-- 				      <input type="text" class="form-control" placeholder="검색어를 입력해주세요." aria-label="input-search" aria-describedby="button-addon2"> -->
<!-- 				      <button class="btn btn-secondary" type="button" id="button-addon2">검색</button> -->
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
				      <th scope="col">카테고리</th>
				      <th scope="col">제목</th>
				      <th scope="col">글쓴이</th>
				    </tr>
				  </thead>
				  <tbody id="tbody">
				  	<c:forEach var="qnaBoardDTO" items="${qnaBoardList }">
				  	 <tr> 
				  		<th scope="row">${qnaBoardDTO.rn }</th>
				  		<td>${qnaBoardDTO.qnaCategory }</td><!-- 이 글을 클릭 가능하게 하는 것은 운영자와 당사자만 가능하게 하자.  -->
				  		
				  		<c:if test="${qnaBoardDTO.qnaSecret eq 0 }">
				  			<td><a href="cs_qna_content.cs?createUser=${qnaBoardDTO.createUser }&createDate=${qnaBoardDTO.createDate}">${qnaBoardDTO.qnaSubject } </a></td>
				  		</c:if>
				  		<c:if test="${qnaBoardDTO.qnaSecret eq 1 }">
				  			<td><a href="cs_qna_content.cs?createUser=${qnaBoardDTO.createUser }&createDate=${qnaBoardDTO.createDate}"><img alt="lock" src="${pageContext.servletContext.contextPath }/_assets/img/lock.png" style="width: 20px;height: 20px;">비밀글로 설정되어 있습니다. </a></td>
				  		</c:if>
				        <td>${qnaBoardDTO.createUser }</td>
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
					    <li class="page-item disabled">
					      <a class="page-link text-secondary" href="cs_qna.cs?pageNum=${pageDTO.startPage - pageDTO.pageBlock }" tabindex="-1" aria-disabled="true">이전</a>
					    </li>
				    </c:if>
				    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					    <li class="page-item" aria-current="page" id="pageSet">
					      <a class="page-link text-secondary" href="cs_qna.cs?pageNum=${i }">${i }</a>
					    </li>
				    </c:forEach>
		    		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
					    <li class="page-item">
					      <a class="page-link text-secondary" href="cs_qna.cs?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">다음</a>
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
	// qnaCategory 값이 비어 있지 않다면...
    if($('#qnaCategory').val() != '') {
   
    }
});
$('#qnaCategory').change(function() {
	 $.ajax({
 	    url: 'cs_qna.cs',  // 서버의 URL을 입력
 	    type: 'GET',  // 요청 유형을 'GET'으로 설정
 	    data: {'qnaCategory': $('#qnaCategory').val()},
 	    success: function(response) {
 	    	if($('#qnaCategory').val() == ''){
 	    		window.location.href = 'cs_qna.cs';
 	    		return;
 	    	}
	// 'response' 객체에서 'qnaBoardList'와 'pageDTO' 데이터 추출
	        var qnaBoardList = response.qnaBoardList;
	        var pageDTO = response.pageDTO;
// 	        debugger;
			var qnaCategories = qnaBoardList.map(function(item) {
			    return item.qnaCategory;
			});
// 			debugger;
			$('#tbody').empty();
			qnaBoardList.forEach(function(search) {
                // 새로운 행(<tr>)을 생성하고 각 칼럼(<td>)에 데이터 추가
                var newRow = $('<tr></tr>');
                newRow.append($('<td></td>').text(search.rn));  
                newRow.append($('<td></td>').text(search.qnaCategory));  
                newRow.append($('<td></td>').html('<a href="cs_qna_content.cs?createUser=' + encodeURIComponent(search.createUser) + '&createDate=' + encodeURIComponent(search.createDate) + '">' + search.qnaSubject + '</a>'));
                newRow.append($('<td></td>').text(search.createUser));

                // 완성된 행을 tbody에 추가
                $('#tbody').append(newRow);
            });
			$('#searchPaging').empty();  // 페이지네이션 영역 비우기
			    // '이전' 버튼
			    if(pageDTO.startPage > pageDTO.pageBlock) {
			        $('#searchPaging').append(
			            '<li class="page-item ">' +
// 			            '<a class="page-link text-secondary" href="cs_qna.cs?pageNum=' + (pageDTO.startPage - pageDTO.pageBlock) + '" tabindex="-1" aria-disabled="true">이전</a>' +
			            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage - pageDTO.pageBlock) + ', \'' + $('#qnaCategory').val() + '\'); return false;">' + '이전' + '</a>' +
			            '</li>'
			        );
			    }
			    // 페이지 번호 버튼
			    for(var i = pageDTO.startPage; i <= pageDTO.endPage; i++) {
			        $('#searchPaging').append(
			            '<li class="page-item" aria-current="page">' +
// 			            '<a class="page-link text-secondary" href="cs_qna.cs?pageNum=' + i + '&qnaCategory=' +encodeURIComponent(qnaCategories) + '">' + i + '</a>' +
// 			            '<a class="page-link text-secondary" href="cs_qna.cs?pageNum=' + i + '&qnaCategory=' + encodeURIComponent($('#qnaCategory').val()) + '">' + i + '</a>' +		
			            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + i + ', \'' + $('#qnaCategory').val() + '\'); return false;">' + i + '</a>' +
			            '</li>'
			        );
			    }
			    // '다음' 버튼
			    if(pageDTO.endPage < pageDTO.pageCount) {
			        $('#searchPaging').append(
			            '<li class="page-item">' +
// 			            '<a class="page-link text-secondary" href="cs_qna.cs?pageNum=' + (pageDTO.startPage + pageDTO.pageBlock) + '">다음</a>' +
			            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage + pageDTO.pageBlock) + ', \'' + $('#qnaCategory').val() + '\'); return false;">' + '다음' + '</a>' +
			            '</li>'
			        );
			    }
  	    },
 	    error: function() {
 	        // 요청 처리 중 오류가 발생했을 때 실행될 코드
 	        alert("요청 중 오류가 발생했습니다.");
 	    }
 	});
});

function searchPageNm(pageNum, qnaCategory){
// 	debugger;
    // AJAX 요청을 통해 서버로부터 새로운 페이징 데이터를 가져옴
    $.ajax({
        url: 'cs_qnaSearch.cs',
        type: 'GET',
        data: {
            pageNum: pageNum,
            qnaCategory: qnaCategory
        },
        success: function(response) {
            // 서버로부터 받은 새로운 페이징 데이터로 '#searchPaging' 업데이트
            // response는 새로운 페이징 데이터를 포함하고 있어야 함
            updatePagination(response);
        }
    });
}

function updatePagination(response) {
// 	debugger;
	// 'response' 객체에서 'qnaBoardList'와 'pageDTO' 데이터 추출
    var qnaBoardList = response.qnaBoardList;
    var pageDTO = response.pageDTO;
//     debugger;
	var qnaCategories = qnaBoardList.map(function(item) {
	    return item.qnaCategory;
	});
//		debugger;
	$('#tbody').empty();
	qnaBoardList.forEach(function(search) {
        // 새로운 행(<tr>)을 생성하고 각 칼럼(<td>)에 데이터 추가
        var newRow = $('<tr></tr>');
        newRow.append($('<td></td>').text(search.rn));  
        newRow.append($('<td></td>').text(search.qnaCategory));  
        newRow.append($('<td></td>').html('<a href="cs_qna_content.cs?createUser=' + encodeURIComponent(search.createUser) + '&createDate=' + encodeURIComponent(search.createDate) + '">' + search.qnaSubject + '</a>'));
        newRow.append($('<td></td>').text(search.createUser));

        // 완성된 행을 tbody에 추가
        $('#tbody').append(newRow);
    });
	$('#searchPaging').empty();  // 페이지네이션 영역 비우기
	    // '이전' 버튼
	    if(pageDTO.startPage > pageDTO.pageBlock) {
	        $('#searchPaging').append(
	            '<li class="page-item ">' +
// 	            '<a class="page-link text-secondary" href="cs_qna.cs?pageNum=' + (pageDTO.startPage - pageDTO.pageBlock) + '" tabindex="-1" aria-disabled="true">이전</a>' +
	            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage - pageDTO.pageBlock) + ', \'' + $('#qnaCategory').val() + '\'); return false;">' + '이전' + '</a>' +
	            '</li>'
	        );
	    }
	    // 페이지 번호 버튼
	    for(var i = pageDTO.startPage; i <= pageDTO.endPage; i++) {
	        $('#searchPaging').append(
	            '<li class="page-item" aria-current="page">' +
//		            '<a class="page-link text-secondary" href="cs_qna.cs?pageNum=' + i + '&qnaCategory=' +encodeURIComponent(qnaCategories) + '">' + i + '</a>' +
//		            '<a class="page-link text-secondary" href="cs_qna.cs?pageNum=' + i + '&qnaCategory=' + encodeURIComponent($('#qnaCategory').val()) + '">' + i + '</a>' +		
	            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + i + ', \'' + $('#qnaCategory').val() + '\'); return false;">' + i + '</a>' +
	            '</li>'
	        );
	    }
	    // '다음' 버튼
	    if(pageDTO.endPage < pageDTO.pageCount) {
	        $('#searchPaging').append(
	            '<li class="page-item">' +
// 	            '<a class="page-link text-secondary" href="cs_qna.cs?pageNum=' + (pageDTO.startPage + pageDTO.pageBlock) + '">다음</a>' +
	            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage + pageDTO.pageBlock) + ', \'' + $('#qnaCategory').val() + '\'); return false;">' + '다음' + '</a>' +
	            '</li>'
	        );
	    }
}


</script>
<%@include file="../_common/commonFooterEnd.jsp"%>