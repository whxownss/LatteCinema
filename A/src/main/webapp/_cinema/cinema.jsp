<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/cinema.css">
	<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

<%-- 현재 JSP 파일에만 해당하는 스타일시트 링크 추가 --%>
<script>

<!-- test!!!!!  -->                                    

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
									<button type="button" class="sel-city">서울</button>

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
									<button type="button" class="sel-city">경기/인천</button>

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
										</ul>
									</div>
								</li>

								<li>
									<button type="button" class="sel-city">충청/대전</button>

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
									<button type="button" class="sel-city">전라/광주</button>

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
									<button type="button" class="sel-city">경북/대구</button>

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
									<button type="button" class="sel-city">경남/부산/울산</button>

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
									<button type="button" class="sel-city">강원</button>

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
									<button type="button" class="sel-city">제주</button>

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

					<div class="place" style="display: none">
          <div class="section-header d-flex justify-content-between align-items-center mb-5">
        <h3>영화관 위치</h3>
      </div>
          
          
					<!-- 영화관 위치 -->
<!-- 						<h2 class="tit mt40"></h2>
 -->						<!-- 영화관 정보 -->
          
						<div class="theater-place">
							<h3 class="tit">서면</h3>
							
							<div class="info_wrap">
							<dl class="theater_info">
								<dt>총 상영관 수</dt>
								<dd>6개관</dd>
								<dt>총 좌석수</dt>
								<dd>1,232석</dd>
								<dt class="adr">주소</dt>
								<dd class="adr">부산 부산진구 동천로 92 (전포동)</dd>
							</dl>
							</div>
							
							<!-- layout 배경 -->
							<div class="dim"></div>
							<!-- layout 배경 -->
							<ul class="pop_wrap">
								<li><a href="#layerLocationPublic" title="대중교통 안내" class="">
									<img src="assets/img/location_subway_40.png" alt="대중교통 안내"><span>대중교통 안내</span></a></li>
								<li><a href="#layerLocationCar" title="자가용/주차안내">
									<img src="assets/img/location_car_40.png" alt="자가용/주차안내"><span>자가용/주차안내</span></a></li>
								<li><a href="#layerLocationMap" title="지도보기">
									<img src="assets/img/location_map_40.png" alt="지도보기"><span>지도보기</span></a></li>
							</ul>
							<br>

              
<div id="layerLocationPublic" class="layer_wrap layer_location_public">
  <strong class="hidden">레이어 팝업 시작</strong>
  <div class="layer_header">
    <h4 class="tit">대중교통안내</h4>
    <button type="button" class="btn_close btnCloseLayer">팝업 닫기</button>
  </div>
  <div class="layer_contents">
    <div class="article_location ty_subway">
      <h5 class="tit_article">지하철로 오시는 길</h5>
      <ul class="list_txt">
        <li>
          <span class="tit">1, 2호선 서면역 </span>
          <span class="txt"> 8번 출구 (도보 직진 200미터 &gt; 대각선 횡단보도 이용 &gt; 건물 진입 후 엘리베이터 이용 6층)</span>
        </li>
      </ul>
    </div>
    <div class="article_location ty_bus">
      <h5 class="tit_article">버스로 오시는 길</h5>
      <ul class="list_txt">
        <li>
          <span class="tit">NC서면점, 서면교차로, 부전도서관 정류장 하차 후 도보 100~200m 내 도착</span>
          <span class="txt"></span>
        </li>
      </ul>
    </div>
  </div>
  <strong class="hidden txtTabIndex" tabindex="0">레이어 팝업 끝</strong>
</div>
<div id="layerLocationCar" class="layer_wrap layer_location_car">
  <strong class="hidden">레이어 팝업 시작</strong>
  <div class="layer_header">
    <h4 class="tit">자가용/주차 안내</h4>
    <button type="button" class="btn_close btnCloseLayer">팝업 닫기</button>
  </div>
  <div class="layer_contents">
    <div class="article_location ty_car">
      <h5 class="tit_article">자가용으로 오시는 길</h5>
      <ul class="list_txt">
        <li>
          <span class="tit">주소 </span>
          <span class="txt"> 부산광역시 부산진구 동천로 92 (NC백화점 6층)</span>
        </li>
      </ul>
    </div>
    <div class="article_location ty_fee">
      <h5 class="tit_article">주차요금 안내</h5>
      <ul class="list_txt">
        <li>
          <span class="tit">영화관 입장로에(자판기 옆) 위치한 시네마 전용 무인정산기(테블릿)에서 차량등록시 3시간 무료 주차 가능합니다.</span>
          <span class="txt"></span>
        </li>
        <li>
          <span class="tit">원활한 출차를 위해 입장 전 사전 차량 등록 후 출차 부탁드립니다. </span>
          <span class="txt"></span>
        </li>
        <li>
          <span class="tit">주차장 이용 안내 </span>
          <span class="txt"></span>
        </li>
        <li>
          <span class="tit">1) NC백화점 건물 內 지하 1~2층 주차장 </span>
          <span class="txt"></span>
        </li>
        <li>
          <span class="tit">2) 주차요금 - 차량 등록시 3시간 무료 (초과시 10분당 1,000원)</span>
          <span class="txt"></span>
        </li>
        <li>
          <span class="tit">3) 영화 관람 고객님께서는 지하 주차장 이용 바랍니다.</span>
          <span class="txt"></span>
        </li>
        <li>
          <span class="tit">※ 시네마 전용 주차정산기 외 NC백화점 주차정산기 적용 불가</span>
          <span class="txt"></span>
        </li>
      </ul>
    </div>
  </div>
  <strong class="hidden txtTabIndex" tabindex="0">레이어 팝업 끝</strong>
</div>
<div id="layerLocationMap" class="layer_wrap layer_location_map">
<strong class="hidden">레이어 팝업 시작</strong>
  <div class="layer_header">
    <h4 class="tit">지도</h4>
    <button type="button" class="btn_close btnCloseLayer">팝업 닫기</button>
  </div>
  <div class="layer_contents">
    <div class="article_location">
      <p class="tit_map">부산 부산진구 동천로 92 (전포동)</p>
      <div class="area_map">
        <div id="cinemaMap" style="height: 480px; width: 100%;" class="tmMap">
          <div id="Tmap_Map_7_Tmap_ViewPort" class="tmMapViewport tmControlDragPanActive tmControlZoomBoxActive tmControlPinchZoomActive tmControlNavigationActive" style="position: relative; overflow: hidden; width: 100%; height: 100%;">
            <div id="Tmap_Map_7_Tmap_Container" style="position: absolute; z-index: 749; left: 0px; top: 0px;">
              <div id="Tmap_Layer_TMS_31" dir="ltr" class="tmLayerDiv tmLayerGrid" style="position: absolute; width: 100%; height: 100%; z-index: 100;">
                <img class="tmTileImage" src="https://topopentile2.tmap.co.kr/tms/1.0.0/hd_tile/17/112526/79224.png?bizAppId=65cf7be3-88f0-47f7-88bf-0eefb34b79f6?v=Release1.18.25&amp;version=20220406" style="visibility: inherit; opacity: 1; position: absolute; left: 108px; top: 122px; width: 256px; height: 256px;">
                <img class="tmTileImage" src="https://topopentile3.tmap.co.kr/tms/1.0.0/hd_tile/17/112525/79224.png?bizAppId=65cf7be3-88f0-47f7-88bf-0eefb34b79f6?v=Release1.18.25&amp;version=20220406" style="visibility: inherit; opacity: 1; position: absolute; left: -148px; top: 122px; width: 256px; height: 256px;">
                <img class="tmTileImage" src="https://topopentile1.tmap.co.kr/tms/1.0.0/hd_tile/17/112526/79225.png?bizAppId=65cf7be3-88f0-47f7-88bf-0eefb34b79f6?v=Release1.18.25&amp;version=20220406" style="visibility: inherit; opacity: 1; position: absolute; left: 108px; top: -134px; width: 256px; height: 256px;">
                <img class="tmTileImage" src="https://topopentile1.tmap.co.kr/tms/1.0.0/hd_tile/17/112526/79223.png?bizAppId=65cf7be3-88f0-47f7-88bf-0eefb34b79f6?v=Release1.18.25&amp;version=20220406" style="visibility: inherit; opacity: 1; position: absolute; left: 108px; top: 378px; width: 256px; height: 256px;">
                <img class="tmTileImage" src="https://topopentile3.tmap.co.kr/tms/1.0.0/hd_tile/17/112527/79224.png?bizAppId=65cf7be3-88f0-47f7-88bf-0eefb34b79f6?v=Release1.18.25&amp;version=20220406" style="visibility: inherit; opacity: 1; position: absolute; left: 364px; top: 122px; width: 256px; height: 256px;">
                <img class="tmTileImage" src="https://topopentile1.tmap.co.kr/tms/1.0.0/hd_tile/17/112525/79225.png?bizAppId=65cf7be3-88f0-47f7-88bf-0eefb34b79f6?v=Release1.18.25&amp;version=20220406" style="visibility: inherit; opacity: 1; position: absolute; left: -148px; top: -134px; width: 256px; height: 256px;">
                <img class="tmTileImage" src="https://topopentile1.tmap.co.kr/tms/1.0.0/hd_tile/17/112525/79223.png?bizAppId=65cf7be3-88f0-47f7-88bf-0eefb34b79f6?v=Release1.18.25&amp;version=20220406" style="visibility: inherit; opacity: 1; position: absolute; left: -148px; top: 378px; width: 256px; height: 256px;">
                <img class="tmTileImage" src="https://topopentile3.tmap.co.kr/tms/1.0.0/hd_tile/17/112527/79225.png?bizAppId=65cf7be3-88f0-47f7-88bf-0eefb34b79f6?v=Release1.18.25&amp;version=20220406" style="visibility: inherit; opacity: 1; position: absolute; left: 364px; top: -134px; width: 256px; height: 256px;">
                <img class="tmTileImage" src="https://topopentile3.tmap.co.kr/tms/1.0.0/hd_tile/17/112527/79223.png?bizAppId=65cf7be3-88f0-47f7-88bf-0eefb34b79f6?v=Release1.18.25&amp;version=20220406" style="visibility: inherit; opacity: 1; position: absolute; left: 364px; top: 378px; width: 256px; height: 256px;">
              </div>
              <div id="Tmap_Layer_Markers_61" dir="ltr" class="tmLayerDiv" style="position: absolute; width: 100%; height: 100%; z-index: 330;">
                <div id="OL_Icon_63" style="position: absolute; width: 24px; height: 38px; left: 213px; top: 202px;">
                  <img id="OL_Icon_63_innerImage" class="olAlphaImg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAmCAYAAADeB1slAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpGNDA5M0VFQjExMDNFNDExQURGMUZFM0QwNjMzNkU5RSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpDQzNEMTE4NTEzQjgxMUU0QUNCQUQyQjJEN0JCQTM3OCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpDQzNEMTE4NDEzQjgxMUU0QUNCQUQyQjJEN0JCQTM3OCIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkNGNzdFRERFMUExM0U0MTFCNUREOTUzNjM3OUQyM0Q3IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkY0MDkzRUVCMTEwM0U0MTFBREYxRkUzRDA2MzM2RTlFIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Q23/mwAAA7ZJREFUeNrsV1tLlEEYfj41Xc0DuXYghZJMyaAyISWCKJIKvIqKQuumQKyruuumCL3oF0RQ3ZTRdSBFB7oqqegEJeWJVbIT7q6u5mE97Nfzznzrfut+626mdw6MM8687/PMvPPO880apmliKUsKlrgsEyQsafOyn25dx+YU60HWCtZ8a8rP+oH1Mevd0J3aX/EwDKcsInAOm6us55DlzjAz3YArD0hN1wYzk8BEAMa4DxjzBTlynfUKiUYSEhC8jE0rgUvM/BIgfSUHV7Cm0trQRuITmmGdAiZHYfi7hYh/UEuSjrgEFvgLM7ewAO5SBjCDFjbguUV8TRJNcxO+ThjD370c3WMnmSUgeDabdwQvRQF50lycTTIHzBBJJgBvh5B0cqSSJH/mZtFlhqUU7s3/Bq6WmaJ9xFcwBMu+A65+Lfu9ZtEuFzKZKCmxyVWSCTw4ofvvvzG1njkQhaaBcT+M/jfcDjZyF7/Dy6wjsAvp2TrmDuViJVC+XtcjFZowdif0FQzBEkxbiA6bWW6dLXEO9NjOSD+L2XpmqxOBoTAUFjHtBNvhytWp6FCOFgIFObrf59Xtycp4t5MYgiWYNoLVSJVdOa++sSoCfuOl7m8o0MQO24DGImYyWiSxrt6k+w/bgWufeacmo4mTETuvuv6IlQ2JdZalEGVrKDwHgIFh/b8Qxx62qaVEMG0En0Rb1PWfU+yx3r8FqK/S4Yl72IIhWIJpU9MnFK59Zl4R45c2exZ73RGw51+AH8MRnEPl+uDP7gYuvbWtnvqkRJCY9h3co1hNYXIsahcXqnUrMW94pC9XuN5q03NC0lBiW71gCBbQMkvAG8e7iZtKFUW4RFtYasq136seoHs8OhK32yOHfXxbWI+CWlnJT8z+uWInyfvRXFVcDJFp0f54KuqkqnKwBDcGPR6O7CDBcFSaWgP1NJhRhyQyjGSeNJZkywdIfIkRBo+5B5yQyDYZ/i4tv1aokpFq5UNfC2Pej34zxgfb4O3U257vYRYOjdiKj/gmelVwBbLNOmOESTnyU0uwY6hMPUcbZUsfyzfxs4WGvWzOGwEm15SkrkOoZIxzyoa2lk/y7yI6tCA4ct/wfmUYgtHnIX2OqTnaKNsFPrwaMTrQh0GPDof6yFuhkTGZE5uFvuy4soA6j0FPCBNDOh1VSg5Bjem4B/7r6UgA+QI0G74u9QZS7yCfSslma25R3qZNTMPXGKDiSZW+jCXz4Ej2BwilRD47T61/a7j6nkUlWP4BsmTlrwADAGiHsLWkHt9JAAAAAElFTkSuQmCC" style="position: relative; width: 24px; height: 38px;">
                </div>
              </div>
            </div>
            <div id="Tmap_Control_ZoomBar_3" class="tmControlZoomBar tmControlNoSelect" unselectable="on" style="position: absolute; left: 4px; top: 4px; z-index: 1005;">
              <div id="Tmap_Control_ZoomBar_3_zoomin" class="tmButton" style="position: absolute; left: 4px; top: 4px; width: 30px; height: 29px; cursor: pointer;">
                <img id="Tmap_Control_ZoomBar_3_zoomin_innerImage" class="olAlphaImg" src="https://topopentile3.tmap.co.kr/tmaplibv20/img/zm_zoom-plus-mini.png" style="position: relative; width: 30px; height: 29px;">
              </div>
              <div id="Tmap_Control_PanZoomBar_ZoombarTmap_Map_7" class="tmButton" style="background-image: url(&quot;https://topopentile3.tmap.co.kr/tmaplibv20/img/zm_zoombar.png&quot;); left: 4px; top: 33px; width: 30px; height: 200px; position: absolute; cursor: pointer; visibility: hidden;"></div>
              <div id="Tmap_Control_ZoomBar_3_Tmap_Map_7" style="position: absolute; left: 8px; top: 51px; width: 22px; height: 9px; cursor: move; visibility: hidden;">
                <img id="Tmap_Control_ZoomBar_3_Tmap_Map_7_innerImage" class="olAlphaImg" src="https://topopentile3.tmap.co.kr/tmaplibv20/img/zm_slider.png" style="position: relative; width: 22px; height: 9px;">
              </div>
              <div id="Tmap_Control_PanZoomBar_LevelGuideTmap_Map_7" style="background-image: url(&quot;https://topopentile3.tmap.co.kr/tmaplibv20/img/zm_btn_lable.png&quot;); left: 34px; top: 63px; width: 29px; height: 134px; position: absolute; visibility: hidden;"></div>
              <div id="Tmap_Control_ZoomBar_3_zoomout" class="tmButton" style="position: absolute; left: 4px; top: 33px; width: 30px; height: 29px; cursor: pointer;">
                <img id="Tmap_Control_ZoomBar_3_zoomout_innerImage" class="olAlphaImg" src="https://topopentile3.tmap.co.kr/tmaplibv20/img/zm_zoom-minus-mini.png" style="position: relative; width: 30px; height: 29px;">
              </div>
            </div>
            <div id="Tmap_Control_ScaleLine_4" class="tmControlScaleLine tmControlNoSelect" unselectable="on" style="position: absolute; z-index: 1005;">
              <div class="tmControlScaleLineTop" style="visibility: visible; width: 51px;">50 m</div>
              <div class="tmControlScaleLineBottom" style="visibility: hidden;"></div>
            </div>
            <div id="Tmap_Control_ArgParser_5" class="tmControlArgParser tmControlNoSelect" unselectable="on" style="position: absolute; z-index: 1005;"></div>
            <div id="Tmap_Control_Attribution_6" class="tmControlAttribution tmControlNoSelect" unselectable="on" style="position: absolute; z-index: 1005;">
              <img src="https://topopentile1.tmap.co.kr/tmaplibv20/img/powered-by-T-map_comms.png">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<strong class="hidden txtTabIndex" tabindex="0">레이어 팝업 끝</strong>
</div>
              




						</div>
						<!-- <div class="notice_wrap_emp"></div> -->
						<!-- <div class="rcm_wrap">
							            이곳에 다른 내용을 추가하시면 됩니다.
							        </div> -->
					</div>
				</div>
			</div>
		</div>
	</section>

</main>







<script>
  $(function(){
    // 페이지 오픈했을때 dim을 숨김
    // dim : 레이아웃에서 불투명한 배경을 만들어주는 역할 layout_bg, layout_background라고 하기도 함
    $(".dim").hide();                       
    
    // a 태그 클릭시 실행
    // layout에 active 클래스를 추가해서
    // active 클래스에 해당하는 css를 사용
    // * layout할때 보통은 addClass()를 사용해서 css가 할당된 class 이름을 추가해주는 방식으로 css를 변화시킴
    // * 롯데시네마에서는 layout은 addClass()를 사용하고, 배경(dim)은 <div class="dim"/> 태그 자체를 삭제했다가 추가하는 방식
    $('.pop_wrap li a').click(function(){
      // a 태그의 href 속성값에 #가 붙어있으므로 jquery에서 id 선택자 그대로 사용할 수 있음
      var layout = $(this).attr("href")                
      console.log(layout)                // #layerLocationPublic
      
      // 이미 할당된 active 클래스를 제거하고
      // 현재 누른 선택자에 active 클래스를 추가함
      $('.layer_wrap').removeClass('active')
      $(layout).addClass('active')
      
      // dim 나타내기 
      $(".dim").fadeIn();
      
      //레이어 영역외 바탕화면 클릭시 화면 닫기
			$(".dim").click(function(e) {
				if (!$(".layer_wrap").has(e.target).length) {
					layer_close();
				}
				;
			});
		})

		//닫기 버튼 클릭시 레이어 닫기
		$(".btn_close").click(function() {
			layer_close();
		});
	});
	//레이어팝업 close 상태 function 만들기
	function layer_close() {
		$('.layer_wrap').removeClass('active');
		$(".dim").fadeOut();
	};
</script>

<style>
/* hidden 스타일이 다른 css파일 내에서도 있으면 이부분 지워도 됨*/
/**/
.hidden {
	overflow: hidden;
	position: absolute !important;
	width: 1px;
	height: 1px;
	clip: rect(1px, 1px, 1px, 1px);
}

.pop_wrap {
	margin-right: 540px;
	padding-left: 0rem;
	float: right;
	margin-top: -180px;
}

.layer_wrap {
	overflow: hidden;
	position: absolute;
	z-index: -1;
	width: 0px;
	height: 0px;
	border: none;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.layer_wrap.active {
	display: block;
	position: fixed;
	z-index: 100;
	height: auto;
	border-radius: 10px;
	background-color: #FFF;
}

.layer_wrap .layer_header {
	position: relative;
	height: 54px;
	line-height: 58px;
	border-bottom: 1px solid #CCC;
	color: #FFF;
	text-align: center;
}

.layer_wrap .layer_header .tit {
  padding-top: 15px;
	font-size: 18px;
	color: #000;
}

.layer_wrap .layer_header strong {
	font-size: 18px;
}

.layer_wrap .layer_header .btn_close {
	position: absolute;
	/*right:20px; top:18px;*/
	right: 15px;
	top: 15px;
	width: 19px;
	height: 19px;
	border: none;
	text-indent: -9999em;
	background: transparent
		url("https://www.lottecinema.co.kr/NLCHS/Content/images/icon/close_19.png")
		no-repeat 0 0;
}

/* 2020.01.16 확인 : 팝업닫기 X 버튼 위치 조정 */
.layer_wrap .layer_header .btn_close.wht, .layer_wrap .layer_contents .btn_close.wht
	{
	position: absolute;
	right: 15px;
	top: 15px;
	width: 19px;
	height: 19px;
	border: none;
	text-indent: -9999em;
	background: transparent
		url("../../Content/images/icon/close_19_wht.png") no-repeat 0 0;
}

/* 2020.01.23 */
.layer_wrap .layer_contents {
	padding: 30px 25px;
}

.layer_wrap .layer_contents.overflowtype1 {
	overflow: hidden;
	overflow-y: scroll;
	height: 600px
}

.layer_wrap .layer_contents.pad0 {
	padding: 0
}

.layer_wrap .layer_footer {
	clear: both;
	border-top: 1px solid #DDD;
	text-align: center;
	background-color: #F8F8F8;
}

.layer_wrap .layer_footer ul:after {
	content: "";
	display: block;
	clear: both;
}

.layer_wrap .layer_footer ul li {
	position: relative;
	float: left;
	width: 50%;
}

.layer_wrap .layer_footer ul li:before {
	content: "";
	position: absolute;
	left: 0;
	top: 50%;
	height: 25px;
	margin-top: -12px;
	border-left: 1px solid #DDD;
}

.layer_wrap .layer_footer ul li:first-child:before {
	display: none;
}

.layer_wrap .layer_footer ul li a, .layer_wrap .layer_footer ul li button
	{
	display: block;
	width: 100%;
	height: 50px;
	line-height: 50px;
	border: none;
	font-size: 16px;
	background-color: #F8F8F8;
}

.layer_wrap .layer_footer.ty2 ul li {
	width: 100%;
}

.layer_wrap .tit_type2 {
	font-size: 13px;
	padding-bottom: 10px;
	line-height: 1.5;
}
/* 영화관 : 위치안내 : 대중교통 */
.layer_wrap.active.layer_location_public {
	width: 700px;
}

/* 영화관 : 위치안내 : 자가용 */
.layer_wrap.active.layer_location_car {
	width: 500px;
}

/* 영화관 : 위치안내 : 지도 */
.layer_wrap.active.layer_location_map {
	width: 500px;
}
/* dimmed 레이아웃 배경 */
.dim {
	position: fixed;
	top: 0;
	right: 0;
	bottom: -1px;
	left: 0;
	z-index: 98;
	background: rgba(0, 0, 0, 0.5);
	overflow-y: scroll
}

.contents_theater_detail .theater_top_wrap .info_wrap .theater_info dt {
	display: inline-block;
	font-size: 15px;
	margin-right: 10px;
}

.contents_theater_detail .theater_top_wrap .info_wrap .theater_info dd {
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
}
</style>
	
	
<%@include file ="../_common/commonFooter.jsp" %>