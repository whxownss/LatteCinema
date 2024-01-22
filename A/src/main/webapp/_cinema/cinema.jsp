<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/cinema.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/cinema.css">
	<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

<%-- 현재 JSP 파일에만 해당하는 스타일시트 링크 추가 --%>
<script>

$(function(){
	$('.sel-city').on('click', function() {

		$("div.theater-place li.on").removeClass('on');
		$(this).parent().addClass('on');

		var _h1 = $('.user-theater').outerHeight();
		var _h2 = $('.theater-place').outerHeight();
		var _h0 = $("div.theater-place li.on .theater-list").outerHeight();
		var _hAll = _h0 + _h1 + _h2;

		$('.theater-box').outerHeight(_hAll);
	});
	
	$('.theater-list ul li').click(function(){
		if($(this).html() == '서면'){
			$('.place').css("display", "block")
		}
		else {
			alert("선택하신 지점은 오픈 준비 중입니다.\n서면점만 선택 가능합니다.");
		}
  })
});



</script>
<style>
.theater-list ul li{cursor: pointer;}
</style>
<%-- 현재 JSP 파일의 내용들... --%> 

<main id="main">
  <section class="category-section">
			<div class="container" data-aos="fade-up">
				
				
				<div id="contents" class="no-padding" style="margin-bottom: 300px;">

		
		<!--// theater-main -->

		<div class="inner-wrap">
			
				
			

			<h2 class="tit mt40">전체극장</h2>

			<div class="theater-box">
				<div class="theater-place">
					<ul id="cinema_ul">
						
					   <li>
								<button type="button" class="sel-city">서울
									
								</button>

									<div class="theater-list">
										<ul>
		                  <li>건대입구</li>
		                  <li>김포공항</li>
		                  <li>서울대입구</li>
		                  <li>수유</li>
		                  <li>영등포</li>
		                  <li>합정</li>
		                  <li>홍대입구</li>
                </ul>
									</div>
							</li>
						
							<li>
								<button type="button" class="sel-city">경기/인천
									
								</button>

								<div class="theater-list">
									 <ul>
                  <li>광교아울렛</li>
                  <li>동탄</li>
                  <li>부천</li>
                  <li>부평</li>
                  <li>수원</li>
                  <li>안산</li>
                  <li>의정부</li>
                  <li>인천터미널</li>
                  <li>평택</li>
                </ul>								</div>
							</li>
						
							<li>
								<button type="button" class="sel-city">충청/대전
									
								</button>

								<div class="theater-list">
								<ul>
                  <li>당진</li>
                  <li>대전</li>
                  <li>서산</li>
                  <li>서청주</li>
                  <li>충주</li>
                </ul>
								</div>
							</li>
						
							<li>
								<button type="button" class="sel-city">전라/광주
									
								</button>

								<div class="theater-list">
								  <ul>
                  <li>광주</li>
                  <li>군산</li>
                  <li>익산모현</li>
                  <li>전주</li>
                  <li>충장로</li>
                </ul>
								</div>
							</li>
						
							<li>
								<button type="button" class="sel-city">경북/대구
									
								</button>

								<div class="theater-list">
									<ul>
                  <li>경주</li>
                  <li>구미공단</li>
                  <li>대구광장</li>
                  <li>동성로</li>
                  <li>상주</li>
                  <li>영천</li>
                  <li>포항</li>
                </ul>
								</div>
							</li>
						
							<li class="on">
								<button type="button" class="sel-city">경남/부산/울산
									
								</button>

								<div class="theater-list">
									<ul>
                  <li>거창</li>
                  <li>김해부원</li>
                  <li>동래</li>
                  <li>마산</li>
                  <li>부산명지</li>
                  <li>부산본점</li>
                  <li>서면</li>
                  <li>센텀시티</li>
                  <li>울산</li>
                  <li>진해</li>
                  <li>창원</li>
                </ul>
								</div>
							</li>
						
							<li>
								<button type="button" class="sel-city">강원
									
								</button>

								<div class="theater-list">
								<ul>
                  <li>남원주</li>
                  <li>동해</li>
                  <li>원주무실</li>
                  <li>춘천</li>
                </ul>
								</div>
							</li>
						
							<li>
								<button type="button" class="sel-city">제주
									
								</button>

								<div class="theater-list">
								<ul>
                  <li>서귀포</li>
                  <li>제주아라</li>
                  <li>제주연동</li>
                </ul>
								</div>
							</li>
						
					</ul>
				</div>
				</div>
				
				
				
		<!-- 영화관 위치 -->
			<div class="place" style="display: none">
			        <h2 class="tit mt40">영화관 위치</h2>
			        영화관 정보
			        <div class="theater-place">
			            <h3 class="tit">서면</h3>
			            <dl class="theater_info">
			                <dt>총 상영관 수</dt>
			                <dd>5개관</dd>
			                <dt>총 좌석수</dt>
			                <dd>500석</dd>
			                <dt class="adr">주소</dt>
			                <dd class="adr">부산광역시 부산진구 부전동 동천로 109 삼한골든게이트 7층</dd>
			            </dl>
			            <ul class="pop_wrap">
			                <li><a href="#layerLocationPublic" title="대중교통 안내" class=""><img src="assets/img/location_subway_40.png" alt="대중교통 안내"><span>대중교통 안내</span></a></li>
			                <li><a href="#layerLocationCar" title="자가용/주차안내"><img src="assets/img/location_car_40.png" alt="자가용/주차안내"><span>자가용/주차안내</span></a></li>
			                <li><a href="#layerLocationMap" title="지도보기"><img src="assets/img/location_map_40.png" alt="지도보기"><span>지도보기</span></a></li>
			            </ul>
			        </div>
			  </div>
			</div>
    </div>
  </div>
</section>

<script>
//When the user clicks on <div>, open the popup
function myFunction() {
var popup = document.getElementById("myPopup");
popup.classList.toggle("show");
}

</script>

<div class="popup" onclick="myFunction()">Click me!
  <span class="popuptext" id="myPopup">Pop_up text...</span>
</div>

	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>