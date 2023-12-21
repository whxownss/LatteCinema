<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
	<link rel="stylesheet" href="../_assets/css/res_1.css">
	<script src="../jQuery/jquery-3.6.0.js"></script>
	<script>
		$(function(){
			
			//수량 옵션
			$('._count :button').on({
			    'click' : function(e){
			    	var p1 = parseInt($("#pCase1").text());
					var p2 = parseInt($("#pCase2").text());
					var p3 = parseInt($("#pCase3").text());
					var p4 = parseInt($("#pCase4").text());
			    	var pSum = p1 + p2 + p3 + p4;
					
			    	if(pSum >= 8 && $(this).hasClass('plus')) return;
			    	
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
				// 좌석 선택 다 해야 뜨는걸로
				var p1 = parseInt($("#pCase1").text());
				var p2 = parseInt($("#pCase2").text());
				var p3 = parseInt($("#pCase3").text());
				var p4 = parseInt($("#pCase4").text());
				
				var sum = p1 * 12000 + p2 * 7000 + p3 * 5000 + p4 * 4000;
				
				$("#mPrice").text(sum);
			});
			
			$(".seat").on("click", function(){
				var p1 = parseInt($("#pCase1").text());
				var p2 = parseInt($("#pCase2").text());
				var p3 = parseInt($("#pCase3").text());
				var p4 = parseInt($("#pCase4").text());
		    	var pSum = p1 + p2 + p3 + p4;
				
		    	if(pSum == 0) {
		    		alert("인원을 선택해 주십시오.");
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
					$(".seat").not(".selectedSeat")
							  .removeClass("btn-light")
							  .addClass("btn-secondary")
							  .prop("disabled", true);
				} else{
					$(".seat").not(".selectedSeat")
					  		  .removeClass("btn-secondary")
					  		  .addClass("btn-light")
					  		  .prop("disabled", false);
				}
			});
			
			
		});
	</script>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

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
								<div><img src="../assets/img/post1.jpg" style="height: 100px"></div>
								<div class="d-flex flex-column p-2 text-start">
									<span>영화제목1111111111111111</span>
									<span>날짜 시간222222222222</span>
									<span>1관3333333333333333</span>
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
							<div class="" style="height:700px">
								<div class="bg-secondary mt-3 mb-5 fs-5">S C R E E N</div>
								<div class="mb-1  d-flex justify-content-between">
									<div class="text-end vca" style="width:300px">A</div>
									<div>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">1</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">2</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">3</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">4</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">5</span></button>
										<span class="me-5"></span>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">6</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">7</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">8</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">9</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">10</span></button>
									</div>
									<div style="width:300px"></div>
								</div>
								<div class="mb-1  d-flex justify-content-between">
									<div class="text-end vca" style="width:300px">B</div>
									<div>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">1</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">2</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">3</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">4</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">5</span></button>
										<span class="me-5"></span>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">6</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">7</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">8</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">9</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">10</span></button>
									</div>
									<div style="width:300px"></div>
								</div>
								<div class="mb-1  d-flex justify-content-between">
									<div class="text-end vca" style="width:300px">C</div>
									<div>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">1</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">2</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">3</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">4</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">5</span></button>
										<span class="me-5"></span>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">6</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">7</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">8</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">9</span></button>
										<button type="button" class="btn btn-light seat" style="width:40px"><span class="mca">10</span></button>
									</div>
									<div style="width:300px"></div>
								</div>
							</div>
							
							
						</div>
						<div class="row">
							<div class="col bg-secondary text-white p-4 text-start fs-4">총 합계 <span class="fs-1" id="mPrice">0</span>원</div>
							<div class="col-2 bg-danger text-white p-4 fs-6 mca myMouse">결제하기</div>
						</div>
					</div>
					
					
				</div>
			</div>
			</div>
		</section>
	
	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>