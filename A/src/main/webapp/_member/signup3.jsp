<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeader.jsp" %>

	<main id="main">
			
		<section class="category-section">
			<div class="container" data-aos="fade-up">
				<form action="doJoin" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;">
               		<div class="section-header d-flex justify-content-between align-items-center mb-5">
	        			<h2>회원가입</h2>
	        			<div><a href="category.html" class="more">2023.12.11 기준</a></div>
	      			</div>
	  
	      <div style="text-align: center; width:35%; margin: 0 auto;">
		      <div class="textForm">
		        <input name="loginId" type="text" class="id" placeholder="아이디">
		      </div>
		      <div class="textForm">
		        <input name="loginPw" type="password" class="pw" placeholder="비밀번호">
		      </div>
		       <div class="textForm">
		        <input name="loginPwConfirm" type="password" class="pw" placeholder="비밀번호 확인">
		      </div>
		      <div class="textForm">
		        <input name="name" type="text" class="name" placeholder="이름">
		      </div>
		       <div class="textForm">
		        <input name="email" type="text" class="email" placeholder="이메일">
		      </div>
		      <div class="textForm">
		        <input name="nickname" type="text" class="nickname" placeholder="닉네임">
		      </div>
		      <div class="textForm">
		        <input name="cellphoneNo" type="number" class="cellphoneNo" placeholder="전화번호">
		      </div>
		      <div>
		      	<input type="submit"  class="btn" value="J O I N"/>
		      	
		      </div>
		                  <div class="social_login">
                <ul>
                    <li class="other_facebook design_social">
                        <a href="javascript:;">Facebook 계정으로 가입
                            <span class="other_icon"><img src="../assets/img/icon_facebook.png" alt="페이스북 아이콘"></span>
                        </a>
                    </li>
                    <li class="other_kakaotalk design_social">
                        <a href="javascript:;">카카오톡 계정으로 가입
                            <span class="other_icon"><img src="../assets/img/icon_kakaotalk.png" alt="카카오톡 아이콘"></span>
                        </a>
                    </li>
                    <li class="other_naver design_social">
                        <a href="javascript:;">네이버 계정으로 가입
                            <span class="other_icon"><img src="../assets/img/icon_naver.png" alt="네이버 아이콘"></span>
                        </a>
                    </li>
                    <li class="other_google design_social">
                        <a href="javascript:;">Google 계정으로 가입
                            <span class="other_icon"><img src="../assets/img/icon_google.png" alt="구글 아이콘"></span>
                        </a>
                    </li>
                </ul>
            </div>
	      </div>
    </form>
			</div>
		</section>
	
	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>