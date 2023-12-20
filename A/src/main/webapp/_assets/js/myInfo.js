/** 마이페이지 회원정보 수정에서 사용되는 js
 * 
 */
var sValidateSchPwdLoginId   = "N";
var sValidateSchPwdMbNm      = "N";
var sValidateSchPwdMblpTelno = "N";
var sValidateSchPwdCertNo    = "N";
var sValidateSchPwdMblpCertNoSuccess = "N";

//이벤트
$(function(){
    $("#btnSchPwdMblpCharCert").attr("disabled", true);
    $("#btnSchPwdMblpCharCert").addClass("disabled");
    fn_validateSchPwdInputVal();
    /* 아이디 특수문자,한글을 제외한 입력 여부판단 */
    $("#ibxSchPwdLoginId").on("keyup", function(e){
        $(this).val($(this).val().replace(/[^0-9a-zA-Z]/gi,""));
        //인증요청 버튼 초기화
        fn_resetBtnSchPwdMbCertNoSend(e)
        if(fn_validateSchPwdInputVal()) {
            if(e.keyCode == 13){$("#btnSchPwd").click();}
        } else {
            if(e.keyCode == 13){$("#ibxSchPwdMbNm").focus();}
        }
    });
    $("#ibxSchPwdLoginId").focusout(function(){
        $(this).val($(this).val().replace(/[^0-9a-zA-Z]/gi,""));
        fn_validateSchPwdInputVal();
    });

    /* 이름 숫자를 제외한 입력 여부판단 */
    $("#ibxSchPwdMbNm").on("keyup", function(e){

        var partton = /[^ㄱ-힣a-zA-Z\s]/g;
        if(partton.test($(this).val())) {
            var value = $(this).val().replace(/[^ㄱ-힣a-zA-Z\s]/g,"");
            $("#ibxSchPwdMbNm").val(value);
        }
        //인증요청 버튼 초기화
        fn_resetBtnSchPwdMbCertNoSend(e)
        if(fn_validateSchPwdInputVal()){
            if(e.keyCode == 13){$("#btnSchPwd").click();}
        } else {
            if(e.keyCode == 13){$("#ibxSchPwdMblpTelno").focus();}
        }
    });
    $("#ibxSchPwdMbNm").focusout(function(){
        var partton = /[^ㄱ-힣a-zA-Z\s]/g;
        if(partton.test($(this).val())) {
            var value = $(this).val().replace(/[^ㄱ-힣a-zA-Z\s]/g,"");
            $("#ibxSchPwdMbNm").val(value);
        }
        fn_validateSchPwdInputVal();
    });

    /* 휴대폰번호 숫자만 입력 여부판단 */
    $("#ibxSchPwdMblpTelno").on("keyup", function(e){
        $(this).val($(this).val().replace(/[^0-9]/g,""));

        //휴대폰 번호
        if($("#ibxSchPwdMblpTelno").val() != "") {
            var frontNm = $("#ibxSchPwdMblpTelno").val().substr(0,2);
            if(frontNm != '01'){
                $('#schPwdMblpNo-error-text').text('휴대폰번호를 정확히 입력해주세요.');
                sValidateSchPwdCertNo = 'N';
                return false;
            }
            else if($("#ibxSchPwdMblpTelno").val().length < 10){
                $('#schPwdMblpNo-error-text').text('휴대폰번호를 정확히 입력해주세요.');
                sValidateSchPwdCertNo = 'N';
                return false;
            }
            else {
                sValidateSchPwdCertNo = 'Y';
                $('#schPwdMblpNo-error-text').text('');
            }
        }
        else {
            sValidateSchPwdCertNo = 'N';
        }

        //인증번호 전송 버튼 활성화
        if( sValidateSchPwdCertNo   == 'Y' && sValidateSchPwdMblpCertNoSuccess == 'N') {
            $("#btnSchPwdMbCertNoSend").attr("disabled", false);
            $("#btnSchPwdMbCertNoSend").removeClass("disabled");
        }
        else {
            $("#btnSchPwdMbCertNoSend").attr("disabled", true);
            $("#btnSchPwdMbCertNoSend").addClass("disabled");
        }

        //인증요청 버튼 초기화
        fn_resetBtnSchPwdMbCertNoSend(e)
    });
    $("#ibxSchPwdMblpTelno").focusout(function(){
        $(this).val($(this).val().replace(/[^0-9]/g,""));
    });

    /* 인증번호 숫자만 입력 여부 판단*/
    $("#ibxSchPwdMblpCharCertNo").on("keyup", function(e){
        $(this).val($(this).val().replace(/[^0-9]/g,""));

        if($("#ibxSchPwdMblpCharCertNo").val().length >= 4) {
            $("#btnSchPwdMblpCharCert").removeClass("disabled");
            $("#btnSchPwdMblpCharCert").attr("disabled", false);
        }
        else {
            $("#btnSchPwdMblpCharCert").attr("disabled", true);
            $("#btnSchPwdMblpCharCert").addClass("disabled");
        }

        if(e.keyCode == 13 && $("#ibxSchPwdMblpCharCertNo").val().length == "4") {$("#btnSchPwdMblpCharCert").click();}
    });
    $("#ibxSchPwdMblpCharCertNo").focusout(function(){
        $(this).val($(this).val().replace(/[^0-9]/g,""));
        if($("#ibxSchPwdMblpCharCertNo").val().length >= 4) {
            $("#btnSchPwdMblpCharCert").removeClass("disabled");
            $("#btnSchPwdMblpCharCert").attr("disabled", false);
        }
        else {
            $("#btnSchPwdMblpCharCert").attr("disabled", true);
            $("#btnSchPwdMblpCharCert").addClass("disabled");
        }
    });

    /* 휴대폰인증 아이디 특수문자,한글을 제외한 입력 여부판단 */
    $("#ibxSchPwdLoginIdMblpCert").on("keyup", function(e){
        $(this).val($(this).val().replace(/[^0-9a-zA-Z]/gi,""));
        if(fn_validateSchPwdInputVal()){
            if(e.keyCode == 13){$("#btnSchPwdMblpCert").click();}
        }
    });
    $("#ibxSchPwdLoginIdMblpCert").focusout(function(){
        $(this).val($(this).val().replace(/[^0-9a-zA-Z]/gi,""));
        fn_validateSchPwdInputVal();
    });

    //인증번호 전송
    $("#btnSchPwdMbCertNoSend").click(function(){

        /* 폼데이터 초기화 */
        $('input[name=certNo]').attr('value','');
        $('input[name=loginId]').attr('value','');
        //$('input[name=certType]').attr('value','');

        $('#schPwdMblpNo-error-text').text('');

        if($("#btnSchPwdMbCertNoSend").hasClass("disabled")){
            return;
        }
        else {
            var sSchPwdLoginId   = $("#ibxSchPwdLoginId").val();
            var sSchPwdMbNm      = $("#ibxSchPwdMbNm").val();
            var sSchPwdMblpTelno = $("#ibxSchPwdMblpTelno").val();

            var sRedisKey        = $('#certForm input[name=redisKey]').val();
            var sMbCertRedisKey  = $('#certForm input[name=mbCertRedisKey]').val();

            var paramData = { loginId:sSchPwdLoginId
                            , mbNm:sSchPwdMbNm
                            , mblpTelno:sSchPwdMblpTelno
                            , redisKey:sRedisKey
                            , mbCertRedisKey:sMbCertRedisKey
                            };
            $.ajaxMegaBox({
                url: "/on/oh/ohg/MbLogin/selectMbCertNoSend.rest",
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                dataType: "json",
                data: JSON.stringify(paramData),
                success: function (data, textStatus, jqXHR) {

                    if( data.resultMap.lmtAt == "Y" ){
                        gfn_alertMsgBox({ msg: '동일번호로 연속적인 인증이 발생하여 창을 닫습니다.\n3분후 다시 시도해 주세요.' , callback: fn_moveMain });
                    }else{

                        var revStr         = data.resultMap.revStr;
                        var certNo         = data.resultMap.certNo;
                        var loginId        = data.resultMap.loginId;
                        var redisKey       = data.resultMap.redisKey;
                        var mbCertRedisKey = data.resultMap.mbCertRedisKey;

                        $('#certForm input[name=redisKey]').attr('value',redisKey);
                        $('#certForm input[name=mbCertRedisKey]').attr('value',mbCertRedisKey);

                        //비회원   //확인 회원가입, 취소 아이디찾기
                        if (revStr == "mbSchIdGuideNonMb") {
                            gfn_alertMsgBoxSize('회원님의 계정에 등록된 정보와 일치하지 않습니다. \n다시 입력해주세요.', 400, 250);
                            return;
                        }
                        //아이디 있는경우 인증번호전송
                        else {
                            $("#ibxSchPwdMblpCharCertNo").attr("disabled", false);
                            $("#ibxSchPwdMblpCharCertNo").focus();
                            $("#ibxSchPwdMblpCharCertNo").val("");
                            //$('#certForm input[name=certNo]').val(certNo);
                            $('#certForm input[name=loginId]').val(loginId);
                            $('#btnSchPwdMbCertNoSend').html("재전송");
                            $("#btnSchPwdMbCertNoSend").attr("disabled", true); //인증번호 전송버튼 비활성화
                            $("#btnSchPwdMbCertNoSend").addClass("disabled");   //인증번호 전송버튼 비활성화
                            $("#btnSchPwdMblpCharCert").attr("disabled", true);
                            $("#btnSchPwdMblpCharCert").addClass("disabled");
                            gfn_alertMsgBoxSize('인증번호를 전송했습니다.\n인증번호가 도착하지 않았을 경우 재전송을 눌러 주세요.\n재전송은 인증번호 발송후 30초 이후에 가능합니다.', 400, 250);//입력하신 휴대폰 번호로 인증번호가 발송되었습니다. 확인 후 인증번호를 입력해주세요!

                            if(typeof AuthTimer != 'undefined'){
                                AuthTimer.fnStop();
                                $('#schPwdtimer').html("3:00");
                            }
                            else {
                                AuthTimer = new $SchPwdTimer();
                            }
                            AuthTimer.comSecond = 180;
                            AuthTimer.fnCallback = function(){alert("다시인증을 시도해주세요.")}
                            AuthTimer.timer = setInterval(function(){AuthTimer.fnTimer()},1000);
                            AuthTimer.domId = document.getElementById("schPwdtimer");

                            //console.log("certNo",certNo);
                            return;
                        }
                    }
                },
                error: function(xhr,status,error){
                     var err = JSON.parse(xhr.responseText);
                     alert(xhr.status);
                     alert(err.message);
                }
            });
        }
    });


    //인증번호 확인 버튼 클릭
    $("#btnSchPwdMblpCharCert").click(function(){
        var sRedisKey       = $('#certForm input[name=redisKey]').val();
        var sMbCertRedisKey = $('#certForm input[name=mbCertRedisKey]').val();
        var sCertNo         = $('#ibxSchPwdMblpCharCertNo').val();
        var sLoginId        = $('#ibxSchPwdLoginId').val();
        var sMbNm           = $('#ibxSchPwdMbNm').val();
        var sMblpTelno      = $('#ibxSchPwdMblpTelno').val();

        var paramData = { redisKey : sRedisKey
                        , mbCertRedisKey : sMbCertRedisKey
                        , certNo : sCertNo
                        , loginId : sLoginId
                        , mbNm : sMbNm
                        , mblpTelno : sMblpTelno
                        };

        $.ajaxMegaBox({
            url: "/on/oh/ohg/MbLogin/selectMbCertNoCnfn.rest",
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            data: JSON.stringify(paramData),
            success: function (data, textStatus, jqXHR) {

                var successAt = data.resultMap.successAt;
                var msg = data.resultMap.msg;
                var redisKey = data.resultMap.redisKey;
                var failCnt = nvl(data.resultMap.failCnt, 0);

                if(successAt == "Y"){
                    sValidateSchPwdMblpCertNoSuccess = "Y";
                    fn_validateSchPwdInputVal();                        //입력항목검증
                    $('#schPwdMblpNo-error-text').text('');             //에러메세지 초기화
                    $("#btnSchPwdMbCertNoSend").attr("disabled", true); //인증번호 전송버튼 비활성화
                    $("#btnSchPwdMbCertNoSend").addClass("disabled");   //인증번호 전송버튼 비활성화
                    $("#schPwdMblpCertRow").hide();
                    $("#ckBtn").attr("disabled", false);
                    $("#submitBtn").attr("disabled", false);
                    $("#pwdReSet").show();
                    $("#pwdReSetConfirm").show();
                    gfn_alertMsgBoxSize('휴대폰 인증을 완료했습니다.', 400, 250);   //휴대폰 인증을 완료했습니다.
                }
                else {
                    sValidateSchPwdMblpCertNoSuccess = "N";
                    if(failCnt == 5) {
                        gfn_alertMsgBox({ msg: '인증번호가 5회 이상 잘못 입력되었습니다.\n처음부터 다시 시도해주세요.' , callback: fn_moveMain });
                    }
                    if(msg == "ME019"){
                        $('#schPwdMblpNo-error-text').text('인증번호가 일치하지 않습니다.\n인증번호를 다시 입력해주세요.');   //msg.ch.ohg.ME019 인증번호를 다시 확인 후 입력해 주세요.
                    }
                    else if(msg == "ME040"){
                        $('#schPwdMblpNo-error-text').text('유효시간이 초과되었습니다.\n인증번호 재전송을 통해서 다시 인증해주세요.'); //msg.ch.ohg.ME040  유효시간이 지났습니다.  인증번호 재전송을 통해서 다시 인증해주세요.
                    }
                    $("#btnSchPwdMbCertNoSend").removeClass("disabled");    //인증번호 전송버튼 활성화
                    $("#btnSchPwdMbCertNoSend").attr("disabled", false);    //인증번호 전송버튼 활성화
                    $("#schPwdMblpCertRow").show();
                    $("#pwdReSet").hide();
                    $("#pwdReSetConfirm").hide();
                }
            },
            error: function(xhr,status,error){
                var err = JSON.parse(xhr.responseText);
                alert(xhr.status);
                alert(err.message);
            }
        });
    });

    /* 확인버튼 클릭 */
    $("#btnSchPwd").click(function(){
        fn_submit();
    });

    /* 휴대폰인증 확인버튼 클릭 */
    $("#btnSchPwdMblpCert").click(function(){
        if($("#ibxSchPwdLoginIdMblpCert").val() == ''){
            gfn_alertMsgBoxSize('본인인증으로 찾기 아이디를 입력해주세요.', 400, 250, fn_PwdLoginIdFocus);
            return;
        }

        $('input[name=certNo]').attr('value','');
        $('input[name=loginId]').attr('value',$("#ibxSchPwdLoginIdMblpCert").val());
        $('input[name=certType]').attr('value','SCRC02');

        fn_goPage('/member-check'); //M-ME-DA-01
    });
});
function fn_PwdLoginIdFocus(){
    $("#ibxSchPwdLoginIdMblpCert").focus();
}

//인증요청 버튼 초기화
function fn_resetBtnSchPwdMbCertNoSend(e){
    if(e.keyCode != 9){
        if(typeof AuthTimer != 'undefined'){
            if(e.keyCode != 13){
                AuthTimer.fnStop();
                $('#schPwdtimer').html("3:00");
                $('#btnSchPwdMbCertNoSend').html("인증요청");
                sValidateSchPwdMblpCertNoSuccess = "N";
                $('#schPwdMblpCertRow').show();
                $('#ibxSchPwdMblpCharCertNo').val("");
                $("#btnSchPwdMbCertNoSend").removeClass("disabled");
                $("#btnSchPwdMbCertNoSend").attr("disabled", false);
            }
            if(fn_validateSchPwdInputVal()){
                if(e.keyCode == 13){$("#btnSchPwd").click();}
            }
        }
        else {
            if(fn_validateSchPwdInputVal()){
                if(e.keyCode == 13){$("#btnSchPwd").click();}
            }
        }
    }
}



//입력 문자 체크
function fn_validateSchPwdInputVal(){

    if($("#ibxSchPwdLoginId").val() != "") {
        sValidateSchPwdLoginId = 'Y';
    }
    else {
        sValidateSchPwdLoginId = 'N';
    }

    if($("#ibxSchPwdMbNm").val() != "") {
        sValidateSchPwdMbNm = 'Y';
    }
    else {
        sValidateSchPwdMbNm = 'N';
    }

    if ($("#ibxSchPwdMblpTelno").val() == ""){
        sValidateSchPwdMblpTelno = 'N';
    }
    else {
        if($("#ibxSchPwdMblpTelno").val().length >= 10) {
            sValidateSchPwdMblpTelno = 'Y';
            $('#schPwdMblpTelno-error-text').text('');
        }
        else {
            sValidateSchPwdMblpTelno = 'N';
            $('#schPwdMblpTelno-error-text').text('휴대폰번호를 정확히 입력해주세요.');
        }
    }

    if(    sValidateSchPwdLoginId   == 'Y'
        && sValidateSchPwdMbNm      == 'Y'
        && sValidateSchPwdMblpTelno == 'Y') {
        $("#ibxSchPwdMblpCharCertNo").attr("disabled", false);
        $("#btnSchPwdMbCertNoSend").removeClass("disabled");
    }
    else {
        $("#ibxSchPwdMblpCharCertNo").attr("disabled", true);
        $("#btnSchPwdMbCertNoSend").addClass("disabled");
    }

    if(    sValidateSchPwdLoginId            == 'Y'
        && sValidateSchPwdMbNm               == 'Y'
        && sValidateSchPwdMblpTelno          == 'Y'
        && sValidateSchPwdMblpCertNoSuccess  == 'Y'
        ){
        $("#btnSchPwd").removeClass("disabled");
        $("#btnSchPwd").attr("disabled", false);
        return true;
    }
    else{
        $("#btnSchPwd").addClass("disabled");
        $("#btnSchPwd").attr("disabled", true);
        return false;
    }
}

//비밀번호변경화면으로
function fn_submit(){

    var sRedisKey       = $('#certForm input[name=redisKey]').val();
    var sMbCertRedisKey = $('#certForm input[name=mbCertRedisKey]').val();
    var sCertNo         = $('#ibxSchPwdMblpCharCertNo').val();
    var sLoginId        = $('#ibxSchPwdLoginId').val();
    var sMbNm           = $('#ibxSchPwdMbNm').val();
    var sMblpTelno      = $('#ibxSchPwdMblpTelno').val();

    var paramData = { redisKey : sRedisKey
                    , mbCertRedisKey : sMbCertRedisKey
                    , certNo : sCertNo
                    , loginId : sLoginId
                    , mbNm : sMbNm
                    , mblpTelno : sMblpTelno
                    };

    $.ajaxMegaBox({
        url: "/on/oh/ohg/MbLogin/selectMbSchPwd.rest",
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        data: JSON.stringify(paramData),
        success: function (data, textStatus, jqXHR) {
            var revStr      = data.resultMap.revStr;
            var fstJoinDt   = data.resultMap.fstJoinDt;
            var redisKey    = data.resultMap.redisKey;
            var loginIdStar = data.resultMap.loginIdStar;

            $('#certForm input[name=redisKey]').attr('value',redisKey);

            //아이디 없는경우  //취소 아이디찾기, 확인 아이디 등록 본인인증시만
            if (revStr == "mbSchIdGuideNonId") {
                var options        = {};
                options.msg        = '아이디 미등록 회원입니다.\n아이디를 등록하시겠습니까?\n가입 : '+fstJoinDt+'('+joinPathNm+' 가입)';
                options.confirmFn  = fn_goPage;
                options.param      = {confirm:'/id-register'} ;
                options.minWidth  = 400;
                options.minHeight = 300;
                gfn_confirmMsgBox(options);
                return;
            }
            //휴면 계정으로 전환된경우 //휴면계정복구    본인인증 수단 선택  M-ME-DA-01
            else if (revStr == "mbSchIdGuideDormAcct") {
                $('#certForm input[name=certType]').attr('value','SCRC03');
                var options        = {};
                options.msg        = '회원님의 아이디는 ['+loginIdStar+'] 메가박스 온라인 서비스를 1년이상 이용하지 않아 휴면계정으로 전환되었습니다. 휴면계정 복구 후 서비스 이용이 가능합니다.\n휴면계정 복구를 진행하시겠습니까?';
                options.okBtnTxt = "휴면계정복구";
                options.callback = fn_goPage;
                options.param    = {confirm:"/member-check"};
                options.minWidth  = 400;
                options.minHeight = 300;
                gfn_alertMsgBox(options);
                return;
            }
            //그외 폼전송
            else{
                fn_goPage("/pw-register");
            }
        },
        error: function(xhr,status,error){
             var err = JSON.parse(xhr.responseText);
             alert(xhr.status);
             alert(err.message);
        }
    });
}

function fn_goPage(page){
    $("#certForm").attr("method","post");
    $("#certForm").attr("action",page);
    $("#certForm input[name=preUrl]").val(document.location.pathname)
    $("#certForm").submit();
}

function fn_goMbSelfcertPage(){
    $("#mbSimpleCertForm").attr("method","post");
    $("#mbSimpleCertForm").attr("action","/member-check");
    $("#mbSimpleCertForm input[name=preUrl]").val(document.location.pathname)
    $("#mbSimpleCertForm").submit();
}

function $SchPwdTimer(){
    //prototype extend
}

$SchPwdTimer.prototype = {
    comSecond : ""
    , fnCallback : function(){}
    , timer : ""
    , domId : ""
    , fnTimer : function(){
        var m = Math.floor(this.comSecond / 60) + ":" + String((this.comSecond % 60)).lpad(2,"0");  // 남은 시간 계산
        this.comSecond--;                   // 1초씩 감소
        this.domId.innerText = m;

        if(this.comSecond < 150){
            $("#btnSchPwdMbCertNoSend").removeClass("disabled");    //인증번호 전송버튼 활성화
            $("#btnSchPwdMbCertNoSend").attr("disabled", false);    //인증번호 전송버튼 활성화
        }

        if (this.comSecond < 0) {           // 시간이 종료 되었으면..
            clearInterval(this.timer);      // 타이머 해제
            $('#schPwdMblpNo-error-text').text('유효시간이 초과되었습니다.\n인증번호 재전송을 통해서 다시 인증해주세요.'); //msg.ch.ohg.ME040  유효시간이 지났습니다.  인증번호 재전송을 통해서 다시 인증해주세요.
            $("#btnSchPwdMblpCharCert").attr("disabled", true); //인증확인버튼 비활성
            $("#btnSchPwdMblpCharCert").addClass("disabled");       //인증확인버튼 비활성
        }
    }
    ,fnStop : function(){
        clearInterval(this.timer);
    }
}

function fn_moveMain(){
    location.href = "/main";
}

/****************************************************************************************************/
$(function() {
  
  // 취소 버튼
  $('#cancelBtn').on('click', function(e) {
      e.preventDefault();

      location.href = '/mypage';
  });

  // 엔터 이벤트
  $('#ibxSchPwdMblpCharCertNo').on('keydown', function(e) {
      if(e.keyCode == 13){
          return false;
      }
  });

  // 확인 버튼
  $('#ckBtn').on('click', function(e) {
      e.preventDefault();

      var url = $(this).data('url');
      var sRedisKey       = $('#certForm input[name=redisKey]').val();
      var sMbCertRedisKey = $('#certForm input[name=mbCertRedisKey]').val();
      var sCertNo         = $('#ibxSchPwdMblpCharCertNo').val();
      var sLoginId        = $('#ibxSchPwdLoginId').val();
      var sMbNm           = $('#ibxSchPwdMbNm').val();
      var sMblpTelno      = $('#ibxSchPwdMblpTelno').val();

      var paramData = { redisKey : sRedisKey
              , mbCertRedisKey : sMbCertRedisKey
              , certNo : sCertNo
              , loginId : sLoginId
              , mbNm : sMbNm
              , mblpTelno : sMblpTelno
              };

      $.ajaxMegaBox({
          url: '/on/oh/ohh/Mypage/pwdCheck.do',
          data: JSON.stringify(paramData),
          success: function(d) {
              if(d.result == 'Y') {
                  //location.href = url;

                  $("#moveFrm").attr("action",url);
                  $("#moveFrm").append('<input type="hidden" name="redisKey" value="' + sRedisKey + '">');
                  $("#moveFrm").append('<input type="hidden" name="mbCertRedisKey" value="' + sMbCertRedisKey + '">');
                  $("#moveFrm").append('<input type="hidden" name="certNo" value="' + sCertNo + '">');
                  $("#moveFrm").append('<input type="hidden" name="loginId" value="' + sLoginId + '">');

                  $("#moveFrm").submit();
              } else {
                  gfn_alertMsgBox('인증 번호가 일치하지 않습니다.');
              }
          }
      });
  });

  /* Nice 본인인증 */
  $("#btnNiceMblpCert").click(function(){
      /* 폼데이터 초기화 */
      $('#searchIdForm input[name=certType]').attr('value','SCRC12');
      fn_submit('/member-check'); //M-ME-DA-01
  });

});
function fn_submit(page){

  $("#searchIdForm").attr("method","post");
  $("#searchIdForm").attr("action",page);
  $("#searchIdForm").submit();
}