<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
</head>
<body>
<jsp:include page="../_common/header.jsp"></jsp:include>
<%
  //FIXME phone_number 중간에 ****으로 포맷팅 해주기
  //FIXME myInfo.js에 href 속성들 수정하기
  String name = "김라떼";
  String id = "id";
  String password = "password";
  String phone_number = "010-1234-5678";
%>

<link href="../_assets/js/myInfo.js">
	<main id="main">
		<section class="category-section">
    		<div class="container has-lnb" data-aos="fade-up">
    			<!-- 이곳에 코드작성 -->
            <div class="inner-wrap">
              <jsp:include page="lnb.jsp"></jsp:include>
              <form id="moveFrm" method="post">
                <div id="contents">
                <h2 class="tit">회원정보</h2>
                <div class="member-wrap">
                    <strong>회원님의 개인정보 보호를 위해 등록된 휴대폰 번호로 인증을 하셔야 합니다.</strong>
                    <div class="table-wrap">
                      <table class="board-form">
                        <caption>아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표<!--아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표--></caption>
                        <colgroup>
                          <col style="width:130px;">
                          <col>
                        </colgroup>
                        <tbody>
                          <input id="ibxSchPwdLoginId" type="hidden" value="<%=id %>"><!--아이디-->
                          <input id="ibxSchPwdMbNm" type="hidden" value="<%= name %>"><!--이름-->
                          <tr>
                            <th scope="row"><label for="ibxSchPwdMblpTelno">휴대폰 번호<!--휴대폰 번호--></label></th>
                            <td>
                              <input type="hidden" id="ibxSchPwdMblpTelno" value="<%=phone_number%>">
                              <input type="text" value="<%=phone_number %>" placeholder="'-' 없이 입력" class="input-text w230px" disabled="">
                              <button id="btnSchPwdMbCertNoSend" type="button" class="button gray w75px ml08">인증요청<!--인증요청--></button>
                            </td>
                          </tr>
                          <tr id="schPwdMblpCertRow">
                            <th scope="row"><label for="ibxSchPwdMblpCharCertNo">인증번호<!--인증번호--></label></th>
                            <td>
                              <div class="chk-num">
                                <div class="line">
                                  <input maxlength="4" type="text" id="ibxSchPwdMblpCharCertNo" class="input-text w180px" title="인증번호 입력"><!--인증번호 입력-->
                                  <div class="time-limit" id="schPwdtimer">3:00</div>
                                </div>
                              </div>
                                <button id="btnSchPwdMblpCharCert" type="button" class="button gray-line w75px ml08 disabled" disabled="disabled">인증확인<!--인증확인--></button>
                                <div id="schPwdMblpNo-error-text" class="alert"></div>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <div class="btn-group">
                    <button class="button large" id="cancelBtn" title="취소">취소</button>
                    <button class="button large purple" id="ckBtn" data-url="userInfo.me" title="확인" >확인</button>
                  </div>
                    <div class="member-wrap" id="niceCert">
                      <strong>휴대폰 번호로 인증이 안되시나요?</strong><br><br>
                      <strong style="font-size: 14px;">
                        휴대폰 번호로 인증이 안되는 경우 본인인증을 통하여 회원정보를 확인할 수 있습니다. <br>
                        본인인증시 제공되는 정보는 해당 인증기관에서 직접 수집하며, 인증 이외의 용도로 이용 또는 저장되지 않습니다.
                      </strong>
                      <div class="btn-member-bottom">
                        <button id="btnNiceMblpCert" type="button" class="button purple large">본인인증<!--본인인증--></button>
                      </div>
                    </div>
                  </div>
              </form>
            </div>
          </div>
        </div>
    </section>
	</main>
  <jsp:include page="../_common/commonFooter.jsp"></jsp:include>
</body>
</html>