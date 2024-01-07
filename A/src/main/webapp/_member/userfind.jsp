<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%MemberDTO memberDTO = (MemberDTO)request.getAttribute("memberDTO"); %>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.0/css/bootstrap.min.css">
<!--   <link href="_assets/js/findIdPass.js"> -->
    <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
  <jsp:include page="../_common/header.jsp"></jsp:include>





</head>
<body>
<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Understood</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Modal -->

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
						<form id="userFindForm" action="userfindPro.me" method="post" name="fr">
							<div class="table-wrap">
								<table class="board-form">
									<caption>이름, 생년월일, 휴대폰 번호 항목을 가진 아이디 찾기 입력 표<!--이름, 생년월일, 휴대폰 번호 항목을 가진 아이디 찾기 입력 표--></caption>
									<colgroup>
										<col style="width:130px;">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="name">이름<!--이름--></label></th>
											<td>
												<input id="name" maxlength="20" type="text" placeholder="이름" class="input-text w230px findInput" name="name"><!--이름-->
											</td>
										</tr>
										<tr>
											<th scope="row"><label for="birth">생년월일<!--생년월일--></label></th>
											<td>
												<input id="birth" maxlength="8" type="text" placeholder="생년월일 8자리" class="input-text w230px findInput" name="birth"><!--생년월일 8자리-->
												<div id="schIdBirthDe-error-text" class="alert"></div>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for="phone">휴대폰 번호<!--휴대폰 번호--></label></th>
											<td>
												<input id="phone"  maxlength="11" type="text" placeholder="'-' 없이 입력" class="input-text w230px findInput" name="phone"><!--'-' 없이 입력-->
												<div id="schIdMblpNo-error-text" class="alert"></div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</form>
							<div class="btn-member-bottom v1">
<!-- 								<button id="btnFindId" type="button" class="button purple large" disabled="disabled" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="userFind()">아이디 찾기아이디 찾기</button> -->
								<button id="btnFindId" type="button" class="button purple large" disabled="disabled" onclick="userFind()">아이디 찾기<!--아이디 찾기--></button>
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
<!-- 		<div class="normalStyle" style="display:none;position:fixed;top:0;left:0;background:#000;opacity:0.7;text-indent:-9999px;width:100%;height:100%;z-index:100;">닫기</div> -->
<!-- 		<div class="alertStyle" style="position: fixed; top: 0px; left: 0px; background: rgb(0, 0, 0); opacity: 0.7; width: 100%; height: 100%; z-index: 5005; display: block;"></div> -->
<!-- 		<section class="alert-popup" style="position: fixed; padding-top: 45px; background: rgb(255, 255, 255); z-index: 5006; top: 434.5px; left: 866.5px; width: 400px; opacity: 1;"  -->
<!-- 					id="layerId_041614172385406745"> -->
<!-- 			<div class="wrap"> -->
<!-- 				<header class="layer-header"> -->
<!-- 					<h3 class="tit">알림</h3> -->
<!-- 				</header> -->
<!-- 				<div class="layer-con" style="height:250px"> -->
<!-- 					<p class="txt-common">회원님의 아이디는 [goodtime5**] 입니다.<br>가입일 : 2022-07-30</p> -->
<!-- 					<div class="btn-group"> -->
<!-- 						<button type="button" class="button lyclose" style="display: none;"></button> -->
<!-- 						<button type="button" class="button purple confirm">확인</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<button type="button" class="btn-layer-close">레이어 닫기</button> -->
<!-- 			</div> -->
<!-- 		</section> -->
	
<%@include file ="../_common/commonFooterStart.jsp" %>
<script type="text/javascript">
$(function () {
	/* 이름 입력 */
	$("#name").on("keyup", function () {
		var partton = /[^가-힣\s]{2,5}$/g; 
		if(partton.test($(this).val())){
			var value = $(this).val().replace(/[^가-힣\s]{2,5}$/g,"");
			$("#name").val(value);
		}
	});
	
	/* 생년월일 입력 */
	$("#birth").on("keyup", function(e){
		var partton = /[^0-9]/g;
		if($("#birth").val() == ""){
			$('#schIdBirthDe-error-text').text('생년월일을 입력해주세요.');
			return false;
		}
		if(partton.test($(this).val())){
			var value = $(this).val($(this).val().replace(/[^0-9]/g,""));
			$('#schIdBirthDe-error-text').text('');
			$("#birth").val(value);
		}
		
	});
	
	/* 연락처 입력 */
	$("#phone").on("keyup", function(e){
		var partton = /[^0-9]/g;
		if($("#phone").val() == ""){
			$('#schIdMblpNo-error-text').text('연락처 입력해주세요.');
			return false;
		}
		if(partton.test($(this).val())){
			var value = $(this).val($(this).val().replace(/[^0-9]/g,""));
			$('#schIdMblpNo-error-text').text('');
			$("#phone").val(value);
		}
	});
	
    $("#btnFindId").on("click", function () {
        if ($("#name").val() !== "" && $("#birth").val() !== "" && $("#phone").val() !== "") {
            var name = $("#name").val();
            var birth = $("#birth").val();
            var phone = $("#phone").val();

            $.ajax({
                type: "post",
                data: { memName: name, memBirth: birth, memPhone: phone },
                url: "userFindId.me",
                dataType: "text",
                success: function (data) {
                    if (data === '1') {
                        alert('회원님이 가입하신 아이디는' + name + '입니다.');
                    } else if (data === '0') {
                        alert('해당정보로 가입한 회원 아이디가 없습니다.');
                    }
                },
                error: function () {
                    // 에러 처리 코드 추가
                }
            });
        }
    });
	
	
	
	
// 	$(".findInput").on("keyup", function(){
// // 		debugger;
// 		if($("#name").val() != "" && $("#birth").val() != "" && $("#phone").val() != ""){
// // 			debugger;
// 			$("#btnFindId").attr("disabled", false);
// 			var name = $("#name").val()
// 			var birth = $("#birth").val()
// 			var phone = $("#phone").val()
			
// 			$("#btnFindId").on("click", function() {
// // 				debugger;
// 				$.ajax({
// 					type : "post",
// 					data : {memName : name, memBirth : birth, memPhone : phone},
// 					url : "userFindId.me",
// 					dataType : "text",
// 					success:function(data){
// // 						debugger;
// 						if(data == '1'){
// 							alert('회원님이 가입하신 아이디는' + text + '입니다.');
// 						}else if(data == '0'){
// 							alert('해당정보로 가입한 회원 아이디가 없습니다.');
// 						}
// 					},
// 					error : function() {
						
// 					}
// 				})	
			
// 			})
// 		}
	
// 	});
});
</script>


<script type="text/javascript">
// var sValidateSchIdMbNm       = "N";
// var sValidateSchIdBirthDe    = "N";
// var sValidateSchIdMblpTelno  = "N";
	
//이벤트
// $(function(){
// 	fn_validateSchIdInputVal();
//////////////////////////////////////////////////////////////////////////////////////////////////////	
	/* /[^ㄱ-힣a-zA-Z\s]/g */
	/* 이름 숫자,영어를 제외한 입력 여부판단 */
// 	$("#name").on("keyup", function(e){
// 		var partton = /[^가-힣\s]{2,5}$/g;
// 		if(partton.test($(this).val())) {
// 			var value = $(this).val().replace(/[^가-힣\s]{2,5}$/g,"");
// 			$("#name").val(value);
// 		}
// 		if(fn_validateSchIdInputVal()) {
// 			if(e.keyCode == 13){$("#btnFindId").click();}
// 		} else {
// 			if(e.keyCode == 13){$("#birth").focus();}
// 		}
// 	});
// 	$("#name").focusout(function(){
// 		var partton = /[^가-힣\s]{2,5}$/g;
// 		if(partton.test($(this).val())) {
// 			var value = $(this).val().replace(/[^가-힣\s]{2,5}$/g,"");
// 			$("#name").val(value);
//         }
// 		fn_validateSchIdInputVal();
// 	});
/////////////////////////////////////////////////////////////////////////////////////////////////////
	/* 생년월일 숫자만 입력 여부판단 */
// 	$("#birth").on("keyup", function(e){
// 		$(this).val($(this).val().replace(/[^0-9]/g,""));
// 		if(fn_validateSchIdInputVal()) {
// 			if(e.keyCode == 13){$("#btnFindId").click();}
// 		} else {
// 			if(e.keyCode == 13){$("#phone").focus();}
// 		}
// 	});
// 	$("#birth").focusout(function(){
// 		$(this).val($(this).val().replace(/[^0-9]/g,""));
// 		fn_validateSchIdInputVal();
// 	});

	/* 휴대폰번호 숫자만 입력 여부판단 */
// 	$("#phone").on("keyup", function(e){
// 		$(this).val($(this).val().replace(/[^0-9]/g,""));
// 		if(fn_validateSchIdInputVal()){
// 			if(e.keyCode == 13){$("#btnFindId").click();}
// 		}
// 	});
// 	$("#phone").focusout(function(){
// 		$(this).val($(this).val().replace(/[^0-9]/g,""));
// 		fn_validateSchIdInputVal();
// 	});
	
// 	$(".findInput").on("keyup", function(){
// 		debugger;
// 		if(!$("#name").val() == "" && !$("#birth").val() == "" && !$("#phone").val() == ""){
// 			debugger;
// 			$(this).attr("disabled", false);
// 		}
// 	})
	
// 	if(!$("#name").val() == "" && !$("#birth").val() == "" && !$("#phone").val() == ""){
// 		debugger;
// 		$(this).attr("disabled", false);
// 	}
	
	/* 확인 */
// 	$("#btnFindId").click(function(){
// 		/* 폼데이터 초기화 */
// 		$('#searchIdForm input[name=loginId]').attr('value','');
// 		$('#searchIdForm input[name=mblpTelno]').attr('value','');
// 		$('#searchIdForm input[name=mbNo]').attr('value','');
// 		$('#searchIdForm input[name=certType]').attr('value','');

// 		var sSchIdMbNm      = $("#name").val();			//이름
// 		var sSchIdBirthDe   = $("#birth").val();		//생년월일
// 		var sSchIdMblpTelno = $("#phone").val();	//휴대폰번호
// 		var paramData = { mbNm:sSchIdMbNm
// 						, birthDe:sSchIdBirthDe
// 						, mblpTelno:sSchIdMblpTelno
// 						};

// 		fn_selectMbSchId(paramData);
// 	});

// });




//입력 문자 체크
// function fn_validateSchIdInputVal(){

// 	//이름
// 	if($("#name").val() != "") {
// 		sValidateSchIdMbNm = 'Y';
// 	}
// 	else {
// 		sValidateSchIdMbNm = 'N';
// 	}

// 	//생년월일
// 	if($("#birth").val() != "") {
// 		if(fn_validateDateYn($("#birth").val(),8)){
// 			sValidateSchIdBirthDe = 'Y';
// 			$('#schIdBirthDe-error-text').text('');
// 		}
// 		else {
// 			sValidateSchIdBirthDe = 'N';
// 			$('#schIdBirthDe-error-text').text('생년월일을 정확히 입력해주세요.');
// 		}
// 	}
// 	else {
// 		sValidateSchIdBirthDe = 'N';
// 	}

// 	//휴대폰번호
// 	if($("#phone").val() != "") {
// 		var frontNm = $("#phone").val().substr(0,2);
// 		if(frontNm != '01'){
// 			$('#schIdMblpNo-error-text').text('휴대폰번호를 정확히 입력해주세요.');
// 			sValidateSchPwdCertNo = 'N';
// 		}
// 		else {
// 			$('#schIdMblpNo-error-text').text('');
// 			sValidateSchIdMblpTelno = 'Y';
// 		}
// 	}
// 	else {
// 		sValidateSchIdMblpTelno = 'N';
// 	}

// 	if(    sValidateSchIdMbNm == 'Y'
// 		&& sValidateSchIdBirthDe == 'Y'
// 		&& sValidateSchIdMblpTelno == 'Y'
// 		){
// 		$("#btnFindId").attr("disabled", false);
// 		return true;
// 	}
// 	else{
// 		$("#btnFindId").attr("disabled", true);
// 		return false;
// 	}
// }
// function fn_submit(page){

// 	$("#searchIdForm").attr("method","post");
// 	$("#searchIdForm").attr("action",page);
// 	$("#searchIdForm").submit();
// }
</script>
<%@include file ="../_common/commonFooterEnd.jsp" %>