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
	int totalCount = 10000;
	int monthlyAudi = 120;
%>

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
                  	
                  <li><a href="adm_home.ad"><i class="fa fa-home"></i> Home</a>
<!--                     <ul class="nav child_menu"> -->
<!--                       <li><a href="index.html">Dashboard</a></li> -->
<!--                       <li><a href="index2.html">Dashboard2</a></li> -->
<!--                       <li><a href="index3.html">Dashboard3</a></li> -->
<!--                     </ul> -->
                  </li>
                  <li><a href="adm_member.ad"><i class="fa fa-user"></i> 회원관리</a></li>
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
              <div class="nav toggle">
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
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 총 회원수</span>
              <div class="count"><%=totalCount %></div>
              <span class="count_bottom"><i class="green">4% </i> From last Month</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 월별 관객수</span>
              <div class="count"><%=monthlyAudi %></div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Month</span>
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
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 월별 매출</span>
              <div class="count">2,315</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Month</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
<!--               <span class="count_top"><i class="fa fa-user"></i> Total Connections</span> -->
<!--               <div class="count">7,325</div> -->
<!--               <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Month</span> -->
            </div>
          </div>
          <!-- /top tiles -->

          <div class="row">
            <div class="col-md-8 col-sm-8 col-xs-8">
              <div class="dashboard_graph">

<!--                 <div class="row x_title"> -->
<!--                   <div class="col-md-6"> -->
<!--                     <h3>Network Activities <small>Graph title sub-title</small></h3> -->
<!--                   </div> -->
<!--                   <div class="col-md-6"> -->
<!--                     <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc"> -->
<!--                       <i class="glyphicon glyphicon-calendar fa fa-calendar"></i> -->
<!--                       <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->

<!--                 <div class="col-md-9 col-sm-9 col-xs-12"> -->
<!--                   <div id="chart_plot_01" class="demo-placeholder"></div> -->
<!--                 </div> -->
				    <div style="width:75%;">
				        <canvas id="canvas"></canvas>
				    </div>
                <div class="clearfix"></div>
              </div>
            </div>

          </div>
          <br />

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
					
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>예매번호</th>	
                          <th>회원명</th>
                          <th>지역</th>
                          <th>영화관</th>
                          <th>영화명</th>
                          <th>가격</th>
                          <th>예매일</th>
                          <th>취소일</th>
                          <th>핸드폰 번호</th>
                          <th>E-mail</th>
                          <th>예매상태</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<tr>
                      		<td>1</td>
                      		<td>강동원</td>
                      		<td>부산</td>
                          	<td>서면점</td>
                      		<td>부산의봄</td>
                      		<td>20000</td>
                      		<td>2023/04/25</td>
                      		<td></td>
                      		<td>010 1111 1111</td>
                      		<td>won@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                        <tr>
                      		<td>2</td>
                      		<td>홍길동</td>
                      		<td>부산</td>
                          	<td>서면점</td>
                      		<td>부산의봄</td>
                      		<td>25000</td>
                      		<td>2023/05/25</td>
                      		<td>2023/05/26</td>
                      		<td>010 2222 2222</td>
                      		<td>dong@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option selected>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>3</td>
                      		<td>김길동</td>
            		        <td>부산</td>
                          	<td>서면점</td>
                      		<td>부산의봄</td>
                      		<td>10000</td>
                      		<td>2023/06/25</td>
                      		<td></td>
                      		<td>010 3333 3333</td>
                      		<td>dong3@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>4</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>부산의봄</td>
                      		<td>10000</td>
                      		<td>2023/07/25</td>
                      		<td></td>
                      		<td>010 3334 3333</td>
                      		<td>dong3@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
                      	<tr>
                      		<td>5</td>
                      		<td>이길동</td>
                      		<td>부산</td>
                      		<td>부산대점</td>
                      		<td>라이언킹</td>
                      		<td>10000</td>
                      		<td>2023/08/25</td>
                      		<td></td>
                      		<td>010 3353 3333</td>
                      		<td>dong5@itwillbs.co.kr</td>
                      		<td>
								<select>
									<option>Y</option>
									<option>N</option>
								</select>
							</td>
                      	</tr>
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
		window.onload = function() {
		    var ctx = document.getElementById("canvas").getContext("2d");
		    window.myLine = new Chart(ctx, config);
		};
		
		// 차트와 상호작용을 위한 버튼 클릭 이벤트 핸들러들
		$('#randomizeData').click(function() {
		    // 모든 데이터셋에 대해 데이터 랜덤화
		    $.each(config.data.datasets, function(i, dataset) {
		        dataset.data = dataset.data.map(function() {
		            return randomScalingFactor();
		        });
		    });
		
		    // 차트 업데이트
		    window.myLine.update();
		});
		
		// 데이터 변경, 데이터셋 추가/삭제 등 다른 버튼 클릭 이벤트 핸들러들은 여기에 작성됩니다...

        
    </script>
    
  </body>
</html>
