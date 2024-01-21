<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
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
    <!-- Datatables -->
    <link href="_admin/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="_admin/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="_admin/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="_admin/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="_admin/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="_admin/build/css/custom.min.css" rel="stylesheet">
    <!-- jQuery -->  
    <script src="_admin/vendors/jquery/dist/jquery.min.js"></script>
  </head>
  <body class="nav-md">
  
   <c:if test="${sessionScope.sId == null || ! fn:startsWith(sessionScope.sId, 'admin')}">
     <c:redirect url="login.me" />
   </c:if>
  
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="main.me" class="site_title"><i class="fa fa-film"></i> <span>Latte Cinema!</span></a>
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
                  <li><a href="adm_home.ad"><i class="fa fa-home"></i>Home</a></li>
                  <li><a href="adm_member.ad"><i class="fa fa-user"></i>회원관리</a></li>
                  <li><a href="adm_mv_inout.ad"><i class="fa fa-edit"></i>영화 통합 추가/제거</a></li>
                  <li><a href="adm_store.ad"><i class="fa fa-beer"></i>스토어 관리</a></li>
                  <li><a href="adm_location.ad"><i class="fa fa-beer"></i>영화관 관리</a></li>
                  <li><a href="adm_cinema.ad"><i class="fa fa-beer"></i>스케줄 관리</a></li>
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
            <div class="nav toggle" style="padding-top: 8px; padding-bottom: 8px">
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
                      <table id="" class="table table-striped table-bordered dt-responsive nowrap boxmovie" cellspacing="0" width="100%">
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
                  <th>무비코드</th>	
                  <th>영화명</th>
                  <th>개봉일자</th>
                  <th>등급</th>
                  <th>영화분류</th>
                  <th>관리</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="movie" items="${movieList }">
              	<tr>
              		<td>${movie.movieCode}</td>
              		<td>${movie.title}</td>
              		<td>${movie.openDate}</td>
              		<td>${movie.rating}</td>
              		<td>${movie.movieCategory}</td>
                  <td>
                    <button class="btn btn-success" type="button" data-toggle="modal" data-target="#modifyModal" data-moviecode="${movie.movieCode}">수정</button> 
                  </td>
              	</tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>			
     </div>
     <!-- row -->
    <!-- /page content -->
  </div>
  
  <!-- 저장 모달 -->
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
          <form id="modal-form"  action="movie_insert.mo" method="post" data-parsley-validate class="form-horizontal form-label-left" onsubmit="return registMovie()">

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
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-title">무비코드<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-moviecode" name="movieCode" class="form-control col-md-7 col-xs-12">
              </div>
            </div>

             <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-category">카테고리<span>*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="movie-category" class="form-control" name="movieCategory" required>
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
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-genre">장르<span>*</span>
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
            <button class="btn btn-success btn-regist" type="submit" form="modal-form">등록</button>
            <button class="btn btn-primary" type="button" data-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 수정 모달 -->
  <div id="modifyModal" class="modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h2 class="modal-title">Update Movie</h2>
          <button type="button" class="close" data-dismiss="modal">
            <span>&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="modal-form2" method="post" data-parsley-validate action="movie_update.mo" class="form-horizontal form-label-left" onsubmit="return modifyMovie()">

            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12">포스터 미리보기</label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <img id="movie-preview2" style="width: inherit;">
              </div>
            </div>
  
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-title">영화이름<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-title2" name="title" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-title">무비코드<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-moviecode2" name="movieCode" class="form-control col-md-7 col-xs-12">
              </div>
            </div>

             <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-category">카테고리<span>*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="movie-category2" class="form-control" name="movieCategory">
                  <option value="NOW">NOW</option>
                  <option value="OLD">OLD</option>
                </select>
               </div> 
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-director">감독<span>*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-director2" name="director" class="form-control col-md-7 col-xs-12">
              </div>
            </div>

            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-actor">배우</label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-actor2" name="actor" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-genre">장르<span>*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-genre2" name="genre" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-opendate">개봉일<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="date" id="movie-opendate2" name="openDate" required="required" class="form-control col-md-7 col-xs-12" placeholder="ex) 230921">
              </div> 
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-startdate">상영시작일<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="date" id="movie-startdate2" name="startDate"required="required" class="form-control col-md-7 col-xs-12" placeholder="ex) 230921">
              </div> 
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-enddate" data-toggle="tooltip" data-placement="bottom" title="상영일로부터 30일이 기본값입니다.">상영종료일<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="date" id="movie-enddate2" name="endDate" required="required" class="form-control col-md-7 col-xs-12" placeholder="ex) 231021">
              </div> 
            </div>

            
             <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-rating">관람등급<span>*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
              <select id="movie-rating2" class="form-control" name="rating" required>
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
               <input type="text" id="movie-nation2" name="nation" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-filmmade">제작사</label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-filmmade2" name="filmMade" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-runtime">상영시간<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
               <input type="text" id="movie-runtime2" name="runTime" class="form-control col-md-7 col-xs-12">
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-synopsis">줄거리</label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <textarea class="form-control" id="movie-synopsis2" name="synopsis" class="form-control col-md-7 col-xs-12"></textarea>
              </div>
            </div>
            
            <div class="form-group">
              <input type="hidden" id="movie-poster2" name="poster">
              <input type="hidden" id="movie-stillcut2" name="stillcut">
            </div>
            
          </form>
        </div>
        <div class="modal-footer">
          <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-2">
            <button class="btn btn-danger btn-delete" type="button" form="modal-form2" onclick="deleteMovie()">삭제</button>
            <button class="btn btn-success btn-regist" type="submit" form="modal-form2">수정</button>
            <button class="btn btn-primary" type="button" data-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
  </div>   
</div> 
 

    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/admJS/adm_mv_inout.js"></script>
  </body>
</html>