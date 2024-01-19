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



	$("#datatable-responsive tbody").on("click","tr a",function(e) { //동일한 "tr a" 선택자를 다른 이벤트에도 사용해야 할 경우 선택자를 중복해서 작성하지 않아도 됩니다.
	    e.preventDefault(); // 앵커 태그의 기본 동작을 막습니다.
	    // 클릭한 앵커 태그와 연관된 가장 가까운 테이블 행 (tr)을 찾습니다.
	    var $row = $(this).closest("tr");
	    // 해당 행 안에 있는 'memId' 셀의 텍스트 내용
	    var memId = $row.find("td:first-child").text();
	    // 이제 'memId' 변수에 클릭된 행의 'memId'가 포함되어 있습니다.
	    //alert("클릭한 memId: " + memId);
	    // 클릭한 앵커 태그의 텍스트 내용을 가져옵니다.
	    var memStatusText = $(this).text();
	    // 이제 'clickedText' 변수에 클릭한 앵커 태그의 텍스트가 포함되어 있습니다.
	    //alert("클릭한 앵커 태그의 텍스트: " + memStatus);
	    
	    // 데이터를 JavaScript 객체에 저장합니다.
	    var msg = '';
	    var memStatus = '1';
	    if(memStatusText === 'Yes'){
	    	msg = '해제';
	    	memStatus = '0';
	    }
	    
	    var data = {
	      memId: memId,
	      memStatus: memStatus
	    };
	    if(!confirm(memId+'회원을 정지'+msg+' 하시겠습니까?')){
	    	alert('취소하셨습니다.');	
	    	return;
	    }
		// AJAX 요청을 생성
	    $.ajax({
	      type: "POST",
	      url: "memStatusChange.ad",
	      data: data, // 전송할 데이터
	      success: function(response) {
	        console.log("데이터 전송 완료");
	        //window.location.href="adm_member.me";
	        // 두 번째 AJAX 요청
	        $.ajax({
        	  type: "GET",
        	  url: "adm_member.ad",
        	  data: { memStatusText: memStatusText },
        	  dataType: "json", //dataType을 명시적으로 설정하여 JSON 데이터로 처리
        	  success: function(userList) {
        		  $('#tbody').empty();
        		  userList.forEach(function(user){
        		      var memId = user.memId;
        		      var memName = user.memName;
        		      var memAddress = user.memAddress;
        		      var memBirthD = user.memBirthD;
        		      var memJoinD = user.memJoinD;
        		      var memPhone = user.memPhone;
        		      var memEmail = user.memEmail;
        		      var memStatus = user.memStatus;
        		      if(memStatus == '0'){
        		    	  memStatus = 'No';
        		      } else {
        		    	  memStatus = 'Yes';
        		      }
        		      var memStopD = user.memStopD;
        		      
        		      var newRow = $('<tr></tr>');
        		      newRow.append($('<td></td>').text(memId));  
        		      newRow.append($('<td></td>').text(memName));  
        		      newRow.append($('<td></td>').text(memAddress));  
        		      newRow.append($('<td></td>').text(memBirthD));  
        		      newRow.append($('<td></td>').text(memJoinD));  
        		      newRow.append($('<td></td>').text(memPhone));  
        		      newRow.append($('<td></td>').text(memEmail));  
        		      newRow.append($('<td></td>').html("<a>"+memStatus+"</a>"));  
        		      newRow.append($('<td></td>').text(memStopD));  
        		      $('#tbody').append(newRow);

        		  });
        	  },
        	  error: function() {
        	    console.error("데이터 요청 실패");
        	  }
        	});
	      },
	      error: function() {
	        // 요청이 실패한 경우 실행할 코드를 여기에 작성
	        console.error("데이터 전송 실패");
	      }
	    });
	    
	});//datatable-responsive tbody tr a 끝

