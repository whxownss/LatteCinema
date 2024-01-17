<%@page import="com.itwillbs.domain.LocationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<script src="./jQuery/jquery-3.6.0.js"></script>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
<%
ArrayList<LocationDTO> regionList = (ArrayList<LocationDTO>)request.getAttribute("regionList");
%>	
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>공지사항</h2>
					<div>
						<a href="cs_center.cs" class="more" style="font-size: 17px;">
							나가기
						</a>
					</div>
				</div>
			</div>
		</section>
		  
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				  <div class="row">
				    <div class="col-md-6 offset-md-3">
				      <div class="bg-light">
				        <ul class="d-flex flex-wrap justify-content-between list-unstyled">
				          <li><a href="cs_center.cs">공지사항</a></li>
				          <li><a href="cs_exque.cs">자주찾는질문</a></li>
				          <li><a href="cs_qna.cs">1:1문의</a></li>
				          <li><a href="cs_lost.cs">분실물</a></li>
				        </ul>
				      </div>
				    </div>
				  </div>
			</div>
		</section>
		
		<section class="category-section" id="">
		<form action="insertCenterWrite.cs" method="post" name="fr">
		<input type="hidden" name="createUser" value=${sessionScope.sId }>
			<div class="container" data-aos="fade-up">
				<select id="locationSelect" name="loIdx" class="form-select" aria-label="Default select example">
					<option selected value="">지역</option>
<!-- 					<option value="1">서울</option> -->
<!-- 					<option value="2">경기/인천</option> -->
<!-- 					<option value="3">경남/부산/울산</option> -->
				</select>
				<select id="cinemaSelect" name="ciIdx" class="form-select" aria-label="Default select example">
				  <option selected value="">영화관</option>
<!-- 				  <option value="전체">전체</option> -->

				</select>
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
				      <th scope="col">#</th>
				      <th scope="col">영화관</th>
				      <th scope="col">제목</th>
				      <th scope="col">등록일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row"></th>
				      <td style="width: 100px;"><span id="textSpan"></span></td>
				      <td><input type="text" id="centerSubject" name="centerSubject" style="width: 90%;" value="" placeholder="제목을 입력하세요."></td>
				      <td><span></span></td>
				    </tr>
				    <tr>
				    	<td colspan="4">
				    		<textarea class="form-control" id="centerContent" name="centerContent" placeholder="내용을 입력하세요." style="text-align: center; box-sizing: border-box; resize: none; height: 500px;"></textarea>
				   		</td>
				    </tr>
				    <tr>
				    	<td colspan="4">
				    		<div class="d-flex justify-content-around">
<!-- 					            <button class="btn btn-dark" type="button" onclick="check()">작성하기</button> -->
					            <button class="btn btn-dark" type="submit" id="submitCenter">작성하기</button>
					        </div>
				    	</td>
				    </tr>
				  </tbody>
				</table>
			</div>
			</form>
		</section>
		
		
	</main>

<%@include file="../_common/commonFooterStart.jsp"%>
<script type="text/javascript">
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
});//

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
	debugger;
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





</script>	
<%@include file="../_common/commonFooterEnd.jsp"%>