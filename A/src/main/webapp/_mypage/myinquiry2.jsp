<%@page import="com.itwillbs.domain.LostBoardDTO"%>
<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.QnaBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
  <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
 
</head>
<body>


<jsp:include page="../_common/header.jsp"></jsp:include>
<main id="main">
  <section class="category-section">
    <div class="container has-lnb" data-aos="fade-up">
    <%
    ArrayList<LostBoardDTO> lostBoardList = (ArrayList<LostBoardDTO>)request.getAttribute("lostBoardList");
    PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
    int lostCount = pageDTO.getCount();
    %>
      <!-- 이곳에 코드작성 -->
      <div class="inner-wrap">
        <jsp:include page="lnb.jsp"></jsp:include>
        

		
			<div id="contents">
				<h2 class="tit">나의 문의내역</h2>
			
				<div class="tab-block">
					<ul>
<!-- 						<li data-url="/mypage/myinquiry?cd=INQD01"><a href="myinquiry.me" class="btn" data-cd="INQD01" title="1:1 문의내역 탭으로 이동">1:1 문의내역</a></li> -->
						<li><a href="myinquiry.me" class="btn" title="1:1 문의내역 탭으로 이동">1:1 문의내역</a></li>
<!-- 						<li data-url="/mypage/myinquiry?cd=INQD03"><a href="#" class="btn" data-cd="INQD03" title="단체관람/대관 문의내역 탭으로 이동">단체관람/대관문의내역</a></li> -->
						<li data-url="/mypage/myinquiry?cd=INQD02" class="on"><a href="#" class="btn" data-cd="INQD02" title="분실물 문의내역 탭으로 이동">분실물 문의내역</a></li>
					</ul>
				</div>
			
				<div class="mypage-infomation mt20">
					<ul class="dot-list mb20">
						<li id="tabDesc">고객센터를 통해 남기신 분실물 문의내역을 확인하실 수 있습니다.</li>
						<!-- <li>문의하시기 전 <a href="/support/faq" class="a-link"><strong>자주묻는질문</strong></a>을 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다</li> -->
					</ul>
			
					<div class="btn-group right">
						<a href="#" class="button" id="inqBtn" title="분실물 문의하기">분실물 문의하기</a>
					</div>
				</div>
			
				<div class="board-list-util mb10">
					<p class="result-count">
						<!-- to 개발 : 검색을 안한 경우 -->
						<strong>전체 (<b id="totalCnt"><%=lostCount %></b>건)</strong>
						<input type="hidden" value="${sessionScope.sId }" id="userId">
					</p>
			
					<div class="dropdown bootstrap-select bs3"><select id="myLostStatusSel" class="" tabindex="-98">
						<option value="">전체</option>
						
								<option value="0">미답변</option>
								<option value="1">답변완료</option>
						
					</select>
<!-- 					<button type="button" class="btn dropdown-toggle btn-default bs-placeholder" data-toggle="dropdown" role="button" data-id="custInqStatCd" title="전체"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">전체</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button> -->
					<div class="dropdown-menu open" role="combobox"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1"><ul class="dropdown-menu inner "></ul></div></div></div>
			
<!-- 					<div class="board-search ml07"> -->
<!-- 						<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text" id="searchTxt" value=""> -->
<!-- 						<button type="button" class="btn-search-input" id="searchBtn">검색</button> -->
<!-- 					</div> -->
				</div>
			
				<div class="table-wrap" id="tableWrap"><!-- table-wrap부분이 바뀌어야함. data-url이 바뀔 때 마다.  -->
					<table class="board-list a-c">
						<caption>1:1 문의 내역 표입니다</caption>
						<colgroup>
							<col style="width:80px">
<%-- 							<col style="width:140px;"> --%>
							<col style="width:120px;">
							<col>
							<col style="width:160px;">
							<col style="width:100px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
<!-- 								<th scope="col">영화관</th> -->
								<th scope="col">영화관</th>
								<th scope="col">제목</th>
								<th scope="col">답변상태</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody id="tbody">
<!-- 							<tr><td colspan="6">목록이 없습니다.</td></tr> -->
							<c:forEach var="lostBoardDTO" items="${lostBoardList}">
								<tr>
									<td>${lostBoardDTO.rn }</td>
									<td>${lostBoardDTO.ciName }</td>
									<td><a href="cs_lost_content.cs?createUser=${lostBoardDTO.createUser }&createDate=${lostBoardDTO.createDate}">${lostBoardDTO.lostSubject }</a></td>
									<c:if test="${empty lostBoardDTO.responseUser }">
							        	<td>미답변</td>
							        </c:if>
							        <c:if test="${! empty lostBoardDTO.responseUser }">
							        	<td>답변완료</td>
							        </c:if>
							        <td>${lostBoardDTO.createDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- pagination -->
<!-- 				<nav class="pagination"></nav> -->
				<section class="category-section" id="">
						<div class="container" data-aos="fade-up">
							<div class="pagination-container d-flex justify-content-center">
							  <ul class="pagination" id="searchPaging">
								<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
								    <li class="page-item disabled">
								      <a class="page-link text-secondary" href="myinquiry2.me?pageNum=${pageDTO.startPage - pageDTO.pageBlock }" tabindex="-1" aria-disabled="true">이전</a>
								    </li>
							    </c:if>	
							    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
								    <li class="page-item" aria-current="page">
								      <a class="page-link text-secondary" href="myinquiry2.me?pageNum=${i }">${i }</a>
								    </li>
							    </c:forEach>
					    		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
								    <li class="page-item">
								      <a class="page-link text-secondary" href="myinquiry2.me?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">다음</a>
								    </li>
							    </c:if>
							  </ul>
							</div>
						</div>
					</section>	
				<!--// pagination -->
			</div>
      </div>
    </div>
  </section>
</main>
<%@include file ="../_common/commonFooterStart.jsp" %>
<script src="./jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript">
	var cd = '';
	var qnaDtlsYn = '';

	$(function() {
// 		// 검색 클릭
// 		$('#searchBtn').on('click', function() {
// 			$('[name=currentPage]').val(1);
// 			fn_selectIrList($('.tab-block li.on a').data('cd'));
// 		});

// 		// 검색 엔터키
// 		$('#searchTxt').on('keydown', function(e) {
// 			if(e.keyCode == 13) {
// 				$('[name=currentPage]').val(1);
// 				fn_selectIrList($('.tab-block li.on a').data('cd'));
// 			}
// 		});

		// 탭 클릭
		$('.tab-block a').on('click', function(e) {
// 			e.preventDefault();

			var cd = $(this).data('cd');
			var idx = $(this).parent().index();


			$('.tab-block li.on').removeClass('on');
			$(this).parent().addClass('on');

			if(idx == 0) {
				$('#inqBtn').html('1:1 문의하기');
				$('#tabDesc').html('고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.');
			} else if(idx == 1) {
				$('#inqBtn').html('단체관람/대관 문의하기');
				$('#tabDesc').html('고객센터를 통해 남기신 단체/대관 문의내역을 확인하실 수 있습니다.');
			} else{
				$('#inqBtn').html('분실물 문의하기');
				$('#tabDesc').html('고객센터를 통해 남기신 분실물 문의내역을 확인하실 수 있습니다.');
			}

			// 탭클릭시 검색조건 초기화
			if (qnaDtlsYn == 'Y') {
				qnaDtlsYn = 'N';
				fn_selectIrList(cd);
			} else {
				$('#custInqStatCd').val('').change();
				$('#searchTxt').val('');
				$('[name=currentPage]').val(1);
			}
		});

		// 문의 버튼
		$('#inqBtn').on('click', function(e) {
			e.preventDefault();

			var url = '';
			var btnText = $(this).text();

			if(btnText == '1:1 문의하기') url = 'cs_qna_write.cs';
			else if(btnText == '단체관람/대관 문의하기') url = 'cs_rent.cs';
			else url = 'cs_lost_write.cs';

			location.href = url;
		});

// 		if(cd == 'INQD03') $('.tab-block a').eq(1).click();
// 		else if(cd == 'INQD02') $('.tab-block a').eq(2).click();
// 		else $('.tab-block a').eq(0).click();

// 		MegaboxUtil.Common.bindSelectBox(); // 셀렉트 박스 라이브러리 적용
	});
$('#myLostStatusSel').on("change",function(){
	 $.ajax({
	 	    url: 'myLostStatus.me',  // 서버의 URL을 입력
	 	    type: 'GET',  // 요청 유형을 'GET'으로 설정
	 	    data: {
	 	    	  //'loIdx': $('#locationSelect').val(),
	 	    	  //'ciIdx': $('#cinemaSelect').val(),
	 	    	  'lostStatus': $('#myLostStatusSel').val(),
	 	    	  //'lostSubject': $('#lostSubject').val()
	 	    },
	 	    success: function(response) {
	 	    	if($('#myLostStatusSel').val() ===''){
	 	    		window.location.href = 'myinquiry2.me';
	 	    		return;
	 	    	}
				// 'response' 객체에서 'lostBoardList'와 'pageDTO' 데이터 추출
		        var lostBoardList = response.lostBoardList;
		        var pageDTO = response.pageDTO;
				$('#tbody').empty();
// 				debugger;
				lostBoardList.forEach(function(search) {
					// 날짜 형식 변경 (예: yyyy-MM-dd)
					console.log('Received createDate:', search.createDate);
	                var formattedDate = formatDate(search.createDate); // 'formatDate'는 날짜 형식을 변경하는 함수
	                var parseAndFormat= parseAndFormatDate(search.createDate);
	                // 새로운 행(<tr>)을 생성하고 각 칼럼(<td>)에 데이터 추가
	                var newRow = $('<tr></tr>');
	                newRow.append($('<td></td>').text(search.rn));  
	                newRow.append($('<td></td>').text(search.ciName));  
	                newRow.append($('<td></td>').html('<a href="cs_lost_content.cs?createUser=' + encodeURIComponent(search.createUser) + '&createDate=' + parseAndFormat + '">' + search.lostSubject + '</a>'));

	                if(search.lostStatus === '0'){
	                	newRow.append($('<td></td>').val(search.lostStatus).text('미답변'));
	                } else {
	                	newRow.append($('<td></td>').val(search.lostStatus).text('답변완료'));
	                }
	                newRow.append($('<td></td>').text(formattedDate));
	                
	                // 완성된 행을 tbody에 추가
	                $('#tbody').append(newRow);
	            });
				$('#searchPaging').empty();  // 페이지네이션 영역 비우기
				    // '이전' 버튼
				    if(pageDTO.startPage > pageDTO.pageBlock) {
				        $('#searchPaging').append(
				            '<li class="page-item disabled">' +
				         	'<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage - pageDTO.pageBlock) + ', \'' + $('#userId').val() + '\', \'' + $('#myLostStatusSel').val() + '\'); return false;">' + '이전' + '</a>' +
				            '</li>'
				        );
				    }
				    // 페이지 번호 버튼
				    for(var i = pageDTO.startPage; i <= pageDTO.endPage; i++) {
					    $('#searchPaging').append(
				    		'<li class="page-item" aria-current="page">' +
					    	    '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + i + ', \'' + $('#userId').val() + '\', \'' + $('#myLostStatusSel').val() + '\'); return false;">' + i + '</a>' +
					    	'</li>'
					    );
					}
				    // '다음' 버튼
				    if(pageDTO.endPage < pageDTO.pageCount) {
				        $('#searchPaging').append(
				            '<li class="page-item">' +
				         	'<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage + pageDTO.pageBlock) + ', \'' + $('#userId').val() + '\', \'' + $('#myLostStatusSel').val() + '\'); return false;">' + '다음' + '</a>' +
				            '</li>'
				        );
				    }
	  	    },
	 	    error: function() {
	 	        alert("요청 중 오류가 발생했습니다.");
	 	    }
	 	});
});

    function searchPageNm(pageNum, createUser, lostStatus){
        // AJAX 요청을 통해 서버로부터 새로운 페이징 데이터를 가져옴
//         debugger;
        $.ajax({
            url: 'myLostStatus.me',
            type: 'GET',
            data: {
                pageNum: pageNum
               ,createUser: createUser
               ,lostStatus: lostStatus
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
    }
    function updatePagination(response) {
		// 'response' 객체에서 'lostBoardList'와 'pageDTO' 데이터 추출

	       var lostBoardList = response.lostBoardList;
	       var pageDTO = response.pageDTO;
	
		$('#tbody').empty();
//			debugger;
		lostBoardList.forEach(function(search) {
			// 날짜 형식 변경 (예: yyyy-MM-dd)
			console.log('Received createDate:', search.createDate);
            var formattedDate = formatDate(search.createDate); // 'formatDate'는 날짜 형식을 변경하는 함수
            var parseAndFormat= parseAndFormatDate(search.createDate);
            // 새로운 행(<tr>)을 생성하고 각 칼럼(<td>)에 데이터 추가
            var newRow = $('<tr></tr>');
            newRow.append($('<td></td>').text(search.rn));  
            newRow.append($('<td></td>').text(search.ciName));  
            newRow.append($('<td></td>').html('<a href="cs_lost_content.cs?createUser=' + encodeURIComponent(search.createUser) + '&createDate=' + parseAndFormat + '">' + search.lostSubject + '</a>'));

            if(search.lostStatus === '0'){
            	newRow.append($('<td></td>').val(search.lostStatus).text('미답변'));
            } else {
            	newRow.append($('<td></td>').val(search.lostStatus).text('답변완료'));
            }
            newRow.append($('<td></td>').text(formattedDate));
            
            // 완성된 행을 tbody에 추가
            $('#tbody').append(newRow);
        });
		$('#searchPaging').empty();  // 페이지네이션 영역 비우기
		    // '이전' 버튼
		    if(pageDTO.startPage > pageDTO.pageBlock) {
		        $('#searchPaging').append(
		            '<li class="page-item disabled">' +
		         	'<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage - pageDTO.pageBlock) + ', \'' + $('#userId').val() + '\', \'' + $('#myLostStatusSel').val() + '\'); return false;">' + '이전' + '</a>' +
		            '</li>'
		        );
		    }
		    // 페이지 번호 버튼
		    for(var i = pageDTO.startPage; i <= pageDTO.endPage; i++) {
			    $('#searchPaging').append(
		    		'<li class="page-item" aria-current="page">' +
			    	    '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + i + ', \'' + $('#userId').val() + '\', \'' + $('#myLostStatusSel').val() + '\'); return false;">' + i + '</a>' +
			    	'</li>'
			    );
			}
		    // '다음' 버튼
		    if(pageDTO.endPage < pageDTO.pageCount) {
		        $('#searchPaging').append(
		            '<li class="page-item">' +
		         	'<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage + pageDTO.pageBlock) + ', \'' + $('#userId').val() + '\', \'' + $('#myLostStatusSel').val() + '\'); return false;">' + '다음' + '</a>' +
		            '</li>'
		        );
		    }
	}	
	
		// 날짜 형식을 변경하는 함수
function formatDate(dateString) {
    var date = new Date(dateString);
    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더해줍니다.
    var day = ('0' + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}
function parseAndFormatDate(dateString) {
    // 'Jan 2, 2024, 12:18:27 AM'와 같은 형식을 파싱
    var parts = dateString.match(/(\w+) (\d+), (\d+), (\d+):(\d+):(\d+) (\w+)/);
    
    if (parts) {
        var months = {'Jan': 0, 'Feb': 1, 'Mar': 2, 'Apr': 3, 'May': 4, 'Jun': 5, 'Jul': 6, 'Aug': 7, 'Sep': 8, 'Oct': 9, 'Nov': 10, 'Dec': 11};
        var year = parseInt(parts[3], 10);
        var month = months[parts[1]];
        var day = parseInt(parts[2], 10);
        var hours = parseInt(parts[4], 10);
        var minutes = parseInt(parts[5], 10);
        var seconds = parseInt(parts[6], 10);
        var ampm = parts[7].toLowerCase();

        // 'AM'과 'PM'을 고려하여 시간 조정
        if (ampm === 'pm' && hours < 12) {
            hours += 12;
        }
        if (ampm === 'am' && hours === 12) {
            hours = 0;
        }

        // Date 객체 생성
        var date = new Date(year, month, day, hours, minutes, seconds);
        
        // 원하는 형식으로 날짜 포맷팅 (예: 'YYYY-MM-DD HH:mm:ss')
        return formatDate2(date);
    } else {
        // 파싱할 수 없는 형식이면 원래 문자열 반환 또는 오류 처리
        return dateString;
    }
}
// 주어진 Date 객체를 'YYYY-MM-DD HH:mm:ss' 형식으로 포맷팅하는 함수
function formatDate2(date) {
    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    var hours = ('0' + date.getHours()).slice(-2);
    var minutes = ('0' + date.getMinutes()).slice(-2);
    var seconds = ('0' + date.getSeconds()).slice(-2);

    return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
}
</script>
<%@include file ="../_common/commonFooterEnd.jsp" %>