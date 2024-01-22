/**
 * 
 */

$(document).ready(function(){
    // 지역명 불러오기.
    $.ajax({
	    url: 'getRegionList.cs',  // 서버의 URL을 입력
	    type: 'GET',  // 요청 유형을 'GET'으로 설정
	    success: function(response) { //response에 내가 가져온 json값이 있음.
// 	    	debugger;
	        // 서버로부터 응답을 성공적으로 받았을 때 실행될 코드
	        // 예: 받은 데이터를 페이지에 표시
	        var regions = response;
	        regions.forEach(function(region) {
	            // 각 지역에 대한 새로운 <option> 요소를 생성하고 <select>에 추가
	            // 'region' 객체의 구조에 따라 'region.value'와 'region.name'를 적절히 조정
	            $('#locationSelect').append($('<option></option>').val(region.loIdx).text(region.loName));
	        });
	    },
	    error: function() {
	        // 요청 처리 중 오류가 발생했을 때 실행될 코드
	        alert("요청 중 오류가 발생했습니다.");
	    }
	});
    
    // 검색버튼 클릭
    $('#lostSearchBtn').on("click",function(){
   		 $.ajax({
   		 	    url: 'cs_lost_search.cs',  // 서버의 URL을 입력
   		 	    type: 'GET',  // 요청 유형을 'GET'으로 설정
   		 	    data: {
   		 	    	  'loIdx': $('#locationSelect').val(),
   		 	    	  'ciIdx': $('#cinemaSelect').val(),
   		 	    	  'lostStatus': $('#lostStatus').val(),
   		 	    	  'lostSubject': $('#lostSubject').val()
   		 	    },
   		 	    success: function(response) {
   		 	    	if($('#locationSelect').val() ===''&& $('#cinemaSelect').val()===''&& $('#lostStatus').val()===''&& $('#lostSubject').val()===''){
   		 	    		window.location.href = 'cs_lost.cs';
   		 	    		return;
   		 	    	}
   					// 'response' 객체에서 'lostBoardList'와 'pageDTO' 데이터 추출
   			        var lostBoardList = response.lostBoardList;
   			        var pageDTO = response.pageDTO;
// 					debugger;
   					$('#tbody').empty();
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
//    					debugger;
   					    // '이전' 버튼
   					    if(pageDTO.startPage > pageDTO.pageBlock) {
   					        $('#searchPaging').append(
   					            '<li class="page-item disabled">' +
   					         	'<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage - pageDTO.pageBlock) + ', \'' + $('#locationSelect').val() + '\', \'' + $('#cinemaSelect').val() + '\', \'' + $('#lostStatus').val() + '\', \'' + $('#lostSubject').val() + '\'); return false;">' + '이전' + '</a>' +
   					            '</li>'
   					        );
   					    }
   					    // 페이지 번호 버튼
   					    for(var i = pageDTO.startPage; i <= pageDTO.endPage; i++) {
						    $('#searchPaging').append(
// 						        '<li class="page-item" aria-current="page">' +
// 						        '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + i + ', \'' + $('#locationSelect').val() + '\', \'' + $('#cinemaSelect').val() + '\', \'' + $('#lostStatus').val() + '\', \'' + $('#lostSubject').val() + '\'); return false;">' + i + '</a>' +
// 						        '</li>'
					    		'<li class="page-item" aria-current="page">' +
						    	    '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + i + ', \'' + $('#locationSelect').val() + '\', \'' + $('#cinemaSelect').val() + '\', \'' + $('#lostStatus').val() + '\', \'' + $('#lostSubject').val() + '\'); return false;">' + i + '</a>' +
						    	'</li>'
						    );
						}

   					    // '다음' 버튼
   					    if(pageDTO.endPage < pageDTO.pageCount) {
   					        $('#searchPaging').append(
   					            '<li class="page-item">' +
   					         	'<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage + pageDTO.pageBlock) + ', \'' + $('#locationSelect').val() + '\', \'' + $('#cinemaSelect').val() + '\', \'' + $('#lostStatus').val() + '\', \'' + $('#lostSubject').val() + '\'); return false;">' + '다음' + '</a>' +
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

 	
});
    function searchPageNm(pageNum, loIdx, ciIdx, lostStatus, lostSubject){
        // AJAX 요청을 통해 서버로부터 새로운 페이징 데이터를 가져옴
//         debugger;
        $.ajax({
            url: 'cs_lost_search.cs',
            type: 'GET',
            data: {
                pageNum: pageNum
               ,loIdx: loIdx
               ,ciIdx: ciIdx
               ,lostStatus: lostStatus
               ,lostSubject: lostSubject
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
    //
    function updatePagination(response) {
		// 'response' 객체에서 'lostBoardList'와 'pageDTO' 데이터 추출

	       var lostBoardList = response.lostBoardList;
	       var pageDTO = response.pageDTO;
	
		$('#tbody').empty();
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
// 		debugger;
		    // '이전' 버튼
		    if(pageDTO.startPage > pageDTO.pageBlock) {
		        $('#searchPaging').append(
		            '<li class="page-item ">' +
// 		            '<a class="page-link text-secondary" href="cs_lost.cs?pageNum=' + (pageDTO.startPage - pageDTO.pageBlock) + '" tabindex="-1" aria-disabled="true">이전</a>' +
		            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage - pageDTO.pageBlock) + ', \'' + $('#locationSelect').val() + '\', \'' + $('#cinemaSelect').val() + '\', \'' + $('#lostStatus').val() + '\', \'' + $('#lostSubject').val() + '\'); return false;">' + '이전' + '</a>' +
		            '</li>'
		        );
		    }
		    // 페이지 번호 버튼
		    for(var i = pageDTO.startPage; i <= pageDTO.endPage; i++) {
		        $('#searchPaging').append(
// 		            '<li class="page-item" aria-current="page">' +
// 		            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + i + ', \'' + $('#locationSelect').val() + '\'+ ', \'' + $('#cinemaSelect').val() + '\'+ ', \'' + $('#lostStatus').val() + '\'+ ', \'' + $('#lostSubject').val() + '\'); return false;">' + i + '</a>' +
// 		            '</li>'
	        		'<li class="page-item" aria-current="page">' +
		        	    '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + i + ', \'' + $('#locationSelect').val() + '\', \'' + $('#cinemaSelect').val() + '\', \'' + $('#lostStatus').val() + '\', \'' + $('#lostSubject').val() + '\'); return false;">' + i + '</a>' +
		        	'</li>'

		        );
		    }
		    // '다음' 버튼 searchPageNm 이 함수 써서 해결하는게 맞는가? 맞음
		    if(pageDTO.endPage < pageDTO.pageCount) {
		        $('#searchPaging').append(
		            '<li class="page-item">' +
// 		            '<a class="page-link text-secondary" href="cs_lost.cs?pageNum=' + (pageDTO.startPage + pageDTO.pageBlock) + '">다음</a>' +
		            '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage + pageDTO.pageBlock) + ', \'' + $('#locationSelect').val() + '\', \'' + $('#cinemaSelect').val() + '\', \'' + $('#lostStatus').val() + '\', \'' + $('#lostSubject').val() + '\'); return false;">' + '다음' + '</a>' +
		            '</li>'
		        );
		    }
	}

$('#locationSelect').change(function() {
	 $.ajax({
 	    url: 'getCinemaList.cs',  // 서버의 URL을 입력
 	    type: 'GET',  // 요청 유형을 'GET'으로 설정
 	    data: {'loIdx': $('#locationSelect').val()},
 	    success: function(response) {
 	        // 서버로부터 응답을 성공적으로 받았을 때 실행될 코드
 	        // 예: 받은 데이터를 페이지에 표시
 	        var cinemas = response;
 	        $('#cinemaSelect').empty();
 	        $('#cinemaSelect').append($('<option>영화관 선택</option>').val(''));
 	        cinemas.forEach(function(cinema) {
//  	        	debugger;
 	            $('#cinemaSelect').append($('<option></option>').val(cinema.ciIdx).text(cinema.ciName));
 	        });
 	    },
 	    error: function() {
 	        // 요청 처리 중 오류가 발생했을 때 실행될 코드
 	        alert("요청 중 오류가 발생했습니다.");
 	    }
 	});
});

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
