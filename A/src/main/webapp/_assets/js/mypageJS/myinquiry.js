/**
 * 
 */
	var cd = '';
	var qnaDtlsYn = '';

	$(function() {
		// 검색 클릭
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
				
			} else {
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

		if(cd == 'INQD03') $('.tab-block a').eq(1).click();
		else if(cd == 'INQD02') $('.tab-block a').eq(2).click();
		else $('.tab-block a').eq(0).click();

// 		MegaboxUtil.Common.bindSelectBox(); // 셀렉트 박스 라이브러리 적용
	});

	// 문의 목록 조회
// 	function fn_selectIrList(cd) {
// 		var currentPage = $('[name=currentPage]').val() ? $('[name=currentPage]').val() : 1;
// 		var inqLclCd = cd || 'INQD01';

// 		var params = {
// 			custInqStatCd: $('#custInqStatCd').val(),
// 			searchTxt: $('#searchTxt').val(),
// 			inqLclCd: inqLclCd
// 		};

// 		var options = {};
// 		options.url = '/on/oh/ohh/MyInq/inqList.do';
// 		options.paramData = params;
// 		options.currentPage = currentPage;

// 		options.successCallBack = function(data) {
// 			var totCount  = Number(data.totCount);
// 			var target = $("div.table-wrap > table.board-list > tbody");

// 			target.find('tr').remove();

// 			$('#totalCnt').text(totCount);

// 			if(data.list.length > 0) {
// 				var tr, td1, td2, td3, td4, td5, td6, a;

// 				target.find('tr').remove();

// 				$.each(data.list, function(i, v) {
// 					var custInqStatNm = '';
// 					// 답변완료(메일+SMS), 답변완료(메일), 답변완료(SMS) ===> 답변완료
// 					if (v.custInqStatCd == "INQST3" || v.custInqStatCd == "INQST4" || v.custInqStatCd == "INQST5") {
// 						custInqStatNm = "답변완료";
// 					} else {
// 						custInqStatNm = v.custInqStatNm;
// 					}

// 					tr = $('<tr>');
// 					a = $('<a>').attr({ 'href': '#', 'class': 'moveBtn', 'data-no': v.custInqSn, 'title': '문의내역 상세보기' }).html(v.custInqTitle);
// 					td1 = $('<td>').text(totCount - (v.rowNum - 1));
// 					td2 = $('<td>').html(v.brchNm ? v.brchNm : '메가박스');
// 					td3 = $('<td>').html(v.inqSclNm);
// 					td4 = $('<td>').attr('class', 'a-l').append(a);
// 					td5 = $('<td>').html(custInqStatNm);
// 					td6 = $('<td>').text(v.fstRegDtStr);

// 					tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
// 					target.append(tr);
// 				});

// 				fn_bindMoveEvent(inqLclCd);
// 			} else {
// 				tr = $('<tr>');
// 				td1 = $('<td>').attr('colspan', 6).text('목록이 없습니다.');

// 				tr.append(td1);
// 				target.append(tr);
// 			}
// 		};

// 		gfn_setPage(options);
// 	}

	// 제목 버튼 이벤트
// 	function fn_bindMoveEvent(cd) {
// 		$('.moveBtn').off();
// 		$('.moveBtn').on('click', function(e) {
// 			e.preventDefault();

// 			var form = MegaboxUtil.Form.createForm();
// 			//form.append('<input type="hidden" name="custInqSn" value="' + $(this).data('no') + '">');
// 			form.append('<input type="hidden" name="custInqStatCd" value="' + $('#custInqStatCd').val() + '">');
// 			form.append('<input type="hidden" name="searchTxt" value="' + $('#searchTxt').val() + '">');
// 			form.append('<input type="hidden" name="currentPage" value="' + $('.pagination .active').text() + '">');
// 			form.append('<input type="hidden" name="cd" value="' + $('.tab-block li.on a').data('cd') + '">');

// 			var custInqSn = $(this).data('no');

// 			form.attr('action', '/mypage/myinquiry/detail?custInqSn='+custInqSn);
// 			form.submit();
// 		});
// 	}
	$('#myQnaStatus').on("change",function(){
		//debugger;
	 $.ajax({
	 	    url: 'myQnaStatus.me',  // 서버의 URL을 입력
	 	    type: 'GET',  // 요청 유형을 'GET'으로 설정
	 	    data: {
	 	    	  //'loIdx': $('#locationSelect').val(),
	 	    	  //'ciIdx': $('#cinemaSelect').val(),
	 	    	  'qnaResponse': $('#myQnaStatus').val(),
	 	    	  //'lostSubject': $('#lostSubject').val()
	 	    },
	 	    success: function(response) {
	 	    	if($('#myQnaStatus').val() ===''){
	 	    		window.location.href = 'myinquiry.me';
	 	    		return;
	 	    	}
				// 'response' 객체에서 'lostBoardList'와 'pageDTO' 데이터 추출
		        var qnaBoardList = response.qnaBoardList;
		        var pageDTO = response.pageDTO;
				$('#tbody').empty();
				//debugger;
				qnaBoardList.forEach(function(search) {
					// 날짜 형식 변경 (예: yyyy-MM-dd)
					console.log('Received createDate:', search.createDate);
	                var formattedDate = formatDate(search.createDate); // 'formatDate'는 날짜 형식을 변경하는 함수
	                var parseAndFormat= parseAndFormatDate(search.createDate);
	                // 새로운 행(<tr>)을 생성하고 각 칼럼(<td>)에 데이터 추가
	                var newRow = $('<tr></tr>');
	                newRow.append($('<td></td>').text(search.rn));  
	                newRow.append($('<td></td>').text(search.qnaCategory));  
	                newRow.append($('<td></td>').html('<a href="cs_qna_content.cs?createUser=' + encodeURIComponent(search.createUser) + '&createDate=' + parseAndFormat + '">' + search.qnaSubject + '</a>'));

	                if(!search.responseUser){
	                	newRow.append($('<td></td>').val('0').text('미답변'));
	                } else {
	                	newRow.append($('<td></td>').val('1').text('답변완료'));
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
				         	'<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage - pageDTO.pageBlock) + ', \'' + $('#userId').val() + '\', \'' + $('#myQnaStatus').val() + '\'); return false;">' + '이전' + '</a>' +
				            '</li>'
				        );
				    }
				    // 페이지 번호 버튼
				    for(var i = pageDTO.startPage; i <= pageDTO.endPage; i++) {
					    $('#searchPaging').append(
				    		'<li class="page-item" aria-current="page">' +
					    	    '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + i + ', \'' + $('#userId').val() + '\', \'' + $('#myQnaStatus').val() + '\'); return false;">' + i + '</a>' +
					    	'</li>'
					    );
					}
				    // '다음' 버튼
				    if(pageDTO.endPage < pageDTO.pageCount) {
				        $('#searchPaging').append(
				            '<li class="page-item">' +
				         	'<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage + pageDTO.pageBlock) + ', \'' + $('#userId').val() + '\', \'' + $('#myQnaStatus').val() + '\'); return false;">' + '다음' + '</a>' +
				            '</li>'
				        );
				    }
	  	    },
	 	    error: function() {
	 	        alert("요청 중 오류가 발생했습니다.");
	 	    }
	 	});
});

    function searchPageNm(pageNum, createUser, qnaResponse){
        // AJAX 요청을 통해 서버로부터 새로운 페이징 데이터를 가져옴
//         debugger;
        $.ajax({
            url: 'myQnaStatus.me',
            type: 'GET',
            data: {
                pageNum: pageNum
               ,createUser: createUser
               ,qnaResponse: qnaResponse
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

	       var qnaBoardList = response.qnaBoardList;
	       var pageDTO = response.pageDTO;
	
	       $('#tbody').empty();
			//debugger;
			qnaBoardList.forEach(function(search) {
				// 날짜 형식 변경 (예: yyyy-MM-dd)
				console.log('Received createDate:', search.createDate);
               var formattedDate = formatDate(search.createDate); // 'formatDate'는 날짜 형식을 변경하는 함수
               var parseAndFormat= parseAndFormatDate(search.createDate);
               // 새로운 행(<tr>)을 생성하고 각 칼럼(<td>)에 데이터 추가
               var newRow = $('<tr></tr>');
               newRow.append($('<td></td>').text(search.rn));  
               newRow.append($('<td></td>').text(search.qnaCategory));  
               newRow.append($('<td></td>').html('<a href="cs_qna_content.cs?createUser=' + encodeURIComponent(search.createUser) + '&createDate=' + parseAndFormat + '">' + search.qnaSubject + '</a>'));

               if(!search.responseUser){
               	newRow.append($('<td></td>').val('0').text('미답변'));
               } else {
               	newRow.append($('<td></td>').val('1').text('답변완료'));
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
			         	'<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage - pageDTO.pageBlock) + ', \'' + $('#userId').val() + '\', \'' + $('#myQnaStatus').val() + '\'); return false;">' + '이전' + '</a>' +
			            '</li>'
			        );
			    }
			    // 페이지 번호 버튼
			    for(var i = pageDTO.startPage; i <= pageDTO.endPage; i++) {
				    $('#searchPaging').append(
			    		'<li class="page-item" aria-current="page">' +
				    	    '<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + i + ', \'' + $('#userId').val() + '\', \'' + $('#myQnaStatus').val() + '\'); return false;">' + i + '</a>' +
				    	'</li>'
				    );
				}
			    // '다음' 버튼
			    if(pageDTO.endPage < pageDTO.pageCount) {
			        $('#searchPaging').append(
			            '<li class="page-item">' +
			         	'<a class="page-link text-secondary" href="#" onclick="searchPageNm(' + (pageDTO.startPage + pageDTO.pageBlock) + ', \'' + $('#userId').val() + '\', \'' + $('#myQnaStatus').val() + '\'); return false;">' + '다음' + '</a>' +
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
