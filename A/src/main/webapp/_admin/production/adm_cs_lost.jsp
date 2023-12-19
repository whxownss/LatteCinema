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
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-desktop"></i> <span>Latte Cinema!</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
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
                  <li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
                  <li><a href="adm_member.jsp"><i class="fa fa-user"></i> 회원관리</a></li>
                  <li><a href="adm_mv_inout.jsp"><i class="fa fa-edit"></i>영화 통합 추가/제거</a></li>
                  <li><a href="adm_store.jsp"><i class="fa fa-beer"></i>스토어 관리</a></li>
                  <li><a><i class="fa fa-table"></i> Tables</a></li>
                  <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation</a></li>
                  <li><a><i class="fa fa-clone"></i>Layouts</a></li>
                </ul>
              </div>
              <div class="menu_section">
                <h3>메인 페이지 관리</h3>
                <ul class="nav side-menu">
                  <li><a href="adm_cs_center.jsp"><i class="fa fa-bullhorn"></i> 공지사항</a></li>
                  <li><a href="adm_cs_exque.jsp"><i class="fa fa-question"></i> 자주찾는질문</a></li>
                  <li><a href="adm_cs_qna.jsp"><i class="fa fa-comments"></i> 1:1문의</a></li>
                  <li><a href="adm_cs_lost.jsp"><i class="fa fa-search"></i> 분실물 문의</a></li>                     
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
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
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
          <div class="">
          
            <div class="page-title">
              <div class="title_left">
              </div>
            </div>

            <div class="clearfix"></div>

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>분실물 문의</h2>
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
                          <th>글번호</th>	
                          <th>영화관</th>
                          <th>글 제목</th>
                          <th>회원명</th>
                          <th>등록일</th>
                          <th>핸드폰 번호</th>
                          <th>E-mail</th>
                          <th>답변유무</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td><a href="../../_cs/cs_lost_content.jsp">책갈피 분실물이 있나요?</a></td>
                          <td>강동원</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>김길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>3</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>박길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>4</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>이길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>5</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>6</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>7</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>8</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>9</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
							</select>
						  </td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>서면점</td>
                          <td>쿠폰 왜이럼?</td>
                          <td>홍길동</td>
                          <td>2011/04/25</td>
                          <td>010 123 2222</td>
                          <td>t.nixon@datatables.net</td>
                          <td>
							<select>
								<option>N</option>
								<option>Y</option>
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
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="../vendors/jszip/dist/jszip.min.js"></script>
    <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>

  </body>
</html>