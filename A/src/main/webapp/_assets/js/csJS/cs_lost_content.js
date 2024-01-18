/**
 *  여기서 수정 안해서 필요는 없는데 내가 만든 거 확인용.
 */
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
//<%--                 'responseUser': '<%=responseUser%>' --%>
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
