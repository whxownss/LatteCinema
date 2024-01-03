<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<%
String createUser = "MEMBER2477";
%>			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>분실물 문의</h2>
					<div>
						<a href="cs_lost.cs" class="more" style="font-size: 17px;">
							나가기
						</a>
					</div>
				</div>
			</div>
		</section>
		  
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up" style="width: 50%;">
				<form action="insertCsLost.cs" id="insertLostForm">
					<table class="table table-bordered border-secondary-subtle">
					  <tbody>
					    <tr>
					      <td class="table-secondary">분실장소</td>
					      <td>
						      <select class="form-select" id="locationSelect" name="loIdx">
						        <option selected class="text-muted" value="">지역 선택</option>
						      </select>		
					      </td>
					      <td>
					      	<select class="form-select" id="cinemaSelect" name="ciIdx">
					        	<option selected class="text-muted" value="">영화관 선택</option>
					      	</select>
					      </td>
					      <td></td>
					    </tr>
					    <tr>
					      <td class="table-secondary">아이디</td>
					      <td colspan="3"><input class="form-control" name="createUser" type="text" value="<%=createUser%>" readonly></td>
					    </tr>
<!-- 					    <tr> -->
<!-- 					      <td class="table-secondary">연락처</td> -->
<!-- 					      <td><input class="form-control" type="text" placeholder="숫자만 입력하세요."></td> -->
<!-- 					      <td class="table-secondary">이메일</td> -->
<!-- 					      <td><input type="text" class="form-control" placeholder="name@example.com 같은 형식으로 입력하세요."></td> -->
<!-- 					    </tr> -->
					    <tr>
					      <td class="table-secondary">제목</td>
					      <td colspan="3"><input class="form-control" name="lostSubject" type="text" placeholder="제목을 입력하세요."></td>
					    </tr>
					    <tr>
					      <td class="table-secondary">내용</td>
					      <td colspan="3"><textarea class="form-control" name="lostContent" placeholder="내용을 입력하세요." style="height: 100px"></textarea></td>
					    </tr>
<!-- 					    <tr> -->
<!-- 					      <td class="table-secondary">비밀번호</td> -->
<!-- 					      <td><input class="form-control" type="password" placeholder="비밀번호를 입력하세요."></td> -->
<!-- 					      <td colspan="2" class="text-danger">*분실물에 대한 고객정보 보호를 위하여 게시글의 비밀번호를 설정하시오.</td> -->
<!-- 					    </tr> -->
					  </tbody>
					</table>
					<div class="d-flex justify-content-around">
						  <div class="form-group mb-3 mr-auto">
						    <button type="submit" class="btn btn-primary" id="lostSubmit">작성</button>
						  </div>
						  <div class="form-group mb-3 ml-auto">
						    <button type="reset" class="btn btn-outline-secondary">취소</button>
						  </div>
					</div>
				</form>
			</div>
		</section>
		
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script src="./jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript">
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
</script>
<%@include file="../_common/commonFooterEnd.jsp"%>