<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../_common/meta.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/_assets/css/mypage.css">
    <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
  <jsp:include page="../_common/header.jsp"></jsp:include>

</head>
<body>


<main id="main">
  <section class="category-section">
      <div class="container has-lnb" data-aos="fade-up">
        <!-- 이곳에 코드작성 -->
        <div class="inner-wrap">
          <jsp:include page="lnb.jsp"></jsp:include>
          <script src="/js/megabox-movieStory.js"></script>
          <script src="/static/pc/js/swiper.min.js"></script>
          <script type="text/javascript">
          var cd = '';
          
            $(function() {
              // 탭 버튼
              $('.tab-block a').on('click', function(e) {
                e.preventDefault();
          
                var type = $(this).data('type');
          
                $('#currentPage').val('1'); // 페이지 번호 초기화
                $('.tab-block li.on').removeClass('on');
                $(this).parent().addClass('on');
          
                $('.myMovieStory').hide();
          
                if(type == 'tl') { // 무비타임라인
                  $('.myTimeline').show();
          
                  MegaboxUtil.MovieStory.bindTimeLineEvent(); // 무비타임라인 이벤트
          
                } else if(type == 'mp') { // 무비포스트
                  $('.myMoviePost').show();
          
                  MegaboxUtil.MovieStory.bindMoviePostEvent(); // 무비포스트 이벤트
                } else if(type == 'one') { // 한줄평
                  $('.myOne').show();
                } else if(type == 'sm') { // 본영화
                  $('.mySeenMovie').show();
                } else if(type == 'lm') { // 보고싶어
                  $('.myLikeMovie').show();
                }
          
                fn_selectDataList(type); // 무비스토리 데이터 조회
              });
          
              // 더보기 버튼
              $('#btnAddMovie').on('click', function() {
          
                fn_movieSerach(true);
              });
          
          
          
              if(cd == 'mp') $('.tab-block li').eq(1).addClass('on'); // 무비포스트 탭 활성화
              else if(cd == 'one') $('.tab-block li').eq(2).addClass('on'); // 한줄평 탭 활성화
              else if(cd == 'sm') $('.tab-block li').eq(3).addClass('on'); // 본영화 탭 활성화
              else if(cd == 'lm') $('.tab-block li').eq(4).addClass('on'); // 보고싶어 탭 활성화
              else $('.tab-block li').eq(0).addClass('on'); // 무비타임라인 탭 활성화
          
              $('.tab-block li.on a').click(); // 활성화 된 탭 컨텐츠 조회
          
              fn_initYearTab();
              MegaboxUtil.Movie.bindMyViewMovieEvent('regBtn', MegaboxUtil.MovieStory.createSeenMovie); // 내가 본 영화 버튼 이벤트
            });
          
            // 연도 탭 초기화
            function fn_initYearTab() {
              if($('.time-year').length > 0 ){
                $yearLeng = $('.time-year .cell').length;
          
                var time_year = new Swiper('.time-year', {
                  loop : false,
                  initialSlide : $yearLeng,
                  simulateTouch : false,
                  slidesPerView: 9,
                  spaceBetween: 0,
                  navigation : {
                    prevEl : '.year-prev',
                    nextEl : '.year-next',
                  },
                  ally : {
                    enabled : true
                  }
                });
          
                $(window).resize(function() {
                  time_year.update();
                }).resize();
          
                $('#movieTimeLineTab').on('click', function () {
                  time_year.update();
                });
          
                $(document).on('click', '.my-timeline .time-year .cell .btn', function(){
                  $(this).addClass('on').closest('.cell').siblings('.cell').find('.btn').removeClass('on');
                });
              }
            };
          
            // 무비스토리 데이터 조회
            function fn_selectDataList(type) {
              $('.no-timeline').remove();
          
              if(type == 'tl') { // 무비타임라인
                MegaboxUtil.MovieStory.createTimeLine();
              } else if(type == 'mp') { // 무비포스트
                $('[name=ibxMovieNmSearch]').val("");
                MegaboxUtil.MovieStory.createMoviePost();
              } else if(type == 'one') { // 한줄평
                MegaboxUtil.MovieStory.createOne();
              } else if(type == 'sm') { // 본영화
                MegaboxUtil.MovieStory.createSeenMovie();
              } else if(type == 'lm') { // 보고싶어
                MegaboxUtil.MovieStory.createLikeMovie();
              }
            };
          
            // 보고싶어 선택 후 리스트 재조회
            function fn_selectMovieList() {
              $('#currentPage').val('1'); // 페이지 번호 초기화
              $('#movieList').empty();
              fn_selectDataList('lm');
            };
          </script>
          <form id="movieForm" method="post">
            <input type="hidden" id="currentPage" value="1">
            <input type="hidden" id="recordCountPerPage" value="10">
          </form>
          <!-- contents -->
          <div id="myLoactionInfo" style="display: none;">
            <div class="location">
              <span>Home</span>
              <a href="/mypage" title="나의 메가박스 페이지로 이동">나의 메가박스</a>
              <a href="/mypage/moviestory" title="나의 무비스토리 페이지로 이동">나의 무비스토리</a>
            </div>
          </div>
          <div id="contents">
            <h2 class="tit">나의 무비스토리</h2>
            <div class="tab-block mb30">
              <ul>
                <li data-url="/mypage/moviestory?cd=tl" class="on">
                  <a id="movieTimeLineTab" href="#" class="btn" data-type="tl" title="무비타임라인 탭으로 이동">무비타임라인</a>
                </li>
                <li data-url="/mypage/moviestory?cd=one">
                  <a href="#" class="btn" data-type="one" title="관람평 탭으로 이동">관람평</a>
                </li>
                <li data-url="/mypage/moviestory?cd=lm">
                  <a href="#" class="btn" data-type="lm" title="보고싶어 탭으로 이동">보고싶어</a>
                </li>
              </ul>
            </div>
            <!-- 나의 무비타임라인 -->
            <div class="my-timeline myTimeline myMovieStory" style="display: block;">
              <button type="button" class="btn-year year-prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true">이전 년도 선택</button>
              <div class="time-year swiper-container-initialized swiper-container-horizontal">
                <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                  <!-- <div class="cell swiper-slide"><button type="button" class="btn">2007</button></div> -->
                  <div class="cell swiper-slide swiper-slide-next" style="width: 86px;">
                    <button type="button" class="btn" data-no="2023">2023</button>
                  </div>
                  <!-- <div class="cell swiper-slide"><button type="button" class="btn">2007</button></div> -->
                  <div class="cell swiper-slide" style="width: 86px;">
                    <button type="button" class="btn" data-no="2022">2022</button>
                  </div>
                  <!-- <div class="cell swiper-slide"><button type="button" class="btn">2007</button></div> -->
                  <div class="cell swiper-slide" style="width: 86px;">
                    <button type="button" class="btn" data-no="2021">2021</button>
                  </div>
                  <!-- <div class="cell swiper-slide"><button type="button" class="btn">2007</button></div> -->
                  <div class="cell swiper-slide" style="width: 86px;">
                    <button type="button" class="btn on" data-no="2020">2020</button>
                  </div>
                </div>
                <span class="swiper-notification" aria-live="assertive" aria-atomic="true">
                </span>
              </div>
              <button type="button" class="btn-year year-next swiper-button-disabled" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true">다음 년도 선택</button>
            </div>
            <!-- my-timeline-list -->
            <div class="my-timeline-list myTimeline myMovieStory" style="display: block;">
              <ol>
                <li>
                  <div class="date">
                    <p>2023.11.26</p>
                  </div>
                  <ul class="movie">
                    <li>
                      <a href="javaScript:void(0)" title="서울의 봄 상세보기" class="img posterImg btn-modal-open2" w-data="850" h-data="auto" data-no="102964630" data-cd="ADMIS" data-mno="23081200">
                        <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/aM1zeiVGySigNObspcjcoH9NaebEPa2f_230.jpg" onerror="noImg(this)" alt="서울의 봄">
                      </a>
                      <div class="cont">
                        <p class="label">본영화</p>
                        <p class="tit">
                          <a href="javaScript:void(0)" title="서울의 봄 상세보기">서울의 봄</a>
                        </p>
                        <div class="theater">
                          <p>코엑스</p>
                          <p>SHINeeWORLD관(컴포트 3관)</p>
                          <p>2023.11.26(일) 12:30 (2회차)</p>
                        </div>
                      </div>
                    </li>
                  </ul>
                </li>
                <li>
                  <div class="date">
                    <p>2023.10.29</p>
                  </div>
                  <ul class="movie">
                    <li>
                      <a href="javaScript:void(0)" title="그대들은 어떻게 살 것인가 상세보기" class="img posterImg btn-modal-open2" w-data="850" h-data="auto" data-no="102468890" data-cd="ADMIS" data-mno="23075200">
                        <img src="https://img.megabox.co.kr/SharedImg/2023/10/25/FXFCIlhJ6JEcTfk8BpVkSWvmf84sSpe9_230.jpg" onerror="noImg(this)" alt="그대들은 어떻게 살 것인가">
                      </a>
                      <div class="cont">
                        <p class="label">본영화</p>
                        <p class="tit">
                          <a href="javaScript:void(0)" title="그대들은 어떻게 살 것인가 상세보기">그대들은 어떻게 살 것인가</a>
                        </p>
                        <div class="theater">
                          <p>코엑스</p>
                          <p>SHINeeWORLD관(컴포트 3관)</p>
                          <p>2023.10.29(일) 14:25 (3회차)</p>
                        </div>
                      </div>
                    </li>
                  </ul>
                </li>
                
                <li>
                  <div class="date">
                    <p>2023.10.29</p>
                  </div>
                  <ul class="movie">
                    <li>
                      <a href="javaScript:void(0)" title="그대들은 어떻게 살 것인가 상세보기" class="img posterImg btn-modal-open2" w-data="850" h-data="auto" data-no="102468890" data-cd="ADMIS" data-mno="23075200">
                        <img src="https://img.megabox.co.kr/SharedImg/2023/10/25/FXFCIlhJ6JEcTfk8BpVkSWvmf84sSpe9_230.jpg" onerror="noImg(this)" alt="그대들은 어떻게 살 것인가">
                      </a>
                      <div class="cont">
                        <p class="label">본영화</p>
                        <p class="tit">
                          <a href="javaScript:void(0)" title="그대들은 어떻게 살 것인가 상세보기">그대들은 어떻게 살 것인가</a>
                        </p>
                        <div class="theater">
                          <p>코엑스</p>
                          <p>SHINeeWORLD관(컴포트 3관)</p>
                          <p>2023.10.29(일) 14:25 (3회차)</p>
                        </div>
                      </div>
                    </li>
                  </ul>
                </li>
                
                <li>
                  <div class="date">
                    <p>2023.10.29</p>
                  </div>
                  <ul class="movie">
                    <li>
                      <a href="javaScript:void(0)" title="그대들은 어떻게 살 것인가 상세보기" class="img posterImg btn-modal-open2" w-data="850" h-data="auto" data-no="102468890" data-cd="ADMIS" data-mno="23075200">
                        <img src="https://img.megabox.co.kr/SharedImg/2023/10/25/FXFCIlhJ6JEcTfk8BpVkSWvmf84sSpe9_230.jpg" onerror="noImg(this)" alt="그대들은 어떻게 살 것인가">
                      </a>
                      <div class="cont">
                        <p class="label">본영화</p>
                        <p class="tit">
                          <a href="javaScript:void(0)" title="그대들은 어떻게 살 것인가 상세보기">그대들은 어떻게 살 것인가</a>
                        </p>
                        <div class="theater">
                          <p>코엑스</p>
                          <p>SHINeeWORLD관(컴포트 3관)</p>
                          <p>2023.10.29(일) 14:25 (3회차)</p>
                        </div>
                      </div>
                    </li>
                  </ul>
                </li>
                
              </ol>
            </div>
            
            <!--// my-timeline-list -->
            <div class="btn-more v1 pt00 myTimeline myMovieStory" style="display: none;">
              <button type="button" class="btn" id="load">더보기
                <i class="iconset ico-btn-more-arr"></i>
              </button>
            </div>
            <!--// 나의 무비타임라인 -->
            <div class="board-list-util myOne myMovieStory" style="display: none;">
              <p class="result-count">
                <strong>총
                  <b class="font-gblue" id="myOneCnt"></b>건</strong>
              </p>
            </div>
            <!-- 나의 한줄평 -->
            <div class="my-appraisal myOne myMovieStory" style="display: none;">
              <ul id="myAppraisal">
              </ul>
            </div>
            <nav class="pagination myOne myMovieStory" style="display: none;">
            </nav>
            <!--// 나의 한줄평 -->
            <!--// 나의 보고싶어 -->
            <!-- my-movie-list -->
            <div class="my-movie-list myLikeMovie myMovieStory" style="display: none;">
              <div class="board-list-util">
                <p class="result-count">
                  <strong>총
                    <b class="font-gblue" id="totalCnt"></b>건</strong>
                </p>
              </div>
              <div class="movie-list myLikeMovie myMovieStory" style="display: none;">
<!--                 <ol class="list" id="movieList"> -->
<!--                 </ol> -->
              </div>
              <div class="more-movie-list pt30 myLikeMovie myMovieStory" style="display: none;">
                <button type="button" class="button btn-more-like-list">더보기
                  <i class="iconset ico-btn-more-arr"></i>
                </button>
              </div>
            </div>
            <!--// my-movie-list -->
            <!-- 보고싶어 영화 없을 때 -->
            <div class="no-my-movie-list myLikeMovie myMovieStory" id="noDataDiv" style="display: none;">
              <i class="iconset ico-movie-see"></i>
              <p>보고싶은 영화를 담아주세요.</p>
            </div>
            <!--// 나의 보고싶어 -->
          </div>
          <!--// contents -->
          <!-- 무비포스트 상세 레이어팝업 -->
          <script type="text/javascript">


          var detailPopup = {
            mbNo : "",
            moviePostNo : "",
            backScreen  : "",
            movieNo : ""
          };

          var moviePostRlyNo;

          $(function() {

            // 구독하기 버튼
            $('#subscribe').on('click', function() {


              $.ajaxMegaBox({
                    url: '/on/oh/oha/Movie/mergeMoviePostSubscribe.do',
                      data: JSON.stringify({
                  mbNo : detailPopup.mbNo
                      }),
                      sessionAt:true,
                    success: function (data) {
                  var resultMap = data.resultMap;

                  if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');

                  if(resultMap.moviePostSbscAt == 'Y' || resultMap.moviePostSbscAt == 'C') {
                    gfn_alertMsgBox('구독 신청이 완료 되었습니다.', function(){

                      // 영화 > 무비포스트 > 구독중인포스트 : 재조회
                      if($('[data-type=subscribe].on').length == 1){
                        $('[data-type=subscribe].on').click();
                      }
                      // 나의 무비스토리  > 구독중인포스트 : 재조회
                      else if($('[data-type=mySubscribe].on').length == 1){
                        $('[data-type=mySubscribe].on').click();
                      }
                    });
                    $('#subscribe').text('구독중');
                  } else if(resultMap.moviePostSbscAt == 'N') {
                    gfn_alertMsgBox('구독이 해제 되었습니다.', function(){
                      // 나의 무비스토리  > 구독중인포스트 : 재조회
                      if ($('[data-type=mySubscribe].on').length == 1) {
                        $('[data-type=mySubscribe].on').click();

                      }

                      // 영화 > 무비포스트 > 구독중인포스트 : 재조회
                      else if($('[data-type=subscribe].on').length == 1){
                        $('[data-type=subscribe].on').click();

                      }
                    });
                    $('#subscribe').text('구독하기');
                  } else {
                    $('#subscribe').text('구독하기');
                  }

                    }
                });
            });

            // 좋아요 버튼
            $(".layer-con").on('click', '.count .btn', function() {
              fn_addHeart(this);
            });

            // 댓글 등록
            $(".layer-con").on('click', '#btnPostRly', function() {
              var postRlyCn = $('#postRlyCn').val();

              if(gfn_isEmpty(postRlyCn)) return gfn_alertMsgBox('내용을 입력하세요');

              fn_insertPostRlyPre();
            });

            // 더보기 버튼
            $('#btnAddMovie').on('click', function() {
              fn_moviePostRlySearch('add');
            });

            // 댓글 사이즈
            $('#postRlyCn').on('keyup', function(e) {
              var postRlyCn = $('#postRlyCn').val();

              if(postRlyCn.length < 101) $('.text-count').text(postRlyCn.length);
            });

            // 공유하기
            $('.btn-post-share button').off().on('click', function(e) {
              e.preventDefault();

              var classStr = $(this).attr('class');

              if(classStr.indexOf('kakao') > -1) { // 카카오톡
                if(!MegaboxUtil.Common.isMobile() && !MegaboxUtil.Common.isApp())
                  MegaboxUtil.Common.alert('앱에서만 사용 가능합니다.');
                else
                  MegaboxUtil.Common.alert('준비중입니다.');
              } else if(classStr.indexOf('face') > -1) { // 페이스북
                MegaboxUtil.Share.facebook();
              } else if(classStr.indexOf('band') > -1) { // 밴드
                MegaboxUtil.Share.band();
              } else if(classStr.indexOf('twitter') > -1) { // 트위터
                MegaboxUtil.Share.twitter();
              } else { // 링크 공유
                MegaboxUtil.Share.copyUrl();
              }

              $('.tooltip-layer, .tipPin').css({ 'opacity': 0, 'z-index': 0 });
            });

            // 예매 클릭
              $('#bokdLinkBtn').off().on('click', function(e) {
                e.preventDefault();

                var form = MegaboxUtil.Form.createForm();
                form.append($('<input>').attr({ 'type': 'hidden', 'name': 'rpstMovieNo', 'value': $(this).data('no') }));
                form.attr('action', '/booking');
                form.submit();
              });


          });


          /*댓글목록 가져오기*/
          function fn_moviePostRlySearch(searchtype, moviePostNo, viewDiv){

            var moviePostNo = moviePostNo;
            //var currentPage = $("#currentPage").val();
            //var recordCountPerPage = $("#recordCountPerPage").val();

            if(searchtype == "search"){
              //currentPage = "1";
            }else if(searchtype == "add"){
              //currentPage = parseInt(currentPage) + 1;
            }
            //$("#currentPage").val(currentPage+"");
            //var paramData = { moviePostNo: moviePostNo, currentPage:currentPage + "", recordCountPerPage:recordCountPerPage};
            var paramData = { moviePostNo: moviePostNo};

            $.ajax({
                  url: "/on/oh/oha/Movie/selectMoviePostRlyList.do",
                  type: "POST",
                  contentType: "application/json;charset=UTF-8",
              data: JSON.stringify(paramData),
                  success: function (data) {
                    if(searchtype == "search"){
                      $("#commentList").empty();
                    }

                    $("#commentList").append(data);


                    if(viewDiv == "rly"){ //댓글아이콘 눌러서 상세 볼 경우
                      console.log(viewDiv);

                      $('#postRlyCn').focus();
                      $('.comment-box')[0].scrollIntoView(false); //댓글로 포커스


                    }else if($('#layer_post_detail .bg-modal-dim').length > 0) {
                      // 그림, 텍스트 눌러서 포스트 상세 볼 경우
                      console.log(viewDiv);
                      $('#layer_post_detail .bg-modal-dim')[0].scrollIntoView(true); // 레이어팝업 헤더에 포커스

                    }

                    //$(".link.btn-modal-open2.post-detailRlyPopup").each(function(idx){
                    $(".btn-modal-open2.post-detailRlyPopup").each(function(idx){
                      var hdnMoviePostNo = $('#hdnMoviePostNo').val();
                      if($.trim($(this).data('no')) == hdnMoviePostNo){
                        var totCnt = $('#rlyCntTop').val();
                        $(this).html("<i class='iconset ico-reply'>댓글 수</i> "+totCnt);
                      }
                    });
                  }
              });

          }

          /*좋아요 저장*/
          function fn_addHeart(obj){

            var artiNo = $(obj).attr("arti-no");

            if (artiNo == null) return ;

            var allData = { artiNo:artiNo, artiDivCd: 'MOPO' };

            $.ajaxMegaBox({
                  url: "/on/oh/oha/Movie/mergeMoviePostHeart.do",
                  type: "POST",
                  contentType: "application/json;charset=UTF-8",
                  dataType: "json",
              data: JSON.stringify(allData),
              sessionAt:true,
                  success: function (data, textStatus, jqXHR) {
                var resultMap = data.resultMap;

                if(resultMap.msg == "sessionFail"){
                  gfn_alertMsgBox("로그인 후 이용가능한 서비스입니다.");
                  return;
                }
                var text = "";
                $(obj).html('');
                if(resultMap.rowStatCd == "D"){
                  text = "<i title=\"좋아요 설정 함\" class=\"iconset ico-like\"></i>"+resultMap.likeCnt;
                  var artiNo = $(obj).attr("arti-no");

                  $(".btn-like.listBtn").each(function(idx){
                    if($.trim($(this).data('no')) == artiNo){
                      var oriVal = $(this).find('span').html(); //좋아요 수
                      var toVal = Number(oriVal)-1;       //좋아요 -1
                      $(this).find('span').html(toVal);     //태그 적용
                      $(this).find('i').removeClass('on');    //온클래스 제거
                    }
                  });
                }else{
                  text = "<i title=\"좋아요 설정 안함\" class=\"iconset ico-like on\"></i>"+resultMap.likeCnt;
                  var artiNo = $(obj).attr("arti-no");

                  $(".btn-like.listBtn").each(function(idx){
                    if($.trim($(this).data('no')) == artiNo){
                      var oriVal = $(this).find('span').html(); //좋아요 수
                      var toVal = Number(oriVal)+1;       //좋아요 +1
                      $(this).find('span').html(toVal);     //태그 적용
                      $(this).find('i').addClass('on');     //온클래스 추가
                    }
                  });
                }
                $(obj).append(text);
                  }
              });
          }


          /*댓글저장 전처리*/
          function fn_insertPostRlyPre(){
            var postRlyCn = $("#postRlyCn").val();

            var fn_complete = function(list){
                  if ( list.length > 0 ) {
                      //alert(list.join(","));
                      gfn_alertMsgBox('허용되지 않는 단어가 포함되어 있습니다.'); //허용되지 않는 단어가 포함되어 있습니다.
                  } else {
                    fn_insertPostRly();
                  }
             }

            gfn_chkPrhword(postRlyCn,fn_complete);
          }

          /*댓글저장*/
          function fn_insertPostRly(){

            var moviePostNo = detailPopup.moviePostNo;
            var postRlyCn = $("#postRlyCn").val();
            var allData = { moviePostNo:moviePostNo, postRlyCn:postRlyCn};

          /*  if(!confirm("등록 하시겠습니까?")){
              return;
            }
           */
          //20190905 한줄평, 댓글 작성시 메세지 불필요  gfn_confirmMsgBox("등록 하시겠습니까?", function(){
              $.ajaxMegaBox({
                    url: "/on/oh/oha/Movie/insertPostRly.do",
                    type: "POST",
                    contentType: "application/json;charset=UTF-8",
                    dataType: "json",
                data: JSON.stringify(allData),
                sessionAt:true,
                      clickLmtChk: true, //중복클릭 방지 실행
                    success: function (data, textStatus, jqXHR) {
                  var resultMap = data.resultMap;

                  if(resultMap.msg == "sessionFail"){
                    gfn_alertMsgBox("로그인 후 이용가능한 서비스입니다.");
                    return;
                  }

                  if(resultMap.msg == 'already') return gfn_alertMsgBox('이미 작성된 댓글이 있습니다.');

                  //20190905 한줄평, 댓글 작성시 메세지 불필요  gfn_alertMsgBox("댓글이 등록 되었습니다.");
                  $(".text-count").text("0");
                  $("#postRlyCn").val("");
                  fn_moviePostRlySearch("search", moviePostNo, "rly");
                      },complete: function(xhr){
                        clearLmt(); //중복제한 초기화

                      }
                });
            /////});
          }



          /*댓글 수정화면 취소버튼*/
          function fn_writeCancel(moviePostRlyNo){
            $("#rlyWri"+moviePostRlyNo).hide();
            $("#rlyTxt"+moviePostRlyNo).show();
          }

          /*댓글 사이즈(수정화면)*/
          function fn_postRlyCnValChk(moviePostRlyNo){
            var postRlyCn = $("#postRlyCn"+moviePostRlyNo).val();
            if(postRlyCn.length < 101){
              $("#textCount"+moviePostRlyNo).text(postRlyCn.length);
            }
          }


          /*******************************************************************
           * 무비포스트 상세 레이어팝업 관련  *
           *******************************************************************/
           function fn_moviePostList(){
            //콜백함수
             fn_moviePostRlySearch('search', detailPopup.moviePostNo);

          }


           function fn_postDetail(moviePostNo, viewDiv, backScreen){
            console.log("MoviePostViewLayerPM.jsp");
            //console.log(moviePostNo);
            detailPopup.moviePostNo = moviePostNo;
            detailPopup.backScreen = backScreen;

            //댓글창 초기화
            $('.comment-function .reset .text-count').text(0);
            $('#postRlyCn').val('');
            $('#subscribe').css("display", "block");
            $('.balloon-space').removeClass('on');


            $.ajaxMegaBox({
              url: '/moviepost/layerDetail',
              type: "POST",
              contentType: "application/json;charset=UTF-8",
              dataType: "json",
              data: JSON.stringify({
                moviePostNo: moviePostNo
              }),
              success: function (data) {

                var detailInfo = data.postList[0];
                $('.post-detail .tit').html(detailInfo.moviePostMovieTitle); //무비포스트 제목
                $('.user-id').html(detailInfo.loginId);
                $('.user-write-time').html(detailInfo.fstRegDe);
                $('.user-post-box .user-info .photo').html('<img src="'+data.imgSvrUrl+detailInfo.profileImgPath+'" alt="'+detailInfo.loginId+'님의 무비포스트" onerror="noImg(this)"/>');
                $('.user-write-time').html(detailInfo.fstRegDe);
                detailPopup.mbNo = detailInfo.mbNo;
                detailPopup.movieNo = detailInfo.movieNo;

                if ((detailInfo.movieStatCd == 'MSC01' || detailInfo.movieStatCd == 'MSC02') && detailInfo.bokdAbleYn == 'Y') {
                  $('#bokdLinkBtn').show();
                  $('#bokdLinkBtn').data('no', detailInfo.movieNo);
                  $('#bokdLinkBtn').attr('title', detailInfo.movieNm +' 예매하기');
                } else {
                  $('#bokdLinkBtn').hide();
                }

                if('3487839' != detailInfo.mbNo){ //무비포스트 쓴 회원과 홈페이지 접속한 회원이 같지 않은 경우

                  $('.count .btn').attr('arti-no', moviePostNo); //좋아요 버튼에 무비포스트번호 셋팅

                  //포스트 옵션 말풍선
                  $('.balloon-space').removeClass('writer').addClass('user');
                  var html ="";
                  html += '<div class="user">';
                    html += '<p class="reset a-c">광고성 내용 및 욕설/비방하는<br />내용이 있습니까?</p>';
                    html += '<button type="button" data-no3="' + moviePostNo + '">포스트 신고 <i class="iconset ico-arr-right-green"></i></button>';
                    html += '</div>';
                  html += '<div class="btn-close"><a href="#" title="닫기"><img src="../../../static/pc/images/common/btn/btn-balloon-close.png" alt="닫기" /></a></div>';
                    $('.balloon-space.mpost .balloon-cont').html(html);

                  if(detailInfo.moviePostSbscAt == 'Y'){ //무비포스트구독여부가 Y면
                    $('#subscribe').text('구독중');
                  }else{
                    $('#subscribe').text('구독하기');
                  }
                }else {
                  $('.count .btn').attr('arti-no', moviePostNo); //좋아요 버튼에 무비포스트번호 셋팅

                  //포스트 옵션 말풍선
                  $('.balloon-space').removeClass('user').addClass('writer');
                  var html="";
                  html += '<div class="writer layer-pop-detail">';
                    html += '<button type="button" data-no1="'+ moviePostNo +'" data-no2="'+ detailInfo.movieNo +'">수정</button>';
                    html += '<button type="button" data-no1="'+ moviePostNo +'">삭제</button>';
                    html += '</div>';
                    html += '<div class="btn-close"><a href="#" title="닫기"><img src="../../../static/pc/images/common/btn/btn-balloon-close.png" alt="닫기" /></a></div>';

                    $('.balloon-space.mpost .balloon-cont').html(html);

                  $('#subscribe').css("display", "none");
                }

                //포스트 내용
                if(data.postList.length > 0){

                  var metaTagImg = "";  //메타태그 이미지
                  var htmlTxt = "";
                  var img_Path = "";
                  for(var i=0; i<data.postList.length; i++){
                    if( i == 0 ){
                      metaTagImg = data.imgSvrUrl + data.postList[i].imgPath
                    }
                    if(data.postList[i].moviePostImgDivCd == 'MIK01'){ //스틸컷(포스터)
                      img_Path = nvl(data.postList[i].imgPath).posterFormat('_600');
                      htmlTxt += '<div class="section">' ;
                      htmlTxt += '<img src="'+ data.imgSvrUrl + img_Path + '"';
                      htmlTxt += 'alt="" />';
                      htmlTxt +='<p class="p-caption">';
                      htmlTxt += data.postList[i].moviePostImgDesc.replaceAll('\n', '<br>');
                      htmlTxt +='</p></div>';
                    }
                    else if(data.postList[i].moviePostImgDivCd == 'MIK02'){ //스틸컷
                      img_Path = nvl(data.postList[i].imgPath).posterFormat('_648');
                      htmlTxt += '<div class="section">';
                      htmlTxt += '<img src="'+ data.imgSvrUrl+ img_Path + '"';
                      htmlTxt += 'alt="" />';
                      htmlTxt += '<p class="p-caption">';
                      htmlTxt += data.postList[i].moviePostImgDesc.replaceAll('\n', '<br>');
                      htmlTxt += '</p></div>';
                    }
                    else if(data.postList[i].moviePostImgDivCd == 'MIK03'){ //예고편동영상
                      img_Path = nvl(data.postList[i].imgPath).posterFormat('_648');
                      htmlTxt += '<div class="section">';
                      htmlTxt += '<video controls poster="'+ data.imgSvrUrl + img_Path + '"';
                      htmlTxt += '<source src="'+data.postList[i].moviePostVodUrl +'" type="video/mp4" /></video>';
                      htmlTxt +=  '<p class="p-caption">';
                      htmlTxt += data.postList[i].moviePostImgDesc.replaceAll('\n', '<br>');
                      htmlTxt += '</p></div>';

                    }
                    else if(data.postList[i].moviePostImgDivCd == 'MOVIEPOST'){ //내사진
                      htmlTxt += '<div class="section">';
                      htmlTxt += '<img src="'+ data.imgSvrUrl + data.postList[i].imgPath+ '"';
                      htmlTxt += 'alt="" />';
                      htmlTxt +=  '<p class="p-caption">';
                      htmlTxt += data.postList[i].moviePostImgDesc.replaceAll('\n', '<br>');
                      htmlTxt += '</p></div>';

                    }
                    else{
                      htmlTxt += '<div class="section">';
                      htmlTxt += '<img src="'+ data.imgSvrUrl + data.postList[i].imgPath+ '"';
                      htmlTxt += 'alt="" />';
                      htmlTxt +=  '<p class="p-caption">';
                      htmlTxt += data.postList[i].moviePostImgDesc.replaceAll('\n', '<br>');
                      htmlTxt += '</p></div>';

                    }
                  }

                  $('.post-cont-area .section-area').html(htmlTxt);

                }

                //좋아요 아이콘
                if(detailInfo.likeYn == "Y"){ //좋아요 Y

                  var txt="";

                  txt += '<i title="좋아요 설정 함" class="iconset ico-like on"></i>';
                  txt += ' ' + detailInfo.likeCnt;

                  $('.count .btn').html(txt);

                }else{ //좋아요 N

                  var txt ="";

                  txt += '<i title="좋아요 설정 안함" class="iconset ico-like"></i>';
                  txt += ' '+ detailInfo.likeCnt;

                  $('.count .btn').html(txt);

                }

                //댓글
                fn_moviePostRlySearch('search', moviePostNo, viewDiv);

                //무비포스트 상세 메타태그 설정
                fn_setMetaTag( detailInfo, moviePostNo, metaTagImg );포스트 신고
                

              }
            });
          }

          function fn_setMetaTag( detailInfo, moviePostNo, metaTagImg ){

            var attr  = "";
            if( moviePostNo != null && moviePostNo != '' )        attr = '?moviePostNo=' + moviePostNo;

            var url   = location.pathname + attr;
            if( detailPopup != null && detailPopup.backScreen != '' ) url  = '/moviepost/all' + attr;

            metaFormat = {
                'scnTitle'      : '(' + gfn_charToHtml(detailInfo.moviePostMovieTitle) + ') 무비포스트 상세 | MEET PLAY SHARE, 메가박스'
                , 'metaTagTitle'  : '(' + gfn_charToHtml(detailInfo.moviePostMovieTitle) + ') 무비포스트 상세'
                , 'metaTagDtls'   : '메가박스의 다양한 무비포스트를 확인해보세요.'
                , 'metaTagImg'    : metaTagImg
                , 'metaTagUrl'    : url
            };

            //URL 변경
            history.replaceState( null, null, location.origin + url );

            //메타태그 설정
            settingMeta(metaFormat);
          }

          
          </script>
              <!--################# 무비포스트 상세 레이어팝업으로 변경 ###########################  -->
              <section id="layer_post_detail" class="modal-layer2">
                <a href="" class="focus">레이어로 포커스 이동 됨</a>
                <div class="wrap">
                  <header class="layer-header">
                    <h3 class="tit">무비포스트 상세</h3>
                  </header>
                  <div class="layer-con">
                    <div class="post-detail">
                      <div class="tit-area mb30">
                        <p class="tit"></p>
                        <div class="direct-link">
                          <a id="bokdLinkBtn" data-no="" href="" style="display: none;" title="">예매하기</a>
                        </div>
                      </div>
                      <div class="user-post-box mb40">
                        <div class="user-post-case">
                          <!-- post-top-area -->
                          <div class="post-top-area">
                            <div class="user-info">
                              <p class="photo">
                                <img src="../../../static/pc/images/movie/img-P-MO-PO0101-user-img01.png" alt="userid80**님의 무비포스트">
                              </p>
                              <p class="user-id">
                                <a href="" title="ID"></a>
                              </p>
                              <p class="user-write-time"></p>
                            </div>
                            <div class="btn-util">
                              <!-- 구독하기 전 -->
                              <button type="button" class="button x-small gray-line" id="subscribe">
                              </button>
                            </div>
                            <!-- post-funtion -->
                            <div class="post-funtion">
                              <div class="wrapper">
                                <button type="button" class="btn-alert mp">옵션보기</button>
                                <!--
                                유저 일때
                                <div class="balloon-space user">
        
                                작성자 일때
                                <div class="balloon-space writer">
                                -->
                                <div class="balloon-space mpost">
                                  <div class="balloon-cont">
                                  </div>
                                </div>
                                <!--// 말풍선 -->
                              </div>
                            </div>
                            <!--// post-funtion -->
                          </div>
                          <!--// post-top-area -->
                          <div class="post-cont-area">
                            <!-- post 내용  -->
                            <div class="section-area">
                            </div>
                            <!--// post 내용 -->
                          </div>
                          <!-- comment count -->
                          <div class="count">
                            <button type="button" class="btn" arti-no="">
                              <i title="좋아요 설정 안함" class="iconset ico-like"></i>
                            </button>
                            <!-- 코멘트 등록 영역으로 이동 -->
                          </div>
                          <!--// comment count -->
                        </div>
                      </div>
                      <!-- share -->
                      <div class="btn-post-share">
                        <!--                <button type="button" title="카카오톡 공유하기" class="btn kakao">카카오톡</button> -->
                        <button type="button" title="페이스북 공유하기" class="btn face">페이스북</button>
                        <button type="button" title="밴드 공유하기" class="btn band">밴드</button>
                        <button type="button" title="트위터 공유하기" class="btn twitter">트위터</button>
                        <button type="button" title="링크 공유하기" class="btn link">링크공유</button>
                      </div>
                      <!--// share -->
                      <!-- comment input -->
                      <div class="comment-write mb40" id="rly">
                        <div class="comment-util mb20">
                          <p>
                            <span id="rlyCnt">댓글</span>
                          </p>
                          <input type="hidden" id="rlyCntTop" value="">
                          <input type="hidden" id="hdnMoviePostNo" value="">
                        </div>
                        <div class="comment" id="input-comment">
                          <textarea class="input-textarea" cols="5" rows="5" id="postRlyCn" title="댓글 입력" name="postRlyCn" maxlength="100">
                          </textarea>
                          <div class="comment-function">
                            <p class="reset">
                              <span class="text-count"></span>/ 100</p>
                            <div class="btn">
                              <button type="button" id="btnPostRly">등록</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!--// comment input-->
                      <!-- comment list -->
                      <div class="comment-list" id="commentList">
                      </div>
                      <!--// comment list -->
                      <div class="mb50">
                      </div>
                    </div>
                  </div>
                  <button type="button" class="btn-modal-close2">레이어 닫기</button>
                </div>
              </section>
              <!-- // ################# 무비포스트 상세 레이어팝업으로 변경 ###########################  -->
              <!-- //무비포스트 상세 레이어팝업 -->
            </data.postlist.length>
          </p>
        </div>
      </div>
  </section>
</main>
<jsp:include page="../_common/commonFooter.jsp"></jsp:include>
</body>
</html>