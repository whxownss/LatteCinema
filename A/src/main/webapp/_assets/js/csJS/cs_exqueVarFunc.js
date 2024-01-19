
function searchPageNm(pageNum,exqSelect){
	// AJAX 요청을 통해 서버로부터 새로운 페이징 데이터를 가져옴
	//debugger;
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

