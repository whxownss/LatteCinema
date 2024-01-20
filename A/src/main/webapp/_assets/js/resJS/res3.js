document.write('<script type="text/javascript" '+ 
						'src="/' + window.location.pathname.split("/")[1] + '/_assets/js/resJS/res3VarFunc.js"></script>');

$(function(){
	// schDTO 그리기
	$(".rating").attr("src", "_assets/img/grade_" + schDTO.rating + ".png");
	$(".title").text(schDTO.title);
	$(".date").text(schDTO.date);
	$(".sTime").text(schDTO.s_time);
	$(".eTime").text(schDTO.eTime);
	$(".scrIdx").text(schDTO.scr_idx);
	$(".seat").text(schDTO.seat.join(', '));
	$(".date").text(schDTO.date);
	$(".cinema").text(schDTO.cinema);
	var personType = [];
	if(schDTO["p1"] != "0") personType.push("성인 " + schDTO["p1"]);
	if(schDTO["p2"] != "0") personType.push("청소년 " + schDTO["p2"]);
	if(schDTO["p3"] != "0") personType.push("경로 " + schDTO["p3"]);
	$(".personType").append("<span>" + personType.join(', ') + "</span>")
	$(".p1").text(schDTO["p1"]);
	$(".p2").text(schDTO["p2"]);
	$(".p3").text(schDTO["p3"]);
	$("#pTP1").text(schDTO["p1"] * 15000);
	$("#pTP2").text(schDTO["p2"] * 12000);
	$("#pTP3").text(schDTO["p3"] * 9000);
	$(".poster").attr("src", schDTO.poster);
	
	
	// 할인받기전 금액 합
	var sumP = parseInt($("#pTP1").text()) + parseInt($("#pTP2").text()) + parseInt($("#pTP3").text());
	$("#sumPrice").text(sumP.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

	// 처음에 총 금액
	$("#salePrice").text(0);
	$("#rsPrice").text($("#sumPrice").text());
	$("#accPoint").text( (parseInt($("#rsPrice").text().replace(/[^\d]+/g, "")) * 0.1).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") );
	
	// 호버시 마우서 커서 모양 변경
	$(".myMouse").css({
		"cursor": "pointer"
	});
	
	
	$("#inputPoint").on("keydown", function(e){
		var iPoint = parseInt($("#inputPoint").val().replace(/[^\d]+/g, ""));
		var nPoint = parseInt($("#nowPoint").text().replace(/[^\d]+/g, ""));
		// 				e.key == 'Enter' 일단보류
		if(e.key == 'Delete'     ||
		   e.key == 'ArrowLeft'  ||
		   e.key == 'Backspace'  || 
		   e.key == 'ArrowRight' ||
		   e.key >= 0 && e.key <= 9) {
			return true;
		}
		return false;
	});
	$("#inputPoint").on("change", function(e){
		var tmp = $("#inputPoint").val();
		var result = tmp.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#inputPoint").val(result);
		
		iTmp = parseInt(tmp.replace(/[^\d]+/g, ""));
		var nTmp = parseInt($("#nowPoint").text().replace(/[^\d]+/g, ""));

		$("#resultPoint").text("포인트를 다시 입력해주세요.");
		
		if(isNaN(iTmp)) iTmp = 0;
		
		// 굿
		if(!(iTmp <= nTmp)) return;
		var rs = (nTmp - iTmp).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#resultPoint").text(rs);
		
		$("#salePrice").text(iTmp);
		
		// 총금액 합
		var sP = sumP - iTmp; 
		$("#rsPrice").text(sP.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("#accPoint").text( (parseInt($("#rsPrice").text().replace(/[^\d]+/g, "")) * 0.1).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") );
		
		// 결제 금액보다 포인트를 많이 쓴 경우
		if(! $("#rsPrice").text().startsWith("-")) return;
		$("#salePrice").text("0");
		$("#rsPrice").text($("#sumPrice").text());
		$("#accPoint").text( (parseInt($("#rsPrice").text().replace(/[^\d]+/g, "")) * 0.1).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") );
		$("#resultPoint").text("상품 금액보다 적게 입력해주세요.");
	});
	$("#inputPoint").on("focus", function(){
		$("#inputPoint").val($("#inputPoint").val().replace(/[^\d]+/g, ""));
	});
});