/**
 * 
 */
$(function(){
	$('#refundTable').DataTable({
		pagingType: 'full_numbers',
		order: [[0, 'desc']]
	});
	
	$("#tbody").on("click","button",function() {
		 var $row = $(this).closest("tr");
	    // 해당 행 안에 있는 'memId' 셀의 텍스트 내용
	    var mid = $row.find("td:first-child").text();
//		/*임시작업*/
//		var dateTimeString = $row.find("td:eq(6)").text().split('~')[0].trim();
//		// 형식이 "yy-mm-dd hh:mm"라고 가정
//		var dateTimeParts = dateTimeString.split(/[- :]/);
//		// JavaScript 호환성을 위해 "yyyy-mm-ddThh:mm" 형식으로 변환
//		var formattedDateTime = `20${dateTimeParts[0]}-${dateTimeParts[1]}-${dateTimeParts[2]}T${dateTimeParts[3]}:${dateTimeParts[4]}`;
//		var tableDate = new Date(formattedDateTime);
//		var currentDate = new Date();
//		if (tableDate < currentDate) {
//		    // 테이블의 날짜가 과거입니다.
//		    alert('환불할 수 없습니다.')
//		    return;
//		} 
//		/*임시작업끝*/		
		if(confirm('정말 취소하시겠습니까?')){
			//window.location.href="";//여기서 res로 가도 되나?
			$.ajax({
					type: "POST",
					url: "res4Pro.re",
					data: {mid: mid},
					dataType: "text"
				})
				.done(function(data){
					//debugger;
					alert(data);
					if(data == "환불 성공"){
						window.location.href="bookinglist.me";
//		 				$.ajax({
//		 					type: "POST",
//		 					url: "res4ProRF.re",
//		 					data: {mid: rsp.merchant_uid},
//		 					datType: "text"
//		 				})
//		 				.done(function(data){
							
//		 				})
//		 				.fail(function(){})
					}
				})
				.fail(function(){})
		}else {
			alert('환불 취소')
		}
	    
	});
	$("#radBokd02").on("click",function(){
		window.location.href="bookinglist2.me";
	});
	
});//document ready
