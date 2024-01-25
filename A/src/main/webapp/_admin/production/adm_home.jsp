<%@page import="com.itwillbs.domain.AdmToolDTO"%>
<%@page import="com.itwillbs.domain.ReservationDTO"%>
<%@page import="com.itwillbs.domain.ResponseDataDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
    <!-- bootstrap-progressbar -->
    <link href="_admin/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="_admin/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="_admin/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="_admin/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="_admin/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="_admin/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="_admin/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="_admin/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath }/_assets/css/adm_home.css" rel="stylesheet">

	<!-- Chart.js 및 jQuery 스크립트 불러오기 -->
    <script src="_admin/vendors/Chart.js/dist/Chart.bundle.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <!-- 캔버스 스타일 지정 -->
    <style>
        canvas {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }
    </style>
    
    <!-- Custom Theme Style -->
    <link href="_admin/build/css/custom.min.css" rel="stylesheet">
  </head>
<%
	int memCount = (int)request.getAttribute("memCount");
	int monthlyAudi = (int)request.getAttribute("monthlyAudi");
	int monthlySum = (int)request.getAttribute("monthlySum");
	ArrayList<ResponseDataDTO> responseList = (ArrayList<ResponseDataDTO>)request.getAttribute("responseList");
	ArrayList<ReservationDTO> resBoardList = (ArrayList<ReservationDTO>)request.getAttribute("resBoardList");
	AdmToolDTO admToolDTO = (AdmToolDTO)request.getAttribute("admToolDTO");
%>

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
                  	
                  <li><a href="adm_home.ad"><i class="fa fa-home"></i>Home</a>
<!--                     <ul class="nav child_menu"> -->
<!--                       <li><a href="index.html">Dashboard</a></li> -->
<!--                       <li><a href="index2.html">Dashboard2</a></li> -->
<!--                       <li><a href="index3.html">Dashboard3</a></li> -->
<!--                     </ul> -->
                  </li>
                  <li><a href="adm_member.ad"><i class="fa fa-user"></i>회원관리</a></li>
                  <li><a href="adm_mv_inout.ad"><i class="fa fa-edit"></i>영화 통합 추가/제거</a>
<!--                     <ul class="nav child_menu"> -->
<!--                       <li><a href="form.html">General Form</a></li> -->
<!--                       <li><a href="form_advanced.html">Advanced Components</a></li> -->
<!--                       <li><a href="form_validation.html">Form Validation</a></li> -->
<!--                       <li><a href="form_wizards.html">Form Wizard</a></li> -->
<!--                       <li><a href="form_upload.html">Form Upload</a></li> -->
<!--                       <li><a href="form_buttons.html">Form Buttons</a></li> -->
<!--                     </ul> -->
                  </li>
                  <li><a href="adm_store.ad"><i class="fa fa-beer"></i>스토어 관리</a>
<!--                     <ul class="nav child_menu"> -->
<!--                       <li><a href="general_elements.html">General Elements</a></li> -->
<!--                       <li><a href="media_gallery.html">Media Gallery</a></li> -->
<!--                       <li><a href="typography.html">Typography</a></li> -->
<!--                       <li><a href="icons.html">Icons</a></li> -->
<!--                       <li><a href="glyphicons.html">Glyphicons</a></li> -->
<!--                       <li><a href="widgets.html">Widgets</a></li> -->
<!--                       <li><a href="invoice.html">Invoice</a></li> -->
<!--                       <li><a href="inbox.html">Inbox</a></li> -->
<!--                       <li><a href="calendar.html">Calendar</a></li> -->
<!--                     </ul> -->
                  </li>
                  
				   <li><a href="adm_location.ad"><i class="fa fa-beer"></i>영화관 관리</a></li>
                   <li><a href="adm_cinema.ad"><i class="fa fa-beer"></i>스케줄 관리</a></li>
                 
                </ul>
              </div>
              <div class="menu_section">
                <h3>메인 페이지 관리</h3>
                <ul class="nav side-menu">
                  <li><a href="adm_cs_center.ad"><i class="fa fa-bullhorn"></i> 공지사항</a>
<!--                     <ul class="nav child_menu"> -->
<!--                       <li><a href="page_403.html">403 Error</a></li> -->
<!--                       <li><a href="page_404.html">404 Error</a></li> -->
<!--                       <li><a href="page_500.html">500 Error</a></li> -->
<!--                       <li><a href="plain_page.html">Plain Page</a></li> -->
<!--                       <li><a href="login.html">Login Page</a></li> -->
<!--                       <li><a href="pricing_tables.html">Pricing Tables</a></li> -->
<!--                     </ul> -->
                  </li>
                  <li><a href="adm_cs_exque.ad"><i class="fa fa-question"></i> 자주찾는질문</a>
<!--                     <ul class="nav child_menu"> -->
<!--                         <li><a href="#level1_1">Level One</a> -->
<!--                         <li><a>Level One<span class="fa fa-chevron-down"></span></a> -->
<!--                           <ul class="nav child_menu"> -->
<!--                             <li class="sub_menu"><a href="level2.html">Level Two</a> -->
<!--                             </li> -->
<!--                             <li><a href="#level2_1">Level Two</a> -->
<!--                             </li> -->
<!--                             <li><a href="#level2_2">Level Two</a> -->
<!--                             </li> -->
<!--                           </ul> -->
<!--                         </li> -->
<!--                         <li><a href="#level1_2">Level One</a> -->
<!--                         </li> -->
<!--                     </ul> -->
                  </li>   
                  
                  <li><a href="adm_cs_qna.ad"><i class="fa fa-comments"></i> 1:1문의</a>
<!--                     <ul class="nav child_menu"> -->
<!--                       <li><a href="e_commerce.html">E-commerce</a></li> -->
<!--                       <li><a href="projects.html">Projects</a></li> -->
<!--                       <li><a href="project_detail.html">Project Detail</a></li> -->
<!--                       <li><a href="contacts.html">Contacts</a></li> -->
<!--                       <li><a href="profile.html">Profile</a></li> -->
<!--                     </ul> -->
                  </li>
                  
                  
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
          <!-- top tiles -->
          <div class="row tile_count">
            <div class="col-md-1 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 총 회원수</span>
              <div class="count">${memCount }</div>
<!--               <span class="count_bottom"><i class="green">4% </i> From last Month</span> -->
            </div>
            <div class="col-md-1 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 월별 관객수</span>
              <div class="count">${monthlyAudi }</div>
<!--               <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Month</span> -->
            </div>
<!--             <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count"> -->
<!--               <span class="count_top"><i class="fa fa-user"></i> 남성 회원</span> -->
<!--               <div class="count green">2,500</div> -->
<!--               <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Month</span> -->
<!--             </div> -->
<!--             <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count"> -->
<!--               <span class="count_top"><i class="fa fa-user"></i> 여성 회원</span> -->
<!--               <div class="count">4,567</div> -->
<!--               <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Month</span> -->
<!--             </div> -->
            <div class="col-md-1 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 월별 매출</span>
              <div class="count">${monthlySum }</div>
<!--               <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Month</span> -->
            </div>
            
<!--             여기서부터임 여기서부터임여기서부터임여기서부터임여기서부터임여기서부터임여기서부터임여기서부터임여기서부터임여기서부터임여기서부터임여기서부터임여기서부터임여기서부터임여기서부터임여기서부터임여기서부터임-->
            <div class="col-md-1 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 결제 취소 시간 (분)</span>
              <div class="count"><input type="number" step="1" class="admTool" id="cancelTime" value="${admToolDTO.cancelTime}"></div>
            </div>
            
            
            <div class="col-md-1 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 환불 불가 시간 (분)</span>
              <div class="count"><input type="number" step="10" class="admTool" id="refundTime" value="${admToolDTO.refundTime}"></div>
            </div>
            
            
            <div class="col-md-1 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> P1 가격 (원)</span>
              <div class="count"><input type="number" step="1000" class="admTool" id="p1Price" value="${admToolDTO.p1Price}"></div>
            </div>
            
            
            <div class="col-md-1 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> P2 가격 (원)</span>
              <div class="count"><input type="number" step="1000" class="admTool" id="p2Price" value="${admToolDTO.p2Price}"></div>
            </div>
            
            <div class="col-md-1 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> P3 가격 (원)</span>
              <div class="count"><input type="number" step="1000" class="admTool" id="p3Price" value="${admToolDTO.p3Price}"></div>
            </div>
            
            <div class="col-md-1 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i></span>
              <div class="count"><button type="button" id="admToolBtn" disabled>수정</button></div>
            </div>
<!--             <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count"> -->
<!--               <span class="count_top"><i class="fa fa-user"></i> Total Connections</span> -->
<!--               <div class="count">7,325</div> -->
<!--               <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Month</span> -->
<!--             </div> -->
          </div>  
          <!-- /top tiles -->

<!--           <div class="row"> -->
<!--             <div class="col-md-8 col-sm-8 col-xs-8"> -->
<!--               <div class="dashboard_graph"> -->

<!-- <!--                 <div class="row x_title"> --> 
<!-- <!--                   <div class="col-md-6"> --> 
<!-- <!--                     <h3>Network Activities <small>Graph title sub-title</small></h3> --> 
<!-- <!--                   </div> --> 
<!-- <!--                   <div class="col-md-6"> --> 
<!-- <!--                     <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc"> --> 
<!-- <!--                       <i class="glyphicon glyphicon-calendar fa fa-calendar"></i> --> 
<!-- <!--                       <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b> --> 
<!-- <!--                     </div> --> 
<!-- <!--                   </div> --> 
<!-- <!--                 </div> --> 

<!-- <!--                 <div class="col-md-9 col-sm-9 col-xs-12"> --> 
<!-- <!--                   <div id="chart_plot_01" class="demo-placeholder"></div> --> 
<!-- <!--                 </div> --> 
<!-- 				    <div style="width:75%;"> -->
<%-- 				        <canvas id="canvas"></canvas> --%>
<!-- 				    </div> -->
<!--                 <div class="clearfix"></div> -->
<!--               </div> -->
<!--             </div> -->

<!--           </div> -->
<!--           <br /> -->

          <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>예매 관리</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                    <!-- 임시  -->
<!--                     	<select class="input-sm"> -->
<!--                     			<option>지역선택</option> -->
<!--                     			<option>부산</option> -->
<!--                     			<option>서울</option> -->
<!--                     		</select> -->
<!--                     	<select class="input-sm"> -->
<!--                     			<option>영화관 선택</option> -->
<!--                     			<option>서면</option> -->
<!--                     			<option>부산대</option> -->
<!--                     		</select> -->
                     <!-- //임시  -->		
                    </p>
					<form action="#" id="bookStatus" name="bookStatus" method="post">
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>예매번호</th>	
                          <th>회원명</th>
                          <th>영화관</th>
                          <th>영화명</th>
                          <th>가격</th>
                          <th>예매일</th>
                          <th>상영일시</th>
                          <th>취소일</th>
<!--                           <th>예매상태</th> -->
                        </tr>
                      </thead>
                      <tbody id="tbody">
                      	<c:forEach var="reservationDTO" items="${resBoardList }">
                      		<tr>
                   			  <th>${reservationDTO.merchantUid }</th>	
	                          <th>${reservationDTO.memId }</th>
	                          <th>${reservationDTO.cinema} ${reservationDTO.scrIdx }</th>
	                          <th>${reservationDTO.title}</th>
	                          <th>${reservationDTO.paidAmount}</th>
	                          <th>${reservationDTO.payTime}</th>
	                          <th>${reservationDTO.date} ${reservationDTO.sTime}~${reservationDTO.schEtime}</th>
	                          <th>${reservationDTO.refundTime}</th>
<!-- 	                          <th> -->
<!-- 	                          	<select name="bookSelect"> -->
<%-- 	                          	<c:if test="${reservationDTO.success eq true }"> --%>
<!-- 									<option value="true" selected>Y</option> -->
<!-- 									<option value="false">N</option> -->
<%-- 	                          	</c:if> --%>
<%-- 	                          	<c:if test="${reservationDTO.success ne true }"> --%>
<!-- 									<option value="true">Y</option> -->
<!-- 									<option value="false" selected>N</option> -->
<%-- 	                          	</c:if> --%>
<!-- 								</select> -->
<!-- 	                          </th> -->
                      		</tr>
                      	</c:forEach>
                      </tbody>
                    </table>
				</form>
					
                  </div>
                </div>
              </div>
              <!--  -->
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>답변 데이터</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                    </p>
                    <table id="datatable-buttons" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>게시판명</th>
                          <th>회원명</th>
                          <th>작성일</th>
                          <th>글제목</th>
                          <th>답변</th>
                          <th>답변자</th>
                          <th>답변일</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="responseDataDTO" items="${responseList }">
                      <tr>
<%--                       	  <c:if test="${empty responseDataDTO.qnaIdx }"> --%>
<!--                       	  	<th>분실물</th>	 -->
<%--                       	  </c:if> --%>
<%--                       	  <c:if test="${empty responseDataDTO.lostIdx }"> --%>
<!--                       	  	<th>1:1문의</th>	 -->
<%--                       	  </c:if> --%>
                      	  <th>${responseDataDTO.boardGB}</th>
                          <th>${responseDataDTO.createUser }</th>
                          <th>${responseDataDTO.createDate }</th>
                          <th>${responseDataDTO.subject }</th>
                          <th>${responseDataDTO.response }</th>
                          <th>${responseDataDTO.responseUser }</th>
                          <th>${responseDataDTO.responseDate }</th>
                      </tr>
                      </c:forEach>
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
          </div>
                    

        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="_admin/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="_admin/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="_admin/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="_admin/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="_admin/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="_admin/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="_admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="_admin/vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="_admin/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="_admin/vendors/Flot/jquery.flot.js"></script>
    <script src="_admin/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="_admin/vendors/Flot/jquery.flot.time.js"></script>
    <script src="_admin/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="_admin/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="_admin/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="_admin/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="_admin/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="_admin/vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="_admin/vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="_admin/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="_admin/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="_admin/vendors/moment/min/moment.min.js"></script>
    <script src="_admin/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- Datatables -->
    <script src="_admin/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="_admin/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="_admin/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="_admin/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="_admin/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="_admin/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="_admin/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="_admin/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="_admin/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="_admin/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="_admin/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="_admin/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="_admin/vendors/jszip/dist/jszip.min.js"></script>
    <script src="_admin/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="_admin/vendors/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="_admin/build/js/custom.min.js"></script>
    
        <!-- JavaScript 코드 -->
    <script>
        // JavaScript 코드는 여기에 작성됩니다.
		// 라인 차트를 생성하고 조작하기 위한 JavaScript 코드
		
		// 월 및 랜덤 데이터를 담을 배열들
		var MONTHS = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
		
        // 월별 매출액
        var MONTHSALES = [150,200,350,330,400,460,370,380,290,100,50];
        
		// 랜덤한 스케일링 요소 생성하는 함수
		var randomScalingFactor = function() {
		    return Math.round(Math.random() * 100);
		};
		
		// 랜덤한 컬러 요소 생성하는 함수
		var randomColorFactor = function() {
		    return Math.round(Math.random() * 255);
		};
		
		// 랜덤한 컬러를 생성하는 함수 (투명도 옵션 가능)
		var randomColor = function(opacity) {
		    return 'rgba(' + randomColorFactor() + ',' + randomColorFactor() + ',' + randomColorFactor() + ',' + (opacity || '.3') + ')';
		};
		
		// 차트의 설정 객체
		var config = {
		    type: 'line',
		    data: {
				labels: MONTHS,
		        datasets: [
		            // 첫 번째 데이터셋
		            {
		                label: "월별 매출(원)",
		                data: MONTHSALES,
		                fill: false,
		                borderDash: [0],
		                borderColor: "red",
		            }
		        ]
		    },
		    options: {
		        responsive: true,
		        title: {
		            display: true,
		            text: '월별 매출액'
		        },
		        tooltips: {
		            mode: 'label',
		            // tooltips 설정은 여기에 추가할 수 있습니다.
		        },
		        hover: {
		            mode: 'dataset'
		        },
		        scales: {
		            xAxes: [{
		                display: true,
		                scaleLabel: {
		                    show: true,
		                    labelString: 'Month'
		                }
		            }],
		            yAxes: [{
		                display: true,
		                scaleLabel: {
		                    show: true,
		                    labelString: 'Value'
		                },
		                ticks: {
		                    suggestedMin: 0,
		                    suggestedMax: 500,
		                    // y축 최대값 변경
		                    // suggestedMax를 원하는 최대값으로 수정합니다.
		                }
		            }]
		        }
		    }
		};
		
		// 각 데이터셋에 랜덤한 컬러 적용
		/* $.each(config.data.datasets, function(i, dataset) {
		    dataset.borderColor = randomColor(0.4);
		    dataset.backgroundColor = randomColor(0.5);
		    dataset.pointBorderColor = randomColor(0.7);
		    dataset.pointBackgroundColor = randomColor(0.5);
		    dataset.pointBorderWidth = 1;
		}); */
		
		// 창이 로드될 때 차트 초기화
// 		window.onload = function() {
// 		    var ctx = document.getElementById("canvas").getContext("2d");
// 		    window.myLine = new Chart(ctx, config);
// 		};
		
		// 차트와 상호작용을 위한 버튼 클릭 이벤트 핸들러들
// 		$('#randomizeData').click(function() {
// 		    // 모든 데이터셋에 대해 데이터 랜덤화
// 		    $.each(config.data.datasets, function(i, dataset) {
// 		        dataset.data = dataset.data.map(function() {
// 		            return randomScalingFactor();
// 		        });
// 		    });
		
// 		    // 차트 업데이트
// 		    window.myLine.update();
// 		});
		
		// 데이터 변경, 데이터셋 추가/삭제 등 다른 버튼 클릭 이벤트 핸들러들은 여기에 작성됩니다...
		$(document).ready(function() {
		  // 셀렉트박스의 onchange 이벤트 핸들러
// 		  $('select[name="bookSelect"]').on('change', function() {
// 			 console.log("이벤트 연결");
// 		    $('#bookStatus').submit(); // 폼 제출
// 		  });
		  $('#tbody').on('change','select',function(){
			var $row = $(this).closest("tr");
			var mid = $row.find("th:first-child").text();
			alert('이벤트연결' + mid);
		  });
		  
		  
		  
		  
		  // 수치 변경
		  $(document).on("change", ".admTool", function(){
			  debugger;
			  $("#admToolBtn").attr("disabled", false);
		  })
		  
		  $("#admToolBtn").on("click", function(){
			  debugger;
			  $.ajax({
				  type: "POST",
				  url: "adm_homePro.ad",
				  data: {
					  cancelTime: $("#cancelTime").val(),
			  		  refundTime: $("#refundTime").val(),
			  		  p1Price: $("#p1Price").val(),
			  		  p2Price: $("#p2Price").val(),
			  		  p3Price: $("#p3Price").val()
				  },
				  dataType: "text"
			  })
			  .done(function(data){
				  debugger;
				  location.reload();
			  })
		  })
		  
		  
		  
		  
		  
		  
		});
        
    </script>
    
  </body>
</html>