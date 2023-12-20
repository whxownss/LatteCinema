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
			
			// 호버시 마우서 커서 모양 변경 (*******질문하기, 이 방법밖에 없나?)
			$(".myMouse").css("cursor","pointer");
			
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
										    <button type="button" class="minus d-flex justify-content-center">-</button>
										    <span class="inpp align-middle">0</span>
										    <button type="button" class="plus d-flex justify-content-center">+</button>
										</div>
									</li>
									<li class="d-flex flex-row ms-3">
										<span class="me-1 d-flex align-items-center">청소년 </span>
										<div class="count-wrap _count">
										    <button type="button" class="minus d-flex justify-content-center">-</button>
										    <span class="inpp align-middle">0</span>
										    <button type="button" class="plus d-flex justify-content-center">+</button>
										</div>
									</li>
									<li class="d-flex flex-row ms-3">
										<span class="me-1 d-flex align-items-center">경로 </span>
										<div class="count-wrap _count">
										    <button type="button" class="minus d-flex justify-content-center">-</button>
										    <span class="inpp align-middle">0</span>
										    <button type="button" class="plus d-flex justify-content-center">+</button>
										</div>
									</li>
									<li class="d-flex flex-row ms-3">
										<span class="me-1 d-flex align-items-center">장애인 </span>
										<div class="count-wrap _count">
										    <button type="button" class="minus d-flex justify-content-center">-</button>
										    <span class="inpp align-middle">0</span>
										    <button type="button" class="plus d-flex justify-content-center">+</button>
										</div>
									</li>
								</ul>
							</div>
						</div>
						
						
						
						
						<div class="row bg-black text-white">
							<div class="" style="height:700px">
								<div class="bg-secondary mt-3">S C R E E N</div>
								<div class="mt-5 border">
								<button type="button" class="btn btn-light">1</button>
								<button type="button" class="btn btn-light">2</button>
								<button type="button" class="btn btn-light">3</button>
								<button type="button" class="btn btn-light">4</button>
								<button type="button" class="btn btn-light">5</button>
								
								<button type="button" class="btn btn-light">6</button>
								<button type="button" class="btn btn-light">7</button>
								<button type="button" class="btn btn-light">8</button>
								<button type="button" class="btn btn-light">9</button>
								<button type="button" class="btn btn-light">10</button>
								
								</div>
							</div>
							
							
						</div>
						<div class="row">
							<div class="col bg-secondary text-white p-4 text-start fs-4">총 합계 0원</div>
							<div class="col-2 bg-danger text-white p-4 fs-6 mca myMouse">결제하기</div>
						</div>
					</div>
					
					
				</div>
			</div>
			</div>
		</section>
	
	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>