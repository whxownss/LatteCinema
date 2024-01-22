//var cinemaList = ${cinemaListJson};

$(function(){
	//
// 	$("#location option:eq(6)").prop("selected", true);
	
	//
	var cinemaList;
	$.ajax({
		type: "GET",
		url: "res1ProGC.re",
		dataType: "json",
		async: false
	})
	.done(function(data){
		cinemaList = data;
	})
	.fail(function(){})
	
	$("#location").on("change", function(e){
		var loIdx = e.currentTarget.selectedIndex;
		$("#cinema").empty();
		// 지역 선택하면 영화관 뿌려주기
		if(loIdx == 0) {
			$("#cinema").append("<option value='0'>지역을 먼저 선택해 주세요</option>");
			$("#screen").empty();
			$("#screen").append("<option value='0'>영화관을 먼저 선택해 주세요</option>");
			return;
		}
		$("#cinema").append("<option value='0'>영화관을 선택해 주세요</option>");
		$.each(cinemaList, (i, e) => {
			if(loIdx != e.loIdx) return;
			$("#cinema").append("<option value='" + e.ciIdx + "'>" + e.ciName + " (" + e.ciOc + ")</option>");
		});
	});
	
	// 영화관 선택하면 상영관 뿌려주기
	$("#cinema").on("change", function(e){
		var ciIdx = e.currentTarget.selectedIndex;
		$("#screen").empty()
		if(ciIdx == 0){
			$("#screen").append("<option value='0'>영화관을 먼저 선택해 주세요</option>");
			return;
		}
		$.ajax({
			type: "GET",
			url: "adm_cinemaPro.ad",
			data: {location: $("#location option:selected").val(),
				   cinema: $("#cinema option:selected").val()},
			dataType: "json"
		})
		.done(function(data){
			$("#screen").append("<option value='0'>상영관을 선택해 주세요</option>");
			$.each(data, function(i, e){
				$("#screen").append("<option value='" + e.scrIdx + "'>" + e.scrIdx + "관</option>");
			});
		})
		.fail(function(){})
	});
	
	// 영화변경시 시간 초기화 (영화별로 런타임이 달라 종료시간도 달라지기 때문)
	$("#movie").on("change", function(){
		$("#movie-startTime").val('');
		$("#movie-endTime").val('');
	})
	
	// 종료시간 표시
	$("#movie-startTime").on("change", function(){
		var h = parseInt($("#movie-startTime").val().substr(0,2));
		var m = parseInt($("#movie-startTime").val().substr(3,2));
		var date = new Date();
		date.setHours(h);
		date.setMinutes(m);
		var runTime = parseInt($("#movie").val().split("/")[1]);
		date.setMinutes(date.getMinutes() + runTime); 
		$("#movie-endTime").val((date.getHours()+"").padStart(2, 0) + ":" + (date.getMinutes()+"").padStart(2, 0));
	})
	
	// 스케줄 등록 (유효성 체크해야됨)
	$(document).on("click", ".deleteSchBtn", function(){
		debugger;	
		var loIdx = $(this).parent().parent().find("[class^='lo']").attr('class').split(" ")[0].substr(2);
		var ciIdx = $(this).parent().parent().find("[class^='ci']").attr('class').substr(2);
		var schIdx = $(this).parent().parent().find(".schIdx").text();
		var movType = $(this).parent().parent().find(".movType").text();
		debugger;	
		
		$.ajax({
			type: "POST",
			url: "adm_cinemaProDS.ad",
			data: {
				loIdx: loIdx,
				ciIdx: ciIdx,
				schIdx: schIdx,
				movType: movType
			},
			dataType: "text"
		})
		.done(function(data){
			debugger;
			if(data == "false"){
				alert("스케줄 삭제에 오류가 발생했습니다.");
				return;
			}
			location.reload();	
			
		})
		.fail(function(){})
	})
});