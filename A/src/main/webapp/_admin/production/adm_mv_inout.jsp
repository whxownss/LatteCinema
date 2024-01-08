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
    <!-- bootstrap-wysiwyg -->
    <link href="_admin/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
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
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.jsp">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
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
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>영화 통합 추가/제거</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
<!--                     <input type="text" class="form-control" placeholder="Search for..."> -->
<!--                     <span class="input-group-btn"> -->
<!--                       <button class="btn btn-default" type="button">Go!</button> -->
<!--                     </span> -->
                  </div>
                </div>
              </div>
            </div>
            
            
            
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Save Movie</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
<!--                         <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a> -->
<!--                         <ul class="dropdown-menu" role="menu"> -->
<!--                           <li><a href="#">Settings 1</a> -->
<!--                           </li> -->
<!--                           <li><a href="#">Settings 2</a> -->
<!--                           </li> -->
<!--                         </ul> -->
                      </li>
<!--                       <li><a class="close-link"><i class="fa fa-close"></i></a> -->
<!--                       </li> -->
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">


                                     <!-- 확인용 -->
                            
                 
                                
                                     
					<button class="btn btn-success" onclick="openMovieModal()">
						일별 박스오피스 조회
					</button>       
            		<button type="button" class="btn btn-success" onclick="openRegistrationPage()">영화조회 / 등록</button>
					
					
					
					
					
					      <div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>등록된 영화 관리</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                    </p>
					
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap boxmovie" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                         <th>선택</th>
					    <!-- <th>영화코드</th> -->
					    <th>제목</th>
					    <th>제작사</th>
					    <th>국가</th>
					    <th>줄거리</th>
					    <th>관람등급</th>
					    <th>개봉일</th>
					    <th>감독</th>
					    <th>상영시간</th>
					    <th>장르</th>
					    <th>포스터</th>
                        </tr>
                      </thead>
                      <tbody>
                       
                      	
                      </tbody>
                    </table>
					
					
                  </div>
                </div>
              </div>			
             </div>
					
					
					
					
					
					
					<!-- 모달 추가 -->
					<!-- <div id="movieModal" class="modal" style="display: none; width: 800px;">
					    <div class="modal-content">
					        <span class="close" onclick="closeMovieModal()">&times;</span>
					        <ol id="movieList">
					           하단 스크립트 모달 동작
					        </ol>
					        <button onclick="confirmMovieSelection()">확인</button>
					    </div>
					</div>  -->
					</div>


        
 		
 			
			<script>
			    function openRegistrationPage() {
			        // 현재 페이지의 컨텍스트 경로를 얻어옵니다.
			        var contextPath = "<%= request.getContextPath() %>";
			
			        // 상대 경로를 사용하여 JSP 파일의 URL을 생성합니다.
			        var registrationPageUrl = contextPath + "/_movie/movie_SearchPopUp.jsp";
			
			        // 윈도우를 새로 열어서 팝업으로 페이지를 표시
			        window.open(registrationPageUrl, "_blank", "width=1200, height=1000");
			    }
			</script>

                        	
                     
                     <!--  잠시 주석 처리   / 이미지는 검색으로 다른 정보와  불러올 예정 -->
                      
                      <!-- <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-img">영화 이미지<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          	<div class="btn-group">
								<a class="btn" title="Insert picture (or just drag &amp; drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>
								<input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage">
							</div>
                        </div>
                      </div> -->
                      
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                         
                        </div>
                      </div>

                   
                  </div>
                </div>
              </div>
            </div>
          
					         
			
			<div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Save Movie Screening</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown"></li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form id="demo-form3" data-parsley-validate class="form-horizontal form-label-left">
					
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-names">영화이름<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                         <!-- 검색 api 로직 들어갈 곳  -->
                         <input type="text" id="movie-name2" required="required" class="form-control col-md-7 col-xs-12">
                         <button type="submit" class="btn btn-success">Search</button>
                        </div>
                      </div>
                      
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-grade">관람등급<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <select id="movie-grade" class="form-control" required>
                            <option value="">관람등급</option>
                            <option value="전체관람가">전체관람가</option>
                            <option value="12세 이상 관람가">12세 이상 관람가</option>
                            <option value="15세 이상 관람가">15세 이상 관람가</option>
                            <option value="청소년 관람불가">청소년 관람불가</option>
                          </select>
                         </div> 
                      </div>
                      
                      
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-grade">관람등급<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <select id="movie-grade" class="form-control" required>
                            <option value="">영화분류</option>
                            <option value="latteMovie">latte Movie</option>
                            <option value="nowMovie">now Movie</option>
                          </select>
                         </div> 
                      </div>
                      
                   
                   
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-startDate">상영시작일<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	<input type="date" id="movie-startDate" required="required" class="form-control col-md-7 col-xs-12" placeholder="ex) 230921">
                        </div> 
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-endDate">상영종료일<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	<input type="date" id="movie-endDate" required="required" class="form-control col-md-7 col-xs-12" placeholder="ex) 231021">
                        </div> 
                      </div>
                     
                      
                      
                     
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-primary" type="button">Cancel</button>
						  <button class="btn btn-primary" type="reset">Reset</button>
                          <button type="submit" class="btn btn-success">Submit</button>
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
              </div>
            </div>
            
            
            
           <div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>등록된 영화 관리</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                    </p>
					
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
        <!-- /page content -->

        <!-- footer content -->
<!--         <footer> -->
<!--           <div class="pull-right"> -->
<!--             Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a> -->
<!--           </div> -->
<!--           <div class="clearfix"></div> -->
<!--         </footer> -->
        <!-- /footer content -->
     
    </div>
   </div> 
   
    
   
   
   

    <!-- jQuery -->
 <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
 
 <!--  min.js를 위 코드로 바꿈 -->
 
    
    <script type="text/javascript">
	  function openMovieModal() {	
		
		$.ajax({
			url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
			type : 'GET',
			data : {
					key : "ee9ed756bb3f15468dceccf766e69e7b",
					targetDt : "20190900"                         //날짜형식이 틀리면 최신날짜를 보여주는걸로 알고있음
			},
			async : false,                              //비동기식인 ajax를 동기식으로 만들어줌 만약 출력해야될 결과가 많거나 제대로 출력되지 않을때, 이 옵션을 사용
			success : function(data) {                        //data에 들어오는 값들은 앞에서 출력되던 예시와 같음
                for (var i = 0; i < data.boxOfficeResult.dailyBoxOfficeList.length; i++) {
                	
                	
                	var filmMade = '';
                    var poster = '';
                    var nation = '';
                    var synopsis = '';
                    var rating = '';
                    var director = '';
                    var runtime = '';
                    var genre = '';
                	var openDate = data.boxOfficeResult.dailyBoxOfficeList[i].openDt;
                	var movieIdx = data.boxOfficeResult.dailyBoxOfficeList[i].movieCd;
                	var title = data.boxOfficeResult.dailyBoxOfficeList[i].movieNm;
                	
                	var html = '';
                    html += '<tr data-movieIdx="'+ movieIdx+'">'
                    html += '<td><input type="checkbox" class="movie-checkbox" data-title="'+ title +'" data-rating="'+ rating +'" data-runtime="'+ runtime +'" data-filmMade="'+ filmMade +'" data-nation="'+ nation +'" data-synopsis="'+ synopsis +'" data-openDate="'+ openDate +'" data-director="'+ director +'" data-genre="'+ genre +'" data-poster="'+ poster +'"/></td>';
                    html += '<td>'+ title + '</td>'
                    html += '<td>'+ filmMade + '</td>'
                    html += '<td>'+ nation + '</td>'
                    html += '<td>'+ synopsis + '</td>'
                    html += '<td>'+ rating + '</td>'
                    html += '<td>'+ openDate + '</td>'
                    html += '<td>'+ director + '</td>'
                  	html += '<td>'+ runtime + '분</td>'
                	html += '<td>'+ genre + '</td>'
                	html += '<td><img src="' + poster + '"></td>'
                    html += '</tr>';
                    
                    $('.boxmovie').find('tbody').append(html)
                }
                
            	 // 각 항목에 클릭 이벤트 추가
                $('#movieList li').on('click', function() {
                    $(this).toggleClass('selected');
                });
			}
		});
	}
	  
	  
	  function closeMovieModal() {
	        // 모달 닫기
	        document.getElementById("movieModal").style.display = "none";
	    }
	
	  function confirmMovieSelection() {
	        // 선택된 영화 목록을 확인하는 로직 추가
	        var selectedMovies = $('#movieList li.selected');
	        var selectedMovieCodes = selectedMovies.map(function() {
	            return $(this).data('movieCd');
	        }).get();
	        var selectedOpenDates = selectedMovies.map(function() {
	            return $(this).data('openDt');
	        }).get();

	        // 확인 로직 (예: 콘솔에 출력)
	        console.log('선택한 영화 코드: ', selectedMovieCodes);
	        console.log('선택한 영화 제목과 개봉일: ', selectedOpenDates);


	        // 모달 닫기
	        closeMovieModal();
	    }
	
	</script>
	
	
	<script type="text/javascript">
		function func1(){
			var movieNm = $('#movie-names').find(':selected').attr('value');
			var movieCd = $('#movie-names').find(':selected').attr('movieCd');
			var openDt = $('#movie-names').find(':selected').attr('openDt');
			
			alert(movieNm);
			alert(movieCd);
			alert(openDt);
			
			location.href='main.me?movieNm='+movieNm+'movieCd='+movieCd+'openDt='+openDt;
		}					
	</script>
	
	 <script src="_admin/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
     <script src="_admin/build/js/custom.min.js"></script>

	
  </body>
</html>
