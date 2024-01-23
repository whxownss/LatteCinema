 	document.write('<script type="text/javascript" '+ 
						'src="/' + window.location.pathname.split("/")[1] + '/_assets/js/movieJS/movie_viewVarFunc.js"></script>');
 
 $(function() {
	 			var sessionId = '<%=(String)session.getAttribute("sId")%>' 
	  // 한줄평 수정
	  if($("#viewComment").val() != ''){
		  $("button[name=revbtn]").attr('id','update')
		  $("button[name=revbtn]").text("수정");
		  $("#revDelete").attr("disabled" , false)
		  // 한줄평 수정
		  $("#update").on("click", function(){
				debugger;
				var viewcomment = $("#viewComment").val()
				// 세션값 
// 				var sessionId = "test1" 
				var title = "${detail.title}";
				var movIdx = ${detail.movieIdx};
				var movType = "${detail.movieCategory}";
			  	
				$.ajax({
					type: "post",
					url: "reviewUpdate.mo",
					data:{
						reComment : viewcomment,
						memId : sessionId,
						movCode: new URL(window.location.href).searchParams.get('movieCode')
					},
					dataType: "text"
				})
				.done(function(data){
					debugger;
					if(data == 'false'){
						alert('한줄평 수정 오류발생')
						return
					}
					location.reload();
				})

		  })
		
		  //한줄평 삭제
		  $("#revDelete").on("click", function(){
			  debugger;
			  $.ajax({
				  type: "post",
				  url: "reviewDelete.mo",
				  data:{
					  memId : sessionId
				  },
				  dateType: "text"
			  })
			  .done(function(data){
				  debugger;
				  if(data == 'false'){
					  alert('한줄평 삭제 오류발생')
					  return
				  }
				  location.reload();
			  })
		  })
		  
	  }
		// 관람평=====================================================================
		
		// 페이징처리작업
		$('#revTable').DataTable({
			pagingType: 'full_numbers',
			order: [[0, 'desc']]
		});	
		
		// 한줄평 작성가능 유무 판단
		$("#write").on("click", function(){
			debugger;
			var viewcomment = $("#viewComment").val()
			// 세션값 
			var sessionId = '<%=(String)session.getAttribute("sId")%>' 
// 			var sessionId = "test1" 
			var title = "${detail.title}";
			var movIdx = ${detail.movieIdx};
			var movType = "${detail.movieCategory}";
			if(sessionId == 'null'){
				alert('로그인 후 작성 가능합니다.');
				return;
			}
			
			debugger;
			$.ajax({
				type: "GET",
				url: "checkWrite.mo",
				data: {
					movIdx: movIdx,
					movType: movType,
					memId: sessionId
				},
				dateType: "text"
			})
			.done(function(data){
				//한줄평 데이터 넣기
				debugger;
				if(data != '0'){
					$.ajax({
						type: "post",
						url: "reviewInsert.mo",
						data: {
							revComment : viewcomment,
							memId : sessionId,
							movType: movType,
							movIdx: movIdx,
							title : title,
							movCode: new URL(window.location.href).searchParams.get('movieCode')
						},
						dataType: "text"
					})
					
					.done(function(data){
						if(data == '0'){
							alert('한줄평 작성 오류발생')
							return
						}
						location.reload();
					})
					
				}else{
					alert('관람내역이 없습니다 실관람 이후 작성가능합니다.')
				}
			})
			.fail(function(){
				debugger;
			})
			
			// 한줄평 수정 및 삭제
			
		});  
		// 한줄평=====================================================================	  
	  
    $(".btn-prev").on("click", function(e) {
      history.back();
    });
    
    $(".sticky").sticky({topSpacing: 20});
    
    // 메인배너 클릭시 영상 팝업
    $(".movie-open").on("click", function(e) {
      e.preventDefault();
      $("#videoMainTagSrc").attr("src", $(this).data("source"));
      $("#videoMainTag").attr("poster", $(this).data("poster"));
      $("#videoMainTag").get(0).load();
      $(".movie-popup").fadeIn(300);
      $("#videoMainTag").get(0).play();
    });
    $(".movie-popup .btn-close, .movie-popup .bg").on("click", function(e) {
      e.preventDefault();
      $("#videoMainTag").get(0).pause();
      $(".movie-popup").fadeOut(300);
    });
    
    $(".still-cut a").on("click", function(e) {
      e.preventDefault();
      var idx = $(".still-cut a").index(this);
      stillcutSwiper.slideTo(idx);
      $(".stillcut-fixed").fadeIn(300);
    });
    $(".stillcut-fixed .btn-close, .stillcut-fixed .bg").on("click", function(e) {
      e.preventDefault();
      $(".stillcut-fixed").fadeOut(300);
    });
  });