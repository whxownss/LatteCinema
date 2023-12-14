<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
	<link rel="stylesheet" href="../_assets/css/cinema.css">
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
});


</script>

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
						
							<li class="on">
								<button type="button" class="sel-city">서울
									
								</button>

									<div class="theater-list">
										<ul>
											<li data-brch-no="1372">
												<a href="/theater?brchNo=1372" title="건대입구 상세보기">건대입구</a>
											</li>
											
											<li data-brch-no="0023">
												<a href="/theater?brchNo=0023" title="김포공항 상세보기">김포공항</a>
											</li>
											
											<li data-brch-no="1341">
												<a href="/theater?brchNo=1341" title="서울대 입구 상세보기">서울대 입구</a>
											</li>
										
											<li data-brch-no="1431">
												<a href="/theater?brchNo=1431" title="수유 상세보기">수유</a>
											</li>
										
											<li data-brch-no="0041">
												<a href="/theater?brchNo=0041" title="영등포 상세보기">영등포</a>
											</li>
											
											<li data-brch-no="1003">
												<a href="/theater?brchNo=1003" title="합정 상세보기">합정</a>
											</li>
										
											<li data-brch-no="1572">
												<a href="/theater?brchNo=1572" title="홍대입구 상세보기">홍대입구</a>
											</li>
										</ul>
									</div>
							</li>
						
							<li>
								<button type="button" class="sel-city">경기/인천
									
								</button>

								<div class="theater-list">
									<ul>
											<li data-brch-no="4121">
												<a href="/theater?brchNo=4121" title="광교아울렛 상세보기">광교아울렛</a>
											</li>
										
											<li data-brch-no="0029">
												<a href="/theater?brchNo=0029" title="동탄 상세보기">동탄</a>
											</li>
										
											<li data-brch-no="0053">
												<a href="/theater?brchNo=0053" title="부천 상세보기">부천</a>
											</li>
										
											<li data-brch-no="0035">
												<a href="/theater?brchNo=0035" title="부평 상세보기">부평</a>
											</li>
										
											<li data-brch-no="4152">
												<a href="/theater?brchNo=4152" title="수원 상세보기">수원</a>
											</li>
										
											<li data-brch-no="0039">
												<a href="/theater?brchNo=0039" title="안산 상세보기">안산</a>
											</li>
										
											<li data-brch-no="0019">
												<a href="/theater?brchNo=0019" title="의정부 상세보기">의정부</a>
											</li>
										
											<li data-brch-no="4451">
												<a href="/theater?brchNo=4451" title="인천터미널 상세보기">인천터미널</a>
											</li>
										
											<li data-brch-no="4652">
												<a href="/theater?brchNo=4652" title="평택 상세보기">평택</a>
											</li>
									</ul>
								</div>
							</li>
						
							<li>
								<button type="button" class="sel-city">충청/대전
									
								</button>

								<div class="theater-list">
									<ul>
										
											<li data-brch-no="4041">
												<a href="/theater?brchNo=4041" title="당진 상세보기">당진</a>
											</li>
										
											<li data-brch-no="4062">
												<a href="/theater?brchNo=4062" title="대전 상세보기">대전</a>
											</li>
										
											<li data-brch-no="4001">
												<a href="/theater?brchNo=4001" title="서산 상세보기">서산</a>
											</li>
										
											<li data-brch-no="4051">
												<a href="/theater?brchNo=4051" title="서청주 상세보기">서청주</a>
											</li>
										
											<li data-brch-no="0027">
												<a href="/theater?brchNo=0027" title="충주 상세보기">충주</a>
											</li>
										
									</ul>
								</div>
							</li>
						
							<li>
								<button type="button" class="sel-city">전라/광주
									
								</button>

								<div class="theater-list">
									<ul>
											<li data-brch-no="3141">
												<a href="/theater?brchNo=3141" title="광주 상세보기">광주</a>
											</li>
										
											<li data-brch-no="0018">
												<a href="/theater?brchNo=0018" title="군산 상세보기">군산</a>
											</li>
										
											<li data-brch-no="3021">
												<a href="/theater?brchNo=3021" title="익산모현 상세보기">익산모현</a>
											</li>
										
											<li data-brch-no="0028">
												<a href="/theater?brchNo=0028" title="전주 상세보기">전주</a>
											</li>
										
											<li data-brch-no="0009">
												<a href="/theater?brchNo=0009" title="충장로 상세보기">충장로</a>
											</li>
									</ul>
								</div>
							</li>
						
							<li>
								<button type="button" class="sel-city">경북/대구
									
								</button>

								<div class="theater-list">
									<ul>
											<li data-brch-no="0040">
												<a href="/theater?brchNo=0040" title="경주 상세보기">경주</a>
											</li>
										
											<li data-brch-no="7122">
												<a href="/theater?brchNo=7122" title="구미공단 상세보기">구미공단</a>
											</li>
										
											<li data-brch-no="0043">
												<a href="/theater?brchNo=0043" title="대구광장 상세보기">대구광장</a>
											</li>
										
											<li data-brch-no="7303">
												<a href="/theater?brchNo=7303" title="동성로 상세보기">동성로</a>
											</li>
										
											<li data-brch-no="7401">
												<a href="/theater?brchNo=7401" title="상주 상세보기">상주</a>
											</li>
										
											<li data-brch-no="7901">
												<a href="/theater?brchNo=7901" title="영천 상세보기">영천</a>
											</li>
										
											<li data-brch-no="7011">
												<a href="/theater?brchNo=7011" title="포항 상세보기">포항</a>
											</li>
									</ul>
								</div>
							</li>
						
							<li>
								<button type="button" class="sel-city">경남/부산/울산
									
								</button>

								<div class="theater-list">
									<ul>
											<li data-brch-no="5021">
												<a href="/theater?brchNo=5021" title="거창 상세보기">거창</a>
											</li>
										
											<li data-brch-no="5061">
												<a href="/theater?brchNo=5061" title="김해부원 상세보기">김해부원</a>
											</li>
										
											<li data-brch-no="5302">
												<a href="/theater?brchNo=5302" title="동래 상세보기">동래</a>
											</li>
										
											<li data-brch-no="5401">
												<a href="/theater?brchNo=5401" title="마산 상세보기">마산</a>
											</li>
										
											<li data-brch-no="5552">
												<a href="/theater?brchNo=5552" title="부산명지 상세보기">부산명지</a>
											</li>
										
											<li data-brch-no="0010">
												<a href="/theater?brchNo=0010" title="부산본점 상세보기">부산본점</a>
											</li>
										
											<li data-brch-no="0050">
												<a href="/theater?brchNo=0050" title="서면 상세보기">서면</a>
											</li>
										
											<li data-brch-no="5612">
												<a href="/theater?brchNo=5612" title="센텀시티 상세보기">센텀시티</a>
											</li>
										
											<li data-brch-no="0021">
												<a href="/theater?brchNo=0021" title="울산 상세보기">울산</a>
											</li>
										
											<li data-brch-no="5064">
												<a href="/theater?brchNo=5064" title="진해 상세보기">첨단</a>
											</li>
									</ul>
								</div>
							</li>
						
							<li>
								<button type="button" class="sel-city">강원
									
								</button>

								<div class="theater-list">
									<ul id="cinema_ul">
										
											<li data-brch-no="2001">
												<a href="/theater?brchNo=2001" title="남원주 상세보기">남원주</a>
											</li>
										
											<li data-brch-no="2171">
												<a href="/theater?brchNo=2171" title="동해 상세보기">동해</a>
											</li>
										
											<li data-brch-no="2201">
												<a href="/theater?brchNo=2201" title="원주무실 상세보기">원주무실</a>
											</li>
										
											<li data-brch-no="2202">
												<a href="/theater?brchNo=2202" title="춘천 상세보기">춘천</a>
											</li>
									</ul>
								</div>
							</li>
						
							<li>
								<button type="button" class="sel-city">제주
									
								</button>

								<div class="theater-list">
									<ul >
											<li data-brch-no="0059">
												<a href="/theater?brchNo=0059" title="서귀포 상세보기">서귀포</a>
											</li>
										
											<li data-brch-no="0054">
												<a href="/theater?brchNo=0054" title="제주아라 상세보기">제주아라</a>
											</li>
											
											<li data-brch-no="0054">
												<a href="/theater?brchNo=0054" title="제주연동 상세보기">제주연동</a>
											</li>
									</ul>
								</div>
							</li>
						
					</ul>
				</div>
				</div>
				
				
						<!-- 영화관 위치 -->
						<div class="place">

							<h2 class="tit mt40">영화관 위치</h2>

							<div class="theater-box"> 주소: 부산광역시 부산진구 부전동 동천로 109 삼한골든게이트 </div>

						</div>
						
						
						<!-- 영화예매창 위치 -->
						<div class="movie_res">

							<h2 class="tit mt40">영화관 예매창 위치 </h2>

							<div class="theater-box" style="height: 186px;"></div>

						</div>
						
						
				
				
				
				
			</div>
		</div>
	</div>
				
				
			</div>
		</section>
	
	</main>
	
	
	
<%@include file ="../_common/commonFooter.jsp" %>