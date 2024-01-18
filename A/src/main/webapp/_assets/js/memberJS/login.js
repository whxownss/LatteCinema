document.write('<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>');
document.write('<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>');
document.write('<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>');
document.write('<script type="text/javascript" '+ 
					'src="/' + window.location.pathname.split("/")[1] + '/_assets/js/memberJS/loginVarFunc.js"></script>');

$(function(){
	//주소 api
	$("#find_button").on('click', function() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	            
	        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            var fullAddr= '';
	            var extraAddr='';
	            
	            if(data.userSelectoredType === 'R'){
	            	fullAddr = data.roadAddress;
	            } else{
	            	fullAddr = data.jibunAddress;
	            }
	            
	            // extraAddr 
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }	                    
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraAddr !== ''){
	                extraAddr = ' (' + extraAddr + ')';
	            }		            
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullAddr !== ''){
	                fullAddr += extraAddr;
	            }                    
	            
	            $("#postcode").val(data.zonecode); 
	            $("#address1").val(fullAddr);
	            $("#address2").focus();
	            
	        }
	    }).open();
	});
	
	//로그인 
	$("#login").submit(function() {
	if($("#id").val() == ""){
		if(!$("#idCheck").length){
			$("#pwdCheck").remove();
			$("#formCheck").append("<span id='idCheck'>아이디를 입력하세요.</span>");
			$("#idCheck").css("color", "red");
		}
		return false;	
	}
	
	if ($("#pwd").val() == "") {
		if(!$("#pwdCheck").length){
			$("#idCheck").remove();
			$("#formCheck").append("<span id='pwdCheck'>비밀번호를 입력하세오.</span>");
			$("#pwdCheck").css("color","red");
		}
		return false;
	}
	
	return true;
	})
});