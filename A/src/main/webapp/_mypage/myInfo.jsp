<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
	<link href="_assets/js/myInfo.js">
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

	<main id="main">
		<section class="category-section">
    		<div class="container has-lnb" data-aos="fade-up">
    			<!-- 이곳에 코드작성 -->
            <div class="inner-wrap">
              <jsp:include page="lnb.jsp"></jsp:include>
              <form id="moveFrm" action="userInfo.me" method="post">
                <div id="contents">
                <h2 class="tit">회원정보</h2>
                <div class="member-wrap">
                    <strong>회원님의 개인정보 보호를 위해 비밀번호를 입력 하셔야 합니다.</strong>
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
                            <th scope="row"><label for="pwd">비밀번호</label></th>
                            <td>
                              <input type="text" value="" placeholder="비밀번호 입력" class="input-text w230px" >
                              <button id="btnSchPwdMbCertNoSend" type="button" class="button gray w75px ml08">확인<!--비밀번호 확인--></button>
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
                    
                  </div>
              </form>
            </div>
          </div>
        </div>
    </section>
	</main>
  <jsp:include page="../_common/footer.jsp" ></jsp:include>
</body>
</html>