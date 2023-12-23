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
 <%
 	String select = "멤버십";
 	String subject = "제목 데이터를 받자";
 	String content = "내용 데이터를 받자";
 	int exqNum = 1; //글번호도 받아와야할듯
 %>
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
          	<!-- 임시  -->
			<div class="container">
			  <!-- Modal -->
			 <form action="#" method="get" name="frChange"> 
			  <div class="modal fade" id="myModal" role="dialog">
			    <div class="modal-dialog">
<!-- 			    <button type="button" class="btn-close" aria-label="Close"></button> -->
			      <!-- Modal content-->
			      <div class="modal-content">
				      <div class="modal-header">
				      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				        <h5 class="modal-title" id="exampleModalLabel">자주찾는질문</h5>
				        <select id="modalSelect" name="changeSelect">
				        	<option value="">구분선택</option>
				        	<option value="예매">예매</option>
				        	<option value="관람권">관람권</option>
				        	<option value="멤버십">멤버십</option>
				        	<option value="할인혜택">할인혜택</option>
				        	<option value="영화관이용">영화관이용</option>
				        </select>
				      </div>
				      <div class="modal-body">
<!-- 				        <form> -->
				          <div class="mb-3">
				            <label for="recipient-name" class="col-form-label">질문</label>
				            <input type="text" class="form-control" id="recipient-name" name="changeQue" value="">
				          </div>
				          <div class="mb-3">
				            <label for="message-text" class="col-form-label">글내용</label>
				            <textarea class="form-control" id="message-text" name="changeContent"></textarea>
				          </div>
<!-- 				        </form> -->
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-danger">삭제</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">나가기</button>
				        <button type="submit" id="modalRewrite" class="btn btn-primary">수정</button>
				      </div>
			    </div>
			  </div>
			  
			</div>
		 </form>	
          	<!-- //임시  -->
          	<form action="#" method="get" name="frAdd"> <!-- form태그로 submit 버튼  -->
			  <div class="modal fade" id="myModal2" role="dialog">
			    <div class="modal-dialog">
<!-- 			    <button type="button" class="btn-close" aria-label="Close"></button> -->
			      <!-- Modal content-->
			      <div class="modal-content">
				      <div class="modal-header">
				      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				        <h5 class="modal-title" id="exampleModalLabel">자주찾는질문</h5>
				        <select name="newSelect">
				        	<option value="">구분선택</option>
				        	<option value="예매">예매</option>
				        	<option value="관람권">관람권</option>
				        	<option value="멤버십">멤버십</option>
				        	<option value="할인혜택">할인혜택</option>
				        	<option value="영화관이용">영화관이용</option>
				        </select>
				      </div>
				      <div class="modal-body">
<!-- 				        <form> -->
				          <div class="mb-3">
				            <label for="recipient-name" class="col-form-label">질문</label>
				            <input type="text" class="form-control" id="recipient-name" name="newQue" value="">
				          </div>
				          <div class="mb-3">
				            <label for="message-text" class="col-form-label">글내용</label>
				            <textarea class="form-control" id="message-text" name="newContent"></textarea>
				          </div>
<!-- 				        </form> -->
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">나가기</button>
				        <button type="submit" id="insertRow" class="btn btn-primary">추가</button>
				      </div>
			    </div>
			  </div>
			  
			</div>
		</form>
          	<!-- //임시  -->          	
            <div class="page-title">
              <div class="title_left">
              </div>
            </div>

            <div class="clearfix"></div>

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>자주 찾는 질문<small><button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#myModal2">추가</button></small></h2>
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
                          <th>구분</th>
                          <th>질문</th>
                          <th>등록일</th>
                          <th>수정일</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>1</td>
                          <td><%=select %></td>
                          <td><a data-toggle="modal" data-target="#myModal" data-info='{"key1": "<%=subject%>", "key2": "<%=content%>", "key3": "<%=select%>"}'><%=subject %></a></td>
                          <td>2011/04/25</td>
                          <td>2011/06/25</td>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td>멤버십</td>
                          <td>포인트 소멸은 어떻게 이루어 지나요?</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>3</td>
                          <td>멤버십</td>
                          <td>VIP 선정 기준이 어떻게 되나요?</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>4</td>
                          <td>관람권</td>
                          <td>특별한 전용 관람권이 따로 있나요?</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>5</td>
                          <td>영화관이용</td>
                          <td>주차가 가능한가요?</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>6</td>
                          <td>영화관이용</td>
                          <td>관람등급에 대해 알고 싶습니다.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>7</td>
                          <td>영화관이용</td>
                          <td>상영관 내 다른 음식물의 반입이 되나요?</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>8</td>
                          <td>할인혜택</td>
                          <td>장애인, 경로 등 우대할인에 대해 알고 싶습니다.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>9</td>
                          <td>예매</td>
                          <td>예매는 몇 장까지 가능한가요?</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>예매</td>
                          <td>예매 취소를 하였는데 환불이 안된 것 같아요.</td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
                        </tr>
                        <tr>
                          <td>11</td>
                          <td><%=select %></td>
                          <td><a data-toggle="modal" data-target="#myModal" data-info='{"key1": "<%=subject%>", "key2": "<%=content%>", "key3": "<%=select%>"}'><%=subject %></a></td>
                          <td>2011/04/25</td>
                          <td>2011/05/25</td>
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
<script type="text/javascript">
	// 테이블의 각 행에 클릭 이벤트를 추가
	$("table tbody tr").on("click", function () {
	    // 클릭한 행에서 첫 번째 <td> 요소의 내용을 가져옴
	    var clickedNumber = $(this).find("td:first").text();

	    // 가져온 숫자 값을 출력하거나 다른 작업 수행
	    console.log("Clicked Number:", clickedNumber);

	    // 또는 다른 작업을 수행
	    // 예를 들어, 모달을 열거나 다른 페이지로 이동
	});
		
		$("tr a[data-toggle='modal']").on("click", function () {
		    // data-info 속성에서 JSON 데이터 가져오기
		    var infoData = $(this).data("info");
		
		    // 필요한 정보 추출
		    var key1 = infoData.key1;
		    var key2 = infoData.key2;
		    var key3 = infoData.key3;
		
		    // 추출한 정보를 출력하거나 다른 작업 수행
		    console.log("Key1:", key1);
		    console.log("Key2:", key2);
		    console.log("Key3:", key3);
		
	        if (infoData) {
	            // 필요한 정보 추출
	            $("#modalSelect").val(infoData.key3); // select 옵션 선택 받기
	            $("#recipient-name").val(infoData.key1); // a 태그에서 가져온 정보
	            $("#message-text").text(infoData.key2); // a 태그에서 가져온 정보
	        } else {
	            console.log("data-info not found");
	        }
		    // 또는 다른 작업을 수행
		    // 예를 들어, 모달을 열거나 다른 페이지로 이동
		});
	
	 // <a> 태그가 클릭되었을 때 실행할 함수
	 // #openModal 대신 "tr:eq(1) td:eq(2)" 사용해보자
// 	    $("tr:eq(1) td:eq(2)").click(function() {
// 	    	alert("이벤트 연결 성공");
// 	        // 현재 클릭된 td 요소에 있는 a 태그에서 data-info 속성 가져오기
// 	        var infoData = $(this).find("a").data("info");

// 	        if (infoData) {
// 	            // 필요한 정보 추출
// 	            $("#modalSelect").val(infoData.key3); // select 옵션 선택 받기
// 	            $("#recipient-name").val(infoData.key1); // a 태그에서 가져온 정보
// 	            $("#message-text").text(infoData.key2); // a 태그에서 가져온 정보
// 	        } else {
// 	            console.log("data-info not found");
// 	        }
// 	    });
	 	//수정 모달 수정 버튼 클릭
	 	$("#modalRewrite").on("click",function(){
	 		alert("이벤트 연결 성공");
	 	// 실제 값으로 subject, content, select 값을 대체하세요
	 	    var subject = '<%=subject %>';
	 	    var content = '<%=content %>';
	 	    var select = '<%=select %>';

	 	    // anchorString을 생성합니다.
// 	 	    var anchorString = '<a data-toggle="modal" data-target="#myModal" data-info=\'{"key1": "' + subject + '", "key2": "' + content + '", "key3": "' + select + '"}\'>';
	 	    var anchorString = '<a data-toggle="modal" data-target="#myModal" data-info=\'{"key1": "' + $("#recipient-name").val() + '", "key2": "' + content + '", "key3": "' + $("#modalSelect").val() + '"}\'>';

	 	    console.log(anchorString);

	 	    // <td> 요소의 내용을 설정합니다.
	 	    $("tr:eq(1) td:eq(1)").text($("#modalSelect").val());
	 	    $("tr:eq(1) td:eq(2)").html(anchorString + $("#recipient-name").val() + '</a>');

	 	    // 모달을 숨깁니다.
	 	    $("#myModal").modal('hide');
	 	});
	 	
	 	// 추가 버튼 누르면 새로운 행 추가 하기
	 	$("#insertRow").on("click", function () {
// 	 	    // 새로운 행을 생성
// 	 	    var newRow = $("<tr></tr>");

// 	 	    // 각 열에 대한 데이터를 가져와서 새로운 셀을 생성하여 행에 추가
// 	 	    var selectValue = $("#myModal2 select").val();
// 	 	    var question = $("#myModal2 #recipient-name").val();
// 	 	    var content = $("#myModal2 #message-text").val();

// 	 	    // 이 예제에서는 각 열에 데이터를 추가하고 있습니다.
// 	 	    newRow.append("<td>" + 11 + "</td>");
// 	 	    newRow.append("<td>" + selectValue + "</td>");
// 	 	    newRow.append("<td>" + question + "</td>");
// // 	 	    newRow.append("<td>" + content + "</td>");
// 			newRow.append("<td>" + "</td>");
// 			newRow.append("<td>" + "</td>");

// 	 	    // 테이블의 맨 위에 행을 추가
// 	 	    $("table tbody").prepend(newRow);

// 	 	    // 모달 닫기
// 	 	    $("#myModal2").modal("hide");
	 	// 현재 테이블에 있는 행의 개수를 가져옴=>나중엔 DB에서 맥스넘버 + 1로 해야함.
	 	    var rowCount = $("table tbody tr").length;

	 	    // 새로운 행을 생성
	 	    var newRow = $("<tr></tr>");

	 	    // 각 열에 대한 데이터를 가져와서 새로운 셀을 생성하여 행에 추가
	 	    var selectValue = $("#myModal2 select").val();
	 	    var question = $("#myModal2 #recipient-name").val();
	 	    var content = $("#myModal2 #message-text").val();

	 	    // 새로운 행을 추가할 때는 현재 행의 개수를 기반으로 하여 숫자를 설정
	 	    newRow.append("<td>" + (rowCount + 1) + "</td>");
	 	    newRow.append("<td>" + selectValue + "</td>");
	 	    newRow.append("<td>" + question + "</td>");
	 	    newRow.append("<td></td>");
	 	    newRow.append("<td></td>");

	 	    // 테이블의 맨 위에 행을 추가
	 	    $("table tbody").prepend(newRow);

	 	    // 모달 닫기
	 	    $("#myModal2").modal("hide");
	 	});
	
</script>
  </body>
</html>