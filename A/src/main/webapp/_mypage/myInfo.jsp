<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="../_common/header.jsp"></jsp:include>
<c:if test="${sessionScope.sId == null }">
<c:redirect url="main.me"/>
</c:if>

	<main id="main">
		<section class="category-section">
    		<div class="container has-lnb" data-aos="fade-up">
    			<!-- 이곳에 코드작성 -->
            <div class="inner-wrap">
              <jsp:include page="lnb.jsp"></jsp:include>
              <form id="moveFrm" action="myInfoPro.me" method="post" name="fr">
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
                          <input id="ibxSchPwdLoginId" type="hidden" value="${sessionScope.sId}" name="id"><!--아이디-->
                          <input id="ibxSchPwdMbNm" type="hidden"  value="${sessionScope.sName}" name="name"><!--이름-->
                          <tr>
                            <th scope="row"><label for="pwd">비밀번호</label></th>
                            <td>
                              <input type="password" value="" placeholder="비밀번호 입력" class="input-text w230px" name="pass"	 >
<!--                          <button id="btnSchPwdMbCertNoSend" type="button" class="button gray w75px ml08">확인비밀번호 확인</button> -->
							  <span id="myinfoPassCheck"></span>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <div class="btn-group">
                    <button class="button large" id="cancelBtn" title="취소" type="button">취소</button>
                    <button class="button large purple" id="ckBtn" title="확인" name="pass" >확인</button>
                  </div>
                    
                  </div>
              </form>
            </div>
          </div>
        </div>
    </section>
	</main>
<%@include file ="../_common/commonFooterStart.jsp" %>
<!-- <link href="_assets/js/myInfo.js"> -->
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/mypageJS/myInfo.js"></script>
<%@include file ="../_common/commonFooterEnd.jsp" %>