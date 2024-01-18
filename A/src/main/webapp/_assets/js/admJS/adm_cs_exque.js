/*jQuery*/
document.write('<script src="_admin/vendors/jquery/dist/jquery.min.js"></script>');
/*Bootstrap*/
document.write('<script src="_admin/vendors/bootstrap/dist/js/bootstrap.min.js"></script>');
/*FastClick*/
document.write('<script src="_admin/vendors/fastclick/lib/fastclick.js"></script>');
/*NProgress*/
document.write('<script src="_admin/vendors/nprogress/nprogress.js"></script>');
/*iCheck*/
document.write('<script src="_admin/vendors/iCheck/icheck.min.js"></script>');	
/*Datatables*/
document.write('<script src="_admin/vendors/datatables.net/js/jquery.dataTables.min.js"></script>');	
document.write('<script src="_admin/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>');	
document.write('<script src="_admin/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>');	
document.write('<script src="_admin/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>');	
document.write('<script src="_admin/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>');	
document.write('<script src="_admin/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>');	
document.write('<script src="_admin/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>');	
document.write('<script src="_admin/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>');	
document.write('<script src="_admin/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>');	
document.write('<script src="_admin/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>');	
document.write('<script src="_admin/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>');	
document.write('<script src="_admin/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>');	
document.write('<script src="_admin/vendors/jszip/dist/jszip.min.js"></script>');	
document.write('<script src="_admin/vendors/pdfmake/build/pdfmake.min.js"></script>');	
document.write('<script src="_admin/vendors/pdfmake/build/vfs_fonts.js"></script>');	
document.write('<script src="_admin/build/js/custom.min.js"></script>');	


	// 테이블의 각 행에 클릭 이벤트를 추가
	$("table tbody tr").on("click", function () {
	    // 클릭한 행에서 첫 번째 <td> 요소의 내용을 가져옴
	    var clickedNumber = $(this).find("td:first").text();

	    // 가져온 숫자 값을 출력하거나 다른 작업 수행
	    console.log("Clicked Number:", clickedNumber);

	    // 또는 다른 작업을 수행
	    // 예를 들어, 모달을 열거나 다른 페이지로 이동
	});
		
		$("tr a[data-toggle='modal']").on("click", function () {
		    // data-info 속성에서 JSON 데이터 가져오기
		    var infoData = $(this).data("info");
		    // 필요한 정보 추출
		    var key1 = infoData.key1;
		    var key2 = infoData.key2;
		    var key3 = infoData.key3;
		    var key4 = infoData.key4;
		    var key5 = infoData.key5;
		
		    // 추출한 정보를 출력하거나 다른 작업 수행
		    console.log("Key1:", key1);
		    console.log("Key2:", key2);
		    console.log("Key3:", key3);
		    console.log("Key4:", key4);
		    console.log("Key5:", key5);
		
	        if (infoData) {
	            // 필요한 정보 추출
	            $("#modalSelect").val(infoData.key3); // select 옵션 선택 받기
	            $("#recipient-name").val(infoData.key1); // a 태그에서 가져온 정보
	            $("#message-text").text(infoData.key2); // a 태그에서 가져온 정보
	            $("#exqUser").val(infoData.key4);
	            $("#exqDate").val(infoData.key5);
	        } else {
	            console.log("data-info not found");
	        }
		    // 또는 다른 작업을 수행
		    // 예를 들어, 모달을 열거나 다른 페이지로 이동
		});
	
	 // <a> 태그가 클릭되었을 때 실행할 함수
	 // #openModal 대신 "tr:eq(1) td:eq(2)" 사용해보자
// 	    $("tr:eq(1) td:eq(2)").click(function() {
// 	    	alert("이벤트 연결 성공");
// 	        // 현재 클릭된 td 요소에 있는 a 태그에서 data-info 속성 가져오기
// 	        var infoData = $(this).find("a").data("info");

// 	        if (infoData) {
// 	            // 필요한 정보 추출
// 	            $("#modalSelect").val(infoData.key3); // select 옵션 선택 받기
// 	            $("#recipient-name").val(infoData.key1); // a 태그에서 가져온 정보
// 	            $("#message-text").text(infoData.key2); // a 태그에서 가져온 정보
// 	        } else {
// 	            console.log("data-info not found");
// 	        }
// 	    });
	 	//수정 모달 수정 버튼 클릭
	 	$("#modalRewrite").on("click",function(){
	 		alert("이벤트 연결 성공");
// 	 	// 실제 값으로 subject, content, select 값을 대체하세요
// 	 	    // anchorString을 생성합니다.
// // 	 	    var anchorString = '<a data-toggle="modal" data-target="#myModal" data-info=\'{"key1": "' + subject + '", "key2": "' + content + '", "key3": "' + select + '"}\'>';
// 	 	    var anchorString = '<a data-toggle="modal" data-target="#myModal" data-info=\'{"key1": "' + $("#recipient-name").val() + '", "key2": "' + content + '", "key3": "' + $("#modalSelect").val() + '"}\'>';

// 	 	    console.log(anchorString);

// 	 	    // <td> 요소의 내용을 설정합니다.
// 	 	    $("tr:eq(1) td:eq(1)").text($("#modalSelect").val());
// 	 	    $("tr:eq(1) td:eq(2)").html(anchorString + $("#recipient-name").val() + '</a>');

// 	 	    // 모달을 숨깁니다.
// 	 	    $("#myModal").modal('hide');
	 	});
	 	
	 	// 추가 버튼 누르면 새로운 행 추가 하기
	 	$("#insertRow").on("click", function () {
	 		alert('추가 버튼 이벤트 연결확인');
	 		if(confirm("추가하시겠습니까?")){
	 			alert("정상적으로 추가되었습니다.");
	 			window.location.href = 'cs_insertExqBoard.cs?createUser=' + $("#insertUser").val() + '&exqSelect=' + $("#insertSelect").val() + '&exqSubject=' + $("#insertSubject").val() + '&exqContent=' + $("#insertContent").val();
	 		}else{
	 			alert("추가가 취소되었습니다.");
	 		}
	 	});
	 	
	 	// 모달 창에서 삭제 버튼 클릭.
	 	$("#deleteExqBoard").on("click",function(){
	 		alert('삭제 버튼 이벤트 연결확인');
	 		
	 		if(confirm("삭제하시겠습니까?")){
	 			alert("정상적으로 삭제되었습니다.");
	 			window.location.href = 'cs_deleteExqBoard.cs?createUser=' + $("#exqUser").val() + '&createDate=' + $("#exqDate").val();
	 		}else{
	 			alert("삭제가 취소되었습니다.");
	 		}
	 	});
	
