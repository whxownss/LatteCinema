// var cinemaList = ${cinemaListJson};

$(function(){
	
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
				$("#screen").append("<option value='" + e.scrIdx + "'>" + e.scrIdx + "관 (" + e.scrSeat +"석)</option>");
			});
		})
		.fail(function(){})
	});
	
	
	// 상영관 선택시 아래에 좌석 수 표시
	$(document).on("change", "#screen", function(){
		if($(this).val() == "0"){
			$("#seatNum").val("");
			debugger;
			return;
		}
		
		var loIdx = $("#location").val();
		var ciIdx = $("#cinema").val();
		var scrIdx = $("#screen").val();
		
		$.ajax({
			type: "GET",
			url: "adm_locationPro.ad",
			data: {
				loIdx: loIdx,
				ciIdx: ciIdx,
				scrIdx: scrIdx
			},
			dateType: "text"
		})
		.done(function(data){
			debugger;
			$("#seatNum").val(data);
		})
		.fail(function(){})
	})
	
	
	// 좌석 수정 db 작업
	$(document).on("click", "#updateScrBtn", function(){
		
		var inputVal = parseInt($("#seatNum").val());
		
		if(inputVal > 234) {
			alert("좌석은 최대 234개까지만 가능합니다.");
			return;
		}
		if(inputVal % 18 != 0) {
			alert("좌석은 18개 단위로만 가능합니다.");
			inputVal -= inputVal % 18;
			$("#seatNum").val(inputVal);
			return;
		}
		
		var loIdx = $("#location").val();
		var ciIdx = $("#cinema").val();
		var scrIdx = $("#screen").val();
		var scrSeat = $("#seatNum").val();

		if(scrIdx == "0") return;
		
		$.ajax({
			type: "POST",
			url: "adm_locationProUS.ad",
			data: {
				loIdx: loIdx,
				ciIdx: ciIdx,
				scrIdx: scrIdx,
				scrSeat: scrSeat
			},
			dateType: "text"
		})
		.done(function(data){
			debugger;
			location.reload();
			
		})
		.fail(function(){
			debugger;
		})
	})
	
	// 상영관 추가
	$(document).on("click", ".addScrBtn", function(){
		debugger;
		
		if($(this).val() == "0"){
			debugger;
			return;
		}
		var loIdx = $(this).parent().parent().find("[class^='lo']").text();
		var ciIdx = $(this).parent().parent().find("[class^='ci']").text();
		
		debugger;
		
		$.ajax({
			type: "POST",
			url: "adm_locationProAS.ad",
			data: {
				loIdx: loIdx,
				ciIdx: ciIdx,
			},
			dateType: "text"
		})
		.done(function(data){
			debugger;
			location.reload();
		})
		.fail(function(){})	
	})
	
	
	// 상영관 삭제
	$(document).on("click", ".deleteScrBtn", function(){
		debugger;
		if($(this).parent().find(".screen").val() == "0"){
			debugger;
			
			return;
		}
		var loIdx = $(this).parent().parent().find("[class^='lo']").text();
		var ciIdx = $(this).parent().parent().find("[class^='ci']").text();
		var scrIdx = $(this).parent().find(".screen").val();
		debugger;
		$.ajax({
			type: "POST",
			url: "adm_locationProDS.ad",
			data: {
				loIdx: loIdx,
				ciIdx: ciIdx,
				scrIdx: scrIdx
			},
			dateType: "text"
		})
		.done(function(data){
			debugger;
			location.reload();
		})
		.fail(function(){})	
	})
	
	
	// 영화관 오픈 클로즈
	$(document).on("change", ".OC", function(){
		debugger;
		
		var loIdx = $(this).parent().parent().find("[class^='lo']").text();
		var ciIdx = $(this).parent().parent().find("[class^='ci']").text();
		var ciOC = $(this).val();
		debugger;
		
		$.ajax({
			type: "POST",
			url: "adm_locationProOC.ad",
			data: {
				loIdx: loIdx,
				ciIdx: ciIdx,
				ciOC: ciOC
			},
			dateType: "text"
		})
		.done(function(data){
			debugger;
			location.reload();
		})
		.fail(function(){})
	})
	
	
	
	
	
	
	
//	$(document).on("change", ".screen", function(){
//		if($(this).val() == "0"){
//			debugger;
//			$(this).parent().parent().find(".seatNum").val("");
//			$(this).parent().parent().find(".seatNum").attr("readonly", true);
//			$(this).parent().parent().find("#updateBtn").attr("disabled", true);
//			return;
//		}
//		
//		debugger;
//		var loIdx = $(this).parent().find("[class^='lo']").text();
//		var ciIdx = $(this).parent().find("[class^='ci']").text();
//		var scrIdx = $(this).val();
//		
//		var me = this;
//		debugger;
//		
//		$.ajax({
//			type: "GET",
//			url: "adm_locationPro.ad",
//			data: {
//				loIdx: loIdx,
//				ciIdx: ciIdx,
//				scrIdx: scrIdx
//			},
//			dateType: "text"
//		})
//		.done(function(data){
//			debugger;
//			$(me).parent().parent().find(".seatNum").val(data);
//			$(me).parent().parent().find(".seatNum").attr("readonly", false);
//			$(me).parent().parent().find("#updateBtn").attr("disabled", false);
//		})
//		.fail(function(){})
//	})
	
	
	
});
