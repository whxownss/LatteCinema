<%@page import="com.itwillbs.domain.RecommendDTO"%>
<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.CenterBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<%
	ArrayList<RecommendDTO> recommendList = (ArrayList<RecommendDTO>)request.getAttribute("recommendList");
	PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
%>			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>옛날영화 추천게시판</h2>
					<div>
						<c:if test="${!empty sessionScope.sId }">
						<a href="cs_recoSubscribe.cs" class="more" style="font-size: 17px;">
							옛날영화 신청
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

		<!-- 진행상태, 신청영화, 감독, 신청자, 신청일, 추천수, 추천하기버튼, 수정버튼  -->
		<input type="hidden" name="recoUser" id="recoUser" value="${sessionScope.sId }">
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
			<div class="row">
				  <div class="col-md-3">
				  </div>
				  <div class="col-md-2">
				    <div class="input-group mb-3">
				    </div>
				  </div>
				  <div class="col-md-2">
				    <div class="input-group mb-3">
				    </div>
				  </div>
				  <div class="col-md-2">
				    <div class="input-group mb-3">
				    </div>
				  </div>
				  <div class="col-md-3">
				    <div class="input-group mb-3">
				      <input type="text" class="form-control" placeholder="검색어를 입력해주세요." id="recoSearch" name="recoSearch" aria-label="input-search" aria-describedby="button-addon2">
				      <button class="btn btn-outline-secondary" type="button" id="recoSearchBtn">검색</button>
				    </div>
				  </div>
				</div>
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
				      <th scope="col">#</th>
				      <th scope="col">진행상태</th>
				      <th scope="col">신청영화</th>
				      <th scope="col">감독</th>
				      <th scope="col">신청자</th>
				      <th scope="col">신청일</th>
				      <th scope="col">추천수</th>
				      <th scope="col">추천하기</th>
				      <th scope="col">삭제하기</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach var="recommendDTO" items="${recommendList }">
				  
				  	<tr>
				  		<td>${recommendDTO.recommendIdx }</td>
				  		<td>진행중</td>
				  		<td>${recommendDTO.movieName }</td>
				  		<td>${recommendDTO.director }</td>
				  		<td>${recommendDTO.createUser }</td>
				  		<td>${recommendDTO.createDate }</td>
				  		<td>${recommendDTO.countReco }</td>
				  		<c:if test="${empty sessionScope.sId }">
				  			<td><button type="button" class="btn btn-dark" id="recoBtn" disabled>추천</button></td>
				  			<td><button type="button" class="btn btn-secondary" disabled>수정</button></td>
				  		</c:if>
				  		<c:if test="${!empty sessionScope.sId }">
				  			<td><button type="button" class="btn btn-dark" id="recoBtn${recommendDTO.recommendIdx }">추천</button></td>
				  			<td><button type="button" class="btn btn-secondary">삭제</button></td>
				  		</c:if>
				  	</tr>
				  </c:forEach>
<%-- 				  <c:forEach var="centerBoardDTO" items="${centerBoardList }"> --%>
<!-- 				  	<tr> -->
<%-- 				      <th scope="row">${centerBoardDTO.rn }</th> --%>
<%-- 				      <td>${centerBoardDTO.ciName }</td> --%>
<%-- 				      <td><a href="cs_center_content.cs?createUser=${centerBoardDTO.createUser }&createDate=${centerBoardDTO.createDate}">${centerBoardDTO.centerSubject }</a></td> --%>
<%-- 				      <td><fmt:formatDate value="${centerBoardDTO.createDate }" pattern="yyyy-MM-dd"/></td> --%>
<!-- 				    </tr> -->
<%-- 				  </c:forEach> --%>
				  </tbody>
				</table>
			</div>
		</section>
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<div class="pagination-container d-flex justify-content-center">
				  <ul class="pagination">
					<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
					    <li class="page-item disabled">
					      <a class="page-link text-secondary" href="cs_recommend.cs?pageNum=${pageDTO.startPage - pageDTO.pageBlock }" tabindex="-1" aria-disabled="true">이전</a>
					    </li>
				    </c:if>	
				    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					    <li class="page-item" aria-current="page">
					      <a class="page-link text-secondary" href="cs_recommend.cs?pageNum=${i }">${i }</a>
					    </li>
				    </c:forEach>
		    		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
					    <li class="page-item">
					      <a class="page-link text-secondary" href="cs_recommend.cs?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">다음</a>
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
	
});
$('.btn').on("click",function(){
	// 클릭된 버튼의 ID 가져오기
    var buttonId = $(this).attr('id');
	var buttonText = $(this).text();
    console.log('클릭된 버튼의 ID: ' + buttonId);
    console.log('클릭된 버튼의 텍스트' + buttonText);
    var searchName = $('#recoSearch').val();
    var recoUser = [];
	recoUser.push($('#recoUser').val()); // 문자열 값을 배열에 추가
    
        // 'this'는 클릭된 버튼을 가리킵니다.
        // closest() 함수를 사용하여 가장 가까운 <tr> 요소를 찾습니다.
        var row = $(this).closest('tr');
        // find() 함수와 선택자를 사용하여 해당 행에서 createUser의 값을 찾습니다.
        var createUser = row.find('td:nth-child(5)').text(); // 'createUser' 값이 5번째 열에 있다고 가정
        console.log('선택한 행의 createUser: ' + createUser);
        var recommendIdx = row.find('td:nth-child(1)').text();
        console.log('선택한 행의 recommendIdx: ' + recommendIdx)
        // find() 함수와 선택자를 사용하여 해당 행에서 추천 수의 값을 찾습니다.
        var countRecoCell = row.find('td:nth-child(7)'); // 'countReco' 값이 7번째 열에 있다고 가정
        var countReco = parseInt(countRecoCell.text());

        if(buttonText === '삭제'){
        	if (  recoUser.includes(createUser)  // 지가 썻거
        	   || recoUser.some(user => user.toLowerCase().startsWith('admin'))) { // 관리자면
        		if(confirm('삭제하시겠습니까?')){
        			window.location.href="deleteRecoData.cs?recommendIdx=" + recommendIdx;        			
        		} 
        		return;
        	} 
        	
        	alert('본인 글이 아닙니다.')
    		return;
        }
        if(buttonText === '검색'){
        	window.location.href="searchReco.cs?movieName=" + searchName;
        	return;
        }
        var recoUser = $('#recoUser').val();
        console.log('선택하는 유저의 아이디: ' + recoUser)
        
        
        
        $.ajax({
            url: 'doRecommend.cs',
            type: 'POST',
            data: { createUser: createUser, 
            		recommendIdx: recommendIdx,
            		recoUser: recoUser
            },
            success: function(response) {
            	
            	var recoSuccess = response.recoSuccess;
            	if(recoSuccess == '1'){
            		// 추천 수 증가
	   			     countReco++;
	   			     countRecoCell.text(countReco);
            	} else {
            		alert('추천불가')
            	}
            	
                // 'response'가 새로운 추천 수를 포함하고 있다고 가정
            },
            error: function() {
                alert('추천 수 업데이트 오류');
            }
        });
});
</script>
<%@include file="../_common/commonFooterEnd.jsp"%>