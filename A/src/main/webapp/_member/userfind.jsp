<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
    <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <jsp:include page="../_common/header.jsp"></jsp:include>





</head>
<body>

	<main id="main">
		<section class="category-section">
			<div class="container w-50" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->

	<!-- member-wrap -->
	<div class="member-wrap">

		<!-- col-wrap -->
		<div class="col-wrap">
			<!-- col -->
			<div class="col">

				<p class="tit-member">아이디/비밀번호 찾기<!--아이디/비밀번호 찾기--></p>

				<div class="tab-list">
					<ul>
						<li class="on"><a href="javaScript:void(0);" title="아이디찾기 선택">아이디 찾기<!--아이디찾기--></a></li>
						<li><a href="passfind.me" title="비밀번호 찾기 선택">비밀번호 찾기<!--비밀번호 찾기--></a></li>
					</ul>
				</div>

				<h2 class="tit mt40">간편찾기<!--간편찾기--></h2>

				<div class="table-wrap">
					<table class="board-form">
						<caption>이름, 생년월일, 휴대폰 번호 항목을 가진 아이디 찾기 입력 표<!--이름, 생년월일, 휴대폰 번호 항목을 가진 아이디 찾기 입력 표--></caption>
						<colgroup>
							<col style="width:130px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="ibxSchIdMbNm">이름<!--이름--></label></th>
								<td>
									<input id="ibxSchIdMbNm" maxlength="20" type="text" placeholder="이름" class="input-text w230px"><!--이름-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxSchIdBirthDe">생년월일<!--생년월일--></label></th>
								<td>
									<input id="ibxSchIdBirthDe" maxlength="8" type="text" placeholder="생년월일 앞8자리" class="input-text w230px"><!--생년월일 8자리-->
									<div id="schIdBirthDe-error-text" class="alert"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxSchIdMblpTelno">휴대폰 번호<!--휴대폰 번호--></label></th>
								<td>
									<input id="ibxSchIdMblpTelno"  maxlength="11" type="text" placeholder="'-' 없이 입력" class="input-text w230px"><!--'-' 없이 입력-->
									<div id="schIdMblpNo-error-text" class="alert"></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="mt20 font-size-14">
					※ 휴대폰 번호가 변경된 경우 본인인증 찾기를 통하여 아이디찾기를 진행해주시기 바랍니다.<!--※ 휴대폰 번호가 변경된 경우 본인인증 찾기를 통하여 아이디찾기를 진행해주시기 바랍니다.-->
				</div>

				<div class="btn-member-bottom v1">
					<button id="btnSchId" type="button" class="button purple large" disabled="disabled">아이디 찾기<!--아이디 찾기--></button>

				</div>


			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
	<!--// member-wrap -->



			</div>
		</section>
	
	</main>
	
<%@include file ="../_common/commonFooterStart.jsp" %>
<script type="text/javascript">
var sValidateSchIdMbNm       = "N";
var sValidateSchIdBirthDe    = "N";
var sValidateSchIdMblpTelno  = "N";

//이벤트
$(function(){
	fn_validateSchIdInputVal();

	/* 이름 숫자를 제외한 입력 여부판단 */
	$("#ibxSchIdMbNm").on("keyup", function(e){
		var partton = /[^ㄱ-힣a-zA-Z\s]/g;
		if(partton.test($(this).val())) {
			var value = $(this).val().replace(/[^ㄱ-힣a-zA-Z\s]/g,"");
			$("#ibxSchIdMbNm").val(value);
		}
		if(fn_validateSchIdInputVal()) {
			if(e.keyCode == 13){$("#btnSchId").click();}
		} else {
			if(e.keyCode == 13){$("#ibxSchIdBirthDe").focus();}
		}
	});
	$("#ibxSchIdMbNm").focusout(function(){
		var partton = /[^ㄱ-힣a-zA-Z\s]/g;
		if(partton.test($(this).val())) {
			var value = $(this).val().replace(/[^ㄱ-힣a-zA-Z\s]/g,"");
			$("#ibxSchIdMbNm").val(value);
        }
		fn_validateSchIdInputVal();
	});

	/* 생년월일 숫자만 입력 여부판단 */
	$("#ibxSchIdBirthDe").on("keyup", function(e){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		if(fn_validateSchIdInputVal()) {
			if(e.keyCode == 13){$("#btnSchId").click();}
		} else {
			if(e.keyCode == 13){$("#ibxSchIdMblpTelno").focus();}
		}
	});
	$("#ibxSchIdBirthDe").focusout(function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		fn_validateSchIdInputVal();
	});

	/* 휴대폰번호 숫자만 입력 여부판단 */
	$("#ibxSchIdMblpTelno").on("keyup", function(e){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		if(fn_validateSchIdInputVal()){
			if(e.keyCode == 13){$("#btnSchId").click();}
		}
	});
	$("#ibxSchIdMblpTelno").focusout(function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		fn_validateSchIdInputVal();
	});

	/* 확인 */
	$("#btnSchId").click(function(){
		/* 폼데이터 초기화 */
		$('#searchIdForm input[name=loginId]').attr('value','');
		$('#searchIdForm input[name=mblpTelno]').attr('value','');
		$('#searchIdForm input[name=mbNo]').attr('value','');
		$('#searchIdForm input[name=certType]').attr('value','');

		var sSchIdMbNm      = $("#ibxSchIdMbNm").val();			//이름
		var sSchIdBirthDe   = $("#ibxSchIdBirthDe").val();		//생년월일
		var sSchIdMblpTelno = $("#ibxSchIdMblpTelno").val();	//휴대폰번호
		var paramData = { mbNm:sSchIdMbNm
						, birthDe:sSchIdBirthDe
						, mblpTelno:sSchIdMblpTelno
						};

		fn_selectMbSchId(paramData);
	})
</script>
<%@include file ="../_common/commonFooterEnd.jsp" %>