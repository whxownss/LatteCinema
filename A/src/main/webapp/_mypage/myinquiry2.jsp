<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.QnaBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%
    ArrayList<QnaBoardDTO> qnaBoardList = (ArrayList<QnaBoardDTO>)request.getAttribute("qnaBoardList");
    PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
    int qnaCount = pageDTO.getCount();
    %>
      <!-- 이곳에 코드작성 -->
      <div class="inner-wrap">
        <jsp:include page="lnb.jsp"></jsp:include>
        

		
			<div id="contents">
				<h2 class="tit">나의 문의내역</h2>
			
				<div class="tab-block">
					<ul>
						<li data-url="/mypage/myinquiry?cd=INQD01"><a href="#" class="btn" data-cd="INQD01" title="1:1 문의내역 탭으로 이동">1:1 문의내역</a></li>
						<li data-url="/mypage/myinquiry?cd=INQD03"><a href="#" class="btn" data-cd="INQD03" title="단체관람/대관 문의내역 탭으로 이동">단체관람/대관문의내역</a></li>
						<li data-url="/mypage/myinquiry?cd=INQD02" class="on"><a href="#" class="btn" data-cd="INQD02" title="분실물 문의내역 탭으로 이동">분실물 문의내역</a></li>
					</ul>
				</div>
			
				<div class="mypage-infomation mt20">
					<ul class="dot-list mb20">
						<li id="tabDesc">고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.</li>
						<!-- <li>문의하시기 전 <a href="/support/faq" class="a-link"><strong>자주묻는질문</strong></a>을 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다</li> -->
					</ul>
			
					<div class="btn-group right">
						<a href="#" class="button" id="inqBtn" title="1:1 문의하기">1:1 문의하기</a>
					</div>
				</div>
			
				<div class="board-list-util mb10">
					<p class="result-count">
						<!-- to 개발 : 검색을 안한 경우 -->
						<strong>전체 (<b id="totalCnt"><%=qnaCount %></b>건)</strong>
					</p>
			
					<div class="dropdown bootstrap-select bs3"><select id="custInqStatCd" onchange="javascript:$('#searchBtn').click();" class="" tabindex="-98">
						<option value="">전체</option>
						
								<option value="INQST1">미답변</option>
								<option value="INQST2">답변완료</option>
						
					</select>
<!-- 					<button type="button" class="btn dropdown-toggle btn-default bs-placeholder" data-toggle="dropdown" role="button" data-id="custInqStatCd" title="전체"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">전체</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button> -->
					<div class="dropdown-menu open" role="combobox"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1"><ul class="dropdown-menu inner "></ul></div></div></div>
			
					<div class="board-search ml07">
						<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text" id="searchTxt" value="">
						<button type="button" class="btn-search-input" id="searchBtn">검색</button>
					</div>
				</div>
			
				<div class="table-wrap" id="tableWrap"><!-- table-wrap부분이 바뀌어야함. data-url이 바뀔 때 마다.  -->
					<table class="board-list a-c">
						<caption>1:1 문의 내역 표입니다</caption>
						<colgroup>
							<col style="width:80px">
<%-- 							<col style="width:140px;"> --%>
							<col style="width:120px;">
							<col>
							<col style="width:160px;">
							<col style="width:100px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
<!-- 								<th scope="col">극장</th> -->
								<th scope="col">유형</th>
								<th scope="col">제목</th>
								<th scope="col">답변상태</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
<!-- 							<tr><td colspan="6">목록이 없습니다.</td></tr> -->
							<c:forEach var="qnaBoardDTO" items="${qnaBoardList}">
								<tr>
									<td>${qnaBoardDTO.rn }</td>
									<td>${qnaBoardDTO.qnaCategory }</td>
									<td><a href="cs_qna_content.cs?createUser=${qnaBoardDTO.createUser }&createDate=${qnaBoardDTO.createDate}">${qnaBoardDTO.qnaSubject }</a></td>
									<c:if test="${empty qnaBoardDTO.responseUser }">
							        	<td>미답변</td>
							        </c:if>
							        <c:if test="${! empty qnaBoardDTO.responseUser }">
							        	<td>답변완료</td>
							        </c:if>
							        <td>${qnaBoardDTO.createDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- pagination -->
				<nav class="pagination"></nav>
				<!--// pagination -->
			</div>
      </div>
    </div>
  </section>
</main>
<%@include file ="../_common/commonFooterStart.jsp" %>
<script type="text/javascript">
	var cd = '';
	var qnaDtlsYn = '';

	$(function() {
// 		// 검색 클릭
// 		$('#searchBtn').on('click', function() {
// 			$('[name=currentPage]').val(1);
// 			fn_selectIrList($('.tab-block li.on a').data('cd'));
// 		});

// 		// 검색 엔터키
// 		$('#searchTxt').on('keydown', function(e) {
// 			if(e.keyCode == 13) {
// 				$('[name=currentPage]').val(1);
// 				fn_selectIrList($('.tab-block li.on a').data('cd'));
// 			}
// 		});

		// 탭 클릭
		$('.tab-block a').on('click', function(e) {
			e.preventDefault();

			var cd = $(this).data('cd');
			var idx = $(this).parent().index();


			$('.tab-block li.on').removeClass('on');
			$(this).parent().addClass('on');

			if(idx == 0) {
				$('#inqBtn').html('1:1 문의하기');
				$('#tabDesc').html('고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.');
				
			} else if(idx == 1) {
				$('#inqBtn').html('단체관람/대관 문의하기');
				$('#tabDesc').html('고객센터를 통해 남기신 단체/대관 문의내역을 확인하실 수 있습니다.');
			} else{
				$('#inqBtn').html('분실물 문의하기');
				$('#tabDesc').html('고객센터를 통해 남기신 분실물 문의내역을 확인하실 수 있습니다.');
			}

			// 탭클릭시 검색조건 초기화
			if (qnaDtlsYn == 'Y') {
				qnaDtlsYn = 'N';
				fn_selectIrList(cd);
			} else {
				$('#custInqStatCd').val('').change();
				$('#searchTxt').val('');
				$('[name=currentPage]').val(1);
			}
		});

		// 문의 버튼
		$('#inqBtn').on('click', function(e) {
			e.preventDefault();

			var url = '';
			var btnText = $(this).text();

			if(btnText == '1:1 문의하기') url = 'cs_qna_write.cs';
			else if(btnText == '단체관람/대관 문의하기') url = 'cs_rent.cs';
			else url = 'cs_lost_write.cs';

			location.href = url;
		});

		if(cd == 'INQD03') $('.tab-block a').eq(1).click();
		else if(cd == 'INQD02') $('.tab-block a').eq(2).click();
		else $('.tab-block a').eq(0).click();

		MegaboxUtil.Common.bindSelectBox(); // 셀렉트 박스 라이브러리 적용
	});

	// 문의 목록 조회
// 	function fn_selectIrList(cd) {
// 		var currentPage = $('[name=currentPage]').val() ? $('[name=currentPage]').val() : 1;
// 		var inqLclCd = cd || 'INQD01';

// 		var params = {
// 			custInqStatCd: $('#custInqStatCd').val(),
// 			searchTxt: $('#searchTxt').val(),
// 			inqLclCd: inqLclCd
// 		};

// 		var options = {};
// 		options.url = '/on/oh/ohh/MyInq/inqList.do';
// 		options.paramData = params;
// 		options.currentPage = currentPage;

// 		options.successCallBack = function(data) {
// 			var totCount  = Number(data.totCount);
// 			var target = $("div.table-wrap > table.board-list > tbody");

// 			target.find('tr').remove();

// 			$('#totalCnt').text(totCount);

// 			if(data.list.length > 0) {
// 				var tr, td1, td2, td3, td4, td5, td6, a;

// 				target.find('tr').remove();

// 				$.each(data.list, function(i, v) {
// 					var custInqStatNm = '';
// 					// 답변완료(메일+SMS), 답변완료(메일), 답변완료(SMS) ===> 답변완료
// 					if (v.custInqStatCd == "INQST3" || v.custInqStatCd == "INQST4" || v.custInqStatCd == "INQST5") {
// 						custInqStatNm = "답변완료";
// 					} else {
// 						custInqStatNm = v.custInqStatNm;
// 					}

// 					tr = $('<tr>');
// 					a = $('<a>').attr({ 'href': '#', 'class': 'moveBtn', 'data-no': v.custInqSn, 'title': '문의내역 상세보기' }).html(v.custInqTitle);
// 					td1 = $('<td>').text(totCount - (v.rowNum - 1));
// 					td2 = $('<td>').html(v.brchNm ? v.brchNm : '메가박스');
// 					td3 = $('<td>').html(v.inqSclNm);
// 					td4 = $('<td>').attr('class', 'a-l').append(a);
// 					td5 = $('<td>').html(custInqStatNm);
// 					td6 = $('<td>').text(v.fstRegDtStr);

// 					tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
// 					target.append(tr);
// 				});

// 				fn_bindMoveEvent(inqLclCd);
// 			} else {
// 				tr = $('<tr>');
// 				td1 = $('<td>').attr('colspan', 6).text('목록이 없습니다.');

// 				tr.append(td1);
// 				target.append(tr);
// 			}
// 		};

// 		gfn_setPage(options);
// 	}

	// 제목 버튼 이벤트
// 	function fn_bindMoveEvent(cd) {
// 		$('.moveBtn').off();
// 		$('.moveBtn').on('click', function(e) {
// 			e.preventDefault();

// 			var form = MegaboxUtil.Form.createForm();
// 			//form.append('<input type="hidden" name="custInqSn" value="' + $(this).data('no') + '">');
// 			form.append('<input type="hidden" name="custInqStatCd" value="' + $('#custInqStatCd').val() + '">');
// 			form.append('<input type="hidden" name="searchTxt" value="' + $('#searchTxt').val() + '">');
// 			form.append('<input type="hidden" name="currentPage" value="' + $('.pagination .active').text() + '">');
// 			form.append('<input type="hidden" name="cd" value="' + $('.tab-block li.on a').data('cd') + '">');

// 			var custInqSn = $(this).data('no');

// 			form.attr('action', '/mypage/myinquiry/detail?custInqSn='+custInqSn);
// 			form.submit();
// 		});
// 	}
</script>
<%@include file ="../_common/commonFooterEnd.jsp" %>