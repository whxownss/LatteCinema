document.write('<script type="text/javascript" '+ 
						'src="/' + window.location.pathname.split("/")[1] + '/_assets/js/resJS/res1VarFunc.js"></script>');

$(function(){
	// 지역 선택
	$(".myLocation").click(function(e){
		// 배경색 변경
		changeBgColor(this);
		// 목록 나타내기
		var lo = $(this).attr("id").slice(2);
		
		var cinemaList;
		$.ajax({
			type: "GET",
			url: "res1ProGC.re",
			dataType: "json",
			async: false
		})
		.done(function(data){
			debugger;
			cinemaList = data;
		})
		.fail(function(){})
		
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
		debugger;
		$.each(movieList, (i, e) => {
			if(e.schMovType != id) return;
				$(".showMovies").append("<li class='list-group-item border border-0 myMouse' id='" 
										+ id + "movie" + (e.movieCode) + "'>"
										+ "<img src='_assets/img/grade_" + e.rating + ".png' class='pb-1 pe-1'/>"
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
		
		debugger;
		if(id == "selectedCinema") selectMovieList();				
		debugger;
		letsGoSchedule(this);			
		debugger;
		
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
		debugger;
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
		
		// 시작 시간 30분 남은거는 선택 안되게끔  *******************************나중에 꼭 풀것
// 		var nowDate = new Date();
// 		var movDate = new Date($("#myCalendar").val() + " " + $(this).find(".startTime").text());
// 		if(new Date(nowDate .getTime() - (nowDate .getTimezoneOffset() * 60000)).toISOString().substring(0, 10) == $("#myCalendar").val()
// 				&& (movDate.getTime() - nowDate.getTime()) / (60 * 1000) < 120 ) {
// 			alert('상영 시작 30분 전부터는 현장에서만 구매 가능합니다.');
// // 			$('#staticBackdrop').modal('hide');
// 			return;
// 		}
		// 시작 시간 30분 남은거는 선택 안되게끔
		
		var sTime = $(this).find(".startTime").text();				   // 시작 시간
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
		var poster = $(this).find(".poster").val();
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
				"date_c"   : date.slice(0, -4),
				"poster"   : poster
		}
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
		
		$('#staticBackdrop').modal('show');
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
	
	
	
	// 영화코드 들고 페이지 왔을 때
	var movieCode = new URL(window.location.href).searchParams.get('movieCode');
	if(movieCode == null) return;
		
	$("#lo6").trigger("click");
	$("#cinema7").trigger("click");
	debugger;
	
	$.ajax({
		type: "GET",
		url: "res1ProGM.re",
		data: {movieCode: movieCode},
		dataType: "json",
	})
	.done(function(data){
		debugger;
		
		var movieType = "NOW";
		if(data.movieCategory == "OLD")
			movieType = "OLD";
		
		$("#" + movieType).trigger("click");
		if($("#" + movieType + "movie" + movieCode).length == 0){
			alert("금일 상영하지 않는 영화입니다.\n다른 날짜를 선택해주세요.");
			return;
		}
		$("#" + movieType + "movie" + movieCode).trigger("click");
		
	})
	.fail(function(){});
	// 영화코드 들고 페이지 왔을 때	
	
});
