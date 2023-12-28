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
					<option value="1">서울</option>
					<option value="2">경기/인천</option>
					<option value="3">경남/부산/울산</option>
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
	    "1": [{value: "1", text: "강남"}, {value: "2", text: "여의도"}, {value: "3", text: "종로"}], // 서울
	    "2": [{value: "1", text: "수원"}, {value: "2", text: "인천"}, {value: "3", text: "부천"}], // 경기/인천
	    "3": [{value: "1", text: "서면"}, {value: "2", text: "해운대"}, {value: "3", text: "울산"}]  // 경남/부산/울산
};

$('#locationSelect').change(function() {
	  var selectedRegion = $(this).val();
	  if(selectedRegion == '지역'){
		  $('#textSpan').text('전체');
	  }
	  updateMovieSelect(selectedRegion);
});

function updateMovieSelect(regionNumber) {
    var movieSelect = $('#movieSelect');
    movieSelect.empty(); // 기존 옵션 제거

    if (theatersByRegion[regionNumber]) {
        theatersByRegion[regionNumber].forEach(function(theater) {
            movieSelect.append($('<option>', {
                value: theater.value, // 숫자를 value로 설정
                text: theater.text    // 영화관 이름을 텍스트로 설정
            }));
        });
//         debugger; //theatersByRegion[1][1] -> 서울의 강남이 나오는 듯 다시 확인 필요
    } else {
        movieSelect.append($('<option>', {
            value: '0',
            text: '전체'
        }));
    }
}


//셀렉트 박스 값이 변경될 때 이벤트 리스너를 추가합니다.
// 셀렉트 박스 값이 변경될 때 이벤트 리스너를 추가합니다.
$('#movieSelect').change(function() {
    const selectedText = $(this).find('option:selected').text(); // 선택된 영화관의 이름
    $('#textSpan').text(selectedText);  // 이름을 텍스트로 표시
    debugger;
});


</script>	
<%@include file ="../_common/commonFooter.jsp" %>