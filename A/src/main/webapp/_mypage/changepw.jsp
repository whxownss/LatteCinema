<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%-- <%MemberDTO memberDTO = (MemberDTO)request.getAttribute("memberDTO"); %> --%>
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
  <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
   <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
 
</head>
<body>

<%-- 										<input type="hidden" name="id" value="${memberDTO.memId }"> --%>
<%--             							<input type="hidden" name="pass" value="${memberDTO.memPass }">		 --%>
<%-- 										<input id="ibxSchPwdLoginId" type="hidden" value="${sessionScope.sId}" name="id" ><!--아이디--> --%>
<%-- 										<input id="ibxSchPwdMbNm" type="hidden" value="${sessionScope.sName}" name="name"><!--이름--> --%>
<%-- 										<input id="ibxSchPwdMbNm" type="hidden" value="${sessionScope.sPass}" name="pass"><!--pass--> --%>

<jsp:include page="../_common/header.jsp"></jsp:include>
<main id="main">
  <section class="category-section">
    <div class="container has-lnb" data-aos="fade-up">
      <!-- 이곳에 코드작성 -->
      <div class="inner-wrap">
        <jsp:include page="lnb.jsp"></jsp:include>
        <form id="fr" method="post" action="changepwPro.me">
			<input id="ibxSchPwdLoginId" type="hidden" value="${sessionScope.sId}" name="id"> <!--아이디-->
			<div id="contents">
				<h2 class="tit">비밀번호 변경</h2>
			
				<ul class="dot-list mb10">
					<li>현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요.</li>
				</ul>
			
				<div class="table-wrap mb20">
					<table class="board-form">
						<caption>현재 비밀번호, 새 비밀번호, 새 비밀번호 확인 항목을 가진 표</caption>
						<colgroup>
							<col style="width:180px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="pass">현재 비밀번호</label></th>
								<td>
									<input type="password" name="pass" class="input-text w150px" >
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="newpasswd">새 비밀번호</label></th>
								<td>
									<input type="password" id="newpasswd" name="newpasswd" class="input-text w150px"
											onblur="checkPass(); ">
									<span id="CheckPassword1"></span><br>								
									<span class="ml10 font-size-14">※ 영문, 숫자, 특수문자 중 2가지 이상 조합하여 8~16자리 이상으로 입력 해 주세요.</span>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="newpasswd2">새 비밀번호 재입력</label></th>
								<td>
									<input type="password" id="newpasswd2" class="input-text w150px" 
											onchange="checkConfirmPasswd()">
									<span id="CheckPassword2"></span><br>
									<span class="ml10 font-size-14">※ 비밀번호 확인을 위해 한 번 더 입력해 주시기 바랍니다.</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			
				<ul class="dot-list">
					<li>생년월일, 전화번호 등 개인 정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수 있으니 사용을 자제해 주세요.</li>
					<li>비밀번호는 3-6개월마다 꼭 바꿔 주세요.</li>
					<li>비밀번호 변경시 모바일 기기와 홈페이지에서 모두 로그아웃됩니다. 변경한 비밀번호로 다시 로그인해주세요.</li>
				</ul>
			
				<div class="btn-group pt40">
					<button class="button large" id="cancelBtn">취소</button>
					<button class="button purple large" type="submit" id="updateBtn">수정</button>
				</div>
			</div>
        </form>
      </div>
    </div>
  </section>
</main>
<%@include file ="../_common/commonFooterStart.jsp" %>
<script>
// 새비밀번호 정규식
var lengthRegexPass = /^[A-Za-z0-9!@#$%]{8,16}$/; // 영문 대소문자 숫자 특수문자 8~16자 규칙(패스워드)
var engUpperRegex = /[A-Z]/; //대문자 규칙 (비밀번호)
var engLowerRegex = /[a-z]/;  //소문자 규칙 (비밀번호)
var numRegex = /[0-9]/;	// 숫자 0~9 규칙 (비밀번호)
var specRegex = /[!@#$%]/;	// 특수문자 규칙 (비밀번호)
// 새비밀번호 유효성
function checkPass(){
	var passwd = $("#newpasswd").val();
	var text =' ** 비밀번호 입력 필수 **';
	var color='red';
	var count = 0;
	
	if(passwd != ""){
		
		if(lengthRegexPass.test(passwd)){
			
			
			if(engUpperRegex.test(passwd))	count ++;
			if(engLowerRegex.test(passwd))	count ++;
			if(numRegex.test(passwd)) 		count ++;
			if(specRegex.test(passwd))		count ++;
			
			switch(count){
				case 4: text = ' **사용 가능 : 안전**';
						color = 'green'; break;
				case 3: text = ' **사용 가능 : 보통**';
						color = 'blue'; break;
				case 2: text = ' **사용 가능 : 위험**';
						color = 'orange'; break;
				default: text = ' **영문자, 숫자, 특수문자 중 2가지 이상 조합 필수!**';
						color = 'red'; break;
			}

		} else{
			text ='영문 대소문자 숫자 특수문자 8~16자 입력'
		}
		
		
	}
	$("#CheckPassword1").text(text).css("color", color);
};

// 새비밀번호 확인 유효성		
function checkConfirmPasswd() {
	var passwd = $("#newpasswd").val();
	var passwd2 = $("#newpasswd2").val();
	
	var text = '**비밀번호 불일치**';
	var color = 'red';
	if( passwd == passwd2 && passwd != ""){
		text='**비밀번호 일치**';
		color='green';
		
	}
	$("#CheckPassword2").text(text).css("color", color);
}		

//유효성 체크 후 submit
function checkSubmit() {
	
	var color = $('#fr span');
	
	var flag = 1;
	
	$.each(color, function(i, v){
		if(this.style.color == "red") {
			flag = 0;
			alert("비밀번호 양식을 확인해 주세요.")
			return false;
		}
	});
	
	return ((flag == 0) ? false : true);
}	

</script>
<%@include file ="../_common/commonFooterEnd.jsp" %>