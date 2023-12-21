/**
 * 나의 메가박스 무비스토리 관련 스크립트
 */
var MovieStory = function() {

  /**
   * 나의 메가박스 - 무비타임라인 이벤트 생성
   */
  this.bindTimeLineEvent = function() {
    // 더보기 버튼
    $('#addList').off().on('click', function() {
      var currentPage = Number($('#currentPage').val()) + 1;

      $('#currentPage').val(currentPage);

      MegaboxUtil.MovieStory.createTimeLine(true);
    });

    // 연도 버튼
    $('.swiper-slide button').off().on('click', function() {
      $('.swiper-slide button.on').removeClass('on');

      $(this).addClass('on');

      MegaboxUtil.MovieStory.createTimeLine();
    });

    // 이전 연도 버튼
    $('.year-prev').off().on('click', function() {
      var target = $('.swiper-slide button.on').parent();
      var indexNo = target.index();

      if(indexNo <= 0) return;

      $('.swiper-slide button.on').removeClass('on');
      target.prev().find('button').addClass('on');
      $('.swiper-slide button.on').click();
    });

    // 다음 연도 버튼
    $('.year-next').off().on('click', function() {
      var target = $('.swiper-slide button.on').parent();
      var yearLen = $('.swiper-slide button').length - 1;
      var indexNo = target.index();

      if(indexNo >= yearLen) return;

      $('.swiper-slide button.on').removeClass('on');
      target.next().find('button').addClass('on');
      $('.swiper-slide button.on').click();
    });
  };

  /**
   * 나의 메가박스 - 무비타임라인 태그 생성
   * @param paging : 페이징 여부
   */
  this.createTimeLine = function(paging) {
    var target = $('.my-timeline-list ol');
    var currentPage = $('#currentPage').val() ? $('#currentPage').val() : 1;

    // 페이징이 아닐시만 초기화
    if(!paging) {
      target.find('li').remove();

      currentPage = 1;
    }

    $.ajaxMegaBox({
      url: '/on/oh/ohh/MyMovieStory/selectMyMovieStoryList.do',
      data: JSON.stringify({
        currentPage: currentPage + '',
        year: $('.swiper-slide button.on').text()
      }),
      success: function(d) {
        var list = d.list;
        var listLen = list.length - 1;
        var html, beforeFstRegDt, nm, movieNm, oneClass;
        var megaScore, dirtorNm, genreNm, playTime, imgPath;
        var currentPage = 0;
        var totalCnt = 0;
        var imgSvrUrl = d.imgSvrUrl;
        var moviePostlayerTag = "";

        if(list && list.length > 0) {
          $.each(list, function(i, v) {
            nm = v.nm ? v.nm : '';
            movieNm = v.movieNm ? v.movieNm : '';

            if(beforeFstRegDt != v.fstRegDt) { // 등록일이 새로운 날일시
              html = '';
              html += '<li>';
              html += '    <div class="date">';
              html += '        <p>' + v.fstRegDt + '</p>';
              html += '    </div>';
              html += '    <ul class="movie">';
            }

            imgPath = v.movieFilePath ? v.movieFilePath : '';
            moviePostlayerTag = v.cd == "MOPO" ? "#layer_post_detail" : "javaScript:void(0)";

            html += '<li>';

            //a 태그 Title 적용 변수 설정
            var aTagTitle = "";

            if (nm =='본영화') {

              aTagTitle = movieNm;

            } else if (nm =='관람평' || nm =='기대평') {

              aTagTitle = '한줄평';

            } else if(nm =='무비포스트'){

              aTagTitle = nm;

            } else{
              aTagTitle = movieNm;
            }


            if (nm =='무비포스트') {
              imgPath = v.moviePostImgDivCd == "MIK" ? nvl(imgPath).posterFormat('_230') : imgPath;
              html += '    <a href=\"'+moviePostlayerTag+'"\ title=\"'+ nm +' 상세보기" class="img posterImg btn-modal-open2" w-data="850" h-data="auto" data-no="' + v.no + '" data-cd="' + v.cd + '" data-mno="' + v.movieNo + '" ><img src="' + imgSvrUrl + imgPath + '" onerror="noImg(this)" alt="' + movieNm + '"></a>';
            } else {
              html += '    <a href=\"'+moviePostlayerTag+'"\ title=\"'+ aTagTitle +' 상세보기" class="img posterImg btn-modal-open2" w-data="850" h-data="auto" data-no="' + v.no + '" data-cd="' + v.cd + '" data-mno="' + v.movieNo + '" ><img src="' + imgSvrUrl + nvl(imgPath).posterFormat('_230') + '" onerror="noImg(this)" alt="' + movieNm + '"></a>'; // 영화 포스터 이미지, 영화명
            }

            html += '    <div class="cont">';
            html += '        <p class="label">' + nm + '</p>'; // 컨텐츠 이름
            html += '        <p class="tit"><a href="javaScript:void(0)" title=\"'+ aTagTitle +' 상세보기\">' + movieNm + '</a></p>'; // 영화명

            if(v.pointList) { // 기대포인트 존재시
              oneClass = v.nm == '기대평' ? 'preview' : 'review' ;
              megaScore = v.megaScore ? v.megaScore : 0;

              html += '<div class="rate">';
              html += '    <p class="num ' + oneClass + '">' + megaScore + '</p>'; // 메가스코어
              html += '    <div class="case">';

              $.each(v.pointList, function(pi, pv) {
                html += '<p>' + pv.topScorePoint + '</p>'; // 기대포인트
              });

              html += '    </div>';
              html += '</div>';
            }

            if(v.nm == '본영화') {
              html += '<div class="theater">';
              if(v.brchNm) html += '    <p>' + v.brchNm + '</p>'; // 극장명
              if(v.theabNm) html += '    <p>' + v.theabNm + '</p>'; // 상영관명
              if(v.etcInfo) html += '    <p>' + v.etcInfo + '</p>'; // 상영정보
              html += '</div>';
            }

            if(v.nm == '보고싶어') {
              var dirtorNm = v.dirtorNm ? v.dirtorNm : '';
              var genreNm = v.genreNm ? v.genreNm : '';
              var playTime = v.playTime ? v.playTime : 0;

              html += '<div class="theater">';

              if(v.rfilmDe) html += '<p>개봉일 : ' + v.rfilmDe.substr(0, 4) + '.' +  v.rfilmDe.substr(4, 2) + '.' + v.rfilmDe.substr(6, 2) +  '</p>'; // 개볼일

              if(dirtorNm) html += '<p>감독 : ' + dirtorNm + '</p>'; // 감독

              html += '    <p>';

              if(genreNm) html += '장르 : ' + genreNm; // 장르
              if(genreNm && playTime) html += ' / '; // 장르&플레이시간
              if(playTime) html += playTime + '분'; // 플레이시간

              html += '    </p>';
              html += '</div>';
            }

            if(v.nm == '기대평' || v.nm == '관람평' ) {
              if(v.title) html += '<p class="txt">' + v.title + '</p>'; // 타이틀 존재시 작성내용
            } else {
              if(v.title) html += '<p class="txt">' + v.title.replaceAll('\n', '<br>') + '</p>'; // 타이틀 존재시 작성내용
            }


            html += '    </div>';
            html += '</li>';

            if((i < listLen && list[i + 1].fstRegDt != v.fstRegDt) || i == listLen) { // 다음 데이터의 등록일이 현재 데이터의 등록일과 다를시 OR 마지막 데이터일시
              html += '    </ul>';
              html += '</li>';

              target.append(html);
            }

            beforeFstRegDt = v.fstRegDt
            currentPage = v.currentPage;
            totalCnt = v.totalCnt;
          });

          $('.no-timeline').remove();
          $('.my-timeline-list').show();

          bindTimeLimeMouseEvent(); // 무비스토리 마우스 이벤트
        } else {
          $('.no-timeline').remove();

          if( $('.swiper-slide button.on').data('no') == $('.swiper-slide button').last().data('no') ){
            html = '<div class="no-timeline">나의 무비타임라인을 만들어 보세요.</div>';
          }else{
            html = '<div class="no-timeline">등록된 타임라인이 없습니다.</div>';
          }


          target.parent().parent().append(html);

          $('.my-timeline-list').hide();
        }

        // 더보기 버튼 설정
        if(currentPage < Math.ceil(totalCnt / 10)) {
          $('#currentPage').val(currentPage);

          $('#addList').parent().show();
        } else {
          $('#addList').parent().hide();
        }
        }
    });
  };

  /**
   * 무비스토리 마우스 이벤트
   */
  var bindTimeLimeMouseEvent = function() {
    // 포스터 이미지 클릭 이벤트
    $('.posterImg').off().on('click', function() {
      var cd = $(this).data('cd');
      var no = $(this).data('no');
      var mno = $(this).data('mno');
      var form = MegaboxUtil.Form.createForm(); // 폼 생성

      if(cd == 'INTRST' || cd == 'ADMIS') { // 보고싶어, 본영화 일시 영화 기본정보 상세페이지로
        form.append('<input type="hidden" name="rpstMovieNo" value="' + mno + '">');
            form.attr('method', 'get');
        form.attr('action', '/movie-detail');
        form.submit();
      } else if(cd == 'PREV' || cd == 'EXPE') { // 기대평, 관람평 일시 영화 한줄평 상세페이지로
        form.append('<input type="hidden" name="rpstMovieNo" value="' + mno + '">');
        form.attr('action', '/movie-detail/comment');
        form.submit();
      } else if(cd == 'MOPO') { // 무비포스트 일시 무비포스트 상세페이지로
        /*form.append('<input type="hidden" name="moviePostNo" value="' + no + '">');
            form.attr('method', 'get');
        form.attr('action', '/moviepost/detail');
        form.submit();*/
        fn_postDetail(no,'post', 'movie-timeline');

      }
    });

    //제목 클릭
    $('.my-timeline-list.myTimeline .cont .tit a').off().on('click', function() {

      var $poster = $(this).closest('li').find('.posterImg');

      if ($poster.data('cd') == 'MOPO') {
        var form = MegaboxUtil.Form.createForm(); // 폼 생성
        form.append('<input type="hidden" name="rpstMovieNo" value="' + $poster.data('mno') + '">');
        form.attr('method', 'get');
        form.attr('action', '/movie-detail');
        form.submit();
      } else {
        $poster.trigger("click");
      }
    });
};

  /**
   * 나의 메가박스 - 무비포스트 이벤트 생성
   */
  this.bindMoviePostEvent = function() {
    // 상단 탭 버튼
    $('.tab-sorting button').off().on('click', function() {
      $('.tab-sorting button.on').removeClass('on');
      $(this).addClass('on');
      $('#currentPage').val("1"); //페이지 1페이지로 고정

      MegaboxUtil.MovieStory.createMoviePost(); // 무비포스트 목록 조회
    });

    // 상단 정렬 버튼
    $('.movie-sorting button').off().on('click', function() {
      $('.movie-sorting button.on').removeClass('on');
      $(this).addClass('on');

      MegaboxUtil.MovieStory.createMoviePost(); // 무비포스트 목록 조회
    });

    // 검색 버튼
    $('.btn-search-input').off().on('click', function() {
      MegaboxUtil.MovieStory.createMoviePost(); // 무비포스트 목록 조회
    });

    // 검색 텍스트 엔터키 이벤트
    $('.btn-search-input').prev().off().on('keydown', function(e) {
      if(e.keyCode == 13)
        $('.btn-search-input').click();
    });

    // 더보기 버튼
    $('.my-movie-post .btn-more-movie-list').off().on('click', function() {
      var currentPage = Number($('#currentPage').val()) + 1;

      $('#currentPage').val(currentPage);

      MegaboxUtil.MovieStory.createMoviePost(true); // 무비포스트 목록 조회
    });
  };

  var masonryTarget;

  /**
   * 나의 메가박스 - 무비포스트 태그 생성
   * @param paging : 페이징 여부
   */
  this.createMoviePost = function(paging) {
    var currentPage = $('#currentPage').val() ? $('#currentPage').val() : 1;
    var ibxMovieNmSearch = $('[name=ibxMovieNmSearch]').val();
    var pageType = $('.movie-sorting button.on').data('type');
    var tabType = $('.tab-sorting button.on').data('type');
    var onairYn = '';   //20190805 purplek ibxMovieNmSearch ? 'Y' : '';
    var loginFullId, loginId;

    $.ajaxMegaBox({
          url: '/on/oh/oha/Movie/selectMoviePostList.do',
      data: JSON.stringify({
        currentPage: currentPage + '',
        recordCountPerPage: '12',
        ibxMovieNmSearch: ibxMovieNmSearch,
        pageType: pageType,
        tabType: tabType,
        onairYn: onairYn,
        position: 'moviePostPaging',
        json: true
      }),
          success: function(d) {

        var list = d.moviePostList;
        var target = $('#moviePostList');
        var html, isMy, onClass;
        var totCnt = 0;
        var imgSvrUrl = d.imgSvrUrl;
        var recordCountPerPage = 12;
        var currentPage = 1;

        if(!paging) {
          target.find('.grid-item, .no-moviepost').remove();

          $.each(target.find('.grid-item'), function(i , v) {
            target.masonry('remove', v);
          });
        }

        if(list && list.length > 0) {
          $.each(list, function(i, v) {
            loginId = v.loginId ? v.loginId : v.mbNm;
            //loginFullId = v.loginFullId ? v.loginFullId : v.fullMbNm;
            isMy = '${userSession.mbLoginId}' == v.loginId ? true : false;
            onClass = v.likeYn == 'Y' ? ' on' : '';
            currentPage = v.currentPage;
            totCnt = v.totCnt;

            html = '';

            html += '<div class="grid-item">';
            html += '    <div class="wrap">';
            html += '        <div class="img">';

            if (v.moviePostImgDivCd == 'MOVIEPOST') {
              html += '            <a href="#layer_post_detail" title="무비포스트 상세보기" class="moviePostBtn btn-modal-open2" w-data="850" h-data="auto" data-no="' + v.moviePostNo + '" data-row="' + v.rowNum  + '" data-tot="' + v.totCnt + '"><img src="' + imgSvrUrl + v.imgPath + '"  onerror="noImg(this)" alt="' + v.moviePostMovieTitle + '" /></a>';
            } else {
              html += '            <a href="#layer_post_detail" title="무비포스트 상세보기" class="moviePostBtn btn-modal-open2" w-data="850" h-data="auto" data-no="' + v.moviePostNo + '" data-row="' + v.rowNum  + '" data-tot="' + v.totCnt + '"><img src="' + imgSvrUrl + nvl(v.imgPath).posterFormat('_230') + '"  onerror="noImg(this)" alt="' + v.moviePostMovieTitle + '" /></a>';
            }

            html += '        </div>';
            html += '        <div class="cont">';
            html += '            <div class="writer">';
            html += '                <a href="#" title="'+loginId+'님의 무비포스트 보기" class="moviePostId" data-id="' + v.mbUid + '">' + loginId + '</a>';

            if(isMy) html += '<p class="my">my</p>';

            html += '            </div>';
            html += '            <a href="#layer_post_detail" title="무비포스트 상세보기" class="link moviePostBtn btn-modal-open2" w-data="850" h-data="auto" data-no="' + v.moviePostNo + '" data-row="' + v.rowNum  + '" data-tot="' + v.totCnt + '">';
            html += '                <div class="label">';

            if(v.maniaAt == 'Y') html += '<p class="mania">Movie mania</p>';
            if(v.edtpikAt == 'Y') html += '<p class="pick">Editor’s Pick</p>';

            html += '                </div>';
            html += '            </a>';
            html += '            <a href="/movie-detail?rpstMovieNo=' + v.rpstMovieNo + '" title="'+v.moviePostMovieTitle+' 상세보기">';
            html += '                <p class="tit">' + v.moviePostMovieTitle + '</p>';
            html += '            </a>';
            html += '            <a href="#layer_post_detail" title="무비포스트 상세보기" class="link moviePostBtn btn-modal-open2" w-data="850" h-data="auto" data-no="' + v.moviePostNo + '" data-row="' + v.rowNum  + '" data-tot="' + v.totCnt + '">';
            html += '                <p class="txt">' + v.moviePostImgDesc.replaceAll('\n', '<br>') + '</p>';
            html += '                <p class="time">' + v.fstRegDt + '</p>';
            html += '            </a>';
            html += '            <div class="condition">';
            html += '                <button type="button" class="btn-like postLikeBtn listBtn jsMake" data-no="' + v.moviePostNo + '"><i class="iconset ico-like' + onClass + '">보고싶어 수</i> <span class="cnt">' + v.postRcmmCnt + '</span></button>';
            //html += '                <a href="#layer_post_detail" class="moviePostRlyBtn btn-modal-open2" w-data="850" h-data="auto" data-no="' + v.moviePostNo + '"><i class="iconset ico-reply">댓글 수</i> ' + v.moviePostRlyCnt + '</a>';
            html += '                  <a href="#layer_post_detail" title= "댓글 작성하기" class="link btn-modal-open2 post-detailRlyPopup" w-data="850" h-data="auto" data-no="' + v.moviePostNo + '"><i class="iconset ico-reply">댓글 수</i> ' + v.moviePostRlyCnt + '</a>';
            html += '            </div>';
            html += '        </div>';
            html += '    </div>';
            html += '</div>';

            target.append(html);
          });

          if(!masonryTarget) {
            masonryTarget = target.masonry({
              itemSelector: '.grid-item',
              columnWidth: 195,
              gutter: 20
            });
          } else {
            var startNo = recordCountPerPage * (currentPage - 1)

            $.each(target.find('.grid-item'), function(i , v) {
              if(i >= startNo)
                target.masonry('appended', v);
            });

            masonryTarget.masonry('layout');
          }

          bindMoviePostMouseEvent();
        } else {
          html = '<div class="no-moviepost">등록된 무비포스트가 없습니다.</div>';

          target.append(html);
        }
        if(recordCountPerPage*currentPage < totCnt) $('.my-movie-post .more-movie-list').show();
        else $('.my-movie-post .more-movie-list').hide();

        $('#currentPage').val(currentPage);
        $('#myMoviePostCnt').text(totCnt.format());
          }
      });
  };

  /**
   * 무비포스트 마우스 이벤트
   */
  var bindMoviePostMouseEvent = function() {

    // 무비포스트 좋아요
    $('.postLikeBtn.jsMake').off().on('click', function() {
      var thisObj = $(this);
      $.ajaxMegaBox({
            url: '/on/oh/oha/Movie/mergeMoviePostHeart.do',
        data: JSON.stringify({
          artiNo: $(this).data('no'),
          artiDivCd: 'MOPO'
        }),
        sessionAt:true,
            success: function (d) {
          var resultMap = d.resultMap;

          if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox("로그인 후 이용가능한 서비스입니다.");

          if(resultMap.rowStatCd == 'D') $(thisObj).find('i').removeClass('on');
          else $(thisObj).find('i').addClass('on');

          $(thisObj).find('.cnt').html(resultMap.likeCnt);
            }
        });
    });

    // 무비포스트 클릭
    $('.moviePostBtn').off().on('click', function(e) {
      e.preventDefault();
      /*var form = MegaboxUtil.Form.createForm(); // 폼 생성
      form.append('<input type="hidden" name="moviePostNo" value="' + $(this).data('no') + '">');
      form.append('<input type="hidden" name="rowNum" value="' + $(this).data('row') + '">');
      form.append('<input type="hidden" name="totCnt" value="' + $(this).data('tot') + '">');
      form.append('<input type="hidden" name="ibxMovieNmSearch" value="' + $('[name=ibxMovieNmSearch]').val() + '">');
      form.append('<input type="hidden" name="pageType" value="">');
      form.append('<input type="hidden" name="onairYn" value="">');
      form.append('<input type="hidden" name="tabType" value="' + $('.tab-sorting button.on').data('type') +  '">');
          form.attr('method', 'get');
      form.attr('action', '/moviepost/detail');
      form.submit();*/

      fn_postDetail($(this).data('no'),'post', 'my-moviePost');
    });

    // 무비포스트 댓글 클릭
    $('.post-detailRlyPopup').off().on('click', function(e) {
      e.preventDefault();

      /*var form = MegaboxUtil.Form.createForm(); // 폼 생성
      form.append('<input type="hidden" name="moviePostNo" value="' + $(this).data('no') + '">');
          form.attr('method', 'get');
      form.attr('action', '/moviepost/detail#rly');
      form.submit();*/

      fn_postDetail($(this).data('no'),'rly', 'my-moviePost');
    });

    // 무비포스트 아이디 클릭
    $('.moviePostId').off().on('click', function(e) {
      e.preventDefault();

      var form = MegaboxUtil.Form.createForm(); // 폼 생성
      form.append('<input type="hidden" name="moviePostId" value="' + $(this).data('id') + '">');
      form.attr('action', '/moviepost/all');
      form.submit();
    });
  };

  /**
   * 나의 메가박스 - 한줄평 태그 생성
   */
  this.createOne = function() {
    var currentPage = $('[name=currentPage]').val() ? $('[name=currentPage]').val() : 1;
    var options = {};
    options.url = '/on/oh/oha/Movie/selectMyOneLineList.do';
    options.paramData = {
      myPage: 'Y',
      currentPage: currentPage + '',
      recordCountPerPage: $('[name=recordCountPerPage]').val() + ''
    };

    // 성공시 처리 함수
    options.successCallBack = function(d) {
      var target = $('#myAppraisal');
      var list = d.list;
      var html;
      var totalCnt = 0;
      var oneClass, likeClass, spointScore;
      var imgSvrUrl = d.imgSvrUrl;

      target.empty();

      totalCnt = d.list.length == 0 ? 0 : d.list[0].totCnt;

      if(list && list.length > 0) {
        $.each(list, function(i, v) {
          spointScore = v.spointScore || 0;
          oneClass = v.onelnEvalDivCd == 'EXPE' ? 'preview' : 'review';
          likeClass = v.rcmmAt == 'N' ? '' : v.onelnEvalDivCd == 'EXPE' ? '-purple' : '-blue';

          html = '';

          html += '<li>';
          html += '    <p class="img posterImg" data-mno="' + v.movieNo + '" style="cursor: pointer"><img src="' + imgSvrUrl + nvl(v.movieFilePath).posterFormat('_230') + '"  onerror="noImg(this)" alt="' + v.movieNm + '" /></p>'; // 포스터 이미지, 영화명
          html += '    <div class="cont">';
          html += '        <p class="tit"><a href="javaScript:void(0)" title="한줄평 상세보기">' + v.movieNm + '</a></p>'; // 영화명
          html += '        <div class="rate">';
          html += '            <p class="num ' + oneClass + '">' + spointScore + '</p>'; // 클래스, 평점

          //if(v.moviePointList) {
          //  html += '<div class="case">';

            //$.each(v.moviePointList, function(si, sv) {
            //  html += '<p>' + sv.topScorePoint + '</p>'; // 기대포인트
            //});
            //html += '</div>';
          //}

          html += '<div class="case">';
          html += gfn_charToHtml(replaceAll(v.topScorePoint, 'span', 'p'));
          html += '</div>';


          html += '        </div>';
          html += '        <p class="txt oneData">' + v.onelnEvalCn + '</p>'; // 한줄평 내용 v.onelnEvalCn.replaceAll('\n', '<br>')
          html += '        <div class="modify-area updateData" style="display: none;">';
          html += '            <textarea rows="5" cols="30" title="한줄평 수정 내용 입력" class="input-textarea">' + v.onelnEvalCn + '</textarea>'; // 한줄평 내용
          html += '        </div>';
          html += '        <div class="util">';
          html += '            <div class="left">';
          html += '                <button type="button" title="좋아요 수" class="like likeBtn" data-no="' + v.onelnEvalNo + '" data-cd="' + v.onelnEvalDivCd + '"><i class="iconset ico-like' + likeClass + '"></i> ' + v.rcmmCnt + '</button>'; // 한줄평 좋아요 수
          if(v.lstUptDt!=='') {
            html += '         <p class="date">' + v.lstUptDt + '</p>';
          }
          else {
            html += '                <p class="date">' + v.fstRegDt + '</p>'; // 등록일자
          }
          html += '            </div>';
          html += '            <div class="right">';
          html += '                <span><button type="button" id="updateRealCommentBtn" class="btn modify updateBtn" data-no="' + v.onelnEvalNo + '" data-mno="' + v.movieNo + '" data-cd="' + v.onelnEvalDivCd + '">수정</button></span>'; // 수정 버튼
          html += '                <span><button type="button" class="btn del deleteBtn" data-no="' + v.onelnEvalNo + '" data-mno="' + v.movieNo + '" data-cd="' + v.onelnEvalDivCd + '">삭제</button></span>'; // 삭제 버튼
          html += '            </div>';
          html += '        </div>';
          html += '    </div>';
          html += '</li>';

          target.append(html);
        });

        bindOneMouseEvent(); // 한줄평 마우스 이벤트
      } else {
        html = '<li class="no-result">등록된 한줄평이 없습니다.</li>';

        target.append(html);
      }

      $('#myOneCnt').text(totalCnt.format()); // 총 건수 설정
    };

    gfn_setPage(options);
  };

  /**
   * 한줄평 마우스 이벤트
   */
  var bindOneMouseEvent = function() {
    // 좋아요 버튼
    $('.likeBtn').off().on('click', function() {
      $.ajaxMegaBox({
            url: '/on/oh/oha/Movie/mergeMoviePostHeart.do',
        data: JSON.stringify({
          artiNo: $(this).data('no'),
          artiDivCd: 'ONELN',
          rcmmAt: $(this).find("i").hasClass('ico-like-purple') ||  $(this).find("i").hasClass('ico-like-blue') ? 'N' : 'Y'
        }),
        sessionAt:true,
            success: function(d) {
              //MegaboxUtil.MovieStory.createOne();
              var artiNo = d.resultMap.artiNo;
              $(".likeBtn").each(function(idx) {
                if($(this).data("no") == artiNo){
                  var likePurpleAt = $(this).find("i").hasClass('ico-like-purple') ? true : false;
                  var likeBlueAt   = $(this).find("i").hasClass('ico-like-blue') ? true : false;
                  var likeHtml = "";

                  if(likePurpleAt || likeBlueAt){
                    var likeCnt = Number($(this).text())-1;
                    likeHtml = '<i class="iconset ico-like"></i> '+likeCnt;
                  }
                  else if(!likePurpleAt && !likeBlueAt) {
                    var likeColor = $(this).data("cd") == "EXPE" ? '-purple' : '-blue';
                    var likeCnt = Number($(this).text())+1;

                    likeHtml = '<i class="iconset ico-like' + likeColor + '"></i> '+likeCnt;
                  }
                  $(this).html(likeHtml);
                }
              });




            }
        });
    });

    // 수정 버튼
    $('.updateBtn').off().on('click', function() {
      var target = $(this).parents('.cont');
      const textArr = target.find('.updateData textarea').val();
      if($(this).text() == '저장') {
        $('#updateRealCommentBtn').css({"pointer-events":"none"});
        if( gfn_isEmpty(textArr) ) {
          alert("한줄평 내용을 입력해주세요.")
          //     } else if($('.point .box button').attr('class').indexOf('on') ==-1 ){
        } else if( textArr.length < 10 ){
          alert("관람평을 최소 10글자 이상 입력해주세요")
        } else {
          for (var i = 0; i < textArr.length; i++) {
            var temp = textArr;
            if (temp[i] == temp[i + 1]) {
              if (temp[i] == temp[i + 2]) {
                if (temp[i] == temp[i + 3]) {
                  if (temp[i] == temp[i + 4]) {
                    alert("동일문자를 5자이상 연속해서 입력하실 수 없습니다.");
                    $('#updateRealCommentBtn').css({"pointer-events": "auto"});
                    return;
                  }
                }
              }
            }
          }
          $.ajaxMegaBox({
            url: '/on/oh/oha/Movie/insertOneLn.do',
            data: JSON.stringify({
              onelnEvalDivCd: $(this).data('cd'),
              onelnEvalNo: $(this).data('no'),
              movieNo: $(this).data('mno'),
              onelnEvalCn: target.find('.updateData textarea').val(),
              updateAt: 'Y',
              myPageAt: 'Y'
            }),
            sessionAt: true,
            clickLmtChk: true, //중복클릭 방지 실행
            success: function (d) {
              //20190905 한줄평, 댓글 작성시 메세지 불필요 gfn_alertMsgBox({ msg: '한줄평이 수정 되었습니다.', callback: oneUpdateComplete });
              oneUpdateComplete();
            }, complete: function (xhr) {
              clearLmt(); //중복제한 초기화
            }
          });
        }
      } else {
        target.find('.oneData').hide();
        target.find('.updateData').show();
        target.find('.updateBtn').text('저장');
        target.find('.deleteBtn').text('취소');
      }
      $('#updateRealCommentBtn').css({"pointer-events": "auto"});
    });

    // 삭제 버튼
    $('.deleteBtn').off().on('click', function() {
      if($(this).text() == '삭제') {
        if(!confirm('작성하신 관람평을 삭제하시겠습니까?')) return;

        $.ajaxMegaBox({
              url: '/on/oh/oha/Movie/deleteOneLn.do',
          data: JSON.stringify({
            onelnEvalNo: $(this).data('no'),
            movieNo: $(this).data('mno'),
            onelnEvalDivCd: $(this).data('cd')
          }),
          sessionAt:true,
              success: function(d) {
                //20190905 한줄평, 댓글 작성시 메세지 불필요 gfn_alertMsgBox({ msg: '삭제 되었습니다.', callback: oneUpdateComplete });
                oneUpdateComplete();
              }
          });
      } else {
        var target = $(this).parents('.cont');
        target.find('.oneData').show();
        target.find('.updateData').hide();
        target.find('.updateBtn').text('수정');
        target.find('.deleteBtn').text('삭제');
      }
    });

    // 포스터 이미지 클릭 이벤트
    $('.posterImg').off().on('click', function() {
      var mno = $(this).data('mno');
      var form = MegaboxUtil.Form.createForm(); // 폼 생성
      form.append('<input type="hidden" name="rpstMovieNo" value="' + mno + '">');
      form.attr('action', '/movie-detail/comment');
      form.submit();
    });


    //제목 클릭
    $('.my-appraisal.myOne.myMovieStory .cont .tit a').off().on('click', function() {
      var posterImgTag = $(this).parent().parent().parent();
      $(posterImgTag).find('.posterImg').trigger("click");
    });


  };

  /**
   * 한줄평 수정, 삭제 완료 후 호출
   */
  var oneUpdateComplete = function() {
    MegaboxUtil.MovieStory.createOne();
  };

  /**
   * 나의 메가박스 - 본영화 태그 생성
   */
  this.createSeenMovie = function() {
    var target = $('.my-saw-movie ul');
    var currentPage = $('#currentPage').val() ? $('#currentPage').val() : 1;
    var options = {};
    options.url = '/on/oh/ohh/MyMovieStory/selectWatchedMovieList.do';
    options.paramData = {
            lastMonth : 'N',
      currentPage: currentPage + '',
      recordCountPerPage: $('#recordCountPerPage').val() + ''
    };

    target.empty();

    // 성공시 처리 함수
    options.successCallBack = function(d) {
      var target = $('#mySawMovie');
      var list = d.movieList;
      var html;
      var totalCnt = 0;
      var imgSvrUrl = d.imgSvrUrl;

      target.find('li').remove();

      if(list && list.length > 0) {
        $.each(list, function(i, v) {
          totalCnt = v.totCnt;

          var s_btnNm1 = "";
          var s_btnNm2 = "";

          if (v.expeAt == 'Y') {
            s_btnNm1 = "관람평보기";
          } else {
            s_btnNm1 = "관람평쓰기";
          }
          if (v.moviePostNo == null) {
            s_btnNm2 = "포스트쓰기";
          } else {
            s_btnNm2 = "포스트보기";
          }

          html = '';

          html += '<li>';
          html += '    <p class="img posterImg" data-mno="' + v.movieNo + '" style="cursor: pointer"><img src="' + imgSvrUrl + nvl(v.imgPathNm).posterFormat('_230') + '" onerror="noImg(this)" alt="' + v.movieNm + '" /></p>'; // 포스터 이미지, 영화명
          html += '    <div class="cont">';
          html += '        <p class="tit"><a href="javaScript:void(0)" title="'+ v.movieNm +' 상세보기">' + v.movieNm + '</a></p>'; // 영화명
          html += '        <div class="theater">';
          html += '            <p>' + v.brchNm + '</p>'; // 극장명
          html += '            <p>' + v.theabNm + '</p>'; // 상영관명
          html += '            <p>' + v.etcInfo + '</p>'; // 상영정보
          html += '        </div>';
          html += '    </div>';
          html += '    <div class="btn-group">';
          html += '        <a href="#" class="btn review moveOneBtn" title="'+ s_btnNm1 +'" data-no="' + v.movieNo + '" data-at="' + v.expeAt + '"><i class="iconset ico-pencil"></i> ' + s_btnNm1 + '</a>';
          if(v.moviePostNo == null){
            html += '        <a href="#" class="btn post movePostBtn" title="'+ s_btnNm2 +'" data-no="' + v.movieNo + '" data-postno="' + v.moviePostNo + '"><i class="iconset ico-pencil"></i>' + s_btnNm2 + '</a>';
          }
          else {
            html += '        <a href="#layer_post_detail" title="'+ s_btnNm2 +'" class="btn-modal-open2 btn post movePostBtn" w-data="850" h-data="auto" data-no="' + v.movieNo + '" data-postno="' + v.moviePostNo + '"><i class="iconset ico-pencil"></i>' + s_btnNm2 + '</a>';
          }
          html += '        <button type="button" class="btn del deleteBtn" data-no="' + v.mbAdmisMovieOrd + '">삭제</button>';
          html += '    </div>';
          html += '</li>';

          target.append(html);
        });

        bindSeenMovieMouseEvent(); // 본영화 마우스 이벤트
      } else {
        html = '<li class="no-result">관람 내역이 없습니다.</li>';

        target.append(html);
      }

      $('#mySeenMovieCnt').text(totalCnt.format()); // 총 건수 설정
    };

    gfn_setPage(options);
  };

  /**
   * 내가 본영화 마우스 이벤트
   */
  var bindSeenMovieMouseEvent = function() {
    // 관람평 쓰기 버튼
    $('.moveOneBtn').off().on('click', function(e) {
      e.preventDefault();

      var form = MegaboxUtil.Form.createForm(); // 폼 생성
      form.append('<input type="hidden" name="rpstMovieNo" value="' + $(this).data('no') + '">');
      form.attr('action', '/movie-detail?tabCd=one');
      form.submit();
    });

    // 무비포스트 쓰기 버튼
    $('.movePostBtn').off().on('click', function(e) {
      e.preventDefault();

      var form = MegaboxUtil.Form.createForm(); // 폼 생성
      form.append('<input type="hidden" name="rpstMovieNo" value="' + $(this).data('no') + '">');
      form.append('<input type="hidden" name="backScreen" value="my-seenMovie">');

      if ($(this).data('postno') == null) {
        form.attr('action', '/moviepost/write');
        form.submit();
      } else {
        fn_postDetail($(this).data('postno'),'post', 'my-seenMovie');
      }

    });

    // 삭제 버튼
    $('.deleteBtn').off().on('click', function(e) {
      e.preventDefault();

      if(!confirm('선택하신 영화를 삭제하시겠습니까?\n삭제 된 영화는 복구가 불가능하며,\n예매번호 및 거래번호를 통해 재등록만 가능합니다.\n\n정말로 삭제하시겠습니까?')) return;

      $.ajaxMegaBox({
        url: '/on/oh/ohb/Movie/deleteAdmisMovie.do',
        data: JSON.stringify({
          mbAdmisMovieOrd: $(this).data('no')
        }),
        success: function(d) {
          $('#currentPage').val('1');

          gfn_alertMsgBox({ msg: '영화가 삭제되었습니다.', callback: MegaboxUtil.MovieStory.createSeenMovie });
        }
      });
    });

    // 포스터 이미지 클릭 이벤트
    $('.posterImg').off().on('click', function() {

      var mno = $(this).data('mno');
      var form = MegaboxUtil.Form.createForm(); // 폼 생성
      form.append('<input type="hidden" name="rpstMovieNo" value="' + mno + '">');
      form.attr('action', '/movie-detail');
      form.submit();
    });

    //제목클릭
    $('.my-saw-movie.mySeenMovie.myMovieStory .tit a').off().on('click', function() {
      var posterImgTag = $(this).parent().parent().parent();
      $(posterImgTag).find('.posterImg').trigger("click");
    });
  };

  /**
   * 나의 메가박스 - 보고싶어 태그 생성
   * @param paging : 페이징 여부
   */
  this.createLikeMovie = function(paging) {
    var currentPage = $('#currentPage').val() ? $('#currentPage').val() : 1;

    if(paging) currentPage = Number(currentPage) + 1;

    //페이지 초기화
    var pageType = true;
    if( currentPage == 1){
      pageType = false;
    }

    $.ajaxMegaBox({
          url: '/on/oh/oha/Movie/selectLikeMovieList.do',
      data: JSON.stringify({
        currentPage: currentPage + '',
        recordCountPerPage: '12',
        likeAt: 'Y',
      }),
          success: function (d) {
            var recordCountPerPage = 12;
        MegaboxUtil.Movie.setImgSvrUrl(d.imgSvrUrl); // 이미지 서버 URL 설정
        MegaboxUtil.Movie.createHtml(d.movieList, $('#movieList'), pageType, true); // 영화 목록 생성

            if(d.movieList.length > 0) {
          $('#noDataDiv').hide();
          $('#movieList').show();
          $('#totalCnt').text(d.movieList[0].totCnt);
            } else {
              $('#noDataDiv').show();
          $('#movieList').hide();
            }

            var totCnt = Number($('.myLikeMovie #totalCnt').html());


            if(recordCountPerPage*currentPage < totCnt){
              $('#currentPage').val(currentPage);
              $('.myLikeMovie .more-movie-list').show();
            }
        else $('.myLikeMovie .more-movie-list').hide();

            bindLikeMovieMouseEvent();
          }
      });
  };
};

var bindLikeMovieMouseEvent = function() {

  // 더보기 버튼
  $('.myLikeMovie .btn-more-like-list').off().on('click', function() {
    MegaboxUtil.MovieStory.createLikeMovie(true); // 무비포스트 목록 조회
  });

}


MegaboxUtil.MovieStory = new MovieStory();