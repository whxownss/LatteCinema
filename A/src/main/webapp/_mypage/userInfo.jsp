<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
  <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
   <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
 
</head>
<body>


<jsp:include page="../_common/header.jsp"></jsp:include>
<main id="main">
  <section class="category-section">
    <div class="container has-lnb" data-aos="fade-up">
      <!-- 이곳에 코드작성 -->
      <div class="inner-wrap">
        <jsp:include page="lnb.jsp"></jsp:include>
        <form id="moveFrm" method="post">
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
                  		
                    <td><%="아이디" %></td> 
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
            
            
            <!--  일단 하드 코딩한 곳 / DB 연결 필요함-->
            
            
            <form name="mbInfoForm">
              <input type="hidden" name="mbNo" value="3487839">
              <input type="hidden" name="phoneNo" value="010-3333-3333">
              <input type="hidden" name="zipcd" value="33333">
              <input type="hidden" name="mbAddr" value="울산광역시 동구 울산동 울산순환도로 999 울산아파트 201동">
              <input type="hidden" name="mbProfilFileNo" value="0">
              <input type="hidden" id="mbByymmdd" value="19930918">
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
                        <span class="mbNmClass"><%="김나혜" %></span>
                        <a href="#layer_name" class="button small gray-line ml10 mr10 btn-modal-open" w-data="600" h-data="350" title="이름변경">이름변경</a>※ 개명으로 이름이 변경된 경우, 회원정보의 이름을 변경하실 수 있습니다.
                        <section id="layer_name" class="modal-layer">
                          <a href="" class="focus">레이어로 포커스 이동 됨</a>
                          <div class="wrap">
                            <header class="layer-header">
                              <h3 class="tit">본인확인 수단 선택</h3>
                            </header>
                            <div class="layer-con">
                              <p class="reset">이름을 변경하기 위한 본인 확인 수단을 선택해 주세요.
                                <br>(단, 개명된 이름으로 가입된 본인명의의 휴대전화 또는 아이핀으로만 가능함)</p>
                              <div class="box-gray v1 mt20 a-c">
                                <a href="#" target="_blank" class="button" id="ipinBtn" title="I-PIN 인증">I-PIN 인증</a>
                                <a href="#" target="_blank" class="button ml10" id="phoneBtn" title="휴대폰 인증">휴대폰 인증</a>
                              </div>
                              <ul class="dash-list mt20">
                                <li>신용평가기관에 개명된 이름이 먼저 등록되어 있어야 합니다.</li>
                                <li>본인인증을 위해 입력하신 정보는 해당 인증기관에서 직접 수집하며 인증 이외의 용도로 이용 또는 저장되지 않습니다.</li>
                              </ul>
                            </div>
                            <button type="button" class="btn-modal-close">레이어 닫기</button>
                          </div>
                        </section>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">생년월일
                        <em class="font-orange">*</em>
                      </th>
                      <td><%="1993년 09월 18일" %></td>
                    </tr>
                    <tr>
                      <th scope="row">
                        <label for="num">휴대폰</label>
                        <em class="font-orange">*</em>
                      </th>
                      <td>
                        <div class="clearfix">
                          <p class="reset float-l w170px lh32 changeVal" data-name="phoneNo"><%="010-3333-3333"%></p>
                          <div class="float-l">
                            <button type="button" class="button small gray-line change-phone-num" id="phoneChgBtn" title="휴대폰번호 변경">휴대폰번호 변경</button>
                          </div>
                        </div>
                        <div class="change-phone-num-area">
                          <div class="position">
                            <label for="chPhone" class="label">변경할 휴대폰</label>
                            <input type="text" id="chPhone" class="input-text w160px numType" placeholder="'-'없이 입력해 주세요" title="변경할 휴대폰 번호 입력" maxlength="11">
                            <button type="button" class="button small gray-line" id="sendNumberBtn">인증번호 전송</button>
                          </div>
                          <div class="position" style="display: none;">
                            <label for="chkNum" class="label">인증번호 입력</label>
                            <div class="chk-num small">
                              <div class="line">
                                <input type="text" id="chkNum" class="input-text w180px" title="인증번호 입력" placeholder="인증번호를 입력해 주세요" maxlength="4">
                                <div class="time-limit" id="timeLimit">3:00</div>
                              </div>
                            </div>
                            <button type="button" class="button small gray-line" id="chgBtn">변경완료</button>
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
                        <input type="text" id="email" name="mbEmail" class="input-text w500px" value="<%="dasda@naver.com"%>">
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
                        <span><%="44025"%></span>
                        <a href="#none" id="addrBtn" class="button small gray-line ml10" title="우편번호 검색">우편번호 검색</a>
                        <p class="reset mt10"><%="울산광역시 동구 울산동 울산순환도로 999 울산아파트 201동"%></p><br>
                        <input type="text" id="addr2" placeholder="상세주소 입력" required>
                        
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </form>

            <div class="btn-group mt40">
              <button class="button large" id="cancelBtn">취소</button>
              <button class="button purple large" id="updateBtn">등록</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </section>
</main>
<%@include file ="../_common/commonFooterStart.jsp" %>
<script type="text/javascript">
    var interval;
    var m, s;

    $(function() {

        // 포인트 비밀번호 set
        $('#pwSetBtn').on('click', function(e) {
            var form = MegaboxUtil.Form.createForm();
            form.append($('<input>').attr({ 'type': 'hidden', 'name': 'setPointPw', 'value': 'Y' }));
            form.attr('action', "/mypage/point-password");
            form.submit();
        });

        // 주소검색 버튼
        $('#addrBtn').on('click', function(e) {
            e.preventDefault();

            var target = $(this);

            // 다음 주소 API 호출
            daum.postcode.load(function() {
                new daum.Postcode({
                    oncomplete: function(d) {
                        var extraAddr = "";

                        if(d.bname !== '' && /[동|로|가]$/g.test(d.bname)){
                            extraAddr += d.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(d.buildingName !== '' && d.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + d.buildingName : d.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }

                        target.prev().html(d.zonecode);
                        target.next().html(d.address+extraAddr);

                        $('[name=zipcd]').val(d.zonecode);
                        $('[name=mbAddr]').val(d.address+extraAddr);
                    }
                }).open();
            });
        });

        // IPIN 인증
        $('#ipinBtn').on('click', function(e) {
            e.preventDefault();

            fn_selfCheck('ipin');
        });

        // 휴대폰 인증
        $('#phoneBtn').on('click', function(e) {
            e.preventDefault();

            fn_selfCheck('phone');
        });

        // 휴대폰번호 변경 클릭
        $('#phoneChgBtn').on('click', function() {
            $('.change-phone-num-area > div input').val('');
            $('.change-phone-num-area > div:first button').text('인증번호 전송');
            $('#timeLimit').html('');
            clearInterval(interval);
        });

        // 인증번호 발송 버튼 클릭
        $('#sendNumberBtn').on('click', function() {
            var target = $('#sendNumberBtn');

            if(target.prev().val().trim() == '')
                return gfn_alertMsgBox('변경할 휴대폰 번호를 입력해 주세요.');

            if (!target.prev().val().isHpPhoneNo())
                return gfn_alertMsgBox('올바른 휴대폰 번호를 입력해 주세요.');


            if(target.prev().val() == $('[name=phoneNo]').val().replaceAll('-',''))
                return gfn_alertMsgBox('휴대폰 번호가 동일합니다.');

            $.ajaxMegaBox({
                url: '/on/oh/ohg/MbLogin/selectNonMbCertNoSend.rest',
                data: JSON.stringify({
                    nonMbNm: $('.mbNmClass').text(),
                    nonMbByymmdd: $('#mbByymmdd').val(),
                    nonMbTelno: target.prev().val()
                }),
                success: function (d) {
                    target.attr('data-key', d.resultMap.redisKey);

                    $('.change-phone-num-area > div:first button').text('재전송');
                    $('.change-phone-num-area > div:last').show();

                    $('#chgBtn').prev().val('');
                    $('#chkNum').val('');
                    $("#chgBtn").removeClass("disabled");
                    $("#chgBtn").attr("disabled", false);

                    clearInterval(interval);


                    gfn_alertMsgBoxSize('인증번호를 전송했습니다.\n인증번호가 도착하지 않았을 경우 재전송을 눌러 주세요.', 400, 250);

                    m = 3;
                    s = 0;

                    $('#timeLimit').html(m + ':0' + s);
                    interval = setInterval(fn_setTime, 1000);
                }
            });
        });

        // 휴대폰번호 변경 완료 버튼
        $('#chgBtn').on('click', function() {
            var telNo = $('#sendNumberBtn').prev().val();
            var certNo = $('#chkNum').val();

            var mbNo = MegaboxUtil.Form.getFormObjData($(document.forms.mbInfoForm)).mbNo;

            $.ajaxMegaBox({
                url: '/on/oh/ohg/MbLogin/selectNonMbCertNoCnfn.rest',
                data: JSON.stringify({
                    redisKey: $('#sendNumberBtn').data('key'),
                    //certNo: $(this).prev().val(),
                    certNo: certNo,
                    nonMbTelno: telNo,
                    mbNo: parseInt(mbNo)
                }),
                success: function (d) {
                    var data = d.resultMap;

                    if(data.successAt == 'Y') {
                        gfn_alertMsgBoxSize('휴대폰 번호가 변경완료 되었습니다.', 400, 250);   //휴대폰 인증을 완료

                        var no = telNo.substr(0, 3) + '-' + telNo.substr(3, 4) + '-' + telNo.substr(7, 4);

                        $('.changeVal').html(no);
                        $('[name=phoneNo]').val(no);

                        $('#phoneChgBtn').click();

                        $('#phoneChgBtn').attr("style","display: none;");

                    } else {
                        if(data.failCnt == 5) {
                            gfn_alertMsgBox({ msg: '인증번호가 5회 이상 잘못 입력되었습니다.\n처음부터 다시 시도해주세요.' , callback: fn_moveMain });
                        }
                        if(data.msg == 'ME019') gfn_alertMsgBox('인증번호가 일치하지 않습니다.\n인증번호를 다시 입력해주세요.'); // 인증번호 틀림
                        else if(data.msg == 'ME040') gfn_alertMsgBox('유효시간이 초과되었습니다.\n인증번호 재전송을 통해서 다시 인증해주세요.'); // 인증번호 유효시간 지남
                        else gfn_alertMsgBox('휴대폰번호 변경에 실패하였습니다.'); // 저장실패
                    }
                }
            });
        });

        // 파일 선택 후 액션
        $('#profileTarget').on('change', function(e) {
            var file = e.target.files[0];
            var filePath = $(this).val();
            var type = file.type;

            if(type.indexOf('image') == -1)
                return gfn_alertMsgBox('이미지 파일만 등록 가능합니다.');

            $.ajax({
                url: '/on/oh/ohh/Mypage/addProfile.do',
                data: new FormData(document.forms.fileForm),
                type: 'POST',
                dataType: 'json',
                processData: false,
                contentType: false,
                success: function(data) {

                    if (data.statCd != 0) {
                        if( data.msg != "" ){
                            gfn_alertMsgBox(data.msg);
                        }else{
                            gfn_alertMsgBox('프로필 사진이 등록시 오류가 발생하였습니다.');
                        }

                        return;
                    }

                    gfn_alertMsgBox({ msg: '프로필 사진이 등록되었습니다.', callback: fn_reload });
                }
            });
        });

        // 첨부파일 추가
        $('#addProfileImgBtn').on('click', function() {
            $('#profileTarget').click();
        });

        // 첨부파일 삭제
        $('#deleteProfileImgBtn').on('click', function() {
            if(!confirm('프로필 사진을 삭제하시겠습니까?')) return;

            $.ajaxMegaBox({
                 url: '/on/oh/ohh/Mypage/deleteProfile.do',
                 success: function(d) {
                     gfn_alertMsgBox({ msg: '프로필 사진이 삭제되었습니다.', callback: fn_reload });
                  }
            });
        });

        // 취소 버튼
        $('#cancelBtn').on('click', function(e) {
            location.href = '/mypage';
        });

        // 등록 버튼
        $('#updateBtn').on('click', function() {
            var form = $(document.forms.mbInfoForm);
            var validObj = [
                
                { target: '[name=phoneNo]', msg: '휴대폰 번호를 입력 해주세요.' },
                { target: '[name=mbEmail]', msg: '이메일을 입력 해주세요.' }
            ];

            if (!$('input[name="mbEmail"]').val().isEmail()) {
                gfn_alertMsgBox('이메일 형식이 잘못 되었습니다.');
                return false
            }

            if(!MegaboxUtil.Form.validRegForm(validObj))
                return false;

            $('[name=phoneNo]').val($.trim($('.changeVal').text()));

            var data = MegaboxUtil.Form.getFormObjData(form);
            data.kioskByymmddLoginSetAt = $('[name=kioskset]:checked').val();
            data.redisKey = $('#sendNumberBtn').data('key');
            data.usePointPwAt = $('[name=usePointPwAt]:checked').val();

            // 스페셜 멤버십 가입 해지 체크
            var removeMbshipCds = '';
            var mbshipLength = $('.userMbshipList .clearfix').length - 1;

            $.each($('.userMbshipList .clearfix'), function(i, v) {
                if($(v).find('input[type=radio]:checked').val() == 'N') {
                    removeMbshipCds += $(v).data('cd');

                    if(i < mbshipLength) removeMbshipCds += ',';
                }
            });

            if(removeMbshipCds.length > 0) data.removeMbshipCds = removeMbshipCds;

            $.ajaxMegaBox({
                 url: '/on/oh/ohh/Mypage/updateUserInfo.do',
                 data: JSON.stringify(data),
                 clickLmtChk: true, //중복클릭 방지 실행
                 success: function(d) {
                    if(d.result == 'notEq') gfn_alertMsgBox('회원정보가 일치 하지않습니다.');
                    else gfn_alertMsgBox({ msg: '회원정보가 수정되었습니다.', callback: fn_mypageHome });
                 },complete: function(xhr){
                    //중복제한 초기화
                    clearLmt();
                 }
            });
        });
    });

    function fn_moveMain(){
        location.href = "/main";
    }

    // 페이지 새로고침
    function fn_reload() {
        location.reload();
    };

    function fn_mypageHome(){
        location.href="/mypage";
    };

    // 인증번호 3분 타이머
    function fn_setTime() {
        if(m == 0 && s == 0) {
            gfn_alertMsgBox('유효시간이 초과되었습니다.\n인증번호 재전송을 통해서 다시 인증해주세요.'); // 인증번호 유효시간 지남
            $("#chgBtn").attr("disabled", true);    //인증확인버튼 비활성
            $("#chgBtn").addClass("disabled");      //인증확인버튼 비활성

            return clearInterval(interval);
        }

        if(s == 0) {
            s = 59;
            m -= 1;
        } else {
            s -= 1;
        }

        s = s < 10 ? '0' + s : s;

        $('#timeLimit').html(m + ':' + s);
    }

    // 본인인증 완료 후 호출
    function fn_MbSelfCertCmpl(d) {

        var newNm = d.newNm;
        var megaCertCi = d.megaCertCi;
        var niceCertCi = d.niceCertCi;

        if (megaCertCi != niceCertCi) {
            gfn_alertMsgBox('이름 변경 대상정보가 회원님과 일치하지 않습니다.');
        } else if(newNm != undefined && newNm != $('.mbNmClass').text()) {
            $('[name=mbNm]').val(newNm);
            $('.mbNmClass').text(newNm);

            gfn_alertMsgBox('이름이 변경되었습니다.');
        } else {
            gfn_alertMsgBox('이름이 동일합니다.');
        }

        $('.btn-modal-close').click();
    }

    //메세지 표시
    function fn_MbSelfCertMessage(param){
        var options       = {};
        options.msg       = param;
        options.callback  = fn_submit;
        options.param     = {confirm:'/main'};
        options.minWidth  = 400;
        options.minHeight = 250;
        gfn_alertMsgBox(options);
        return;
    }

    // 본인인증
    function fn_selfCheck(type) {
        var form = type == 'ipin' ? $('#ipinFrm') : $('#phoneFrm');
        var param = MegaboxUtil.Form.getInputString(form);
        var url;

        if(type == 'ipin') url = 'https://cert.vno.co.kr/ipin.cb';
        else url = 'https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb';

        window.open('', 'selfCheck', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');

        form.find('[name=param_r1]').val(param);
        form.attr('target', 'selfCheck');
        form.attr('action', url);
        form.submit();
    }

    // 첨부파일 삭제 이벤트
    function fn_bindDelBtnCheck() {
        $('.btn-del').off();
        $('.btn-del').on('click', function() {
            var idx = $(this).parent().index();

            $.ajaxMegaBox({
                url: '/on/coc/FileUpload/deleteFileUpload.do',
                data: JSON.stringify({
                    fileNo: $(this).data('no'),
                    fileSn: $(this).data('sn'),
                    physicFileDelYn: 'Y'
                }),
                success: function (d) {
                    if (Number(d.deleteCnt) > 0) {
                        $('#imgList p').eq(idx).remove();
                    }
                }
            });
        });
    }
</script>
<script type="text/javascript">
var fn_ConnWithCallBack = function(paramData){
    var connTy = lnkgInfoObj.attr("connTy");
    var logUrl = "";
    if ( connTy == "conn") {
        logUrl = "/on/oc/ocz/SimpleLogin/insertSimpleLogin.do";
    }
    //else {
    //    logUrl = "/on/oc/ocz/SimpleLogin/deleteSimpleLogin.do";
    //}
    $.ajaxMegaBox({
        url: logUrl,
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        data: JSON.stringify(paramData),
        success: function (data, textStatus, jqXHR) {
            if ( connTy == "conn") {
                var loginInfo = "";
                var accessToken = "";

                if ( lnkgInfoObj.attr("lnkgTy") == "FACEBOOK" ) {
                    if (data.hashMap.facebookLoginName != null) {
                        loginInfo = data.hashMap.facebookLoginName;
                    }
                    if (data.hashMap.facebookLoginEmail != null) {
                        loginInfo += ((loginInfo == '') ? '' : ', ') + data.hashMap.facebookLoginEmail;
                    }
                    if (data.hashMap.facebookRegDt != null) {
                        loginInfo += ((loginInfo == '') ? '' : ', ') + data.hashMap.facebookRegDt;
                    }
                    accessToken = data.hashMap.facebookAccessToken;
                } else if ( lnkgInfoObj.attr("lnkgTy") == "KAKAO" ) {
                    if (data.hashMap.kakaoLoginName != null) {
                        loginInfo = data.hashMap.kakaoLoginName;
                    }
                    if (data.hashMap.kakaoLoginEmail != null) {
                        loginInfo += ((loginInfo == '') ? '' : ', ') + data.hashMap.kakaoLoginEmail;
                    }
                    if (data.hashMap.kakaoRegDt != null) {
                        loginInfo += ((loginInfo == '') ? '' : ', ') + data.hashMap.kakaoRegDt;
                    }
                    accessToken = data.hashMap.kakaoAccessToken;
                } else if ( lnkgInfoObj.attr("lnkgTy") == "NAVER" ) {
                    if (data.hashMap.naverLoginName != null) {
                        loginInfo = data.hashMap.naverLoginName;
                    }
                    if (data.hashMap.naverLoginEmail != null) {
                        loginInfo += ((loginInfo == '') ? '' : ', ') + data.hashMap.naverLoginEmail;
                    }
                    if (data.hashMap.naverRegDt != null) {
                        loginInfo += ((loginInfo == '') ? '' : ', ') + data.hashMap.naverRegDt;
                    }
                    accessToken = data.hashMap.naverAccessToken;
                } else if ( lnkgInfoObj.attr("lnkgTy") == "PAYCO" ) {
                    if (data.hashMap.paycoLoginName != null) {
                        loginInfo = data.hashMap.paycoLoginName;
                    }
                    if (data.hashMap.paycoLoginEmail != null) {
                        loginInfo += ((loginInfo == '') ? '' : ', ') + data.hashMap.paycoLoginEmail;
                    }
                    if (data.hashMap.paycoRegDt != null) {
                        loginInfo += ((loginInfo == '') ? '' : ', ') + data.hashMap.paycoRegDt;
                    }
                    accessToken = data.hashMap.paycoAccessToken;
                }
                lnkgInfoObj.removeClass("gray").addClass("gray-line").attr("connTy","disconn").text("해제").parent().prev().text("로그인 연동(" + loginInfo + ")");
                lnkgInfoObj.attr("accessToken", accessToken);

                gfn_alertMsgBoxSize('정상적으로 연동 되었습니다.', 400, 200);
            }
            //else {
            //    lnkgInfoObj.removeClass("gray-line").addClass("gray").attr("connTy","conn").text("연동").parent().prev().text("연결된 계정정보가 없습니다.");
            //   gfn_alertMsgBoxSize('정상적으로 연동 해제 되었습니다.', 400, 200);
            //}

        },
        error: function(xhr,status,error){
            var err = JSON.parse(xhr.responseText);
            alert(xhr.status);
            alert(err.message);
        }
    });
}

// 연동 해제
function deleteSimpleLogin(simpleLoginTyCd, accessToken) {
    var logUrl = "/on/oc/ocz/SimpleLogin/deleteSimpleLogin.do";

    var paramData = {
            simpleLoginTyCd     : simpleLoginTyCd
           ,simpleLoginTokenVal : accessToken
   };

    $.ajaxMegaBox({
        url: logUrl,
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        data: JSON.stringify(paramData),
        success: function (data, textStatus, jqXHR) {
            lnkgInfoObj.removeClass("gray-line").addClass("gray").attr("connTy","conn").text("연동").parent().prev().text("연결된 계정정보가 없습니다.");
            gfn_alertMsgBoxSize('정상적으로 연동 해제 되었습니다.', 400, 200);
        },
        error: function(xhr,status,error){
            var err = JSON.parse(xhr.responseText);
            alert(xhr.status);
            alert(err.message);
        }
    });
}

$(function(){
    $("tbody#lnkgInfoTbody button").off("click").on("click",function(){
        var accessToken = '';
        var simpleLoginTyCd = '';
        lnkgInfoObj = $(this);

        if ( lnkgInfoObj.attr("connTy") == "conn" ) { // 연동
            simpleLoginWith($(this).attr("lnkgTy"));
        } else { // 해제
            simpleLoginTyCd = lnkgInfoObj.attr("lnkgTy");
            accessToken = lnkgInfoObj.attr("accessToken");

            deleteSimpleLogin(simpleLoginTyCd, accessToken);
        }
    });
});
</script>
<%@include file ="../_common/commonFooterEnd.jsp" %>