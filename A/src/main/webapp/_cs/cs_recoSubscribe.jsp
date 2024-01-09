<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h5>옛날 영화 추천 신청</h5>
					<div>
						<a href="cs_center.cs" class="more" style="font-size: 16px;">
							나가기
						</a>
					</div>
				</div>
			</div>
		</section>
		  
		<section class="category-section" id="">
			<div class="container bg-light" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				  <div class="row">
				    <div class="col-md-6 offset-md-3">
				      <div class>
				        <ul class="d-flex flex-wrap justify-content-between mb-4">
				          <li>라떼시네마 옛날영화 추천 신청서 입니다.</li>
				        </ul>
				      </div>
				    </div>
				  </div>
			</div>
		</section>
	
		<section class="category-section" id="">
			<div class="container bg-light" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="row justify-content-center">
			      <div class="col-lg-4 col-md-8 col-sm-10">
			        <h2 class="text-center">신청</h2>
			        <form action="insertRecommend.cs" method="post">
			          <div class="form-group mb-3">
			            <label for="createUser">신청자명</label>
			            <input type="text" class="form-control" id="createUser" name="createUser" value="${sessionScope.sId }" readonly>
			          </div>
<!-- 			          <div class="form-group mb-3"> -->
<!-- 			            <label for="password">비밀번호</label> -->
<!-- 			            <input type="password" class="form-control" id="password" placeholder="비밀번호 입력"> -->
<!-- 			          </div> -->
			          <div class="form-group mb-3">
			            <label for="movieName">신청영화</label>
			            <input type="text" class="form-control" name="movieName" id="movieName" list="movieList">
			            <datalist id="movieList">
<!-- 				           	<option>영화1</option> -->
<!-- 				           	<option>영화2</option> -->
<!-- 				           	<option>영화3</option> -->
<!-- 				           	<option>영화4</option> -->
<!-- 				           	<option>서울4</option> -->
<!-- 				           	<option>서울4</option> -->
<!-- 				           	<option>서울4</option> -->
<!-- 				           	<option>서울4</option> -->
				        </datalist>
<!-- 			            <input type="text" class="form-control" id="movieName" name="movieName" placeholder="영화명 입력"> -->
			          </div>
			          <div class="form-group mb-3">
			            <label for="director">감독</label>
			            <input type="text" class="form-control" id="director" name="director" placeholder="">
			          </div>
			          <div class="form-group mb-3">
			            <label for="agreement">신청 시 주의 사항</label>
			            <div>
				            <textarea class="form-control" id="agreement" style="overflow: auto; height: 100px;" readonly>만약 다른 분이 이미 작성한 제안 글이 있는 경우, 새로운 글을 작성하시는 것보다 기존 글을 추천해주시는 게 상영 확률이 높아집니다.</textarea>
			            </div>
			          </div>
<!-- 			          <div class="checkbox checkbox-styled" style="margin-bottom: 20px;"> -->
<!-- 							<label> -->
<!-- 								<input type="checkbox" autocomplete="off"> -->
<!-- 								<span>개인정보 수집 및 이용에 동의합니다.</span> -->
<!-- 							</label> -->
<!-- 					  </div> -->
					  <div class="d-flex justify-content-around">
					  <c:if test="${!empty sessionScope.sId }">
				          <div class="form-group mb-3 d-flex justify-content-center">
							  <button type="submit" class="btn btn-primary">작성</button>
						  </div>
						   <div class="form-group mb-3 d-flex justify-content-center">
							  <button type="reset" class="btn btn-outline-secondary">취소</button>
						  </div>
					  </c:if>	  
			          </div>	
			        </form>
			      </div>
				
				</div>
			</div>	
		</section>	
	</main>
	
<%@include file="../_common/commonFooterStart.jsp"%>
<script src="./jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    var serviceKey = "L5BI6RFWUZ7B4WG0K4U6";
    var base_url = "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml2.jsp";
    var releaseStart = "19990101";
    var releaseEnd = "19991231";
    var listCount = 100; // 한 페이지당 결과 수

    function fetchTotalCount(callback) {
        var parameters = "?collection=kmdb_new2&detail=N&ServiceKey=" + serviceKey + "&releaseDts=" + releaseStart + "&releaseDte=" + releaseEnd + "&listCount=1";
        $.ajax({
            url: base_url + parameters,
            type: 'GET',
            dataType: 'xml',
            success: function(response) {
                var totalCount = $(response).find('TotalCount').text();
                var totalPages = Math.ceil(totalCount / listCount);
                callback(totalPages);
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
            }
        });
    }

    function fetchMoviesByReleaseYear(page) {
        var startCount = (page - 1) * listCount;
        var parameters = "?collection=kmdb_new2&detail=N&ServiceKey=" + serviceKey + "&releaseDts=" + releaseStart + "&releaseDte=" + releaseEnd + "&listCount=" + listCount + "&startCount=" + startCount;
        $.ajax({
            url: base_url + parameters,
            type: 'GET',
            dataType: 'xml',
            success: function(response) {
                $(response).find('Row').each(function() {
                    var title = $(this).find('title').text();
                    $('#movieList').append($('<option>').text(title));
                });
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
            }
        });
    }

    fetchTotalCount(function(totalPages) {
        for (var page = 1; page <= totalPages; page++) {
            fetchMoviesByReleaseYear(page);
        }
    });
});

$('#movieName').on("change", function() {
    var serviceKey = "L5BI6RFWUZ7B4WG0K4U6";
    var base_url = "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml2.jsp";
    var releaseStart = "19990101"; // 검색 시작 개봉연도
    var releaseEnd = "19991231";   // 검색 종료 개봉연도
    var movieName = encodeURIComponent($('#movieName').val());

    function fetchMoviesByReleaseYear(start, end) {
        var parameters = "?collection=kmdb_new2&detail=N&ServiceKey=" + serviceKey + "&releaseDts=" + start + "&releaseDte=" + end + "&title=" + movieName;
        var url = base_url + parameters;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'xml',
            success: function(response) {
                $(response).find('Row').each(function() {
                    // 감독 이름 추출
                    var directorNames = [];
                    $(this).find('directors director').each(function() {
                        directorNames.push($(this).find('directorNm').text());
                    });
                    console.log("Directors: " + directorNames.join(", "));
                    $('#director').val(directorNames.join(", "));
                });
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
            }
        });
    }

    fetchMoviesByReleaseYear(releaseStart, releaseEnd); // 특정 개봉연도의 영화 데이터 불러오기
});




</script>
<%@include file="../_common/commonFooterEnd.jsp"%>