<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../_common/commonHeaderStart.jsp"%>
	<link rel="stylesheet" href="../_assets/css/res_1.css">
	<script src="../jQuery/jquery-3.6.0.js"></script>
	<script>
		
		$(function(){
			// 지역 선택
			$(".myLocation").click(function(e){
				// 배경색 변경
				$(".myLocation").addClass("bg-body-secondary");
				$(this).removeClass("bg-body-secondary");
				$(this).css("background", "white");
				
				// 목록 나타내기
				var locations = {
						lo1: ["건대입구", "김포공항", "서울대입구", "수유", "영등포", "합정", "홍대입구"],						  // 서울 
						lo2: ["광교아울렛", "동탄", "부천", "부평", "수원", "안산", "의정부", "인천터미널", "평택"],				  // 경기,인천
						lo3: ["당진", "대전", "서산", "서청주", "충주"],													  // 충청,대전
						lo4: ["광주", "군산", "익산모현", "전주", "충장로"],												  // 전라, 광주
						lo5: ["경주", "구미공단", "대구광장", "동성로", "상주", "영천", "포항"],								  // 경북, 대구
						lo6: ["거창", "김해부원", "동래", "마산", "부산명지", "부산본점", "서면", "센텀시티", "울산", "진해", "창원"], // 경남, 부산, 울산
						lo7: ["남원주", "동해", "원주무실", "춘천"],														  // 강원
						lo8: ["서귀포", "제주아라", "제주연동"]															  // 제주
				};
				var lo = $(this).attr("id");
				var content = locations[$(this).attr("id")];
				$(".showLocations").empty();
				$.each(content, (i, e) => {
					$(".showLocations").append("<li class='list-group-item border border-0 myMouse' id='cinema" + (i+1) + "'>" + e + "</li>");
				});
				
				
				
				// 다른 지역 선택하고 오면 체크 없어지는거 해결
				if($("#selectedCinema").text() != "지역 및 영화관"){
					var list = $("[id*=cinema]").text();
					var text = $("#selectedCinema").text()
					if(list.includes(text)){
						
						$(".myMouse:contains(" + text + ")").append("<span class='position-absolute top-50 end-0 translate-middle-y me-2 bi bi-check-lg' style='color: red;'></span>")
													  		.removeClass("border border-0")
													  		.css("border", "1px red solid");
						
// 						debugger;
					}
				}
			}); // 지역 선택 끝

			// 영화 종류 선택
			$(".myMovie").click(function(e){
				// 배경색 변경
				$(".myMovie").addClass("bg-body-secondary");
				$(this).removeClass("bg-body-secondary");
				$(this).css("background", "white");
				
				// 목록 나타내기
				var movies = {
						mo1: ["옛날영화제목1", "옛날영화제목2", "옛날영화제목3", "옛날영화제목4", "옛날영화제목5", "옛날영화제목6", "옛날영화제목7"],						  
						mo2: ["최신영화제목1", "최신영화제목2", "최신영화제목3", "최신영화제목4", "최신영화제목5", "최신영화제목6", "최신영화제목7", 
							  "최신영화제목8", "최신영화제목9", "최신영화제목10", "최신영화제목11", "최신영화제목12"]
				};
				var mo = $(this).attr("id");
				var content = movies[$(this).attr("id")];
				$(".showMovies").empty();
				$.each(content, (i, e) => {
					$(".showMovies").append("<li class='list-group-item border border-0 myMouse' id='movie" + (i+1) + "'>" + e + "</li>");
				});
				
				
				
				// 다른 지역 선택하고 오면 체크 없어지는거 해결
				if($("#selectedMovie").text() != "영화"){
					var list = $("[id*=movie]").text();
					var text = $("#selectedMovie").text()
					if(list.includes(text)){
						
						$(".myMouse:contains(" + text + ")").append("<span class='position-absolute top-50 end-0 translate-middle-y me-2 bi bi-check-lg' style='color: red;'></span>")
													  		.removeClass("border border-0")
													  		.css("border", "1px red solid");
						
// 						debugger;
					}
				}
			}); // 영화 종류 선택 끝
			
			
			
			// 영화관 및 영화 선택 (동적으로 생긴 태그에 대해선 이렇게 해야함)
			$(document).on("click", "[id*=cinema], [id*=movie]", function(e){
				var tmp = $(this).attr("id");
				var id = (tmp.startsWith("c")) ? "selectedCinema" : "selectedMovie";
				$("#" + id).text(this.textContent);
			});
			
			
			// 영화 선택 (*******질문하기, 공통부분, 지금은 내용을 변경시켜서 통일했지만 만약에 내용이 다른 경우엔?)
// 			$(document).on("click", "[id*=movie]", function(e){
// 				$("#selectedMovie").text(this.textContent);
// 			});
			
			
			// 호버시 마우서 커서 모양 변경 (*******질문하기, 이 방법밖에 없나?)
// 			$(".myMouse").css("cursor","pointer");
			$(document).on("mouseover", ".myMouse", function(e){
				$(".myMouse").css("cursor","pointer");
			});
			
			
			// 선택시 체크표시
			$(document).on("click", "[id*=cinema], [id*=movie]", function(e){
				var tmp = $(this).attr("id");
				var id = (tmp.startsWith("c")) ? "[id*=cinema]" : "[id*=movie]";
				$(id).addClass("border border-0");
				$(this).removeClass("border border-0");
				$(this).css("border", "1px red solid");
				$(id + " span").remove();
				$(this).append("<span class='position-absolute top-50 end-0 translate-middle-y me-2 bi bi-check-lg' style='color: red;'></span>");
			});
			
			
			// 날짜 표시
			var date = new Date();
// 			alert(date);
			var minDate = date;
			var maxDate = new Date(minDate).setDate(minDate.getDate() + 5);
			alert(maxDate);
			var dateFormat = date.getFullYear() + "-" + date.getMonth()+1 + "-" + date.getDate();
			$("#myCalendar").prop("min", "2023-12-18");
			$("#myCalendar").prop("max", "2023-12-30"); // new Date(date).setDate(date.getDate() + 5)
			$("#myCalendar").val(date.toISOString().substring(0, 10));
			writeDate(date);
			$("#myCalendar").on("change", function(){
				date = new Date($("#myCalendar").val());
				writeDate(date);
			});
		});


		
		
		// 필요 변수 및 함수
		var days = ["일", "월", "화", "수", "목", "금", "토"];
		var writeDate = function(date){
			$("#selectedDate").text($("#myCalendar").val() + " (" + days[date.getDay()] + ")");
		}
	</script>
<%@include file="../_common/commonHeaderEnd.jsp"%>




<main id="main">

	<section class="category-section">
		<div class="container" data-aos="fade-up">

			<div class="container text-center">
				<div class="row border border-secondary">
				
					<!-- 젤 바깥 1번 --> 
					<div class="col-1 border border-secondary p-0">
						<ul class="list-group h-100 rounded-0">
							<li class="list-group-item h-100 ps-0 pe-0 active" aria-current="true" id="test1">
								<span class="position-absolute top-50 start-50 translate-middle w-100">01<br>상영시간</span>
							</li>
							<li class="list-group-item h-100 ps-0 pe-0">
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
						<div class="row">
							
							<!-- 지역 및 영화관 -->
							<div class="col border border-secondary hErrorP">
								<div class="row" >
									<div class="col p-2 bg-black text-white selected" id="selectedCinema">지역 및 영화관</div>
								</div>
								<div class="row hErrorC">
									<div class="col p-0 bg-body-secondary">
										<ul class="list-group text-start mb-0 ps-0 rounded-0">
											<li class="list-group-item border border-0 bg-body-secondary myLocation myMouse" id="lo1">서울</li>
											<li class="list-group-item border border-0 bg-body-secondary myLocation myMouse" id="lo2">경기/인천</li>
											<li class="list-group-item border border-0 bg-body-secondary myLocation myMouse" id="lo3">충청/대전</li>
											<li class="list-group-item border border-0 bg-body-secondary myLocation myMouse" id="lo4">전라/광주</li>
											<li class="list-group-item border border-0 bg-body-secondary myLocation myMouse" id="lo5">경북/대구</li>
											<li class="list-group-item border border-0 bg-body-secondary myLocation myMouse" id="lo6">경남/부산/울산</li>
											<li class="list-group-item border border-0 bg-body-secondary myLocation myMouse" id="lo7">강원</li>
											<li class="list-group-item border border-0 bg-body-secondary myLocation myMouse" id="lo8">제주</li>
										</ul>
									</div>
									<div class="col p-0">
										<ul class="list-group border border-0 text-start mb-0 ps-0 rounded-0 showLocations">
										</ul>
									</div>
								</div>
							</div>
							
							<!-- 영화 -->
							<div class="col border border-secondary">
								<div class="row">
									<div class="col p-2 bg-black text-white" id="selectedMovie">영화</div>
								</div>
								<div class="row" style="">
									<div class="col p-0 bg-body-secondary">
										<ul class="list-group text-start mb-0 ps-0 rounded-0">
											<li class="list-group-item border border-0 bg-body-secondary myMovie myMouse" id="mo1">옛날영화</li>
											<li class="list-group-item border border-0 bg-body-secondary myMovie myMouse" id="mo2">최신영화</li>
										</ul>
									</div>
									<div class="col p-0">
										<ul class="list-group border border-0 text-start mb-0 ps-0 rounded-0 showMovies scrollable" style="height: 450px; overflow: auto;">
										</ul>
									</div>
								</div>
							</div>
							
							<!-- 날짜 및 시간 -->
							<div class="col border border-secondary">
								<div class="row">
									<div class="col p-2 bg-black text-white" id="selectedDate">날짜 및 시간</div>
								</div>
								<div class="row">
									<div class="col p-0">
										<input type='date' name='date' value="날짜" min="" max="" id="myCalendar" class="w-100 text-center border border-0 bg-body-secondary"/>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
				</div>
			</div>



		</div>
	</section>

</main>

<%@include file="../_common/commonFooter.jsp"%>