/**
 * 
 */
$(document).ready(function(){
    // 지역명 불러오기.
    $.ajax({
	    url: 'getRegionList.cs',  // 서버의 URL을 입력
	    type: 'GET',  // 요청 유형을 'GET'으로 설정
	    success: function(response) { //response에 내가 가져온 json값이 있음.
// 	    	debugger;
	        // 서버로부터 응답을 성공적으로 받았을 때 실행될 코드
	        // 예: 받은 데이터를 페이지에 표시
	        var regions = response;
	        regions.forEach(function(region) {
	            // 각 지역에 대한 새로운 <option> 요소를 생성하고 <select>에 추가
	            // 'region' 객체의 구조에 따라 'region.value'와 'region.name'를 적절히 조정
	            $('#locationSelect').append($('<option></option>').val(region.loIdx).text(region.loName));
	        });
	    },
	    error: function() {
	        // 요청 처리 중 오류가 발생했을 때 실행될 코드
	        alert("요청 중 오류가 발생했습니다.");
	    }
	});
    
    $('#lostSubmit').on('click',function(e){
    	if($('#locationSelect').val() === '' || $('#cinemaSelect').val() === ''){
    		e.preventDefault();
		    alert('지역 및 영화관을 선택해주세요.');
    	} else if($('#lostSubject').val()===''){
			e.preventDefault();
			alert('제목을 입력하세요')
		} else if($('#lostContent').val()===''){
			e.preventDefault();
			alert('내용을 입력하세요')
		} else {
   	        var isConfirmed = confirm("정말로 제출하시겠습니까?"); // 다이얼로그 표시
   	        if (isConfirmed) {
   	            // 사용자가 확인을 선택한 경우
   	            // 여기에서 제출 동작을 수행하거나 다음 단계로 이동할 수 있습니다.
   	            $('#insertLostForm').submit();
   	        } else {
   	            // 사용자가 취소를 선택한 경우
   	            // 아무 동작 없음 또는 원하는 작업을 수행하세요.
   	        	e.preventDefault();
   	        }
    	}
    });

});
$('#locationSelect').change(function() {
	 $.ajax({
 	    url: 'getCinemaList.cs',  // 서버의 URL을 입력
 	    type: 'GET',  // 요청 유형을 'GET'으로 설정
 	    data: {'loIdx': $('#locationSelect').val()},
 	    success: function(response) {
 	        // 서버로부터 응답을 성공적으로 받았을 때 실행될 코드
 	        // 예: 받은 데이터를 페이지에 표시
 	        var cinemas = response;
//  	        $('#cinemaSelect').empty();
//  	        $('#cinemaSelect').append($('<option>전체</option>'));
 	        cinemas.forEach(function(cinema) {
//  	        	debugger;
 	            $('#cinemaSelect').append($('<option></option>').val(cinema.ciIdx).text(cinema.ciName));
 	        });
 	    },
 	    error: function() {
 	        // 요청 처리 중 오류가 발생했을 때 실행될 코드
 	        alert("요청 중 오류가 발생했습니다.");
 	    }
 	});
});
