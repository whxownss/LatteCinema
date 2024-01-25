<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>라떼시네마</title>
	<link href="_assets/img/common/favicon2.png" rel="icon">
<!-- Bootstrap -->
<link href="_admin/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="_admin/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="_admin/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="_admin/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<!-- Datatables -->
<link href="_admin/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="_admin/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="_admin/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
<link href="_admin/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
<link href="_admin/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<!-- Custom Theme Style -->
<link href="_admin/build/css/custom.min.css" rel="stylesheet">
</head>
<body class="nav-md">

<c:if test="${sessionScope.sId == null || ! fn:startsWith(sessionScope.sId, 'admin')}">
	<c:redirect url="login.me" />
</c:if>
<c:set var="cinemaList" value="${requestScope.cinemaList}" />

	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="main.me" class="site_title"><i class="fa fa-film"></i>
							<span>Latte Cinema!</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img src="_admin/production/images/img.jpg" alt="..."
								class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2>admin</h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
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
								<li><a href="adm_cs_center.ad"><i
										class="fa fa-bullhorn"></i> 공지사항</a></li>
								<li><a href="adm_cs_exque.ad"><i class="fa fa-question"></i>
										자주찾는질문</a></li>
								<li><a href="adm_cs_qna.ad"><i class="fa fa-comments"></i>
										1:1문의</a></li>
								<li><a href="adm_cs_lost.ad"><i class="fa fa-search"></i>
										분실물 문의</a></li>
							</ul>
						</div>

					</div>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<div class="sidebar-footer hidden-small">
						<a data-toggle="tooltip" data-placement="top" title="Settings">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
							<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
							class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Logout"
							href="login.html"> <span class="glyphicon glyphicon-off"
							aria-hidden="true"></span>
						</a>
					</div>
					<!-- /menu footer buttons -->
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
          <div class="">
          
            <div class="page-title">
              <div class="title_left">
					<h3>영화관 관리</h3>
              </div>
            </div>












					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>영화관 수정</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"></li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
									<form id="demo-form2" data-parsley-validate
										class="form-horizontal form-label-left"
										action="adm_cinemaProIS.ad">



										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="area">지역<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select id="location" name="location" class="form-control"
													required>
													<option value="0">지역을 선택해 주세요</option>
													<c:forEach var="location" items="${locationList}" varStatus="status">
														<option value="${status.index + 1}">${location.loName}</option>
													</c:forEach>
												</select>
											</div>
										</div>



										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="area">영화관<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select id="cinema" name="cinema" class="form-control"
													required>
													<option value="ci0">지역을 먼저 선택해 주세요</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="area-detail">상영관<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select id="screen" name="screen" class="form-control"
													required>
													<option value="0">영화관을 먼저 선택해 주세요</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="area-detail">좌석수<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="number" id="seatNum" class="form-control" 
														min="0" max="234" step="18" required>
											</div>
										</div>

						  

										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button class="btn btn-success" type="button" id="updateScrBtn">수정</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>





            <div class="clearfix"></div>
			<div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>영화관 목록</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                    </p>
				<form action="#" id="memManage" name="memManage" method="post">	
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>지역</th>
                          <th>영화관</th>
                          <th>오픈 여부</th>
                          <th>상영관 수</th>
                          <th>상영관 삭제</th>
                          <th>상영관 추가</th>
                        </tr>
                      </thead>
                      <tbody id="tbody">
                      	<c:forEach var="cinema" items="${cinemaList }">
                      	<tr>
                      		<td>${cinema.loName }</td>
                      		<td>${cinema.ciName }</td>
	                        <td>
								<select class="OC">
									<c:if test="${cinema.ciOc == 'N' }">
										<option value="N" selected>N</option>
										<option value="Y">Y</option>
									</c:if>
									<c:if test="${cinema.ciOc == 'Y' }">
										<option value="N">N</option>
										<option value="Y" selected>Y</option>
									</c:if>
								</select>
							</td>
                      		<td>${cinema.ciSNum}</td>
                      		<td>
                      			<select class="screen">
                      				<option value="0">상영관을 선택하세요</option>
                      				<c:forEach var="i" begin="1" end="${cinema.ciSNum}" step="1">
                      					<option value="${i}">${i}관</option>
                      				</c:forEach>
                      			</select>
                      			<c:if test="${cinema.ciOc == 'N' }">
									<button class="btn btn-success" type="button" disabled>삭제</button>
                      				<span class="loIdx" hidden="true">${cinema.loIdx}</span>
                      				<span class="ciIdx" hidden="true">${cinema.ciIdx}</span>
								</c:if>
								<c:if test="${cinema.ciOc == 'Y' }">
									<button class="btn btn-success deleteScrBtn" type="button">삭제</button>
                      				<span class="loIdx" hidden="true">${cinema.loIdx}</span>
                      				<span class="ciIdx" hidden="true">${cinema.ciIdx}</span>
								</c:if>
                      		</td>
                      		<td>
                      			<c:if test="${cinema.ciOc == 'N' }">
									<button class="btn btn-success" type="button" disabled>상영관 추가</button>
								</c:if>
								<c:if test="${cinema.ciOc == 'Y' }">
									<button class="btn btn-success addScrBtn" type="button" >상영관 추가</button>
								</c:if>
                      			
                      		</td>
						</tr>	  
                      	</c:forEach>
                        
                      </tbody>
                    </table>
				</form>	
					
                  </div>
                </div>
              </div>
              </div>
            </div>
          </div>




		</div>
		<!-- /page content -->

		<!-- footer content -->
		<footer>
			<div class="pull-right">
				Gentelella - Bootstrap Admin Template by <a
					href="https://colorlib.com">Colorlib</a>
			</div>
			<div class="clearfix"></div>
		</footer>
		<!-- /footer content -->
	</div>

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
	<!-- Datatables -->
	<script src="_admin/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="_admin/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="_admin/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="_admin/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script
		src="_admin/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="_admin/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="_admin/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="_admin/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="_admin/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="_admin/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="_admin/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="_admin/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	<script src="_admin/vendors/jszip/dist/jszip.min.js"></script>
	<script src="_admin/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script src="_admin/vendors/pdfmake/build/vfs_fonts.js"></script>

	<!-- Custom Theme Scripts -->
<script src="_admin/build/js/custom.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/_assets/js/admJS/adm_location.js"></script>
</body>
</html>