/**
 * 
 */
$(document).ready(function(){
	var sId = $('#sId').val();
	// qnaCategory 값이 비어 있지 않다면...
    if($('#qnaCategory').val() != '') {
   
    }
    // 'name' 클래스를 가진 모든 요소를 선택
    $('.name').each(function() {
      var fullName = $(this).text(); // 현재 텍스트 가져오기
      if(fullName.length > 1) {
        var maskedName = fullName[0] + '*'.repeat(fullName.length - 1) +"***"; // 마스킹 처리
        $(this).text(maskedName); // 마스킹된 이름으로 업데이트
      }
    });
});
$('#qnaCategory').change(function() {
	var sId = $('#sId').val();
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
                
                if(search.qnaSecret === '0'){
	                newRow.append($('<td></td>').html('<a href="cs_qna_content.cs?createUser=' + encodeURIComponent(search.createUser) + '&createDate=' + encodeURIComponent(search.createDate) + '">' + search.qnaSubject + '</a>'));
                } else if(search.qnaSecret === '1' && !sId.startsWith("admin") && sId != search.createUser){
                	newRow.append($('<td></td>').html('<img alt="lock" src="_assets/img/lock.png" style="width: 20px;height: 20px;">' + "비밀글로 설정되어 있습니다."));
                } else if(search.qnaSecret === '1' || sId.startsWith("admin") || sId === search.createUser){
                	newRow.append($('<td></td>').html('<a href="cs_qna_content.cs?createUser=' + encodeURIComponent(search.createUser) + '&createDate=' + encodeURIComponent(search.createDate) + '">' + '<img alt="lock" src="_assets/img/lock.png" style="width: 20px;height: 20px;">' +search.qnaSubject + '</a>'));
                }
                
                if(!search.responseUser){
                	newRow.append($('<td></td>').text('미답변'));
                } else{
                	newRow.append($('<td></td>').text('답변완료'));
                }
                var fullName = search.createUser;
                var maskedName = fullName.length > 1 ? fullName[0] + '*'.repeat(fullName.length - 1)+'***' : fullName;
                newRow.append($('<td></td>').text(maskedName));

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
	var sId = $('#sId').val();
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
        
        if(search.qnaSecret === '0'){
            newRow.append($('<td></td>').html('<a href="cs_qna_content.cs?createUser=' + encodeURIComponent(search.createUser) + '&createDate=' + encodeURIComponent(search.createDate) + '">' + search.qnaSubject + '</a>'));
        } else if(search.qnaSecret === '1' && !sId.startsWith("admin") && sId != search.createUser){
        	newRow.append($('<td></td>').html('<img alt="lock" src="_assets/img/lock.png" style="width: 20px;height: 20px;">' + "비밀글로 설정되어 있습니다."));
        } else if(search.qnaSecret === '1' || sId.startsWith("admin") || sId === search.createUser){
        	newRow.append($('<td></td>').html('<a href="cs_qna_content.cs?createUser=' + encodeURIComponent(search.createUser) + '&createDate=' + encodeURIComponent(search.createDate) + '">' + '<img alt="lock" src="_assets/img/lock.png" style="width: 20px;height: 20px;">' +search.qnaSubject + '</a>'));
        }
        
        if(!search.responseUser){
        	newRow.append($('<td></td>').text('미답변'));
        } else{
        	newRow.append($('<td></td>').text('답변완료'));
        }
        var fullName = search.createUser;
        var maskedName = fullName.length > 1 ? fullName[0] + '*'.repeat(fullName.length - 1)+'***' : fullName;
        newRow.append($('<td></td>').text(maskedName));

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
