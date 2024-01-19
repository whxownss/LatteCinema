

var phoneRegex =/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/; // 모든 전화번호 규칙 (연락처)
// // 휴대폰번호 변경 클릭
$('#phoneChgBtn').on('click', function() {
// 	debugger;
	$("#newPhone").attr("readonly", false);
	$("#phoneChange").toggle();
	$("#newPhone").val('');
	$("#CheckPhone").text('');
	var text = "변경취소"
	if($("#phoneChgBtn").text() == text) 
		text = "휴대폰번호 변경";
		
	$("#phoneChgBtn").text(text);

});
	
	
// 인증번호 발송 버튼 클릭
var checkSmsCode;
$('#sendNumberBtn').on('click', function() {
	var target = $('#sendNumberBtn');
 	if(target.prev().val().trim() == '')
 		return $("#CheckPhone").text('변경할 휴대폰 번호를 입력해 주세요.').css("color", "red");

	if (!phoneRegex.test(target.prev().val().trim()))
 		return $("#CheckPhone").text('올바른 휴대폰 번호를 입력해 주세요.').css("color", "red");

	if(target.prev().val().trim() == $('[name=phone]').val().replaceAll('-',''))
		return $("#CheckPhone").text('휴대폰 번호가 동일합니다.').css("color", "red");
	
	var newphone = $("#newPhone").val();
	 $.ajax({
		 type : "post",
		 url : "phoneSms.me",
		 dataType : "text",
		 data : {newPhone : newphone},
		 success:function(data){
			 debugger;
			 alert("sms문자 보내기 성공");
			 checkSmsCode = data;
			 $("#checkSms").css("display", "block");
			 $("#newPhone").attr("readonly", true);
		 },
		 error:function(){
			 alert("sms문자 보내기 실패");
		 }
		 
	 });//ajax
		
});

$("#changePhBtn").on("click",function(){
	debugger;
	if($("#chkNum").val() == checkSmsCode){
		alert('인증번호 일치');
	}else{
		alert('인증번호가 일치하지 않습니다');
		$("#updateBtn").attr("disabled", true);
	}
});




//유효성 체크 후 submit
function checkSubmit() {
	
	var color = $('#moveFrm span');
	
	var flag = 1;
	
	$.each(color, function(i, v){
		if(this.style.color == "red") {
			flag = 0;
			alert("정보수정 양식을 확인해 주세요.")
			return false;
		}
	});
	
	return ((flag == 0) ? false : true);
}	
