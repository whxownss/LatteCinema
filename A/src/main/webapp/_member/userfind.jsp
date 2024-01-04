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
	});
	/* 본인인증 */
	$("#btnSchIdMblpCert").click(function(){
		/* 폼데이터 초기화 */
		$('#searchIdForm input[name=certType]').attr('value','SCRC04');
		fn_submit('/member-check');	//M-ME-DA-01
	});
});


function fn_selectMbSchId(paramData){
	$.ajaxMegaBox({
		url: "/on/oh/ohg/MbLogin/selectMbSchId.rest",
		type: "POST",
		contentType: "application/json;charset=UTF-8",
		dataType: "json",
		data: JSON.stringify(paramData),
		success: function (data, textStatus, jqXHR) {

			var revStr      = data.resultMap.revStr;
			var loginIdStar = data.resultMap.loginIdStar;
			var loginId     = data.resultMap.loginId;
			var fstJoinDt   = data.resultMap.fstJoinDt;
			var joinPathNm  = data.resultMap.joinPathNm;
			var dormAcctAt  = data.resultMap.dormAcctAt;
			var certType    = data.resultMap.certType;
			var loginPage   = "/main";
			var redisKey    = data.resultMap.redisKey;


			//아이디 있는경우	//화면이동 로그인메인 M-ME-LO-01
			if (revStr == "mbSchIdGuideId") {
				//본인인증을 통한 아이디찾기일 경우 아이디를 표시한다.
				var msg = "";
				var options = {};
				if(certType == "SCRC04"){
					msg = '회원님의 아이디는 ['+loginId+'] 입니다.\n가입일 : '+fstJoinDt+'';
				}
				else {
					msg = '회원님의 아이디는 ['+loginIdStar+'] 입니다.\n가입일 : '+fstJoinDt+'';
				}
				options.msg = msg;
				options.callback = fn_submit;
				options.param    = {confirm:'/main'};
				options.minWidth  = 400;
				options.minHeight = 250;
				gfn_alertMsgBox(options);
				return;
			}

			//아이디 없는경우	//아이디 등록	M-ME-FI-02
			if (revStr == "mbSchIdGuideNonId") {
				$('#searchIdForm input[name=certType]').attr('value','SCRC11');	//웹아이디 신규등록
				$('#searchIdForm input[name=dormAcctAt]').attr('value',dormAcctAt);
				$('#searchIdForm input[name=redisKey]').attr('value',redisKey);
				var options        = {};
				options.msg        = '아이디 미등록 회원입니다.\n아이디를 등록하시겠습니까?\n가입 : '+fstJoinDt+'('+joinPathNm+' 가입)';
				options.confirmFn  = fn_submit;
				options.param      = {confirm:'/member-check'} ;
				options.minWidth  = 400;
				options.minHeight = 300;
				gfn_confirmMsgBox(options);
				return;
			}

			//아이디 없으며 휴면계정인경우
			if(revStr == "dormAcctNonId"){
				$('#searchIdForm input[name=certType]').attr('value','SCRC11');	//웹아이디 신규등록
				$('#searchIdForm input[name=dormAcctAt]').attr('value',dormAcctAt);
				$('#searchIdForm input[name=redisKey]').attr('value',redisKey);
				var options        = {};
				options.msg        = '회원님은 아이디 미등록 상태로 메가박스 온라인 서비스를 1년이상 이용하지 않아 휴면계정으로 전환되었습니다. 아이디 등록을 통해 휴면계정 복구를 진행하시겠습니까?';
				options.confirmFn  = fn_submit;
				options.param      = {confirm:'/member-check'} ;
				options.minWidth  = 400;
				options.minHeight = 300;
				gfn_confirmMsgBox(options);
				return;
			}

			//휴면 계정으로 전환된경우 //휴면계정복구	본인인증 수단 선택	M-ME-DA-01
			if (revStr == "mbSchIdGuideDormAcct") {
				$('#searchIdForm input[name=certType]').attr('value','SCRC03');
				$('#searchIdForm input[name=redisKey]').attr('value',redisKey);
				var options        = {};
				options.msg        = '회원님의 아이디는 ['+loginIdStar+'] 메가박스 온라인 서비스를 1년이상 이용하지 않아 휴면계정으로 전환되었습니다. 휴면계정 복구 후 서비스 이용이 가능합니다.\n휴면계정 복구를 진행하시겠습니까?';
				options.okBtnTxt = "휴면계정복구";
				options.callback = fn_submit;
				options.param    = {confirm:"/member-check"};
				options.minWidth  = 400;
				options.minHeight = 300;
				gfn_alertMsgBox(options);
				return;
			}

			//비회원	//확인 회원가입, 취소 아이디찾기
			if (revStr == "mbSchIdGuideNonMb") {
				gfn_alertMsgBoxSize('해당정보로 가입된 사용자를 찾을수 없습니다.\n\n탈퇴여부 및 재가입 가능한 일자를 확인하고 싶으시면 본인인증을 통하여 확인 가능합니다.', 400, 250);
				return;
			}
		},
		error: function(xhr,status,error){
			 var err = JSON.parse(xhr.responseText);
			 alert(xhr.status);
			 alert(err.message);
		}
	});
}

//입력 문자 체크
function fn_validateSchIdInputVal(){

	//이름
	if($("#ibxSchIdMbNm").val() != "") {
		sValidateSchIdMbNm = 'Y';
	}
	else {
		sValidateSchIdMbNm = 'N';
	}

	//생년월일
	if($("#ibxSchIdBirthDe").val() != "") {
		if(fn_validateDateYn($("#ibxSchIdBirthDe").val(),8)){
			sValidateSchIdBirthDe = 'Y';
			$('#schIdBirthDe-error-text').text('');
		}
		else {
			sValidateSchIdBirthDe = 'N';
			$('#schIdBirthDe-error-text').text('생년월일을 정확히 입력해주세요.');
		}
	}
	else {
		sValidateSchIdBirthDe = 'N';
	}

	//휴대폰번호
	if($("#ibxSchIdMblpTelno").val() != "") {
		var frontNm = $("#ibxSchIdMblpTelno").val().substr(0,2);
		if(frontNm != '01'){
			$('#schIdMblpNo-error-text').text('휴대폰번호를 정확히 입력해주세요.');
			sValidateSchPwdCertNo = 'N';
		}
		else {
			$('#schIdMblpNo-error-text').text('');
			sValidateSchIdMblpTelno = 'Y';
		}
	}
	else {
		sValidateSchIdMblpTelno = 'N';
	}

	if(    sValidateSchIdMbNm == 'Y'
		&& sValidateSchIdBirthDe == 'Y'
		&& sValidateSchIdMblpTelno == 'Y'
		){
		$("#btnSchId").attr("disabled", false);
		return true;
	}
	else{
		$("#btnSchId").attr("disabled", true);
		return false;
	}
}
function fn_submit(page){

	$("#searchIdForm").attr("method","post");
	$("#searchIdForm").attr("action",page);
	$("#searchIdForm").submit();
}
</script>
<%@include file ="../_common/commonFooterEnd.jsp" %>