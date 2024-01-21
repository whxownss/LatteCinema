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
<title>Latte Cinema</title>
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
							<h3>스케줄 관리</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>스케줄 추가</h2>
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
												for="area-detail">영화<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select id="movie" name="movie" class="form-control"
													required>
													<option value="0">영화를 선택해 주세요</option>
													<optgroup label="OLD">
														<c:forEach var="movie" items="${movieList}" varStatus="status">
															<c:if test="${movie.movieCategory == 'OLD'}">
																<option value="OLD${movie.movieIdx}/${movie.runTime}">${movie.title} (${movie.runTime}분)
																</option>
															</c:if>
														</c:forEach>
													</optgroup>
													<optgroup label="NOW">
														<c:forEach var="movie" items="${movieList}" varStatus="status">
															<c:if test="${movie.movieCategory == 'NOW'}">
																<option value="NOW${movie.movieIdx}/${movie.runTime}">${movie.title} (${movie.runTime}분)
																</option>
															</c:if>
														</c:forEach>
													</optgroup>
												</select>
											</div>
										</div>

										<!--  영화관 위치가 아니라 영화관 위치 설명 파일이면 다른 곳에 있어야 할듯 -->

										<!--  <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="movie-position">영화관 위치<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	<input type="text" id="movie-position" required="required" class="form-control col-md-7 col-xs-12">
                          	<div class="btn-group">
								<a class="btn" title="Insert picture (or just drag &amp; drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>
								<input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage">
							</div>
                        </div>
                      </div> -->
										


										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="movie-startDate">상영일<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="date" id="movie-startDate" required="required"
													class="form-control col-md-7 col-xs-12" name="date"
													placeholder="ex) 230921">
											</div>
										</div>



										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="movie-startTime">시작시간<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="time" id="movie-startTime" required="required"
													class="form-control col-md-7 col-xs-12" name="sTime"
													placeholder="ex) 09:00">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="movie-endTime">종료시간<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="time" id="movie-endTime" required="required"
													class="form-control col-md-7 col-xs-12"
													placeholder="ex) 13:00" readonly>
											</div>
										</div>

										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button class="btn btn-primary" type="button">취소</button>
												<button class="btn btn-primary" type="reset">초기화</button>
												<button class="btn btn-success" type="submit" id="insertSchBtn">등록</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>




					<!-- 				<div class="clearfix"></div> -->

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>스케줄 조회</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<p class="text-muted font-13 m-b-30"></p>
									<form action="#" id="memManage" name="memManage" method="post">
										<table id="datatable-responsive"
											class="table table-striped table-bordered dt-responsive nowrap"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>지역</th>
													<th>영화관</th>
													<th>상영날짜</th>
													<th>번호</th>
													<th>상영관</th>
													<th>영화타입</th>
													<th>영화제목</th>
													<th>러닝타임</th>
													<th>시작시간</th>
													<th>종료시간</th>
													<th>기타</th>
												</tr>
											</thead>
											<tbody id="tbody">
												<c:forEach var="sch" items="${allSchedules}">
													<tr>
														<td class="lo${sch.loIdx}">${sch.loName}</td>
														<td class="ci${sch.ciIdx}">${sch.ciName}</td>
														<td class="">${sch.schDate}</td>
														<td class="schIdx">${sch.schIdx}</td>
														<td class="">${sch.scrIdx}</td>
														<td class="movType">${sch.schMovType}</td>
														<td class="">${sch.title}</td>
														<td class="">${sch.schRun}</td>
														<td class="">${sch.schStime}</td>
														<td class="">${sch.schEtime}</td>
														<td><button class="btn btn-primary deleteSchBtn" type="button">삭제</button></td>
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
<script type="text/javascript">
var cinemaList = ${cinemaListJson};

$(function(){
	//
// 	$("#location option:eq(6)").prop("selected", true);
	
	//
	
	$("#location").on("change", function(e){
		var loIdx = e.currentTarget.selectedIndex;
		$("#cinema").empty();
		// 지역 선택하면 영화관 뿌려주기
		if(loIdx == 0) {
			$("#cinema").append("<option value='0'>지역을 먼저 선택해 주세요</option>");
			$("#screen").empty();
			$("#screen").append("<option value='0'>영화관을 먼저 선택해 주세요</option>");
			return;
		}
		$("#cinema").append("<option value='0'>영화관을 선택해 주세요</option>");
		$.each(cinemaList, (i, e) => {
			if(loIdx != e.loIdx) return;
			$("#cinema").append("<option value='" + e.ciIdx + "'>" + e.ciName + " (" + e.ciOc + ")</option>");
		});
	});
	
	// 영화관 선택하면 상영관 뿌려주기
	$("#cinema").on("change", function(e){
		var ciIdx = e.currentTarget.selectedIndex;
		$("#screen").empty()
		if(ciIdx == 0){
			$("#screen").append("<option value='0'>영화관을 먼저 선택해 주세요</option>");
			return;
		}
		$.ajax({
			type: "GET",
			url: "adm_cinemaPro.ad",
			data: {location: $("#location option:selected").val(),
				   cinema: $("#cinema option:selected").val()},
			dataType: "json"
		})
		.done(function(data){
			$("#screen").append("<option value='0'>상영관을 선택해 주세요</option>");
			$.each(data, function(i, e){
				$("#screen").append("<option value='" + e.scrIdx + "'>" + e.scrIdx + "관</option>");
			});
		})
		.fail(function(){})
	});
	
	// 영화변경시 시간 초기화 (영화별로 런타임이 달라 종료시간도 달라지기 때문)
	$("#movie").on("change", function(){
		$("#movie-startTime").val('');
		$("#movie-endTime").val('');
	})
	
	// 종료시간 표시
	$("#movie-startTime").on("change", function(){
		var h = parseInt($("#movie-startTime").val().substr(0,2));
		var m = parseInt($("#movie-startTime").val().substr(3,2));
		var date = new Date();
		date.setHours(h);
		date.setMinutes(m);
		var runTime = parseInt($("#movie").val().split("/")[1]);
		date.setMinutes(date.getMinutes() + runTime); 
		$("#movie-endTime").val((date.getHours()+"").padStart(2, 0) + ":" + (date.getMinutes()+"").padStart(2, 0));
	})
	
	// 스케줄 등록 (유효성 체크해야됨)
	$(".deleteSchBtn").on("click", function(){
		debugger;	
		var loIdx = $(this).parent().parent().find("[class^='lo']").attr('class').split(" ")[0].substr(2);
		var ciIdx = $(this).parent().parent().find("[class^='ci']").attr('class').substr(2);
		var schIdx = $(this).parent().parent().find(".schIdx").text();
		var movType = $(this).parent().parent().find(".movType").text();
		debugger;	
		
		$.ajax({
			type: "POST",
			url: "adm_cinemaProDS.ad",
			data: {
				loIdx: loIdx,
				ciIdx: ciIdx,
				schIdx: schIdx,
				movType: movType
			},
			dataType: "text"
		})
		.done(function(data){
			if(data == "false"){
				alert("스케줄 삭제에 오류가 발생했습니다.");
				return;
			}
			location.reload();	
			
		})
		.fail(function(){})
	})
});
</script>

</body>
</html>