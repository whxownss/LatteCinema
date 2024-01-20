<%@page import="com.itwillbs.domain.StoreItemDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.itwillbs.domain.StorePayDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  
    <title>Latte Cinema!</title>

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
    <!-- Datatables -->
    <link href="_admin/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="_admin/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="_admin/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="_admin/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="_admin/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

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
                  <li><a href="adm_cinema.ad"><i class="fa fa-beer"></i>스케줄 관리</a></li>
                </ul>
              </div>
              <div class="menu_section">
                <h3>메인 페이지 관리</h3>
                <ul class="nav side-menu">
                  <li><a href="adm_cs_center.ad"><i class="fa fa-bullhorn"></i> 공지사항</a></li>
                  <li><a href="adm_cs_exque.ad"><i class="fa fa-question"></i> 자주찾는질문</a></li>
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
<%
List<StoreItemDTO> itemNameList = 
		(List<StoreItemDTO>)request.getAttribute("itemNameList");
ArrayList<StorePayDTO> storeList = 
		(ArrayList<StorePayDTO>)request.getAttribute("storeList");
%>
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>스토어 관리</h3>
              </div>

            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>새상품 추가</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form action="adm_storeBuyList.ad" id="demo-form1" enctype="multipart/form-data" 
                    	method="post" data-parsley-validate class="form-horizontal form-label-left">
                    

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="store-name">상품 번호<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" name="itemIdx" required="required" class="form-control col-md-7 col-xs-12" placeholder="B / S / C로 구분">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="store-name">상품명<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" name="itemName" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="store-name">상품 정보<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" name="itemDetail" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="store-number">상품 가격<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" name="itemPrice" required="required" class="form-control col-md-7 col-xs-12" placeholder="숫자만 입력하세요.">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="store-img">상품 이미지<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          	<div class="btn-group">
								<a class="btn" title="Insert picture (or just drag &amp; drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>
								<input type="file" name="itemImage" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage">
							</div>
                        </div>
                      </div>
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
						  <button class="btn btn-primary" type="reset">초기화</button>
                          <button type="submit" class="btn btn-success">등록</button>
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
                    <h2>상품 삭제</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown"></li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form action="adm_storeDel.ad" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="store_name2">상품<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	<select name="name" id="store_name2" class="form-control" required>
		                        <option value="none">=== 선택 ===</option>
		                        <c:forEach var="storeItem" items="${itemNameList }" varStatus="s">
		                            <option value="${storeItem.itemName}">${storeItem.itemName}</option>
		                        </c:forEach>
                          	</select>
                        </div> 
                      </div>
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
						  <button class="btn btn-primary" type="reset">초기화</button>
                          <button type="submit" class="btn btn-success">삭제</button>
                        </div>
                      </div>

                    </form>
                  </div>
                  
                </div>
              </div>
            </div>
			
			<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>스토어 결제 관리</h2>
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
                          <th>결제번호</th>	
                          <th>회원명</th>
                          <th>구매물품</th>
                          <th>구매수량</th>
                          <th>가격</th>
                          <th>구매일</th>
                          <th>핸드폰 번호</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="storeList" items="${storeList }">
                      	<tr>
                      		<td>${storeList.merchantUid }</td>
                      		<td>${storeList.buyerName }</td>
                      		<td>${storeList.name }</td>
                      		<td>${storeList.itemCnt }</td>
                      		<td>${storeList.paidAmount }</td>
                      		<td>${storeList.payTime }</td>
                      		<td>${storeList.buyerTel }</td>
                      	</tr>
                      </c:forEach>
                      </tbody>
                    </table>
					
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
    <!-- bootstrap-progressbar -->
    <script src="_admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="_admin/vendors/iCheck/icheck.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="_admin/vendors/moment/min/moment.min.js"></script>
    <script src="_admin/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-wysiwyg -->
    <script src="_admin/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="_admin/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="_admin/vendors/google-code-prettify/src/prettify.js"></script>
    <!-- jQuery Tags Input -->
    <script src="_admin/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
    <!-- Switchery -->
    <script src="_admin/vendors/switchery/dist/switchery.min.js"></script>
    <!-- Select2 -->
    <script src="_admin/vendors/select2/dist/js/select2.full.min.js"></script>
    <!-- Parsley -->
    <script src="_admin/vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Autosize -->  
    <script src="_admin/vendors/autosize/dist/autosize.min.js"></script>
    <!-- jQuery autocomplete -->
    <script src="_admin/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
    <!-- starrr -->
    <script src="_admin/vendors/starrr/dist/starrr.js"></script>
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
	
  </body>
</html>
