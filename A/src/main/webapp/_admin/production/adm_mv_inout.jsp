<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  
    <title>Latte Cinema</title>
    <!-- Bootstrap -->
    <link href="_admin/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="_admin/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="_admin/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="_admin/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="_admin/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="_admin/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="_admin/vendors/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="_admin/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="_admin/build/css/custom.min.css" rel="stylesheet">
    <!-- jQuery -->  
    <script src="_admin/vendors/jquery/dist/jquery.min.js"></script>
  </head>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="adm_home.ad" class="site_title"><i class="fa fa-film"></i> <span>Latte Cinema!</span></a>
            </div>
            <div class="clearfix"></div>
            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="_admin/production/images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>admin</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->
            <br />
            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a href="adm_home.ad"><i class="fa fa-home"></i> Home</a></li>
                  <li><a href="adm_member.ad"><i class="fa fa-user"></i> 회원관리</a></li>
                  <li><a href="adm_mv_inout.ad"><i class="fa fa-edit"></i>영화 통합 추가/제거</a></li>
                  <li><a href="adm_store.ad"><i class="fa fa-beer"></i>스토어 관리</a></li>
                </ul>
              </div>
              <div class="menu_section">
                <h3>메인 페이지 관리</h3>
                <ul class="nav side-menu">
                  <li><a href="adm_cs_center.ad"><i class="fa fa-bullhorn"></i> 공지사항</a></li>
                  <li><a href="adm_cs/cs_exque.ad"><i class="fa fa-question"></i> 자주찾는질문</a></li>
                  <li><a href="adm_cs_qna.ad"><i class="fa fa-comments"></i> 1:1문의</a></li>
                  <li><a href="adm_cs_lost.ad"><i class="fa fa-search"></i> 분실물 문의</a></li>                     
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->
            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen"><span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span></a>
              <a data-toggle="tooltip" data-placement="top" title="Lock"><span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span></a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.jsp"><span class="glyphicon glyphicon-off" aria-hidden="true"></span></a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>
	    </div>
      <!-- top navigation -->
      <div class="top_nav">
        <div class="nav_menu">
          <nav>
            <div class="nav toggle">
              <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>
          </nav>
        </div>
      </div>
      <!-- /top navigation -->

      <!-- page content -->
      <div class="right_col" role="main">
        <div class="page-title">
          <div class="title_left">
            <h3>영화 통합 추가/제거</h3>
          </div>
          <div class="title_right">
            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
              <div class="input-group"></div>
            </div>
          </div>
        </div>
        <div class="clearfix"></div>
        <!-- row -->
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
              <div class="x_title">
                <h2>Save Movie</h2>
                <ul class="nav navbar-right panel_toolbox">
                  <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                  <li class="dropdown"></li>
                </ul>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <div class="search-box col-md-12 col-sm-12 col-xs-12" style="margin-left: 24%;">
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="text" id="movie-name2" required="required" class="input-movie-title form-control">
                  </div>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                  	<button type="button" class="btn btn-success" onclick="openSearchMovie()">영화검색</button>
                  	<button type="button" class="btn btn-success" onclick="openBoxOffice()">일별 박스오피스 조회</button>
                  </div>
                </div>
                <!-- contents -->
                <div class="movie_contents" style="display:none;">
                 <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>조회된 영화</h2>
                      <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                      </ul>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                      <p class="text-muted font-13 m-b-30"></p>
                      <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap boxmovie" cellspacing="0" width="100%">
                        <thead></thead>
                        <tbody></tbody>
                      </table>
                    </div>
                   </div>
                  </div>			
                </div>
                <!-- /contents -->
              </div>
            </div>
          </div>
        </div>
      <!-- row -->
     <!-- row -->
     <div class="row">
    	<div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
          <div class="x_title">
            <h2>등록된 영화 관리</h2>
            <ul class="nav navbar-right panel_toolbox">
              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
            </ul>
            <div class="clearfix"></div>
          </div>
          <div class="x_content">
            <p class="text-muted font-13 m-b-30"></p>
            <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
              <thead>
                <tr>
                  <th>영화 인덱스</th>	
                  <th>영화명</th>
                  <th>개봉일자</th>
                  <th>등급</th>
                  <th>상영상태</th>
                  <th>영화분류</th>
                </tr>
              </thead>
              <tbody>
              	<tr>
              		<td>1</td>
              		<td>집에 보내줘</td>
              		<td>2023/12/25</td>
              		<td>전체관람가</td>
              		<td>상영중 <!-- 상영종료일보다 이전인 날짜엔 상영중으로 보이고 지나면 상영종료로 보이게  --></td>
              		<td>now</td>
              	</tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>			
     </div>
     <!-- row -->
    <!-- /page content -->
  </div>
  
  <!-- 모달 추가 -->
  <div id="movieModal" class="modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h2 class="modal-title">Save Movie Screening</h2>
          <button type="button" class="close" data-dismiss="modal">
            <span>&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="modal-form" action="movie_insert.mo" method="post" data-parsley-validate class="form-horizontal form-label-left" onsubmit="return registMovie()">

            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12">포스터 미리보기</label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <img id="movie-preview" style="width: inherit;">
              </div>
            </div>
  
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-title">영화이름<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-title" name="title" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-title">인덱스<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-movieidx" name="movieIdx" class="form-control col-md-7 col-xs-12">
              </div>
            </div>

             <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-category">카테고리<span>*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="movie-category" class="form-control" required>
                  <option value="NOW">NOW</option>
                  <option value="OLD">OLD</option>
                </select>
               </div> 
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-director">감독<span>*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-director" name="director" required="required" class="form-control col-md-7 col-xs-12">
              </div>
            </div>

            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-actor">배우
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-actor" name="actor" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-genre">장르<span">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-genre" name="genre" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-opendate">개봉일<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="date" id="movie-opendate" name="openDate" required="required" class="form-control col-md-7 col-xs-12" placeholder="ex) 230921">
              </div> 
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-startdate">상영시작일<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="date" id="movie-startdate" name="startDate"required="required" class="form-control col-md-7 col-xs-12" placeholder="ex) 230921">
              </div> 
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-enddate" data-toggle="tooltip" data-placement="bottom" title="상영일로부터 30일이 기본값입니다.">상영종료일<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="date" id="movie-enddate" name="endDate" required="required" class="form-control col-md-7 col-xs-12" placeholder="ex) 231021">
              </div> 
            </div>

            
             <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-rating">관람등급<span>*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="movie-rating" class="form-control" name="rating" required>
                  <option value="all">전체관람가</option>
                  <option value="12">12세 이상 관람가</option>
                  <option value="15">15세 관람가</option>
                  <option value="18">청소년 관람불가</option>
                </select>
               </div> 
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-nation">국가<span>*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-nation" name="nation" required="required" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-filmmade">제작사</label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-filmmade" name="filmMade" required="required" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-runtime">상영시간<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-runtime" name="runTime" required="required" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-synopsis">줄거리</label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <textarea class="form-control" id="movie-synopsis" name="synopsis" class="form-control col-md-7 col-xs-12"></textarea>
              </div>
            </div>
            
            <div class="form-group">
              <input type="hidden" id="movie-poster" name="poster">
              <input type="hidden" id="movie-stillcut" name="stillcut">
            </div>
            
          </form>
        </div>
        <div class="modal-footer">
          <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-2">
            <button class="btn btn-primary" type="button" data-toggle="tooltip" data-placement="top" title="제목과 감독명으로 재조회합니다." onclick="searchMovieIndex()">상세조회</button>
            <button class="btn btn-success btn-regist" type="submit" form="modal-form">등록</button>
            <button class="btn btn-primary" type="button" data-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
  </div>
   
</div> 
 
 <script type="text/javascript">
   $(function(){
    /* 검색창 엔터 활성화 */
     $('.input-movie-title').keypress(function(e){
       if(e.which == 13) {
         openSearchMovie();
       }
     });
    
    /* 모달 활성화 됐을 때*/
     $('#movieModal').on('show.bs.modal', function (event) {
       /*FIXME : 박스오피스에서 모달을 띄웠을때, 이전에 있던 포스터가 그대로 걸려있음 */
       var button   = $(event.relatedTarget)
       var title    = button.data('title')
       var opendate = button.data('opendate')
       var startdate= moment().format('YYYY-MM-DD')
       var enddate  = moment(startdate).add(30,'days').format('YYYY-MM-DD')
       var rating   = button.data('rating')
       var runtime  = button.data('runtime')
       var filmMade = button.data('filmmade')
       var nation   = button.data('nation')
       var synopsis = button.data('synopsis')
       var director = button.data('director')
       var genre    = button.data('genre')
       var poster   = button.data('poster')
       var actor    = button.data('actor')
       var rating   = button.data('rating')
       var category = button.data('category')
       var movieIdx = button.data('movieidx')
       var stillcut = button.data('stillcut')
       
       var modal = $(this)
       // 박스오피스 only
       modal.find('#movie-title').val(title)
       modal.find('#movie-opendate').val(opendate)
       // kmdb only
       modal.find('#movie-movieidx').val(movieIdx)
       modal.find('#movie-genre').val(genre)
       modal.find('#movie-rating').val(rating)
       modal.find('#movie-runtime').val(runtime)
       modal.find('#movie-filmmade').val(filmMade)
       modal.find('#movie-nation').val(nation)
       modal.find('#movie-startdate').val(startdate)   //상영일(startdate) : 개봉일(opendate)을 디폴트값으로 넣었음
       modal.find('#movie-opendate').val(opendate)
       modal.find('#movie-enddate').val(enddate)
       modal.find('#movie-synopsis').val(synopsis)
       modal.find('#movie-director').val(director)
       modal.find('#movie-poster').val(poster)
       modal.find('#movie-actor').val(actor)
       modal.find('#movie-category').val(category)
       modal.find('#movie-stillcut').val(stillcut)
       modal.find('#movie-preview').attr('src',poster) //포스터 미리보기 삽입
     })
     
   })
   
   /*박스오피스 조회*/
	  function openBoxOffice() {
	  $('.movie_contents').css('display','block')
	  $('.boxmovie').find('tbody').html('');
	  
		$.ajax({
			url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
			type : 'GET',
			data : {
					key : "ee9ed756bb3f15468dceccf766e69e7b",
					targetDt : "20190900"                         //날짜형식이 틀리면 최신날짜를 보여주는걸로 알고있음
			},
			async : false,                                    //비동기식인 ajax를 동기식으로 만들어줌 만약 출력해야될 결과가 많거나 제대로 출력되지 않을때, 이 옵션을 사용
			success : function(data) {                        //data에 들어오는 값들은 앞에서 출력되던 예시와 같음
			  console.log(data)
			  var boxofficehead = `
			  <tr>
          <th>순위</th>
          <th>제목</th>
          <th>개봉일</th>
          <th>등록</th>
        </tr>`
        $('.boxmovie').find('thead').html(boxofficehead)
        
        for (var i = 0; i < data.boxOfficeResult.dailyBoxOfficeList.length; i++) {
          var html = '';
        	var movieIdx = data.boxOfficeResult.dailyBoxOfficeList[i].movieCd;
        	var rank = data.boxOfficeResult.dailyBoxOfficeList[i].rank;
        	var title = data.boxOfficeResult.dailyBoxOfficeList[i].movieNm;
        	var openDate = data.boxOfficeResult.dailyBoxOfficeList[i].openDt;
          html += '<tr>'
          html += '<td>'+ rank + '</td>'
          html += '<td>'+ title + '</td>'
          html += '<td>'+ openDate + '</td>'
          html += '<td><button class="btn btn-success" type="button" data-toggle="modal" data-target="#movieModal"'+
                  ' data-movieidx="'+ movieIdx + '"data-title="' + title + '"data-opendate="' + openDate +'"data-category="NOW">등록</button></td>';
          html += '</tr>';
          
          $('.boxmovie').find('tbody').append(html)
        }
        
			}
		});
	}
  /**
  *kmdb에서 검색한 결과에서 누락된 결과를 조회하기 위해서
  *kobis에 영화제목과 영화감독명으로 재조회하는 기능
  */
  function searchMovieIndex(){
    const title = $('#movie-title').val()
    const director = $('#movie-director').val()
    $.ajax({
      url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json',
      type : 'GET',
      data : {
          key : "ee9ed756bb3f15468dceccf766e69e7b",
          movieNm : title,
          itemPerPage : "1",                            //결과 ROW의 개수
          directorNm : director
      },
      async : false,
      success : function(data) {
        console.log(data)
        // 제목과 감독으로 검색한 결과가 있는지 검증
        if(data.movieListResult.totCnt != 0){ 
          const movieCd = data.movieListResult.movieList[0].movieCd
          if(movieCd !== undefined){
            $('#movie-movieidx').val(movieCd)
          }  
        }else{
          alert("해당 영화에 대한 정보를 찾을 수 없습니다.")  
        }
      },
      error : function(){
        alert("해당 영화에 대한 정보를 찾을 수 없습니다.")
      }
    });
    
  }
  /**
  ajax 분리
  FIXME : 분리하는 과정에서 무조건 OLD 넣게 설정되어버렸는데, 수정 필요함
  */
  function detailSearch(){
    var keyword = $('.input-movie-title').val();
    var result = '';
    $.ajax({
      url : 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp',
      data : {
        collection : 'kmdb_new2',                   //고정값
        ServiceKey : 'N6BL7Q77SG0M41244297',        //키
        sort : 'prodYear,1',     //정렬옵션 제작년도 정렬이 그나마 제일 정확한 것 같음
        title : keyword,
      },
      type : 'GET',
      dataType: 'json',
      async : false,
      timeout : 3000,                                   //KMDB 서버가 불안정해서 3초 이내 응답 받을 수 있도록
      success : function(data) {
        console.log(data)
        result = data;
       },
      error:function(xhr, status, error){
        console.log(xhr.statusText)
        alert("서버와 연결할 수 없습니다.\n" + xhr.statusText)  
      }
    });
    return result;
  }
   
   
   /*검색 영화 조회*/
  function openSearchMovie(){
    $('.movie_contents').css('display','block')
    $('.boxmovie').find('tbody').html('');
    
    var moviesearchhead = `
      <tr>
      <td>제목</td>
      <td>국가</td>
      <td>관람등급</td>
      <td>개봉일</td>
      <td>감독</td>
      <td>장르</td>
      <td>등록</td>
      </tr>`
    $('.boxmovie').find('thead').html(moviesearchhead)
    
    const data = detailSearch();
      
    for(var i=0; i<data.Data[0].Count ; i++){
      var info = data.Data[0].Result[i];
      var title = info.title.replace(/!HS | !HE /g, '').trim(); // 검색어에 !HS !HE 라는 글자가 같이 포함돼서 없애주는 작업  
      var movieIdx = info.Codes.Code[0].CodeNo;
      var filmMade = info.company;
      // openDate를 YYYYMMDD 형식에서 YYYY-MM-DD 형식으로 변경
      // openDate가 ""일때 kmdb 등록일(regDate)을 대신 넣도록 함
      var openDate = (info.repRlsDate !== "") ? moment(info.repRlsDate).format("YYYY-MM-DD")
                      : (info.regDate !== "") ? moment(info.regDate).format("YYYY-MM-DD") : "";
                                               
      var poster = info.posters.split('|')[0];
      var nation = info.nation;
      var synopsis = info.plots.plot[0].plotText;
      // rating : kmdb에서 받는 값이 15세미만불가, 15세관람가 등 일관성이 없어서 해당하는 숫자가 포함되는지 따지기로 함
      var rating = info.rating.includes("전체")? "all" :
                   info.rating.includes("12")  ? "12"  : 
                   info.rating.includes("15")  ? "15"  :
                   info.rating.includes("18")  ? "18"  : "";
      var director = info.directors.director[0].directorNm;
      var runtime = info.runtime;
      var genre = info.genre;
      var html = '';
      
      var actorArr = [];
      let count = info.actors.actor.length > 3 ? 3 : info.actors.actor.length;
      for(let i = 0; i < count ; i++){
        actorArr.push(info.actors.actor[i].actorNm);
      }
      var actor = actorArr.join('|');
      var stillcut = info.stlls;
      
      html += '<tr>'
      html += '<td>'+ title + '</td>'
      html += '<td>'+ nation + '</td>'
      html += '<td>'+ rating + '</td>'
      html += '<td>'+ openDate + '</td>'
      html += '<td>'+ director + '</td>'
      html += '<td>'+ genre + '</td>'
      html += '<td><button class="btn btn-success" type="button" data-toggle="modal" data-target="#movieModal" data-movieidx="'+ movieIdx +
              '"data-title="' + title +
              '"data-rating="'+ rating +
              '"data-runtime="'+ runtime +
              '"data-filmmade="'+ filmMade +
              '"data-nation="'+ nation +
              '"data-synopsis="'+ synopsis +
              '"data-opendate="'+ openDate +
              '"data-director="'+ director +
              '"data-genre="'+ genre +
              '"data-poster="'+ poster +
              '"data-actor="'+ actor +
              '"data-stillcut="'+ stillcut +
              '"data-category="OLD">등록</button></td>';
              
      html += '</tr>';
      
      $('.boxmovie').find('tbody').append(html)
  }
      
  }
  /**
   유효성 검사하는 로직 작성
   영화 등록 버튼 눌렀을 때 실행
  */
  function registMovie(){
    if(confirm("등록하시겠습니까?")){
       var msg = "";
       if($('#movie-title').val() === ""){ alert("이름을 입력해 주세요"); return false; }
       if($('#movie-genre').val() === ""){ alert("장르를 입력해 주세요"); return false; }
       if($('#movie-rating').val() === ""){ alert("관람등급을 입력해 주세요"); return false; }
       if($('#movie-runtime').val() === ""){ alert("상영시간을 입력해 주세요"); return false; }
       if($('#movie-filmmade').val() === ""){ alert("제작사를 입력해주세요"); return false; }
       if($('#movie-nation').val() === ""){ alert("제작국가 입력해 주세요"); return false; }
       if($('#movie-startdate').val() === ""){ alert("상영시작을 입력해 주세요"); return false; }
       if($('#movie-opendate').val() === ""){ alert("상영일을 입력해 주세요"); return false; }
       if($('#movie-synopsis').val() === ""){ alert("줄거리를 입력해 주세요"); return false; }
       if($('#movie-director').val() === ""){ alert("감독을 입력해 주세요"); return false; }
       if($('#movie-poster').val() === ""){ alert("등록된 포스터가 없습니다.");}
       if($('#movie-actor').val() === ""){ alert("등록된 배우가 없습니다.");}
      return true;
    }
    return false;
  }
  
	</script>

    <!-- Bootstrap -->
    <script src="_admin/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="_admin/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="_admin/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="_admin/vendors/iCheck/icheck.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="_admin/build/js/custom.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="_admin/vendors/moment/min/moment.min.js"></script>
  </body>
</html>