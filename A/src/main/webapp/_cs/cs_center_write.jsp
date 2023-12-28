<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file ="../_common/commonHeaderStart.jsp" %>
<script src="./jQuery/jquery-3.6.0.js"></script>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
			
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
			<div class="container" data-aos="fade-up">
				<select id="locationSelect" class="form-select" aria-label="Default select example">
					<option selected>지역</option>
					<option value="서울">서울</option>
					<option value="경기/인천">경기/인천</option>
					<option value="경남/부산/울산">경남/부산/울산</option>
				</select>
				<select id="movieSelect" class="form-select" aria-label="Default select example">
				  <option selected>영화관</option>
				  <option value="전체">전체</option>
				  <option value="서면">서면</option>
				  <option value="강남">강남</option>
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
				      <th scope="row">max+1</th>
				      <td style="width: 100px;"><span id="textSpan">전체</span></td>
				      <td><input type="text" style="width: 90%;" value="제목 입력하세요."></td>
				      <td><span>오늘날짜들어가야함.</span></td>
				    </tr>
				    <tr>
				    	<td colspan="4">
				    		<textarea class="form-control" style="text-align: center; box-sizing: border-box; resize: none; height: 500px;">
내용을 입력해주세요.
				    		</textarea>
				   		</td>
				    </tr>
				    <tr>
				    	<td colspan="4">
				    		<div class="d-flex justify-content-around">
					            <button class="btn btn-dark" type="button" onclick="location.href='cs_center_content.cs'">작성하기</button>
					        </div>
				    	</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</section>
		
		
	</main>
<script type="text/javascript">
$(document).ready(function() {
	  updateMovieSelect($('#locationSelect').val());
	  
      const selectedValue = $('#movieSelect').val();
      $('#textSpan').text(selectedValue);
});

const theatersByRegion = {
		  "서울": ["강남", "여의도", "종로"], // db값을 어떻게 받을까?
		  "경기/인천": ["수원", "인천", "부천"],
		  "경남/부산/울산": ["서면", "해운대", "울산"]
};
$('#locationSelect').change(function() {
	  var selectedRegion = $(this).val();
	  if(selectedRegion == '지역'){
		  $('#textSpan').text('전체');
	  }
	  updateMovieSelect(selectedRegion);
});
function updateMovieSelect(region) {
	  var movieSelect = $('#movieSelect');
	  movieSelect.empty(); // 기존 옵션 제거

	  if (theatersByRegion[region]) {
	    theatersByRegion[region].forEach(function(theater) {
	      movieSelect.append($('<option>', {
	        value: theater,
	        text: theater
	      }));
	    });
	  } else {
	    movieSelect.append($('<option>', {
	      text: '전체'
	    }));
	  }
}

//셀렉트 박스 값이 변경될 때 이벤트 리스너를 추가합니다.
// 셀렉트 박스 값이 변경될 때 이벤트 리스너를 추가합니다.
$('#movieSelect').change(function() {
    // 선택한 옵션의 값을 가져와서 span 태그의 텍스트 내용으로 설정합니다.
    const selectedValue = $(this).val();
    $('#textSpan').text(selectedValue);
});


</script>	
<%@include file ="../_common/commonFooter.jsp" %>