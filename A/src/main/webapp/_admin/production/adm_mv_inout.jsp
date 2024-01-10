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
          <form id="demo-form3" data-parsley-validate class="form-horizontal form-label-left">
  
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-title">영화이름<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-title" required="required" class="form-control col-md-7 col-xs-12">
              </div>
            </div>

             <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-category">카테고리<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="movie-category" class="form-control" required>
                  <option value="NOW">NOW</option>
                  <option value="OLD">OLD</option>
                </select>
               </div> 
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-director">감독<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-director" required="required" class="form-control col-md-7 col-xs-12">
              </div>
            </div>

            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-actor">배우<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-actor" required="required" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-genre">장르<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-genre" required="required" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-startdate">상영시작일<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="date" id="movie-startdate" required="required" class="form-control col-md-7 col-xs-12" placeholder="ex) 230921">
              </div> 
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-enddate">상영종료일<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="date" id="movie-enddate" required="required" class="form-control col-md-7 col-xs-12" placeholder="ex) 231021">
              </div> 
            </div>

            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-opendate">개봉일<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="date" id="movie-opendate" required="required" class="form-control col-md-7 col-xs-12" placeholder="ex) 230921">
              </div> 
            </div>
            
             <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-rating">관람등급<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="movie-rating" class="form-control" required>
                  <option value="전체관람가">전체관람가</option>
                  <option value="12세 이상 관람가">12세 이상 관람가</option>
                  <option value="15세 이상 관람가">15세 이상 관람가</option>
                  <option value="청소년 관람불가">청소년 관람불가</option>
                </select>
               </div> 
            </div>
            
           <!--  <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-nation">옵션1<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="movie-grade" class="form-control" required>
                  <option value="">영화분류</option>
                  <option value="NOW">latte Movie</option>
                  <option value="nowMovie">now Movie</option>
                </select>
               </div> 
            </div> -->
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-nation">국가<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-nation" required="required" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-runtime">상영시간<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-runtime" required="required" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-synopsis">줄거리<span class="required">*</span></label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <textarea class="form-control" id="movie-synopsis" required="required" class="form-control col-md-7 col-xs-12"></textarea>
              </div>
            </div>
            
          </form>
        </div>
        <div class="modal-footer">
          <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-2">
            <button class="btn btn-primary" type="button">취소</button>
            <button class="btn btn-success btn-regist" type="submit">등록</button>
          </div>
        </div>
      </div>
    </div>
  </div>
   
</div> 
    
  <!-- jQuery -->
 <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
 
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
       var button = $(event.relatedTarget)
       var title = button.data('title')
       var opendate = button.data('opendate')
       
       console.log(opendate)
       
       var rating = button.data('rating')
       var runtime = button.data('runtime')
       var filmMade = button.data('filmmade')
       var nation = button.data('nation')
       var synopsis = button.data('synopsis')
       var director = button.data('director')
       var genre = button.data('genre')
       var poster = button.data('poster')
       
       var modal = $(this)
       // 박스오피스 only
       modal.find('#movie-title').val(title)
       modal.find('#movie-opendate').val(opendate)
       // kmdb only
       modal.find('#movie-genre').val(genre)
       modal.find('#movie-rating').val(rating)
       modal.find('#movie-runtime').val(runtime)
       modal.find('#movie-filmmade').val(filmMade)
       modal.find('#movie-nation').val(nation)
       modal.find('#movie-opendate').val(opendate)
       modal.find('#movie-synopsis').val(synopsis)
       modal.find('#movie-director').val(director)
       modal.find('#movie-poster').val(poster)
       
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
			async : false,                              //비동기식인 ajax를 동기식으로 만들어줌 만약 출력해야될 결과가 많거나 제대로 출력되지 않을때, 이 옵션을 사용
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
                  ' data-movieidx="'+ movieIdx + '"data-title="' + title + '"data-opendate="' + openDate +'">등록</button></td>';
          html += '</tr>';
          
          $('.boxmovie').find('tbody').append(html)
        }
        
			}
		});
	}
   /*검색 영화 조회*/
  function openSearchMovie(){
    var keyword = $('.input-movie-title').val();
    $('.movie_contents').css('display','block')
    $('.boxmovie').find('tbody').html('');
    
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
      success : function(data) {
        console.log(data);
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
          
          
        for(var i=0; i<data.Data[0].Count ; i++){
          var info = data.Data[0].Result[i];
          var title = info.title.replace(/!HS | !HE /g, '');  
          // 검색어에 !HS !HE 라는 글자가 같이 포함돼서 없애주는 작업
          //var actors = '';                                  
          var movieIdx = info.Codes.Code[0].CodeNo;
          var filmMade = info.company;
          var openDate = info.repRlsDate;
          console.log(openDate)
          var poster = info.posters.split('|')[0];
          var nation = info.nation;
          var synopsis = info.plots.plot[0].plotText;
          var rating = info.rating;
          var director = info.directors.director[0].directorNm;
          var runtime = info.runtime;
          var genre = info.genre;
          var html = '';
       // openDate를 YYYYMMDD 형식에서 YYYY-MM-DD 형식으로 변경
 			openDate = openDate.replace(/^(\d{4})(\d{2})(\d{2})$/, '$1-$2-$3');  
          
          html += '<tr data-movieIdx="'+ movieIdx+'">'
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
                  '">등록</button></td>';
          html += '</tr>';
          
        /* html += '<td><img src="'+ info.posters.split('|')[0] + '"></td>'  */  // 첫번째 포스터만
       /*    html += '<td><img src="'+ info.stlls.split('|')[0] + '"></td>'      */     // 첫번째 스틸컷만
          $('.boxmovie').find('tbody').append(html)
        }
        
        $('.btn-regist').click(function(){
            
            if(confirm("등록하실래용?")){
              var formData = new FormData();
              
              // 선택된 체크박스 가져오기
                var selectedCheckboxes = $('.movie-checkbox:checked');
              
                // 각 체크박스에 대한 처리
               selectedCheckboxes.each(function (index, checkbox) {
                var movieIdx = $(checkbox).closest('tr').attr('data-movieIdx');
                var title = $(checkbox).attr('data-title');
                var rating = $(checkbox).attr('data-rating');
                var runtime = $(checkbox).attr('data-runtime');
                var filmMade = $(checkbox).attr('data-filmMade');
                var openDate = $(checkbox).attr('data-openDate');
                var nation = $(checkbox).attr('data-nation');
                var synopsis = $(checkbox).attr('data-synopsis');
                var director = $(checkbox).attr('data-director');
                var genre = $(checkbox).attr('data-genre');
                var poster = $(checkbox).attr('data-poster');
                
                console.log("filmMade : "+filmMade);
                console.log("openDate : "+openDate);
                console.log("poster : "+poster);
                console.log("poster : "+title);
                console.log("poster : "+rating);
                console.log("poster : "+filmMade);
                console.log("poster : "+nation);
                console.log("poster : "+synopsis);
    
                formData.append("movieIdx", movieIdx);
                formData.append("title", title);
                formData.append("rating", rating);
                formData.append("runtime", runtime);
                formData.append("filmMade", filmMade);
                formData.append("nation", nation);
                formData.append("synopsis", synopsis);
                formData.append("openDate", openDate);
                formData.append("director", director);
                formData.append("genre", genre);
                // 파일 업로드 시
                var posterFile = $(checkbox).data('posterFile');
                if (posterFile) {
                  // posterFile이 존재할 경우에만 FormData에 추가
                  formData.append("poster", posterFile);
                }
              });
                
               $.ajax({
                   type: 'POST',
                   url: '/A/movie_insert.mo',
                   data: formData,
                   processData: false,
                   contentType: false,
                   success: function () {
                     // 서버로부터의 응답을 받았을 때 실행되는 코드
                     <!-- insertMovie 자바 코드 넣을 곳 -->
                     location.href = "adm_mv_inout.ad";
                     
                     console.log('등록 성공');
                     window.close();
                  
                   },
                   error: function () {
                     // 서버로부터의 응답을 받지 못했을 때 실행되는 코드
                     console.log('등록 실패');
                   }
                 });
               }
             });
           },
      error:function(){
        alert("상영 정보가 확실하지 않습니다.")  
      }
    });
  }
  
	</script>
    <!-- jQuery -->  
    <script src="_admin/vendors/jquery/dist/jquery.min.js"></script>
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
  </body>
</html>