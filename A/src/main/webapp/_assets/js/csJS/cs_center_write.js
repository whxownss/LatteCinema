/**
 * 
 */

$(document).ready(function() {
      // 지역명 불러오기.
      $.ajax({
  	    url: 'getRegionList.cs',  // 서버의 URL을 입력
  	    type: 'GET',  // 요청 유형을 'GET'으로 설정
  	    success: function(response) { //response에 내가 가져온 json값이 있음.
//   	    	debugger;
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
	$('#locationSelect').change(function() {
		 $.ajax({
	  	    url: 'getCinemaList.cs',  // 서버의 URL을 입력
	  	    type: 'GET',  // 요청 유형을 'GET'으로 설정
	  	    data: {'loIdx': $('#locationSelect').val()},
	  	    success: function(response) {
	   	    	//debugger;
	  	        // 서버로부터 응답을 성공적으로 받았을 때 실행될 코드
	  	        // 예: 받은 데이터를 페이지에 표시
	  	        var cinemas = response;
	  	        $('#cinemaSelect').empty();
				//$('#cinemaSelect').append($('<option>전체</option>')); // 이거 빼기로 했음. 나중에 확인해보기.
	  	        cinemas.forEach(function(cinema) {
					//debugger;
	  	            $('#cinemaSelect').append($('<option></option>').val(cinema.ciIdx).text(cinema.ciName));
	  	        });
	  	            $('#textSpan').text(cinemas[0].ciName);
	  	    },
	  	    error: function() {
	  	        // 요청 처리 중 오류가 발생했을 때 실행될 코드
	  	        alert("요청 중 오류가 발생했습니다.");
	  	    }
	  	});
	});
	$('#cinemaSelect').change(function(){
		//debugger;
		var cinemaName = $('#cinemaSelect').find('option:selected').text();
		$('#textSpan').text(cinemaName);
	});
	$('#submitCenter').on("click",function(e){
		if($('#locationSelect').val()===''){
			alert('지역을 선택하세요')
			e.preventDefault();
			console.log('영화관이름' + $('#cinemaSelect').val())
		} else if($('#cinemaSelect').val()===''){
			alert('영화관을 선택하세요')
			e.preventDefault();
		} else if($("#centerSubject").val() === ''){
			alert('제목을 입력하세요.')
			e.preventDefault();
		} else if($("#centerContent").val() === ''){
			alert('내용을 입력하세요.')
			e.preventDefault();
		}
		
	});
});//

