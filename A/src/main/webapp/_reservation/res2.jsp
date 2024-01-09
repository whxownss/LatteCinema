<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
	<link rel="stylesheet" href="_assets/css/res_1.css">
<%@include file ="../_common/commonHeaderEnd.jsp" %>

<!-- 인원 선택 Modal1 -->
<div class="modal fade" id="warning" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
<!--       <div class="modal-header"> -->
<!--         <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1> -->
<!--       </div> -->
      <div class="modal-body">
        <div class="text-center mt-5 mb-5 fw-bold">인원을 선택해 주십시오.</div>
      </div>
      <div class="modal-footer ps-0 pe-0 pt-0 pb-0">
        <button type="button" class="btn btn-light w-100 ms-0 me-0 mt-0 mb-0"" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal1 -->
<!-- 좌석 중복 Modal2 -->
<div class="modal fade" id="seatWarning" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
<!--       <div class="modal-header"> -->
<!--         <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1> -->
<!--       </div> -->
      <div class="modal-body">
        <div class="text-center mt-5 mb-5 fw-bold">해당 좌석은 이미 판매가 되었습니다.<br>다른 좌석을 선택하여 주십시오.</div>
      </div>
      <div class="modal-footer ps-0 pe-0 pt-0 pb-0">
        <button type="button" class="btn btn-light w-100 ms-0 me-0 mt-0 mb-0"" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal2 -->

	<main id="main">
			
		<section class="category-section">
			<div class="container" data-aos="fade-up">
				<div class="container text-center">
				<div class="row border border-secondary">
				
					<!-- 젤 바깥 1번 --> 
					<div class="col-1 border border-secondary p-0">
						<ul class="list-group h-100 rounded-0">
							<li class="list-group-item h-100 ps-0 pe-0 done">
								<span class="position-absolute top-50 start-50 translate-middle w-100">01<br>상영시간</span>
							</li>
							<li class="list-group-item h-100 ps-0 pe-0 active">
								<span class="position-absolute top-50 start-50 translate-middle w-100">02<br>인원/좌석</span>
							</li>
							<li class="list-group-item h-100 ps-0 pe-0">
								<span class="position-absolute top-50 start-50 translate-middle w-100">03<br>결제</span>
							</li>
							<li class="list-group-item h-100 ps-0 pe-0">
								<span class="position-absolute top-50 start-50 translate-middle w-100">04<br>결제완료</span>
							</li>
						</ul>
					</div>
					
					<!-- 젤 바깥 2번 -->
					<div class="col">
						<div class="row p-2 bg-black text-white">
							<div class="col-4"></div>
							<div class="col-4 text-center">인원/좌석 선택</div>
							<div class="col-4 text-end"><small>*인원은 최대 8명까지 선택 가능합니다.</small></div>
						</div>
						<div class="d-flex justify-content-between">  
							<div class="p-2 flex-shrink-2 d-flex">
								<div><img src="assets/img/post1.jpg" style="height: 100px"></div>
								<div class="d-flex flex-column p-2 text-start">
									<span>
										<img src="" class="rating">
										<span class="mTitle"></span>
									</span>
									<span>
										<span class="date"></span>
									</span>
									<span>
										<span class="sTime"></span>
										<span class="eTime"></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
										<span class="sIdx"></span>
									</span>
								</div>
							</div>
							<div class="p-2 d-flex align-items-center">
								<ul class="d-flex align-items-center mb-0">
									<li class="d-flex flex-row ms-3">
										<span class="me-1 d-flex align-items-center">성인 </span>
										<div class="count-wrap _count">
										    <button type="button" class="minus d-flex justify-content-center pmBtn">-</button>
										    <span class="inpp align-middle cntPerson" id="pCase1">0</span>
										    <button type="button" class="plus d-flex justify-content-center pmBtn">+</button>
										</div>
									</li>
									<li class="d-flex flex-row ms-3">
										<span class="me-1 d-flex align-items-center">청소년 </span>
										<div class="count-wrap _count">
										    <button type="button" class="minus d-flex justify-content-center pmBtn">-</button>
										    <span class="inpp align-middle cntPerson" id="pCase2">0</span>
										    <button type="button" class="plus d-flex justify-content-center pmBtn">+</button>
										</div>
									</li>
									<li class="d-flex flex-row ms-3">
										<span class="me-1 d-flex align-items-center">경로 </span>
										<div class="count-wrap _count">
										    <button type="button" class="minus d-flex justify-content-center pmBtn">-</button>
										    <span class="inpp align-middle cntPerson" id="pCase3">0</span>
										    <button type="button" class="plus d-flex justify-content-center pmBtn">+</button>
										</div>
									</li>
									<li class="d-flex flex-row ms-3">
										<span class="me-1 d-flex align-items-center">장애인 </span>
										<div class="count-wrap _count">
										    <button type="button" class="minus d-flex justify-content-center pmBtn">-</button>
										    <span class="inpp align-middle cntPerson" id="pCase4">0</span>
										    <button type="button" class="plus d-flex justify-content-center pmBtn">+</button>
										</div>
									</li>
								</ul>
							</div>
						</div>
						
						<div class="row bg-black text-white">
							<div class="drawSeat" style="height:700px">
								<div class="bg-secondary mt-3 mb-5 fs-5">S C R E E N</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col bg-secondary text-white p-4 text-start fs-4">총 합계 <span class="fs-1" id="mPrice">0</span>원</div>
							<div class="col-2 bg-danger text-white p-4 fs-6 mca myMouse goRes3Btn">결제하기</div>
						</div>
					</div>
					
					
				</div>
			</div>
			<div ><a href="res3.re" style="margin-left: 100%;"><button>res3 이동</button></a></div>
			</div>
		</section>
	
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script src="jQuery/jquery-3.6.0.js"></script>
<script>
var schDTO = JSON.parse(localStorage.getItem("schDTO"));
$(function(){
	// SEAT 테이블에 내가 선택한 자리가 구매한 내역에 없으면 SEAT 테이블에서 삭제
	$.ajax({
		type: "POST",
		url: "res2ProRS.re",
		data: {memId: "test1"},
		dataType: "text"
	})
	.done(function(data){
		
	})
	.fail(function(){
		
	})
	
	
	
	
	// 예약된 자리에 대해 선택 못하게 처리  (+ 결제전 선택한 자리)  
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
	.fail(function(){
	})
	
	
	// 좌상단에 영화 정보 나타내기
	$(".rating").attr("src", "_assets/img/grade_" + schDTO.rating + ".png");
	$(".mTitle").text(schDTO.title);
	$(".date").text(schDTO.date);
	$(".sTime").text(schDTO.s_time + " ~ ");
	$(".eTime").text(schDTO.eTime);
	$(".sIdx").text(schDTO.scr_idx);
	
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
			debugger;
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
</script>
<%@include file="../_common/commonFooterEnd.jsp"%>