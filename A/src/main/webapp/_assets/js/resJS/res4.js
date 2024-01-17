document.write('<script type="text/javascript" '+ 
						'src="/' + window.location.pathname.split("/")[1] + '/_assets/js/resJS/res4VarFunc.js"></script>');

$(function(){
	$("#refund").on("click", function(){
		$.ajax({
			type: "GET",
			url: "res4Pro.re",
			data: {mid: rsp.merchant_uid},
			dataType: "text"
		})
		.done(function(data){
			if(data == "환불 성공"){
// 				$.ajax({
// 					type: "POST",
// 					url: "res4ProRF.re",
// 					data: {mid: rsp.merchant_uid},
// 					datType: "text"
// 				})
// 				.done(function(data){
					
// 				})
// 				.fail(function(){})
			}
		})
		.fail(function(){})
	});
	
	
	$(".buyerName").text(rsp.buyer_name);
	$(".resIdx").text(rsp.merchant_uid);
	$(".sTime").text(rsp.s_time);
	$(".eTime").text(rsp.eTime);
	$(".sIdx").text(rsp.scr_idx);
	$(".seat").text(rsp.seat);
	$(".date").text(rsp.date);
	$(".cinema").text(rsp.cinema);
	var personType = [];
	if(rsp["p1"] != "0") personType.push("성인 " + rsp["p1"]);
	if(rsp["p2"] != "0") personType.push("청소년 " + rsp["p2"]);
	if(rsp["p3"] != "0") personType.push("경로 " + rsp["p3"]);
	$(".personType").append("<span>" + personType.join(', ') + "</span>")
	$(".poster").attr("src", rsp.poster);
	
})