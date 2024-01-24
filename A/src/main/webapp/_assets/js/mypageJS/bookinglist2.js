/**
 * 
 */
$(function(){
	$('#refundItem').DataTable({
		pagingType: 'full_numbers',
		order: [[0, 'desc']]
	});
	
	$("#tbody").on("click","button",function() {
		debugger;
		 var $row = $(this).closest("tr");
	    // 해당 행 안에 있는 'merchantUid' 셀의 텍스트 내용
	    var mid = $row.find("td:first-child").text();
		if(confirm('정말 취소하시겠습니까?')){
			
			$.ajax({
				type: "POST",
				url: "storeRefund.st",
				data: {mid: mid},
				dataType: "text"
			})
			.done(function(data){
				debugger;
				if(data == "환불 성공"){
					window.location.href="bookinglist2.me";
//	 				$.ajax({
//	 					type: "POST",
//	 					url: "res4ProRF.re",
//	 					data: {mid: rsp.merchant_uid},
//	 					datType: "text"
//	 				})
//	 				.done(function(data){
						
//	 				})
//	 				.fail(function(){})
				}
			})
			.fail(function(){})
			
			
			//window.location.href="";//여기서 res로 가도 되나?
		}else {
			
		}
		
		
	    
	});
	
	$("#radBokd01").on("click",function(){
		window.location.href="bookinglist.me";
	});
	
});//document ready