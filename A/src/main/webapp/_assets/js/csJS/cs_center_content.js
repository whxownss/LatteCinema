/**
 * 
 */
$(document).ready(function() {
    // 편집 버튼을 클릭했을 때 실행되는 함수
    $("#editButton").click(function() {
    	 var contentArea = $("#contentArea");
         var titleArea = $("#titleArea");
         var updateUser = $("#updateUser");
         var isEditable = contentArea.attr("contenteditable") == "true";
         
         // 제목과 내용을 편집 가능하게 만들거나, 편집을 중지
         contentArea.attr("contenteditable", !isEditable);
         titleArea.attr("contenteditable", !isEditable);
         $(this).text(isEditable ? "수정" : "저장");

         if (isEditable) {
            // AJAX 요청을 통해 서버에 데이터를 저장
            $.ajax({
                url: 'saveCenterContent.cs',
                type: 'POST',
                data: {
                    'centerSubject': titleArea.text(), // 수정된 제목
                    'centerContent': contentArea.html(), // 수정된 내용
                    'createDate': '${centerBoardDTO.createDate}',
                    'createUser': '${centerBoardDTO.createUser}',
                    'updateUser': updateUser.val()
                },
                success: function(response) {
                    alert("저장되었습니다!");
                },
                error: function() {
                    alert("저장 중 오류가 발생했습니다.");
                }
            });
        }
    });
    $('#deleteButton').click(function(){
        // 사용자에게 확인을 요청합니다.
        if(confirm("정말 삭제하시겠습니까?")) {
            // 사용자가 '확인'을 클릭한 경우, AJAX 요청을 시작합니다.
            $.ajax({
                url: 'deleteCenterContent.cs',
                type: 'POST',
                data: {
                    'createDate': '${centerBoardDTO.createDate}',
                    'createUser': '${centerBoardDTO.createUser}'
                },
                success: function(response) {
                    alert("삭제되었습니다!");
                    //center.cs 로 이동하기.
                    window.location.href = 'cs_center.cs';
                },
                error: function() {
                    alert("삭제 중 오류가 발생했습니다.");
                }
            });
        } else {
            // 사용자가 '취소'를 클릭한 경우, 아무것도 하지 않습니다.
            alert("삭제가 취소되었습니다.");
        }
    });

});
