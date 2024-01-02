<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.itwillbs.domain.ScheduleDTO"%>
<%@page import="com.itwillbs.domain.CinemaDTO"%>
<%@page import="com.itwillbs.domain.LocationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../_common/commonHeaderStart.jsp"%>
	<link rel="stylesheet" href="_assets/css/res_1.css">
<%@include file="../_common/commonHeaderEnd.jsp"%>

<c:set var="locationList" value="${requestScope.locationList}" />
<c:set var="cinemaListJson" value="${requestScope.cinemaListJson}" />
<c:set var="scheduleListJson" value="${requestScope.scheduleListJson}" />

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
							<div class="col-3 border border-secondary hErrorP">  <!-- hErrorP --> 
								<div class="row" >
									<div class="col p-2 bg-black text-white" id="selectedCinema">지역 및 영화관</div> <!-- .selected -->
								</div>
								<div class="row hErrorC" style="">  <!-- hErrorC --> 
									<div class="col p-0 bg-body-secondary">
										<ul class="list-group text-start mb-0 ps-0 rounded-0">
											<c:forEach var="location" items="${locationList}" varStatus="status">
												<li class="list-group-item border border-0 bg-body-secondary myLocation myMouse" 
													id="lo${status.index + 1}">${location.loName}</li>
											</c:forEach>
										</ul>
									</div>
									<div class="col p-0">
										<ul class="list-group border border-0 text-start mb-0 ps-0 rounded-0 showLocations ">
										</ul>
									</div>
								</div>
							</div>
							
							<!-- 영화 -->
							<div class="col-4 border border-secondary hErrorP">
								<div class="row">
									<div class="col p-2 bg-black text-white" id="selectedMovie">영화</div>
								</div>
								<div class="row hErrorC" style="">
									<div class="col p-0 bg-body-secondary">
										<ul class="list-group text-start mb-0 ps-0 rounded-0">
											<li class="list-group-item border border-0 bg-body-secondary myMovie myMouse" id="OLD">옛날영화</li>
											<li class="list-group-item border border-0 bg-body-secondary myMovie myMouse" id="NOW">최신영화</li>
										</ul>
									</div>
									<div class="col p-0">
										<ul class="list-group border border-0 text-start mb-0 ps-0 rounded-0 showMovies scrollable" style="height: 450px; overflow: auto;">
										</ul>
									</div>
								</div>
							</div>
							
							<!-- 날짜 및 시간 -->
							<div class="col-5 border border-secondary">
								<div class="row">
									<div class="col p-2 bg-black text-white" id="selectedDate">날짜 및 시간</div>
								</div>
								<div class="row">
									<div class="col p-0">
										<input type='date' name='date' value="날짜" min="" max="" id="myCalendar" class="w-100 text-center border border-0 bg-body-secondary"/>
									</div>
								</div>
								<div class="row" >
									<div class="col" id="showTimeTable" style="height: 450px; overflow: auto;">								
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
				</div>
			</div>

			<div><button id="forTest" style="margin-left: 100%;">TEST</button></div>
			<div ><a href="res2.re" style="margin-left: 100%;"><button>res2 이동</button></a></div>

		</div>
	</section>

</main>

<%@include file="../_common/commonFooterStart.jsp"%>
<script src="jQuery/jquery-3.6.0.js"></script>
<script>

var cinemaList = ${cinemaListJson};
// var scheduleList = ${scheduleListJson};

var days = ["일", "월", "화", "수", "목", "금", "토"];
//맨처음 상단에 날짜 표시
var writeDate = function(date){
	$("#selectedDate").text($("#myCalendar").val() + " (" + days[date.getDay()] + ")");
};
var dateFormat = function(date){
	var year  = date.getFullYear();
	var month = (date.getMonth()+1) < 10 ? "0" + (date.getMonth()+1) : (date.getMonth()+1); 
	var date  = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();

	return year + "-" + month + "-" + date;
};
//당일 날짜 기준으로 범위 설정
var setDateRange = function(date){
	$("#myCalendar").prop("min", dateFormat(date));
	$("#myCalendar").prop("max", dateFormat(new Date(date.setDate(date.getDate() + 4))));
};

//상영 시간표 출력
var showSchedule = function(param, date){
	$("#showTimeTable").empty();
	$.ajax({
		type: "GET",
		url: "res1Pro.re",
		data: {cinema: $("#selectedCinema").text(),
			   param: param,
			   date: $("#myCalendar").val()},
		dataType: "json"  // fail 기준 질문하기. 결과값 [] 여도 done -> 왜??
	})
	.done(function(data){
// 		debugger;
// 		$("#showTimeTable").append("<div class='text-start' id='oldSch'>옛날 영화</div>" + 
// 								   "<div class='text-start mt-3' id='nowSch'>최신 영화</div>");

		// 이거 따로 빼줄것
		var check = function(type, value){
			var id = (type == "OLD") ? "oldSch" : "nowSch";
			var text = (type == "OLD") ? "옛날 영화" : "최신 영화";
			
			if(value.schMovType == type && $("#showTimeTable").children("#" + id).length == 0){
				$("#showTimeTable").append("<div class='text-start' id='" + id + "'>" + text + "</div>");
			}
		}
		$.each(data, function(index, value){
			check("OLD", value);
			check("NOW", value);
			
			var id = (value.schMovType == "OLD") ? "oldSch" : "nowSch";
			var pId = id;
			id += value.schMovIdx;
			if(! $("#" + id).length){
				$("#" + pId).append("<div class='text-start' id='" + id + "'>" + value.title + "</div>");
				$("#" + id).append("<div class='text-start'><ul class='text-start  list-time ps-2'></ul></div>");
			}
			$("#" + id).find(".list-time")
			   		   .append("<a class='btn btn-light ms-1 me-1 mt-1 mb-1 pt-0 pb-0 border border-dark-subtle'" 
					    	   + "href='#' role='button' style='width: 100px;'>" 
					   		   + "<span class='fs-5'>" + value.schTime + "</span>" + "<br>" 
					   		   + "<span style='font-size: small'>" + value.scrSeatAvail + "/" + value.scrSeat + "</span>&nbsp;&nbsp;&nbsp;&nbsp;" 
					   		   + "<span style='font-size: small'>" + value.scrIdx + "관</span>" + "</a>");
		})
	})
	.fail(function(){
		$.ajax({
			type: "GET",
			url: "res1ProOc.re",
			dataType: "json" 
		})
		.done(function(data){
			// 영업중인 곳 선택한 상태에서 다른 곳 선택하면 영화 목록 그대로인거 해결
			$(".showMovies").empty();
			$(".myMovie").removeClass("bg-body-secondary");
			$(".myMovie").addClass("bg-body-secondary");
			
			var msg = "";
			
			for(var i = 0; i < data.length; i++){
				if(!msg.includes(data[i].loName)) msg += ("\n - " + data[i].loName + " : ");
				msg += data[i].ciName;
				msg += ( (i == data.length-1 || (data[i].loName != data[i+1].loName)) ? "" : ", " );
			}
			$("#selectedCinema").text($("#selectedCinema").text() + " (준비중)")  // 순서가 뭔가 아쉽
			alert("선택하신 지점은 오픈 준비 중입니다.\n다른 지점을 선택해 주세요.\n\n현재 운영중인 지점 :" + msg);
		})
		.fail(function(){
			alert("현재 모든 지점 오픈 준비 중입니다.");
		})
	})
	
};


$(function(){
			var movieList;
			
			// 지역 선택
			$(".myLocation").click(function(e){
				// 배경색 변경
				$(".myLocation").addClass("bg-body-secondary");
				$(this).removeClass("bg-body-secondary");
				$(this).css("background", "white");
				
				// 목록 나타내기
				var lo = $(this).attr("id").slice(2);
				// cinemaList에서 클릭한 지역에 해당하는 영화관 이름만 content에 담기
				var content = [];
				$.each(cinemaList, (i, e) => {
					if(lo == e.loIdx){
						content.push(e.ciName);
					}
				});
				
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
				$(".showMovies").empty();
				var id = $(this).attr("id")
				$.each(movieList, (i, e) => {
					if(e.schMovType != id) return;
 					$(".showMovies").append("<li class='list-group-item border border-0 myMouse' id='" + id + "movie" 
 													+ (i+1) + "'>" + e.title + "</li>");
 				});			
				
				// 다른 지역 선택하고 오면 체크 없어지는거 해결
				if($("#selectedMovie").text() != "영화"){
					var list = $("[id*=movie]").text();
					var text = $("#selectedMovie").text()
					if(list.includes(text)){
						
						$(".myMouse:contains(" + text + ")").append("<span class='position-absolute top-50 end-0 translate-middle-y me-2 bi bi-check-lg' style='color: red;'></span>")
													  		.removeClass("border border-0")
													  		.css("border", "1px red solid");
					}
				}
			}); // 영화 종류 선택 끝
				
			// 영화관 및 영화 선택 (동적으로 생긴 태그에 대해선 이렇게 해야함)								// **이 두개 합치기
			$(document).on("click", "[id*=cinema], [id*=movie]", function(e){
				var tmp = $(this).attr("id");
				var id = (tmp.startsWith("c")) ? "selectedCinema" : "selectedMovie";
				$("#" + id).text(this.textContent);
				
				if(id == "selectedCinema"){
					var cinema = $("#selectedCinema").text();
					if(id == "selectedCinema"){
						if(!($("#selectedCinema").text() == "지역 및 영화관" || $("#selectedCinema").text().includes("(준비중)"))){
							$.ajax({
								type: "GET",
								url: "res1ProML.re",
								data: {cinema: cinema},
								dataType: "json"  
							})
							.done(function(data){
								movieList = data;
							})
							.fail(function(){
							})
						}				
					}
				}
				
				// showSchedule()   (젤 바같에 날짜 != "날짜 및 시간" 조건 뺏음)
				if($("#selectedMovie").text() != "영화" && $("#selectedCinema").text() == "지역 및 영화관") return;
				// 특정 영화의 시간표만 보여주기 위함
				var param = "all";
				// find(".bi-check-lg") 체크 해제 시 다시 전체 시간표로 나오기 위한 조건
				if($(this).find(".bi-check-lg").length == 0 && $(this).attr("id").includes("movie")){
					param = $(this).text();
				}
				showSchedule(param);
			});
				
				
			// 선택시 체크표시																	// **이 두개 합치기
			$(document).on("click", "[id*=cinema], [id*=movie]", function(e){
				var tmp = $(this).attr("id");
				var id = (tmp.startsWith("c")) ? "[id*=cinema]" : "[id*=movie]";
				// 영화 선택 해제
				if(id == "[id*=movie]" && $(this).children("span").length){
					$(this).addClass("border border-0");
					$(this).children("span").remove();
					$("#selectedMovie").text("영화")
					return;
				}
				// 같은 영화관 선택시 처리
				if(id == "[id*=cinema]" && $(this).children("span").length){
					$(".showMovies").empty();
					$(".myMovie").removeClass("bg-body-secondary");
					$(".myMovie").addClass("bg-body-secondary");
					$("#selectedMovie").text("영화")
					return;
				}
				$(id).addClass("border border-0");
				$(this).removeClass("border border-0");
				$(this).css("border", "1px red solid");
				$(id + " span").remove();
				$(this).append("<span class='position-absolute top-50 end-0 translate-middle-y me-2 bi bi-check-lg' style='color: red;'></span>");
			});
				
				
			// 날짜 표시
			var date = new Date();
			// 맨처음 달력에 날짜 표시
			$("#myCalendar").val(date.toISOString().substring(0, 10));
			// 맨처음 상단에 날짜 표시
			writeDate(date);  												// **일단은 처음에는 날짜 표시 안되게끔.
			// 당일 날짜 기준으로 범위 설정
			setDateRange(date);
			// 달력에서 선택 후 날짜 표시
			$("#myCalendar").on("change", function(){
				date = new Date($("#myCalendar").val());
				writeDate(date);
				
				// showSchedule()
				if($("#selectedMovie").text() != "영화" && $("#selectedCinema").text() == "지역 및 영화관") return;
				// 특정 영화의 시간표만 보여주기 위함
				var param = "all";
				// find(".bi-check-lg") 체크 해제 시 다시 전체 시간표로 나오기 위한 조건
				if($(this).find(".bi-check-lg").length == 0 && $(this).attr("id").includes("movie")){
					param = $(this).text();
				}
				showSchedule(param);
				
				
			}); // 날짜 표시 끝
			

			// 호버시 마우서 커서 모양 변경
			$(document).on("mouseover", ".myMouse", function(e){
				$(".myMouse").css("cursor","pointer");
			});
});



</script>
<%@include file="../_common/commonFooterEnd.jsp"%>