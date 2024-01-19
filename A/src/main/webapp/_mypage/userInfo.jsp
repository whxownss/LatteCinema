<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%MemberDTO memberDTO = (MemberDTO)request.getAttribute("memberDTO"); %>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
</head>
<body>
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
        <form id="moveFrm" method="post" action="userInfoPro.me" onsubmit="return checkSubmit()">
          <div id="contents" class="">
            <h2 class="tit">개인정보 수정</h2>
            <ul class="dot-list mb10">
              <li>회원님의 정보를 정확히 입력해주세요.</li>
            </ul>
            <div class="table-wrap">
              <table class="board-form">
                <caption>프로필사진, 아이디 항목을 가진 표</caption>
                <colgroup>
                  <col style="width:180px;">
                    <col>
                </colgroup>
                <tbody>
                  <tr>
                   
                  </tr>
                  <tr>
                    <th scope="row">아이디</th>
                  		
                    <td><span name="id" > ${memberDTO.memId }</span></td> 
                    <td><a href="delete.me" class="button small member-out" title="회원탈퇴">회원탈퇴</a></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="tit-util mt40 mb10">
              <h3 class="tit">기본정보</h3>
              <div class="right">
                <p class="reset">
                  <em class="font-orange">*</em>필수</p>
              </div>
            </div>
            	<input type="hidden" name="id" value="${memberDTO.memId }">
            	<input type="hidden" name="phone" value="${memberDTO.memPhone }">
              <div class="table-wrap mb40">
                <table class="board-form">
                  <caption>이름, 생년월일, 휴대폰, 이메일, 비밀번호, 주소 항목을 가진 기본정보 표</caption>
                  <colgroup>
                    <col style="width:180px;">
                      <col>
                  </colgroup>
                  <tbody>
                    <tr>
                      <th scope="row">이름
                        <em class="font-orange">*</em>
                      </th>
                      <td>
                        <span class="mbNmClass" >${memberDTO.memName }</span>
                       	<span style="font-size: 10px;"> ※ 개명으로 이름이 변경된 경우 문의사항에 남겨주세요 </span>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">생년월일
                        <em class="font-orange">*</em>
                      </th>
                      <td><span >${memberDTO.memBirthD}</span></td>
                    </tr>
                    <tr>
                      <th scope="row">
                        <label for="num">휴대폰</label>
                        <em class="font-orange">*</em>
                      </th>
                      <td>
                        <div class="clearfix">
                          <p class="reset float-l w170px lh32 changeVal" data-name="phone">${memberDTO.memPhone }</p>
                          <div class="float-l">
                            <button type="button" class="button small gray-line change-phone-num" id="phoneChgBtn" title="휴대폰번호 변경">휴대폰번호 변경</button>
                          </div>
                        </div>
                        <div  id="phoneChange"class="change-phone-num-area" style="display: none">
                          <div class="position">
                            <label for="newPhone" class="label">변경할 휴대폰</label>
                            <input onblur="checkPhone()" type="TEXT" id="newPhone" name="newPhone" class="input-text w160px numType" placeholder="'-'없이 입력가능" title="변경할 휴대폰 번호 입력" maxlength="15">
                            <button type="button" class="button small gray-line" id="sendNumberBtn">인증번호 전송</button>
                            <br><span id="CheckPhone"></span>
                          </div>
                          
                          <div id ="checkSms"class="position" style="display: none;">
                            <label for="chkNum" class="label">인증번호 입력</label>
                            <div class="chk-num small">
                              <div class="line">
                                <input type="text" id="chkNum" class="input-text w180px" title="인증번호 입력" placeholder="인증번호를 입력해 주세요" maxlength="4">
                              </div>
                            </div>
                            <button type="button" class="button small gray-line" id="changePhBtn">변경완료</button>
                          </div>

                        </div>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">
                        <label for="email">이메일</label>
                        <em class="font-orange">*</em>
                      </th>
                      <td>
                        <input type="email" id="email"  name="email" class="input-text w500px" value="${memberDTO.memEmail }">
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">비밀번호
                        <em class="font-orange">*</em>
                      </th>
                      <td>
                        <a href="changepw.me" class="button small gray-line" title="비밀번호 변경">비밀번호 변경</a></td>
                    </tr>
                    <tr>
                      <th scope="row">주소</th>
                      <td>
                      	<input type="text" id="postcode" name="postcode" class="input-text w150px" value="${memberDTO.memAddress.split("/")[0]}">
                        <a href="#none" id="addrBtn" class="button small gray-line ml10" title="우편번호 검색">우편번호 검색</a><br>
						<input class="input-text mt10 w-100" id="addr1" name="addr1" value="${memberDTO.memAddress.split("/")[1]}"><br>
                        <input class="input-text mt10 w150px" type="text" id="addr2" name="addr2"  value="${memberDTO.memAddress.split('/')[2]}" placeholder="상세주소 입력" required>
                        
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

            <div class="btn-group mt40">
              <button class="button large" id="cancelBtn">취소</button>
              <button class="button purple large" id="updateBtn" type="submit">등록</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </section>
</main>
<%@include file ="../_common/commonFooterStart.jsp" %>
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/mypageJS/userInfo.js"></script>
<%@include file ="../_common/commonFooterEnd.jsp" %>