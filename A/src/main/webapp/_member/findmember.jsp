<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
  <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <jsp:include page="../_common/header.jsp"></jsp:include>
  <script>
    $(function () {
      $('ul.tab li').click(function () {
        var tabId = $(this).attr('data-tab');
        $('ul.tab li').removeClass('on');
        $('.table-wrap').removeClass('on');
        $(this).addClass('on');
        $('#' + tabId).addClass('on');
      })
    });
  </script>
</head>
<body>

<main id="main">
  <section class="category-section">
    <div class="container w-50" data-aos="fade-up">
      <h3 class="tit">아이디/비밀번호 찾기</h3>
      <div class="col-wrap">
        <div class="col">
          <div class="tab-list">
            <ul class="tab">
              <li class="on" data-tab="menu1"><a href="#" title="아이디찾기 선택">아이디 찾기</a></li>
              <li data-tab="menu2"><a href="#" title="비밀번호 찾기 선택">비밀번호 찾기</a></li>
            </ul>
          </div>

          <!-- 아이디 찾기 menu1 -->
          <div class="table-wrap on" id="menu1">
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
							<input id="ibxSchIdMblpTelno" maxlength="11" type="text" placeholder="'-' 없이 입력" class="input-text w230px"><!--'-' 없이 입력-->
							<div id="schIdMblpNo-error-text" class="alert"></div>
						</td>
					</tr>
					<tr>
			          <div class="btn-member-bottom v1">
			            <button id="btnSchId" type="button" class="button purple large" disabled="disabled">아이디 찾기</button>
			          </div>						
					</tr>
				</tbody>      
				
			
				        
            </table>
          </div>

          <!-- 비밀번호 찾기 menu2 -->						
          <div class="table-wrap" id="menu2">
            <table class="board-form">
           
				<caption>아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표<!--아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표--></caption>
				<colgroup>
					<col style="width:130px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="ibxSchPwdLoginId">아이디<!--아이디--></label></th>
						<td>
							<input id="ibxSchPwdLoginId" maxlength="20" type="text" placeholder="아이디" class="input-text w230px"><!--아이디-->
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="ibxSchPwdMbNm">이름<!--이름--></label></th>
						<td>
							<input id="ibxSchPwdMbNm" maxlength="20" type="text" placeholder="이름" class="input-text w230px"><!--이름-->
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="ibxSchPwdMblpTelno">휴대폰 번호<!--휴대폰 번호--></label></th>
						<td>
							<input type="text" id="ibxSchPwdMblpTelno" maxlength="11" placeholder="'-' 없이 입력" class="input-text w230px"><!--'-' 없이 입력-->
							<button id="btnSchPwdMbCertNoSend" type="button" class="button gray w75px ml08 disabled" disabled="disabled">인증요청<!--인증요청--></button>
						</td>
					</tr>
					<tr id="schPwdMblpCertRow">
						<th scope="row"><label for="ibxSchPwdMblpCharCertNo">인증번호<!--인증번호--></label></th>
						<td>
							<div class="chk-num">
								<div class="line">
									<input maxlength="4" type="text" id="ibxSchPwdMblpCharCertNo" class="input-text w180px" title="인증번호 입력" disabled="disabled"><!--인증번호 입력-->

									<div class="time-limit" id="schPwdtimer">
										3:00
									</div>
								</div>
							</div>

							<button id="btnSchPwdMblpCharCert" type="button" class="button gray-line w75px ml08 disabled" disabled="disabled">인증확인<!--인증확인--></button>
							<div id="schPwdMblpNo-error-text" class="alert"></div>
						</td>
					</tr>
					<tr>
			          <div class="btn-member-bottom v1">
			            <button id="btnSchId" type="button" class="button purple large" disabled="disabled">비밀번호 찾기</button>
			          </div>						
					</tr>
				</tbody>    
				
				
				          
            </table>
          </div>



        </div>
      </div>
    </div>
  </section>
</main>

<jsp:include page="../_common/commonFooter.jsp"></jsp:include>
</body>
</html>