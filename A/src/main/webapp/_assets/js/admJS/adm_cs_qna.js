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

	$("tr a[data-toggle='modal']").on("click", function () {
// 		debugger; // 문제점은 공지사항 내용쪽 텍스트가 공백이 너무 많아서 터져버림.
	    // data-info 속성에서 JSON 데이터 가져오기
	    var infoData = $(this).data("info");
	    console.log(typeof infoData); //1번째 글은 Object타입, 서면입력글은 string으로 잡힘.
	    
	    //Object면 String으로 바꾸고 String이면 그냥 통과해서 replaceAll 가능하게 함.
	    if(typeof infoData != 'string'){
	    	infoData = JSON.stringify(infoData);	
	    }
		
		console.log(infoData);
	    if (infoData.includes("\n")) {
	        // \n이 포함되어 있다면, replaceAll을 사용하여 모두 제거
	        infoData = infoData.replaceAll("\n", "");
	    }
	    if (infoData.includes("\t")) {
	    	infoData = infoData.replaceAll("\t", "");
	    }
// 	    infoData = infoData.replaceAll("\n", "");
// 	    infoData = infoData.replaceAll("\t", "");
	    infoData = JSON.parse(infoData);
	
	    // 필요한 정보 추출
	    var key1 = infoData.key1;
	    var key2 = infoData.key2;
	    var key3 = infoData.key3;
	    var key4 = infoData.key4;
	    var key5 = infoData.key5;
	    var key6 = infoData.key6;
	
	    // 추출한 정보를 출력하거나 다른 작업 수행
	    console.log("Key1:", key1);
	    console.log("Key2:", key2);
	    console.log("Key3:", key3);
	    console.log("Key4:", key4);
	    console.log("Key5:", key5);
	    console.log("Key6:", key6);
	
        if (infoData) {
            // 필요한 정보 추출
            $("#qnaCategory").val(infoData.key3); // 
            $("#recipient-name").val(infoData.key1); // a 태그에서 가져온 정보
            $("#message-text").text(infoData.key2); // a 태그에서 가져온 정보
            $("#qnaUser").val(infoData.key4);
            $("#qnaDate").val(infoData.key5);
            $("#qnaResponse").val(infoData.key6);
        } else {
            console.log("data-info not found");
        }
	    // 또는 다른 작업을 수행
	    // 예를 들어, 모달을 열거나 다른 페이지로 이동
	});//tr 누르면 모달 토글		
	$('#deleteQnaBoard').on("click",function(){
		if(confirm('정말 삭제하시겠습니까?')){
			alert('삭제완료');
			window.location.href = 'deleteQnaBoard.cs?createUser=' + $('#qnaUser').val() + '&createDate=' + $("#qnaDate").val();
		} else {
			alert('삭제를 취소하셨습니다.');
		}
	});
