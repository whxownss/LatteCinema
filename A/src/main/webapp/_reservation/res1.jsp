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

<!-- Modal1 -->
<div class="modal fade" id="warning" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
<!--       <div class="modal-header"> -->
<!--         <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1> -->
<!--       </div> -->
      <div class="modal-body">
        <div class="text-center mt-5 mb-5 fw-bold">영화관을 선택해 주십시오.</div>
      </div>
      <div class="modal-footer ps-0 pe-0 pt-0 pb-0">
        <button type="button" class="btn btn-light w-100 ms-0 me-0 mt-0 mb-0"" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal1 -->

<!-- Modal2 -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <input type="hidden" id="schDTO"></input>
      <div class="modal-header d-flex justify-content-between pt-2 pb-2 bg-secondary-subtle" >
      	<div style="width: 32px"></div>
        <div><h1 class="modal-title fs-5 text-center" id="modalTitle"></h1></div>
        <div class="ppa"><button type="button" class="btn-close pt-0 pb-0 vca" data-bs-dismiss="modal" aria-label="Close"></button></div>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="text-center" id="modalSeat">
        		잔여좌석
        		<span class="fw-bold fs-4 cSeat"></span>
        		/
        		<span class="aSeat"></span>
        	</div>
        </div>
        <div class="row">
        	<div class="text-center mainTitle mb-1">
        		<img class="modalRating pb-1" src=""/>
        		<span class="">본 영화는 </span>
        		<span class="ratingText"></span>
        		<span class=""> 영화입니다.</span>
        	</div>
        	
        	<div class="text-center subTitle">
        		<div class="subText " style='font-size: small'></div>
        	</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger goRes2Btn">인원/좌석 선택</button>
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
var movieList;
var days = ["일", "월", "화", "수", "목", "금", "토"];
var ratingSubTitles = {
		"all" : "",
		"12"  : "만 12세 미만의 고객님(영, 유아 포함)은 반드시 부모님 또는 성인 보호자의 동반하에\n관람이 가능합니다. 연령 확인 불가 시 입장이 제한될 수 있습니다.",
		"15"  : "만 15세 미만의 고객님(영, 유아 포함)은 반드시 부모님 또는 성인 보호자의 동반하에\n관람이 가능합니다. 연령 확인 불가 시 입장이 제한될 수 있습니다.",
		"18"  : "만 18세 미만의 고객님(영, 유아 포함)은 부모님 또는 성인 보호자를 동반하여도\n관람이 불가합니다. 또한 만 18세 이상이라도 재학중인 학생은 관람이 불가합니다.\n영화 관람 시, 반드시 신분증을 지참하여 주시기 바랍니다."
}
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
// showSchedule에서 필요한 부분
var check = function(type, value){
	var id = (type == "OLD") ? "oldSch" : "nowSch";
	var text = (type == "OLD") ? "옛날 영화" : "최신 영화";
	
	if(value.schMovType == type && $("#showTimeTable").children("#" + id).length == 0){
		$("#showTimeTable").append("<div class='text-start' id='" + id + "'>" + text + "</div>");
	}
}
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
		$.each(data, function(index, value){
			check("OLD", value);
			check("NOW", value);
			
			var id = (value.schMovType == "OLD") ? "oldSch" : "nowSch";
			var pId = id;
			id += value.schMovIdx;
			if(! $("#" + id).length){
				$("#" + pId).append("<div class='text-start fTitle' id='" + id + "'>" 
								 	+ "<img src='_assets/img/grade_" + value.rating + ".png' class='pb-1 ps-2'/> "
								    + "<span class='mTitle'>" + value.title + "</span></div>");
				$("#" + id).append("<div class='text-start'><ul class='text-start  list-time ps-2'></ul></div>");
			}
			$("#" + id).find(".list-time")
			   		   .append("<a class='btn btn-light ms-1 me-1 mt-1 mb-1 pt-0 pb-0 border border-dark-subtle modalBtn'" 
					    	   + "href='#' role='button' style='width: 100px;'" 
					    	   + "data-bs-toggle='modal' data-bs-target='#staticBackdrop'>" // 모달모달모달모달모달모달모달모달모달모달모달모달모달모달 
					   		   + "<span class='fs-5 starTime'>" + value.schStime + "</span>" + "<br>" 
					   		   + "<span class='seat' style='font-size: small'><span class='cSeat'>" 
					   		   + value.scrSeatAvail + "</span>/<span class='aSeat'>" 
					   		   + value.scrSeat + "</span></span>&nbsp;&nbsp;&nbsp;&nbsp;" 
					   		   + "<span class='scrIdx' style='font-size: small'>" + value.scrIdx + "관</span>" 
					   		   + "<input type='hidden' class='endTime'  value='" + value.schEtime + "'>"
					   		   + "<input type='hidden' class='rating'  value='" + value.rating + "'>"
					   		   + "<input type='hidden' class='loIdx' value='" + value.loIdx + "'>"
					   		   + "<input type='hidden' class='ciIdx' value='" + value.ciIdx + "'>"
					   		   + "<input type='hidden' class='schIdx' value='" + value.schIdx + "'>"
					   		   + "<input type='hidden' class='movType' value='" + value.schMovType + "'>"
					   		   + "<input type='hidden' class='movIdx' value='" + value.schMovIdx + "'>");
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
			cleanMyMovies();
			
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
var cleanMyMovies = function(){
	$("#selectedMovie").text("영화");
	$(".showMovies").empty();
	$(".myMovie").removeClass("bg-body-secondary");
	$(".myMovie").addClass("bg-body-secondary");
}
var keepCheck = function(param){
	var type = (param == "cinema") ? "Cinema" : "Movie";
	var target = (param == "cinema") ? "지역 및 영화관" : "영화";
	var text = $("#selected" + type).text().replace(" (준비중)", "");
	
	if(text != target){
		var list = $("[id*=" + type.toLowerCase() + "]").text();
		if(list.includes(text)){
			$(".myMouse:contains(" + text + ")").append("<span class='position-absolute top-50 end-0 translate-middle-y me-2 bi bi-check-lg' style='color: red;'></span>")
										  		.removeClass("border border-0")
										  		.css("border", "1px red solid");
		}
	}
}
var changeBgColor = function(param){
	var selector = ($(param).hasClass("myLocation")) ? "Location" : "Movie";
	
	$(".my" + selector).addClass("bg-body-secondary");
	$(param).removeClass("bg-body-secondary");
	$(param).css("background", "white");
}
var selectMovieList = function(){
	var cinema = $("#selectedCinema").text();
	if(!($("#selectedCinema").text() == "지역 및 영화관" || $("#selectedCinema").text().includes("(준비중)"))){
		$.ajax({
			type: "GET",
			url: "res1ProML.re",
			data: {cinema: cinema,
				   date: $("#myCalendar").val()},
			dataType: "json"  
		})
		.done(function(data){
			movieList = data;
		})
		.fail(function(){
		})
	}
}
var letsGoSchedule = function(p){
	// showSchedule()
	if($("#selectedMovie").text() != "영화" && $("#selectedCinema").text() == "지역 및 영화관") return;
	// 특정 영화의 시간표만 보여주기 위함
	var param = "all";
	// find(".bi-check-lg") 체크 해제 시 다시 전체 시간표로 나오기 위한 조건
	if($(p).find(".bi-check-lg").length == 0 && $(p).attr("id").includes("movie")){
		param = $(p).text();
	}
	showSchedule(param);
}

$(function(){
	// 지역 선택
	$(".myLocation").click(function(e){
		// 배경색 변경
		changeBgColor(this);
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
		keepCheck("cinema")
	}); // 지역 선택 끝

	// 영화 종류 선택
	$(".myMovie").click(function(e){
		if($("#selectedCinema").text().includes(" (준비중)") || $("#selectedCinema").text() == "지역 및 영화관"){
			
			$("#warning").modal("show");
			return;
		}
		
		// 배경색 변경
		changeBgColor(this);
		
		// 목록 나타내기
		$(".showMovies").empty();
		var id = $(this).attr("id")
		$.each(movieList, (i, e) => {
			if(e.schMovType != id) return;
				$(".showMovies").append("<li class='list-group-item border border-0 myMouse' id='" 
										+ id + "movie" + (i+1) + "'>" 
										+ "<img src='_assets/img/grade_" + e.rating + ".png' class='pb-1'/>"
										+ e.title + "</li>");
		});			
		
		// 다른 영화 선택하고 오면 체크 없어지는거 해결
		keepCheck("movie")
	}); // 영화 종류 선택 끝
		
	// 영화관 및 영화 선택 (동적으로 생긴 태그에 대해선 이렇게 해야함)								// **이 두개 합치기
	$(document).on("click", "[id*=cinema], [id*=movie]", function(e){
		var tmp = $(this).attr("id");
		var id = (tmp.startsWith("c")) ? "selectedCinema" : "selectedMovie";
		$("#" + id).text(this.textContent);
		
		if(id == "selectedCinema") selectMovieList();				
		
		letsGoSchedule(this);
		
		//////////////////////////////선택시 체크표시	
		var id2 = (tmp.startsWith("c")) ? "[id*=cinema]" : "[id*=movie]";
		// 영화 선택 해제
		if(id2 == "[id*=movie]" && $(this).children("span").length){
			$(this).addClass("border border-0");
			$(this).children("span").remove();
			$("#selectedMovie").text("영화")
			return;
		}
		// 같은 영화관 선택시 처리
		if(id2 == "[id*=cinema]" && $(this).children("span").length){
			cleanMyMovies();
			$("#selectedMovie").text("영화")
			return;
		}
		$(id2).addClass("border border-0");
		$(this).removeClass("border border-0");
		$(this).css("border", "1px red solid");
		$(id2 + " span").remove();
		$(this).append("<span class='position-absolute top-50 end-0 translate-middle-y me-2 bi bi-check-lg' style='color: red;'></span>");
		////////////////////////////////////
	});
		
	// 날짜 표시
	var date = new Date();
	debugger;
	// 맨처음 달력에 날짜 표시
	$("#myCalendar").val(new Date(date.getTime() - (date.getTimezoneOffset() * 60000)).toISOString().substring(0, 10));
	// 맨처음 상단에 날짜 표시
	writeDate(date);  												// **일단은 처음에는 날짜 표시 안되게끔.
	// 당일 날짜 기준으로 범위 설정
	setDateRange(date);
	// 달력에서 선택 후 날짜 표시
	$("#myCalendar").on("change", function(){
		date = new Date($("#myCalendar").val());
		writeDate(date);
		
		cleanMyMovies();
		selectMovieList();
		
		// 영화관 선택도 없이 날짜 변경 할 때
		var cinema = $("#selectedCinema").text();
		if(cinema == "지역 및 영화관" || cinema.includes("(준비중)")) return;
		
		letsGoSchedule(this);
	}); // 날짜 표시 끝
	
	// 시간표 선택시 모달 창에 내용 넣기
	$(document).on("click", ".modalBtn", function(){
		// 영화고르지 않고 시간표에서 바로 고를때 영화부분 수정
		$("#selectedMovie").text($(this).parents(".fTitle").children().eq(1).text());
		var selector = ($(this).parents("#nowSch").length == 0) ? "#OLD" : "#NOW";
		$(selector).trigger("click");
		
		var sTime = $(this).find(".starTime").text();				   // 시작 시간
		var cSeat = $(this).find(".cSeat").text();					   // 남은 자리
		var aSeat = $(this).find(".aSeat").text();					   // 모든 자리
		var sIdx = $(this).find(".scrIdx").text();					   // 몇관 번호
		var eTime = $(this).find(".endTime").val();					   // 종료 시간
		var rating = $(this).find(".rating").val();					   // 관람 등급
		
		var date = $("#selectedDate").text();           			   // 선택 날짜
		var title = $(this).parents(".fTitle").find(".mTitle").text(); // 영화 제목
		var cinema = $("#selectedCinema").text();					   // 영화관
		var loIdx = $(this).find(".loIdx").val();
		var ciIdx = $(this).find(".ciIdx").val();
		var schIdx = $(this).find(".schIdx").val();
		var movType = $(this).find(".movType").val();
		var movIdx = $(this).find(".movIdx").val();
		// 포스터도 담아야함
		var schDTO = {
				"rating"   : rating,
				"title"    : title,
				"date"     : date,
				"s_time"   : sTime,
				"eTime"    : eTime,
				"scr_idx"  : sIdx,
				"cSeat"    : cSeat,
				"aSeat"    : aSeat,
				"cinema"   : cinema,
				"lo_idx"   : loIdx,
				"ci_idx"   : ciIdx,
				"sch_idx"  : schIdx,
				"mov_type" : movType,
				"mov_idx"  : movIdx,
				"date_c"   : date.slice(0, -4)
		}
		debugger;
		$("#schDTO").val(JSON.stringify(schDTO));
		$("#modalTitle").text(sTime + " ~ " + eTime + " (" + sIdx + ")");
		$("#modalSeat .cSeat").text(cSeat);
		$("#modalSeat .aSeat").text(aSeat);
		
		var imgSrc;
		var ratingText;
		var ratingColor;
		var subTitle = ratingSubTitles[rating];
		switch (rating) {
		case "all": ratingText = "전체관람가";			  ratingColor = "green"; break;
		case "12":  ratingText = "만 12세 이상 관람가";   ratingColor = "goldenrod"; break;
		case "15":  ratingText = "만 15세 이상 관람가";   ratingColor = "chocolate"; break;
		case "18":  ratingText = "청소년 관람불가";		  ratingColor = "Crimson"; break;
		}
		
		$(".modalRating").attr("src", "_assets/img/grade_" + rating + ".png");
		$(".ratingText").text(ratingText);
		$(".ratingText").css("text-decoration","underline").css("color", ratingColor);
		$(".subText").text(subTitle);
	});
	
	
	// res2 페이지 이동
	$(".goRes2Btn").on("click", function(){
		localStorage.setItem('schDTO', $("#schDTO").val());
		window.location = "res2.re";
	});
	
	
	
	// 호버시 마우서 커서 모양 변경
	$(document).on("mouseover", ".myMouse", function(e){
		$(".myMouse").css("cursor","pointer");
	});
});
</script>
<%@include file="../_common/commonFooterEnd.jsp"%>