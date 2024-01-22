/**
 * 
 */
$(function(){
	$('#refundTable').DataTable({
		pagingType: 'full_numbers'
	});
	
	$("#tbody").on("click","button",function() {
		 var $row = $(this).closest("tr");
	    // 해당 행 안에 있는 'memId' 셀의 텍스트 내용
	    var mid = $row.find("td:first-child").text();
		if(confirm('정말 취소하시겠습니까?')){
			//window.location.href="";//여기서 res로 가도 되나?
			$.ajax({
					type: "POST",
					url: "res4Pro.re",
					data: {mid: mid},
					dataType: "text"
				})
				.done(function(data){
					debugger;
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
			alert('취소 싫어')
		}
	    
	});
	$("#radBokd02").on("click",function(){
		window.location.href="bookinglist2.me";
	});
	
});//document ready
