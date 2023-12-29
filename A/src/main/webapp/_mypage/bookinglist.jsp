<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>

  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
  <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
   <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
 
</head>
<body>

<jsp:include page="../_common/header.jsp"></jsp:include>
<main id="main">
  <section class="category-section">
    <div class="container has-lnb" data-aos="fade-up">
      <!-- 이곳에 코드작성 -->
      <div class="inner-wrap">

        <jsp:include page="lnb.jsp"></jsp:include>
	


			<div id="myLoactionInfo" style="display: none;">
				<div class="location">
					<span>Home</span>
					<a href="/mypage" title="나의 메가박스 페이지로 이동">나의 메가박스</a>
					<a href="/mypage/bookinglist?tab=01" title="예매/구매내역 페이지로 이동">예매/구매내역</a>
				</div>
			</div>			
			
			
			<div id="contents">
				<h2 class="tit">예매/구매 내역</h2>
			
				<div class="tab-block tab-layer">
					<ul>
						<li data-url="/mypage/bookinglist?tab=01" data-tit="예매내역" title="예매내역 탭으로 이동" class="on"><a href="#myBokdArea" class="btn">예매 </a></li>
						<li data-url="/mypage/bookinglist?tab=02" data-tit="구매내역" title="구매내역 탭으로 이동"><a href="#myPurcArea" class="btn">구매 </a></li>
					</ul>
				</div>
				<div class="tab-cont-wrap">
			
					<!-- 예매내역 -->
					<div id="myBokdArea" class="tab-cont on"><a href="" class="ir">예매  탭 화면 입니다.</a>
			
						<!-- 예매 조회 조건 -->
						<div class="board-list-search mt20">
							<table summary="예매 조회 조건">
								<colgroup>
									<col style="width:75px;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">구분 </th>
										<td>
											<input type="radio" id="radBokd01" name="radBokd" value="B" checked="checked">
											<label for="radBokd01">예매내역 </label>
											<input type="radio" id="radBokd02" name="radBokd" value="E">
											<label for="radBokd02">지난내역 </label>
			
											<div class="dropdown bootstrap-select disabled small bs3"><select name="selYM" class="selectpicker small" disabled="disabled" tabindex="-98">
												
													<option value="202312">2023년 12월</option>
												
													<option value="202311">2023년 11월</option>
												
													<option value="202310">2023년 10월</option>
												
													<option value="202309">2023년 9월</option>
												
													<option value="202308">2023년 8월</option>
												
													<option value="202307">2023년 7월</option>
												
													<option value="202306">2023년 6월</option>
												
													<option value="202305">2023년 5월</option>
												
													<option value="202304">2023년 4월</option>
												
													<option value="202303">2023년 3월</option>
												
													<option value="202302">2023년 2월</option>
												
													<option value="202301">2023년 1월</option>
												
											</select><button type="button" class="btn dropdown-toggle disabled btn-default" data-toggle="dropdown" role="button" tabindex="-1" aria-disabled="true" title="2023년 12월"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">2023년 12월</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1"><ul class="dropdown-menu inner "></ul></div></div></div>
			
											<button type="button" class="button gray-line small ml05" name="search">
												<i class="iconset ico-search-gray"></i> 조회 
											</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 예매 조회 조건 End -->
			
						<!-- 예매 영화 목록 -->
						<div id="bokdList"><div class="no-history-reservation mt20">	예매 내역이 없습니다. </div></div>
			
						<h3 class="tit mt70">예매취소내역</h3>
			
						<ul class="dot-list">
							<li>상영일 기준 7일간 취소내역을 확인하실 수 있습니다.</li>
						</ul>
			
						<!-- 취소한 예매 영화 목록 -->
						<div class="table-wrap mt10">
							<table class="board-list" summary="취소일시, 영화명, 극장, 상영일시, 취소금액 항목을 가진 취소내역 목록 표">
								<caption>취소일시, 영화명, 극장, 상영일시, 취소금액 항목을 가진 취소내역 목록 표</caption>
								<colgroup>
									<col style="width:160px;">
									<col>
									<col style="width:130px;">
									<col style="width:188px;">
									<col style="width:105px;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">취소일시</th>
										<th scope="col">영화명</th>
										<th scope="col">극장</th>
										<th scope="col">상영일시</th>
										<th scope="col">취소금액</th>
									</tr>
								</thead>
								<tbody><tr>	<td>2023.12.23 (14:29)</td>	<th scope="row">서울의 봄</th>	<td>양산</td>	<td>2023.12.24 (일) 13:25</td>	<td class="a-r">		<span class="font-red">42,000원</span>	</td></tr></tbody>
							</table>
						</div>
			
						<nav class="pagination" id="navBokd"><strong class="active">1</strong> </nav>
			
						<!-- 예매 안내상황  -->
						<div class="box-pulldown mt30">
							<div class="tit">
								<button type="button" class="btn-toggle">이용안내<i class="iconset ico-arr-toggle-down"></i></button>
							</div>
							<div class="cont">
								<strong>[예매 안내]</strong>
								<ul class="dot-list mb30">
									<li>만 4세(48개월) 이상부터는 영화티켓을 반드시 구매하셔야 입장 가능합니다.</li>
									<li>예매 변경은 불가능하며, 취소 후 재 예매를 하셔야만 합니다.</li>
									<li>메가박스 모바일앱을 이용할 경우 티켓출력없이 모바일티켓을 통해 바로 입장하실 수 있습니다.</li>
								</ul>
			
								<strong>[티켓교환 안내]</strong>
								<ul class="dot-list mb30">
									<li>극장의 무인발권기(KIOSK)를 통해 예매번호 또는 고객확인번호(생년월일+휴대폰번호)를 입력하여 편리하게 티켓을 발권하실 수 있습니다.</li>
									<li>무인발권기 이용이 어려우신경우, 티켓교환권을 출력하여 매표소에 방문하시면 티켓을 발권하실 수 있습니다.</li>
									<li>(티켓교환권 출력이 어려운경우 예매번호와 신분증을 지참하여 매표소에 방문하시면 티켓을 발권하실 수 있습니다)</li>
								</ul>
			
								<strong>[예매취소 안내]</strong>
								<ul class="dot-list">
									<li>온라인(홈페이지/모바일) 예매 취소는 상영시간 20분전까지 입니다.</li>
									<li>위탁 예매 사이트 이용 시 취소 및 환불 규정은 해당 사이트 규정을 따릅니다.</li>
									<li>LIVE 공연 콘텐트는 취소 기준은 아래와 같습니다.
										<ul class="dash-list">
											<li>관람 4일전 : 취소 가능</li>
											<li>관람 3일 ~ 1일전 : 취소 수수료 부담 후 취소 가능</li>
											<li>관람 당일 : 취소 및 환불 불가</li>
										</ul>
									</li>
									<li>공연 관람시 시작 시간 이후에는 입장이 제한 됩니다.</li>
									<li>발권된 티켓은 상영시간 전까지 현장 방문 시에만 취소가 가능합니다.</li>
								</ul>
							</div>
						</div>
						<!-- 예매 안내상황 End -->
					</div>
			
					<!-- 구매내역 영역 -->
					<div id="myPurcArea" class="tab-cont"><a href="" class="ir"></a>
			
						<!-- 구매 조회 조건 -->
						<div class="board-list-search mt20">
							<table summary="구매 조회 조건">
								<colgroup>
									<col style="width:75px;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">구분</th>
										<td>
											<div class="dropdown bootstrap-select mr10 small bs3"><select class="selectpicker mr10 small" name="selPurc" tabindex="-98">
												<option value="">전체</option>
												<option value="SPD54">스토어</option>
												<option value="SPD52">모바일오더</option>
											</select><button type="button" class="btn dropdown-toggle btn-default bs-placeholder" data-toggle="dropdown" role="button" title="전체"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">전체</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1"><ul class="dropdown-menu inner "></ul></div></div></div>
			
											<input type="radio" name="radPurc" id="radPurc01" value="" checked="checked">
											<label for="radPurc01">전체</label>
											<input type="radio" name="radPurc" id="radPurc02" value="P">
											<label for="radPurc02">구매내역</label>
											<input type="radio" name="radPurc" id="radPurc03" value="C">
											<label for="radPurc03">취소내역</label>
										</td>
									</tr>
									<tr>
										<th scope="row">조회기간</th>
										<td>
											<div class="btn-period">
												<button type="button" class="btn" value="D7">1주일</button>
												<button type="button" class="btn on" value="M1">1개월</button>
												<button type="button" class="btn" value="M3">3개월</button>
												<button type="button" class="btn" value="M6">6개월</button>
											</div>
											<div class="date">
												<input type="text" title="조회기간 시작 날짜 입력" placeholder="yyyy.mm.dd" class="date-calendar v2 hasDatepicker" id="dp1703435331895"><button type="button" class="ui-datepicker-trigger">날짜 선택</button>
												<span>~</span>
												<input type="text" title="조회기간 마지막 날짜 입력" placeholder="yyyy.mm.dd" class="date-calendar v2 hasDatepicker" id="dp1703435331896"><button type="button" class="ui-datepicker-trigger">날짜 선택</button>
												<button type="button" class="button gray-line" name="search">
													<i class="iconset ico-search-gray"></i> 조회
												</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 구매 조회 조건 End -->
			
						<!-- 구매 목록  -->
						<div class="board-list-util mb10">
							<p class="result-count pt00">
								<strong>전체 <b class="font-gblue">0</b>건</strong>
							</p>
						</div>
			
						<div class="table-wrap">
							<table class="board-list" summary="결제일시, 구분, 상품명, 결제금액, 상태 항목을 가진 결제내역 목록 표">
								<caption>결제일시, 구분, 상품명, 결제금액, 상태 항목을 가진 결제내역 목록 표</caption>
								<colgroup>
									<col style="width:160px;">
									<col style="width:150px;">
									<col>
									<col style="width:120px;">
									<col style="width:120px;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">결제일시</th>
										<th scope="col">구분</th>
										<th scope="col">상품명</th>
										<th scope="col">결제금액</th>
										<th scope="col">상태</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
			
						<nav class="pagination" id="navPurc"></nav>
			
						<!-- 구매 안내상황  -->
						<div class="box-pulldown mt30">
							<div class="tit">
								<button type="button" class="btn-toggle">이용안내<i class="iconset ico-arr-toggle-down"></i></button>
							</div>
							<div class="cont">
								<strong>[스토어 구매/취소 안내]</strong>
								<ul class="dot-list mb30">
									<li>스토어 상품은 구매 후 취소가능기간 내 100% 환불이 가능하며, 부분환불은 불가 합니다. </li>
									<li>(ex. 3개의 쿠폰을 한 번에 구매하신 경우, 3개 모두 취소만 가능하며 그 중 사용하신 쿠폰이 있는 경우 환불이 불가합니다)</li>
									<li>스토어 교환권은 MMS로 최대 1회 재전송 하실 수 있습니다.</li>
								</ul>
			
								<strong>[모바일오더 구매/취소 안내]</strong>
								<ul class="dot-list mb30">
									<li class="font-red">ⓘ 모바일오더는 모바일앱을 통해 이용하실 수 있습니다.</li>
									<li>모바일오더는 구매 후 즉시 조리되는 상품으로 취소가 불가 합니다.</li>
									<li>극장 매점에서 주문번호가 호출되면 상품을 수령하실 수 있습니다.</li>
									<li>극장 상황에 따라 상품준비시간이 다소 길어질 수 있습니다.</li>
								</ul>
							</div>
						</div>
						<!-- 구매 안내상황  End -->
			
					</div>
				</div>
			</div>

      </div>
    </div>
  </section>
</main>
<%@include file ="../_common/commonFooterStart.jsp" %>
<script type="text/javascript">
$(function(){
	var url = location.pathname + location.search;
    $("div.lnb-area > nav#lnb a").filter(function(i,o) { return $(o).attr("href") == url;}).last().parent().addClass("on");

	$.get('/on/oh/ohh/MyScnBoard/selectCponMbNoCount.do')
			.done(function (data) {
				if (data.todayPubOthcomCponCnt > 0) {
					var i = $('<span>메가박스/제휴쿠폰 </span><i class="iconset ico-theater-new"></i>');

					$('#discountCoupon')
							.empty()
							.append(i);
				} else {
					// do nothing
				}
			});
});
</script>      
<script type="text/javascript">

	var cancelParam = {};

	//========================================================================================
	//공통
	//========================================================================================

	// 접근 설정
	fn_com_setAccType = function(accType) {
		cancelParam.accType = accType;
	};

	// obj 객체 조회
	fn_com_getObj = function(obj, type) {
		return $(obj).closest(type);
	};

	// 예매 교환권
	fn_com_bokdInfoPop = function($obj) {

		if (cancelParam.accType == 'MY' && !sessionAllow( {sessionAt:true} )) return;

		var reqUrl = fn_getUrl('/MyBokdTicketChbndPopup.do?sellTranNo='+ $obj.attr('sell-tran-no'));

		window.open(reqUrl, '_blank', 'width=750,height=810,resizable=no');
	};

	// 결제내역
	fn_com_payInfoPop = function($obj, locale) {

		var paramData = {'tranNo' : $obj.attr('sell-tran-no')};

		if (locale != undefined) paramData.localeCode = locale;

		gfn_divLayPopUp({
			url       : fn_getUrl('/MyBokdPayInfoPopup.do'),
			params    : paramData,
			height    : '600',
			width     : '600',
			target_id : 'layer_payment_history',
			btn_id    : 'btn_paymentHistory'
		});
	};

	// 굿즈 수령내역
	fn_com_goodsAcptInfoPop = function($obj, locale) {

		var paramData = {'sellTranNo' : $obj.attr('sell-tran-no')};
		if (locale != undefined) paramData.localeCode = locale;

		gfn_divLayPopUp({
			url       : '/on/oh/ohh/MyBokdPurc/MyGoodsAcptListPopup.do',
			params    : paramData,
			height    : '500',
			width     : '490',
			target_id : 'layer_chk_theater',
			btn_id    : 'btn_chkTheater'
		});
	};

	// OK캐쉬백 적립
	fn_com_okCasRecPop = function(confirmFn, $obj) {

		var paramData = {'transNo' : $obj.attr('sell-tran-no')};
		var initParam = {callbackFn : confirmFn};

		gfn_divLayPopUp({
			url       : fn_getUrl('/MyBokdCashRecPopup.do'),
			params    : paramData,
			height    : '450',
			width     : '600',
			target_id : 'layer_okcash_after',
			btn_id    : 'btn_okcashAfter',
			initFn    : 'savePointRecInit',
			initParam : initParam,
		});
	};

	// 예매목록 조회
	fn_com_makeHtmlForBokdList = function(paramData) {

		// 값 조회
		$.ajaxMegaBox({
			url      : fn_getUrl('/selectBokdList.do'),
			data     : JSON.stringify(paramData),
			success  : function (data, textStatus, jqXHR) {

				fn_makeHtmlForBokdList(paramData, data);
			}
		});
	};

	// 구분에 따른 URL 생성
	function fn_getUrl(url) {

		switch(cancelParam.accType) {
		case 'NON' : return '/on/non/NonMbBokd'     + url;  break;
		default    : return '/on/oh/ohh/MyBokdPurc' + url;
		}
	}

	// 예매목록 생성
	function fn_makeHtmlForBokdList(paramData, data) {

		var $li, html;

		var arr = [];

		if (data.list.length == 0) {

			html  = '';
			html += '<div class="no-history-reservation mt20">';
			html += '	예매 내역이 없습니다. ';
			html += '</div>';

			$('#bokdList').html(html);

			return;
		}

		$.each(data.list, function(i, param) {

			var privPackList = '';

			arr.push($li = $(getBokdHtml()));

			// 버튼노출 스위치용
			param.buttonCd = (paramData.divCd == 'E' || param.playAt == 'N')? 'ETC' : param.hotdealStatCd;

			// 이미지 여부
			$li.find('a:first').attr({'href' : '/movie-detail?rpstMovieNo='+ param.rpstMovieNo, 'title' : param.movieNm +' '});
			$li.find('a:first').html('<img src="'+ data.imgSvrUrl + param.imgPath +'" alt="'+ param.movieNm +'" onerror="noImg(this)">');

			// 핫딜상태코드
			switch(param.hotdealStatCd) {
			case 'HDS01' : //핫딜진행
				param.bokdTitle    = '거래번호';  
				param.bokdNoFormat = param.sellTranNo;          //거래번호로 변경
				break;
			default      :
				param.bokdTitle    = '예매번호';  
				param.bokdNoFormat = (param.bokdNo || '').bokdFormat();
			}

			// 버튼 노출 변경
			switch(param.buttonCd) {
			case 'HDS01' : //핫딜진행
				$li.find('div.btn-group a.purple').remove();     //교환권출력 삭제
				break;
			case 'HDS02' : //핫딜성공
				$li.find('div.btn-group a.gray').remove();       //예매취소 삭제
				break;
			case 'ETC'   : //추가조건
				$li.find('div.btn-group a.purple').remove();     //교환권출력 삭제
				$li.find('div.btn-group a.gray').remove();       //예매취소 삭제
				break;
			}

			// OK캐시백 적립 버튼
			if (Number(nvl(param.okSaveAmt)) > 0) {
				$li.find('div.btn-group').prepend('<a href="" name="btnOkCashRec" class="button">제휴포인트 추후 적립</a>');
			}

			// 식음료 신청정보
			if('Y' == param.drnkAddStatCd && param.theabKindCd.indexOf('TBP') > -1){
				if(param.privPackList != null){
					var parivPackSplitList = param.privPackList.split(',');
					// 내용 생성
					$.each(parivPackSplitList, function(i, param) {
						privPackList += '<dd>' + param +'</dd>';
					});
					privPackList +='<dt>' + '총 ' + parivPackSplitList.length +'건'+'</dt>';
				}

			} else if(param.theabKindCd.indexOf('TBP') == -1){
				param.title = '관람좌석';         
				param.noti  = param.seatNm;
			}

			// 값 설정
			$li.attr({'sell-tran-no' : param.sellTranNo});

			//************************
			// 관람정보
			//************************
			html  = '';
			html += '<tr>';
			html += '	<th scope="row" class="a-r">'+ param.bokdTitle +'</th>';
			html += '	<td colspan="3">';
			html += '		<em class="num">'+ param.bokdNoFormat +'</em>';
			if(param.goodsAcptChk == 'Y') { //굿즈 수령완료
				html += '	<span class="goodsGet">굿즈 수령 완료</span>';
            }
			html += '	</td>';
			html += '</tr>';
			html += '<tr>';
			html += '	<th scope="row" class="a-r">영화명</th>';
			html += '	<td colspan="3">';
			html += '		<p class="tit-movie">';
			html += '			<span>'+ param.movieNm     +'</span>';
			html += '			<span>'+ param.movieKindNm +'</span>';
			html += '		</p>';
			html += '	</td>';
			html += '</tr>';
			html += '<tr>';
			html += '	<th scope="row" class="a-r">극장/상영관</th>';
			html += '	<td>'+ param.brchNm +'/'+ param.theabNm +'</td>';
			html += '	<th scope="row">관람인원</th>';
			html += '	<td>'+ param.admisPcnt +'</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<th scope="row" class="a-r">관람일시</th>';
			html += '	<td>'+ param.playDt.megaFormat('kr') +' ('+ param.playSeq +'회차)</td>';

			if(param.theabKindCd.indexOf('TBP') == -1){		// 부티크가 아닌경우만

				html += '	<th scope="row">'+ param.title +'</th>';
				html += '	<td>'+ param.noti +'</td>';
			}
			html += '</tr>';
			if(param.goodsAcptChk == 'Y') {//굿즈 수령완료
				html += '<tr>';
				html += '<th>굿즈 수령</th>';
				html += '<td>';
				// html += '<a href="#" onclick="fn_goodsGetListDtl(\''+param.sellTranNo+'\')" class="goodsGetView" data-gn="'+param.sellTranNo+'">굿즈수령내역 확인</a>';
				html += '<a href="#" class="goodsGetView" name="goodsGetView" data-gn="'+param.sellTranNo+'">굿즈수령내역 확인</a>';
				html += '</td>';
				html += '</tr>';
			}

			if(privPackList.length > 0){
				html += '<th scope="row" class="a-r va-t" style="padding-top:8px;">패키지 신청</th>';
				html += '	<td class="newTd"><dl class="dot_list">'+ privPackList +'</dl></td>';
				html += '</tr>';
			}


			$li.find('table:eq(0) tbody').html(html);

			//************************
			// 결제정보
			//************************
			param.point = {title : '', value : ''}; //ie디자인오류로 빈값으로변경

			if (paramData.divCd == 'B' && cancelParam.accType != 'NON' && param.resvrPoint != '0') {
				param.point = {title : '적립예정 포인트', value : param.resvrPoint.format() + ' P'};
			}

			html  = '';
			html += '<tr>';
			html += '	<th scope="row" class="a-r">결제일시</th>';
			html += '	<td>'+ (param.payDe || '').maskDate();
			html += '		<a href="#" class="button gray-line x-small" title="결제정보">결제정보</a>';
			html += '	</td>';
			html += '	<th scope="row">'+ param.point.title +'</th>';
			html += '	<td>'+ param.point.value +'</td>';
			html += '</tr>';

			$li.find('table:eq(1) tbody').html(html);
		});

		//************************
		// 기본 구조
		//************************
		html  = '';
		html += '<div class="board-list-util">';
		html += '	<p class="result-count pt00">';
		html += '		<strong>';
		html += '			총';
		html += '			<b class="font-gblue">'+ data.list[0].totCnt +'</b>건';
		html += '		</strong>';
		html += '	</p>';
		html += '</div>';
		html += '<div class="history-reservation">';
		html += '	<ul></ul>';
		html += '</div>';

		$('#bokdList').html(html);

		$('#bokdList ul').html(arr);

	}

	// html 기본 틀
	function getBokdHtml() {

		var html = '';

		html += '<li>';
		html += '	<div class="round">';
		html += '		<a href="#" class="img" title="예매목록"></a>';
		html += '		<table class="table">';
		html += '			<colgroup>';
		html += '				<col style="width:75px;">';
		html += '				<col style="width:230px;">';
		html += '				<col style="width:80px;">';
		html += '				<col>';
		html += '			</colgroup>';
		html += '			<tbody>';
		html += '			</tbody>';
		html += '		</table>';
		html += '		<div class="bg-round">';
		html += '			<table class="table">';
		html += '				<colgroup>';
		html += '					<col style="width:75px;">';
		html += '					<col style="width:230px;">';
		html += '					<col style="width:100px;">';
		html += '					<col>';
		html += '				</colgroup>';
		html += '				<tbody>';
		html += '				</tbody>';
		html += '			</table>';
		html += '		</div>';
		html += '		<div class="btn-group">';
		html += '			<a href="" title="" class="button purple" name="btnTicketChbnd">교환권출력</a>';
		html += '			<a href="" class="button gray" name="btnCancelBokd" title="예매취소">예매취소</a>';
		html += '		</div>';
		html += '	</div>';
		html += '</li>';

		return html;
	}

	// 취소된 예매 리스트 생성
	fn_com_makeHtmlforCancelBokdList = function() {

		var options = {};

		// 네이게이션 ID
		options.navId = '#navBokd';

		// 호출 URL
		options.url = fn_getUrl('/selectCancelBokdList.do');

		options.paramData = {'localeCode' : 'kr'};

		// 그리기
		options.successCallBack = function( data, textStatus, jqXHR ) {

			var html = '';

			// 기본값
			if (data.list.length == 0) {
				html = '<tr><td colspan="5" class="a-c">취소내역이 없습니다.</td></tr>';
			}

			// 내용 생성
			$.each(data.list, function(i, param) {

				if (param.playDt    == null) param.playDt    = '';
				if (param.rfndDe    == null) param.rfndDe    = '';
				if (param.sellEndDe == null) param.sellEndDe = '';

				html += '<tr>';
				html += '	<td>'+ (param.rfndDt || '').payDtFormat() +'</td>';
				html += '	<th scope="row">'+ param.movieNm +'</th>';
				html += '	<td>'+ param.brchNm +'</td>';
				html += '	<td>'+ param.playDt.megaFormat('kr') +'</td>';
				html += '	<td class="a-r">';
				html += '		<span class="font-red">'+ param.prdtAmt.format() +'원</span>';
				html += '	</td>';
				html += '</tr>';
			});

			// html 설정
			$(options.navId).prev().find('tbody').html(html);
		};

		// page 이벤트 연결
		gfn_setPage(options);

	};

	//========================================================================================
	//기프트카드 선물취소 체크
	//========================================================================================
	fn_giftcard_cancel_chk = function(confirmFn, $obj){
		cancelParam.confirmFn = confirmFn;

		var paramData = {'transNo' : $obj.attr('sell-tran-no')};

		if($obj.attr('sell-prdt-kind-cd') == 'SPD61'){

			// 로딩생성
			gfn_logdingModal();

			$.ajaxMegaBox({
				url      : '/on/oh/ohz/PayStore/giftCardCancelChk.do',
				data     : JSON.stringify(paramData),
				clickLmtChk: true, //중복클릭 방지 실행
				success  : function (data, textStatus, jqXHR) {

					// 로딩삭제
					gfn_logdingModal();

					var totCnt = parseInt(data.returnMap.totCnt);
					var sgntCnt = parseInt(data.returnMap.sgntCnt);

					if(totCnt > 0 && sgntCnt > 0){
						gfn_alertMsgBox('선물하신 기프트카드가 등록되어 구매취소가 불가합니다.');
						return;
					} else {
						fn_com_cancelPurc(confirmFn, $obj);
					}
				},
				complete: function(xhr){
					clearLmt(); //중복제한 초기화
				}
			});
		} else {
			fn_com_cancelPurc(confirmFn, $obj);
		}
	}

	//========================================================================================
	//구매취소
	//========================================================================================
	fn_com_cancelPurc = function(confirmFn, $obj) {

		cancelParam.confirmFn = confirmFn;

		gfn_confirmMsgBox('취소 시 유효기간 경과된 포인트는 복구되지 않습니다.\n구매취소 하시겠습니까?', function() {
			var paramData = {'transNo' : $obj.attr('sell-tran-no')};
			// 로딩생성
			gfn_logdingModal();

			$.ajaxMegaBox({
				url      : '/on/oh/ohz/PayStore/cancelStorePayment.do',
				data     : JSON.stringify(paramData),
				clickLmtChk: true, //중복클릭 방지 실행
				success  : function (data, textStatus, jqXHR) {

					// 로딩삭제
					gfn_logdingModal();

					if (data.statCd == 0) {
						gfn_alertMsgBox('구매취소 되었습니다.', function() {
							if (cancelParam.confirmFn != null) cancelParam.confirmFn();
						});
					} else {
						gfn_alertMsgBox(data.msg);
					}
				},
		        complete: function(xhr){
		         	clearLmt(); //중복제한 초기화
		        }
			});
		});
	};

	//========================================================================================
	//환불수수료 결제 - 예매
	//========================================================================================
	// 예매 - 환불수수료 확인
	fn_com_cancelBokd = function(confirmFn, $obj) {

		cancelParam.confirmFn = confirmFn;
		cancelParam.paramData = { 'sellChnlCd' : ''
								, 'transNo'    : $obj.attr('sell-tran-no')
								, 'sellTranNo' : $obj.attr('sell-tran-no')};

		// 수수료 확인
		$.ajaxMegaBox({
			url     : fn_getUrl('/selectMyBokdRfndFee.do'),
			data    : JSON.stringify(cancelParam.paramData),
			clickLmtChk: true, //중복클릭 방지 실행
			success : function (data, textStatus, jqXHR) {

				// 환불정보
				cancelParam.info = data.info;
				var nonData = {'callUrl': data.info.callUrl
						, 'cancelAt'   : data.info.cancelAt
						, 'refundAmt'  : data.info.refundAmt
						, 'transNo'    : $obj.attr('sell-tran-no')
						, 'sellTranNo' : $obj.attr('sell-tran-no')};

				switch(data.info.cancelAt) {
				case 'N' : //예매취소 불가
					if (data.info.rtnMsg != '') gfn_alertMsgBoxSize(data.info.rtnMsg, 400);
					break;
				case 'Y' : //예매취소 가능
					gfn_confirmMsgBox('취소 시 유효기간 경과된 관람권, 쿠폰, 포인트는 복구되지 않습니다.\n예매취소 하시겠습니까?', function(){ fn_nextCancelBokd()});
					break;
				case 'P' : //환불수수료 팝업
					gfn_divLayPopUp({
						url       : '/on/oh/ohz/PayBooking/MyBokdRfndFeePopup.do',
						height    : '380',
						width     : '600',
						params    : nonData,
						initFn    : 'myBokdRfndFeeInit',
						initParam : {callbackFn : function() {

								// 환불수수료
								cancelParam.paramData.refundAmt = cancelParam.info.refundAmt;
								// 환불수수료 선결제처리
								fn_preRefund();
							}
						}
					});
				}
			},
	        complete: function(xhr){
	         	clearLmt(); //중복제한 초기화
	        }
		});
	};

	// 환불수수료 선결제처리
	function fn_preRefund(){

		$.ajaxMegaBox({
			contentType  : 'application/json;charset=UTF-8',
			url          : '/on/oh/ohz/PayBooking/prepareRefund.do',
			data         : JSON.stringify(cancelParam.paramData),
			success      : function (data, textStatus, jqXHR) {
				if (data.statCd != 0) {
					gfn_alertMsgBox(data.msg);
					return;
				}

				//fdk 결제 팝업 생성
				fdkPayProc(cancelParam.paramData.transNo);
			},
			error: function(xhr,status,error){
				var err = JSON.parse(xhr.responseText);
				gfn_alertMsgBox(err.msg);
			}
		});
	}

	// 예매취소
	function fn_nextCancelBokd() {

		// 로딩생성
		gfn_logdingModal();

		$.ajaxMegaBox({
			url     : cancelParam.info.callUrl,
			data    : JSON.stringify(cancelParam.paramData),
			success : function (data, textStatus, jqXHR) {

				// 로딩삭제
				gfn_logdingModal();

				if (data.returnMap.statCd == '0') {
					gfn_alertMsgBox('예매가 취소되었습니다.', function() {
						if (cancelParam.confirmFn != null) cancelParam.confirmFn();
					});
				} else {
					gfn_alertMsgBox(data.returnMap.msg);
				}
			}
		});
	}

	// FDK호출
	function fdkPayProc(transNo) {

		//FDK 결제 창 호출 페이지로 프레임 영역 변경
		FD_PAY_FRAME.location.href = '/on/oh/ohz/PayBooking/applyRefundCreditCard.do?transNo='+transNo;

		//"FD_PAY_FRAME" 프레임을 가지고 있는 DIV 영역의 ID를 입력(sample 이용 시 : id="fdpayWin")
		layer_open('fdpayWin');
	}

	// 레이어 팝업 호출 시 처리
	function layer_open(el){
		wrapWindowByMask();         //레이어 팝업 활성화 시 하단 MASKING 처리를 위한 함수

		var fdlayer = $('#' + el);  //레이어의 id를 fdlayer변수에 저장
		fdlayer.fadeIn();           //레이어 실행

		// 화면의 중앙에 레이어를 띄운다.
		fdlayer.css('margin-top' , '-'+fdlayer.outerHeight()/2+'px');
		fdlayer.css('margin-left', '-'+fdlayer.outerWidth() /2+'px');
		fdlayer.center();
		fdlayer.find('a.closeBtn').click(function(e){
			fdlayer.fadeOut();                                          //'Close'버튼을 클릭하면 레이어가 사라진다.
			e.preventDefault();
			document.getElementById('mask').style.display = 'none';     //레이어 팝업 비활성화 시 하단 MASKING 표시 해제
			FD_PAY_FRAME.location.href = '/on/oh/ohz/PayBooking/blank.do'; //빈 페이지로 프레임 영역 변경
		});
	}

	//레이어 팝업 하단 영역 마스킹 처리(레이어 팝업 호출 시 사용)
	function wrapWindowByMask(){
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();
		var maskWidth  = $(window).width();

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({'width':maskWidth,'height':maskHeight});

		//애니메이션 효과
		$('#mask').fadeIn(1000);
		$('#mask').fadeTo('slow',0.6);
	}

	// 최종결제
	function fdkAuthResult(fdkResultData) {

		//오류시 alert 메시지 팝업 후 레이어 닫기
		if (fdkResultData.Code != '0000') {
			gfn_alertMsgBox({ msg: fdkResultData.Msg });
			$('#fdpayWin').find('a.closeBtn').click();
			return false;
		} else {
			//승인요청중 close버턴클릭문제 (승인요청전 레이어만 사라지게 처리한다)
			$('#fdpayWin').fadeOut();
		}
		var transNo = cancelParam.paramData.transNo;

		var paramData = {transNo:transNo, Code:fdkResultData.Code, Msg:fdkResultData.Msg , FDTid:fdkResultData.FDTid };
		$.ajax({
			url        : '/on/oh/ohz/PayBooking/execRefundPayment.do',
			type       : 'POST',
			contentType: 'application/json;charset=UTF-8',
			dataType   : 'json',
			data       : JSON.stringify(paramData),
			success    : function (data, textStatus, jqXHR) {
				//최종 결제 테스트
				if (data.statCd != '0') {
					gfn_alertMsgBox({ msg: data.msg });
				} else {
					//예매취소
					fn_nextCancelBokd();
				}
				$('#fdpayWin').find('a.closeBtn').click();

			},
			error       : function(xhr,status,error){
				gfn_logdingModal();
				var err = JSON.parse(xhr.responseText);
				//err.statCd 에 따라서 이전화면으로 리턴 가능토록
				gfn_alertMsgBox({ msg: err.msg });
				$('#fdpayWin').find('a.closeBtn').click();
			}
		});
	}

	jQuery.fn.center = function () {
		this.css('position','absolute');
		this.css('top', Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + 350 + 'px');
		return this;
	}

</script>	
<script type="text/javascript">

	// Tab Index
	var tabIdx = 01 -1;

	// 최초 1번 조회 여부 Index로 관리함
	var arrTab = [0, 0];

	var $btnOkCashRec = null;

	$(function() {

		// 접근자 설정 : 중요!!!
		fn_com_setAccType('MY');

		$('document').ready(function() {

			// 구매 조회기간
			$('#myPurcArea .btn-period button[value="M1"]').click();

			// 요청 탭 선택
			$('div.tab-block a').eq(tabIdx).click();
		});

		// 이벤트 버블현상 공통 제거
		$('#contents').on('click', 'a', function(e) {

			if (($(this).attr('href') || '').indexOf('/') == -1) {
				e.preventDefault();
			}
		});

		// 메뉴 선택
		$('#contents div.tab-block a').click(function() {

			var index = $('div.tab-block a').index(this);

			// 최초 1회 조회
			if (arrTab[index] == 0) {

				switch(index){
				case 0 :

					// 예매내역
					$('#myBokdArea [name=search]').click();

					// 예매취소 내역
					fn_com_makeHtmlforCancelBokdList(); break;

				case 1 :

					// 구매내역
					fn_makeHtmlforPurcList();
				}

				arrTab[index] = 1;
			}
		});

		// 예매Tab > 구분 > 라디오
		$('#myBokdArea [name=radBokd]').click(function() {

			$('#myBokdArea [name=selYM]').prop('disabled', (this.value != 'E')).selectpicker('refresh');
		});

		// 예매Tab > 구분 > 조회
		$('#myBokdArea [name=search]').click(function() {

			var paramData = {'divCd' : $('#myBokdArea [name=radBokd]:checked').val(), 'localeCode' : 'kr'};

			if (paramData.divCd == 'E') {
				paramData.searchDe = $('#myBokdArea [name=selYM]').val();
			}

			// 값 조회
			fn_com_makeHtmlForBokdList(paramData);
		});

		// 구매Tab > 조회기간 > 기간 버튼
		$('#myPurcArea .btn-period button').click(function() {

			var dateFormat = {'diffSe' : this.value[0], 'diffVal' : '-'+ this.value[1], 'stanDate' : '20231225'.maskDate()};

			$('#myPurcArea .date-calendar:eq(0)').val(dateDiffFormat(dateFormat,'yy.mm.dd'));
			$('#myPurcArea .date-calendar:eq(1)').val('20231225'.maskDate());

			$(this).addClass('on').siblings().removeClass('on');
		});

		// 구매 Tab > 조회기간 > 조회 버튼
		$('#myPurcArea [name=search]').click(function() {

			fn_makeHtmlforPurcList();
		});

		// 예매 Tab > 결제정보
		$('#myBokdArea').on('click', 'tbody a.button', function() {

			fn_com_payInfoPop(fn_com_getObj(this, 'li'));
		});

		// 예매 Tab > 굿즈수령내역확인
		$('#myBokdArea').on('click', '[name=goodsGetView]', function() {
			fn_com_goodsAcptInfoPop(fn_com_getObj(this, 'li'));
		});

		// 예매 Tab > 예매취소
		$('#myBokdArea').on('click', '[name=btnCancelBokd]', function() {

			fn_com_cancelBokd(function(){ fn_reSreach(0); }, fn_com_getObj(this, 'li'));
		});

		// 예매 Tab > 교환권출력
		$('#myBokdArea').on('click', '[name=btnTicketChbnd]', function() {

			fn_com_bokdInfoPop(fn_com_getObj(this, 'li'));
		});

		// 예매 Tab > OK캐쉬백 적립
		$('#myBokdArea').on('click', '[name=btnOkCashRec]', function() {

			$btnOkCashRec = $(this);
			fn_com_okCasRecPop(function(){ $btnOkCashRec.remove(); }, fn_com_getObj(this, 'li'));
		});

		// 구매 Tab > 결제정보
		$('#myPurcArea').on('click', '.board-list a', function() {

			fn_com_payInfoPop(fn_com_getObj(this, 'tr'), 'kr');
		});

		// 구매 Tab > 구매취소
		$('#myPurcArea').on('click', '[name=btnCancelPruc]', function() {

			fn_giftcard_cancel_chk(function() { fn_reSreach(1); }, fn_com_getObj(this, 'tr'));
		});
	});

	// 재조회
	function fn_reSreach(index) {
		arrTab[index] = 0;
		$('#contents div.tab-block a').eq(index).click();
	}

	// 구매내역 리스트 생성
	function fn_makeHtmlforPurcList(){

		var arr = [];

		var options = {};

		// 값 설정
		$.each( $('#myPurcArea .date-calendar'), function(i, obj) { arr.push( $(obj).val().replaceAll('.', '') ) });

		arr.push($('#myPurcArea [name=selPurc]').val());
		arr.push($('#myPurcArea [name=radPurc]:checked').val());

		// 네이게이션 ID
		options.navId = '#navPurc';

		// 호출 URL
		options.url = '/on/oh/ohh/MyBokdPurc/selectPurcList.do';

		// 파라메터
		options.paramData = {'StartDe' : arr[0], 'EndDe' : arr[1], 'prdtDivCd' : arr[2], 'sellStatCd' : arr[3]};

		// 그리기
		options.successCallBack = function( data, textStatus, jqXHR ) {

			var html = '';
			var totCnt = 0;

			// 기본값
			if (data.list.length == 0) {

				html = '<tr><td colspan="5" class="a-c">결제내역이 없습니다.</td></tr>';
			}

			// 내용 생성
			$.each(data.list, function(i, param) {

				if (i == 0) totCnt = param.totCnt;

				switch(param.statCd) {
				case 'C' :
					param.cls        = 'font-red';
					param.sellStatNm = '결제취소';
					break;
				case 'N' :
					param.cls        = 'font-gblue';
					param.sellStatNm = '취소불가';
					break;
				case 'Y' :
					param.cls        = 'font-gblue';
					param.sellStatNm = '<button type="button" class="button gray-line small" name="btnCancelPruc">구매취소</button>';
					break;
				}

				html += '<tr sell-tran-no="'+ param.sellTranNo +'" sell-prdt-kind-cd="'+param.sellPrdtKindCd+'">';
				html += '	<td>'+ (param.payDt || '').payDtFormat() +'</td>';
				html += '	<td>'+ param.prdtClNm +'</td>';
				html += '	<th scope="row"><a href="" title="'+ param.prdtDivNm +' 결제정보">'+ param.prdtDivNm +'</a></th>';
				if(param.prdtClNm == "포인트몰"){
					html += '	<td class="a-r"><strong class="'+ param.cls +'">'+ param.prdtAmt.format() +'P</strong></td>';
				}else{
					if(param.prdtAmt == 0){
						html += '	<td class="a-r"><strong class="'+ param.cls +'">사용</strong></td>';
					}else{
						html += '	<td class="a-r"><strong class="'+ param.cls +'">'+ param.prdtAmt.format() +'원</strong></td>';
					}
				}
				html += '	<td>'+ param.sellStatNm +'</td>';
				html += '</tr>';
			});

			// 전체 갯수
			$('#myPurcArea .result-count b').html(totCnt.format());

			// html 설정
			$('#myPurcArea .board-list tbody').html(html);
		};

		// page 이벤트 연결
		gfn_setPage(options);
	}
</script>
<%@include file ="../_common/commonFooterEnd.jsp" %>