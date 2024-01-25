/**
 * 
 */
    $(document).ready(function() {
		var qnaSecret = $('#qnaSecret').val();
		var sessionId = $('#sessionId').val();
		var fullName = $('#userName').text(); // '김철수'라고 가정
		if(qnaSecret == '1'){
			//debugger;
			if(sessionId != fullName && sessionId != "admin"){
				window.location.href = "login.me";
			}
		}
        // 사용자 이름을 변수로 받음
        
        // 첫 글자를 제외하고 나머지 글자를 '*'로 변환하는 함수
        function anonymizeName(name) {
            if(name.length > 1) {
                // 이름의 첫 글자를 제외한 나머지 길이만큼 '*' 문자를 생성
                var stars = '*'.repeat(name.length - 1);
                // 첫 글자와 생성된 '*' 문자열을 결합
                return name[0] + stars;
            }
            // 이름이 한 글자인 경우 그대로 반환 (또는 다른 로직 적용 가능)
            return name;
        }
        // 이름을 익명화하고 결과를 변수에 저장
        var anonymizedName = anonymizeName(fullName);
        // 익명화된 이름을 HTML 요소에 적용
        $('#userName').text(anonymizedName);
    	
//     	if ($("#editableTextArea").val().trim() === '') {
// 	          $("#editableTextArea").val(''); // 텍스트 영역을 비웁니다.
// 	    }
//         if($('#editableTextArea').val() === ''){
//             $('#editableTextArea').prop('readonly', false);
//         }
    	
//     	// 수정 링크 클릭 시 이벤트 처리
//     	$("#editLink").click(function(e) {
//     	    var isReadonly = $('#editableTextArea').prop('readonly'); // readonly 상태 확인
//     	    $('#editableTextArea').prop('readonly', !isReadonly); // readonly 상태 토글
//     	    $(this).text(isReadonly ? "저장" : "수정"); // 버튼 텍스트 업데이트

//     	    if($("#editableTextArea").val().trim() === '') {
//   	          $("#editableTextArea").val(''); // 텍스트 영역을 비웁니다.
//   	    	}
//     	    if($("#editableTextArea").val() === ''){
// 	    		e.preventDefault();
// 			    alert('답변을 하고 등록해주세요.');
// 	   	    } else {
//    	    	    if (!isReadonly) { // 편집 상태이면 저장 작업 수행
// 	    	        $.ajax({
// 	    	            url: 'updateQnaBoard.cs',
// 	    	            type: 'POST',
// 	    	            contentType: 'application/json', // 데이터 타입 명시
// 	    	            data: JSON.stringify({ // 데이터를 JSON 문자열로 변환
// 	    	                'qnaResponse': $('#editableTextArea').val(), // 수정된 내용
// 	    	                'createDate': '${qnaBoardDTO.createDate}',
// 	    	                'createUser': '${qnaBoardDTO.createUser}',
// 	    	                'responseUser': '${sessionScope.sId}'
// 	    	            }),
// 	    	            success: function(response) {
// 	    	                alert("저장되었습니다!");
// 	    	                $('#editableTextArea').prop('readonly', true); // 저장 후 readonly 다시 설정
// 	    	                $("#editLink").text("수정"); // 버튼 텍스트 업데이트
// 	    	            },
// 	    	            error: function() {
// 	    	                alert("저장 중 오류가 발생했습니다.");
// 	    	            }
// 	    	        });
// 	    	    }
// 	   	    } 
//     	});
    	
// 	       	// 수정 버튼 클릭 시 이벤트 처리
// 	    	$("#editButton").click(function(e) {
// 	    		if ($("#editableTextArea").val().trim() === '') {
// 	  	          $("#editableTextArea").val(''); // 텍스트 영역을 비웁니다.
// 	  	        }
// 	    		if($("#editableTextArea").val() === ''){
// 		    		e.preventDefault();
// 				    alert('답변을 하고 등록해주세요.');
// 	       	    } else {
// 	       	    	$.ajax({
// 	    	            url: 'updateQnaBoard.cs',
// 	    	            type: 'POST',
// 	    	            contentType: 'application/json', // 데이터 타입 명시
// 	    	            data: JSON.stringify({ // 데이터를 JSON 문자열로 변환
// 	    	                'qnaResponse': $('#editableTextArea').val(), // 수정된 내용
// 	    	                'createDate': '${qnaBoardDTO.createDate}',
// 	    	                'createUser': '${qnaBoardDTO.createUser}',
// 	    	                'responseUser': '${sessionScope.sId}'
// 	    	            }),
// 	    	            success: function(response) {
// 	    	                alert("저장되었습니다!");
// 	    	                window.location.href = 'cs_qna_content.cs?createUser=${qnaBoardDTO.createUser }&createDate=${qnaBoardDTO.createDate}';
// 	    	            },
// 	    	            error: function() {
// 	    	                alert("저장 중 오류가 발생했습니다.");
// 	    	            }
// 	    	        });
// 	       	    }
    	        
//     	    });

    });
    function edit(){
    	
    }
