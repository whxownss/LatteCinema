/**
 * 
 */
$(document).ready(function() {
	$('#qnaSecretChk').change(function(){
        if($(this).is(':checked')){
            $('#qnaSecret').val('1');
        } else {
            $('#qnaSecret').val('0');
        }
    });
	$("#insertForm").on("submit", function (e) { 
// 		alert("qnaSecret: "+$('#qnaSecret').val())
// 		e.preventDefault();
		  if($("#qnaCategory").val() == '카테고리'){
		    e.preventDefault();
		    alert('카테고리를 선택해주세요.')
		  } else if($('#qnaSubject').val() === ''){
			  alert('제목을 입력하세요')
			  e.preventDefault();
		  } else if($('#qnaContent').val() === ''){
			  alert('내용을 입력하세요')
			  e.preventDefault();
		  }
	});
});

