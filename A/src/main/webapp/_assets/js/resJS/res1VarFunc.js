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
					    	   + "href='#' role='button' style='width: 100px;'>" 
// 					    	   + "data-bs-toggle='modal' data-bs-target='#staticBackdrop'>" // 모달모달모달모달모달모달모달모달모달모달모달모달모달모달 
					   		   + "<span class='fs-5 startTime'>" + value.schStime + "</span>" + "<br>" 
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
					   		   + "<input type='hidden' class='movIdx' value='" + value.schMovIdx + "'>"
					   		   + "<input type='hidden' class='poster' value='" + value.poster + "'>");
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