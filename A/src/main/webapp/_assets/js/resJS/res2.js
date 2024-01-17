document.write('<script type="text/javascript" '+ 
						'src="/' + window.location.pathname.split("/")[1] + '/_assets/js/resJS/res2VarFunc.js"></script>');

$(function(){
	// SEAT 테이블에 내가 선택한 자리가 구매한 내역에 없으면 SEAT 테이블에서 삭제
	$.ajax({
		type: "POST",
		url: "res2ProRS.re",
		data: {memId: "test1"},
		dataType: "text"
	})
	.done(function(data){
		// 결제창갔다가 다시 새로 고침할때 문제 해결 (GSON 에러)
		delete schDTO["seat"];
		// 예약된 자리에 대해 선택 못하게 처리  (+ 결제전 선택한 자리)  (원래는 done부분이 아니라 바같부분에 있던거)
		$.ajax({
			type: "GET",
			url: "res2Pro.re",
			data: {schDTO: JSON.stringify(schDTO)},
			dataType: "text" 
		})
		.done(function(data){  // 예매 자리가 없어도 ""가 리턴 되어 done으로 옴
			var paidSeats = data.split("/");
			$.each(paidSeats, (i, v) => {
				$("#seatNum" + v).removeClass("btn-light")
								 .addClass("btn-dark")
								 .addClass("paidSeat")
								 .prop("disabled", true);		
			});
		})
		.fail(function(){})
	})
	.fail(function(){})
	
	// 좌상단에 영화 정보 나타내기
	$(".rating").attr("src", "_assets/img/grade_" + schDTO.rating + ".png");
	$(".mTitle").text(schDTO.title);
	$(".date").text(schDTO.date);
	$(".sTime").text(schDTO.s_time + " ~ ");
	$(".eTime").text(schDTO.eTime);
	$(".sIdx").text(schDTO.scr_idx);
	$(".poster").attr("src", schDTO.poster);
	
	// 좌석 그리기
	var aSeat = parseInt(schDTO.aSeat);
	var col = 10;
	var row = aSeat / col;
	for(var i = 0; i < row; i++){
		var seatRow = String.fromCharCode(65 + i);
		$(".drawSeat").append("<div class='mb-1  d-flex justify-content-between'>"
				               + "<div class='text-end vca' style='width:300px'>" + seatRow + "</div>"
				               + "<div class='" + seatRow + "'>"
							   + "</div>"
							   + "<div style='width:300px'></div>"
							   +"</div>");
		for(var j = 1; j <= col; j++){
			$("." + seatRow).append("<button type='button' id='seatNum" + (seatRow + "" + j) + "' class='btn btn-light seat' style='width:40px'>"
								   +	"<span class='mca'>" + j + "</span>"
								   +"</button> ");
			if(j == col/2) 
				$("." + seatRow).append("<span class='me-5'></span> ");
		}
	}
	
	//수량 옵션
	$('._count :button').on({
	    'click' : function(e){
	    	var p1 = parseInt($("#pCase1").text());
			var p2 = parseInt($("#pCase2").text());
			var p3 = parseInt($("#pCase3").text());
			var p4 = parseInt($("#pCase4").text());
	    	var pSum = p1 + p2 + p3 + p4;
			// 8 넘는 경우 || 0 인거 -버튼 눌렀을때	    	
	    	if(pSum >= 8 && $(this).hasClass('plus') || $(this).hasClass('minus') && $(this).next().text() == "0") return;
	    	
	    	// 인원 변경시 버튼선택과 금액 초기화
	    	$(".seat").not(".paidSeat")
	    			  .removeClass("btn-secondary selectedSeat btn-danger btn-light")
       				  .addClass("btn-light")
	  		  		  .prop("disabled", false);
 			$("#mPrice").text("0");
			
	        e.preventDefault();
	        var count = $(this).parent('._count').find('.inpp').text();
	        var now = parseInt(count);
	        var min = 0;
	        var max = 8;
	        var num = now;
	        if($(this).hasClass('minus')){
	            var type = 'm';
	        }else{
	            var type = 'p';
	        }
	        if(type=='m'){
	            if(now>min){
	                num = now - 1;
	            }
	        }else{
	            if(now<max){
	                num = now + 1;
	            }
	        }
	        if(num != now){
	            $(this).parent('._count').find('.inpp').text(num);
	        }
	    }
	});
	
	// 호버시 마우서 커서 모양 변경
	$(".myMouse").css("cursor","pointer");
	
	
	$(".cntPerson").on("DOMSubtreeModified", function(){
		// 좌석 선택 다 해야 뜨는걸로 - > 했음
// 		var p1 = parseInt($("#pCase1").text());
// 		var p2 = parseInt($("#pCase2").text());
// 		var p3 = parseInt($("#pCase3").text());
// 		var p4 = parseInt($("#pCase4").text());
		
// 		var sum = p1 * 12000 + p2 * 7000 + p3 * 5000 + p4 * 4000;
		
// 		$("#mPrice").text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	});
	
	$(".seat").on("click", function(){
		var p1 = parseInt($("#pCase1").text());
		var p2 = parseInt($("#pCase2").text());
		var p3 = parseInt($("#pCase3").text());
		var p4 = parseInt($("#pCase4").text());
    	var pSum = p1 + p2 + p3 + p4;
		
    	if(pSum == 0) {
    		$("#warning").modal("show");
    		return;
    	}
		
		if($(this).hasClass("selectedSeat")){
			$(this).removeClass("btn-danger");
			$(this).addClass("btn-light");
			$(this).removeClass("selectedSeat");	
		} else {
			$(this).removeClass("btn-light");
			$(this).addClass("btn-danger");
			$(this).addClass("selectedSeat");
		}

		var selectedSeatCNT = $(".selectedSeat").length;
		if(selectedSeatCNT >= pSum){
			$(".seat").not(".paidSeat")
					  .not(".selectedSeat")
					  .removeClass("btn-light")
					  .addClass("btn-secondary")
					  .prop("disabled", true);
			
			// 좌석 선택 다 하면 가격 나옴
			var p1 = parseInt($("#pCase1").text());
			var p2 = parseInt($("#pCase2").text());
			var p3 = parseInt($("#pCase3").text());
			var p4 = parseInt($("#pCase4").text());
			var sum = p1 * 12000 + p2 * 7000 + p3 * 5000 + p4 * 4000;
			
			$("#mPrice").text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		} else{
			$(".seat").not(".paidSeat")
			  		  .not(".selectedSeat")
			  		  .removeClass("btn-secondary")
			  		  .addClass("btn-light")
			  		  .prop("disabled", false);
		}
	});
	
	$(".goRes3Btn").on("click", function(){
		if($("#mPrice").text() == "0") return;

		var p1 = parseInt($("#pCase1").text());
		var p2 = parseInt($("#pCase2").text());
		var p3 = parseInt($("#pCase3").text());
		var selectedSeat = [];
		$(".selectedSeat").each(function(i, e){
			selectedSeat.push($(e).attr('id').replace("seatNum", ""));
	    });
		
		// schDTO에 정보 추가
		schDTO["p1"] = p1;
		schDTO["p2"] = p2;
		schDTO["p3"] = p3;
		schDTO["seat"] = selectedSeat;
		schDTO["seat_c"] = selectedSeat.toString();
		// 동시에 같은 좌석 선택시 처리
		$.ajax({
			type: "GET",
			url: "res2ProCS.re",
			data: {schDTO: JSON.stringify(schDTO)},
			dataType: "text" 
		})
		.done(function(data){
			// 겹치는 자리 없을 시 DB작업 후 페이지 이동
			$.ajax({
				type: "POST",
				url: "res2ProIS.re",
				data: {schDTO: JSON.stringify(schDTO)},
				dataType: "text"
			})
			.done(function(data){
				
				
				localStorage.setItem('schDTO', JSON.stringify(schDTO));
				window.location = "res3.re";
			})
			.fail(function(){
				alert('seat info insert error');
			})
		})
		.fail(function(){
			$("#seatWarning").modal("show");
			// 모달 창 띄우고 다시 자리 선택하게끔
		})
	})
	
	
});