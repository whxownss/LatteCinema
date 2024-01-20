// 연락처 정규식 체크
function checkPhone() {
	var phone = $("#phone").val();
	var text = "** 연락처 입력 필수! **"
	var color = "red";
	var phoneRegex = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	if(phone != ""){
		text = "** 알맞은 연락처 형식으로 입력! ' - ' 생략가능!! **";
		
		if(phoneRegex.test(phone)){
			text = "** 알맞은 연락처 형식! ** ";
			color = "green";
		}
	}
	
	$("#checkPhone").text(text).css("color",color);
	var checkPhone = document.getElementById('checkPhone');
	if(checkPhone.style.color == 'red') return;   

		// 연락처 유무 체크
		$.ajax({
			type : "post",
			data : {memPhone : phone}, //입력한 값 변수에 담기
			url : "checkphone.st", 
			dataType: "text",
			success:function(data){
				if(data == '1'){
					$("#checkPhone").text("선물가능한 번호입니다.").css("color", "green");
					return false;
				}else if(data == '0'){
					$("#checkPhone").text("선물할수없는 번호입니다.").css("color", "red");
					return true;
				 }		
			},
			error: function(){
			}
		});
		
	}
	
//결제 API 

// 가맹점 식별코드
var IMP = window.IMP;

// 포트원 api
  function requestPay(sId, param) {
	
	if(sId == null || sId == ''){
		location.href="login.me";
	}
	
	// 선물하기 모달창 전화번호 없이 결제불가
	var checkPhone = document.getElementById('checkPhone');
	if(param == 'gift' && (checkPhone.style.color == 'red' || $("#checkPhone").text() == '')){
		alert('휴대폰 번호를 확인해주세요.');
		return;
	}
	
	//주문번호 만들기
	const make_merchant_uid = () => {
        const current_time = new Date();
        const year = current_time.getFullYear().toString();
        const month = (current_time.getMonth()+1).toString();
        const day = current_time.getDate().toString();
        const hour = current_time.getHours().toString();
        const minute = current_time.getMinutes().toString();
        const second = current_time.getSeconds().toString();
        const merchant_uid = hour + minute + second;
        return merchant_uid;
    };
    const merchant_uid = make_merchant_uid()
	
	var itemName = $("#itemName").text();
	var price = parseInt($("#sPrice").text().replace(",", "")); 
	
	// 결제 및 정보
	IMP.init("imp20121707"); 
      IMP.request_pay({ 
          pg: "html5_inicis.INIpayTest",	// PG사
          pay_method: "card",	// 지불수단
          merchant_uid: "STO" + merchant_uid,   // 주문번호
          name: itemName,	// 상품명
          amount: 100,    // 가격		price
          buyer_email: "duqdlduq2@naver.com",	// 구매자 이메일
          buyer_name: "김성엽",	// 구매자 이름
          buyer_tel: "010-5125-1365",	// 구매자 연락처
      }, function (rsp) { // callback
    	  console.log(rsp);
    	  if (rsp.success) {	// 결제성공
    		  rsp["mem_id"] = 'asd';   
    	  	  rsp["item_cnt"] = $(".inpp").text();
    	  	  
    	  	  if(param == 'gift'){
    	  		rsp["gift_tel"] = $("#phone").val();		// 전화번호 확인
    	  		var msg = ($("#msg").val() == '') ? $('#msg').attr('placeholder') : $("#msg").val();
    	  		rsp["gift_msg"] = msg;		// 메시지 확인
    	  	  }
    		  
    		  $.ajax({
    			  type: "POST",
    			  data: {rsp : JSON.stringify(rsp)},
    			  url: "storeListPro.st",
    			  dataType: "text"
    		  })
    		  .done(function(data){
    			  
    			  if(data == "true"){
    				  alert("결제가 완료되었습니다.")
    				  $('#checkPhone').text('');
    				  $('#phone').val('');
            		  $('#msg').val('');
    				  $("#exampleModal").modal('hide');
    			  }
    		  })
    		  .fail(function(){})    		  
      	 }
	});
}