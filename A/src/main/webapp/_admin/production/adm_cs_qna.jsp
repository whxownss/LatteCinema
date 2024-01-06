<%@page import="com.itwillbs.domain.QnaBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<%
ArrayList<QnaBoardDTO> qnaBoardList = (ArrayList<QnaBoardDTO>)request.getAttribute("qnaBoardList");
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
          
            <div class="page-title">
              <div class="title_left">
              </div>
            </div>

						  <!-- Modal -->
			 <form action="updateQnaBoard2.cs" method="get" name="frChange"> 
			  <div class="modal fade" id="myModal" role="dialog">
			    <div class="modal-dialog">
<!-- 			    <button type="button" class="btn-close" aria-label="Close"></button> -->
			      <!-- Modal content-->
			      <div class="modal-content">
				      <div class="modal-header">
				      <input type="hidden" name="responseUser" value="${sessionScope.sId }">
				      <input type="hidden" id="qnaUser" name="createUser" value="">
				      <input type="hidden" id="qnaDate" name="createDate" value="">
				      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				        <h5 class="modal-title" id="exampleModalLabel">1:1문의사항</h5>
				        <input type="text" value="" id="qnaCategory" name="qnaCategory" readonly>
				      </div>
				      <div class="modal-body">
<!-- 				        <form> -->
				          <div class="mb-3">
				            <label for="recipient-name" class="col-form-label">제목</label>
				            <input type="text" class="form-control" id="recipient-name" name="qnaSubject" value="" readonly>
				          </div>
				          <div class="mb-3">
				            <label for="message-text" class="col-form-label">내용</label>
				            <textarea class="form-control" id="message-text" name="qnaContent" readonly></textarea>
				          </div>
				          <div class="mb-3">
				            <label for="message-text" class="col-form-label">문의답변</label>
				            <textarea class="form-control" id="qnaResponse" name="qnaResponse"></textarea>
				          </div>
<!-- 				        </form> -->
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-danger" id="deleteQnaBoard">삭제</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">나가기</button>
				        <button type="submit" id="modalRewrite" class="btn btn-primary">수정</button>
				      </div>
			    </div>
			  </div>
			  
			</div>
		 </form>

            <div class="clearfix"></div>

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>1:1문의 목록</h2>
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
                          <th>카테고리</th>
                          <th>글 제목</th>
                          <th>회원명</th>
                          <th>등록일</th>
                          <th>답변자</th>
                          <th>답변일</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="qnaBoardDTO" items="${qnaBoardList }">
                      	<tr>
                      		<td>${qnaBoardDTO.rn }</td>
                      		<td>${qnaBoardDTO.qnaCategory }</td>
<%--                       		<td><a href="cs_qna_content.cs?createUser=${qnaBoardDTO.createUser }&createDate=${qnaBoardDTO.createDate}">${qnaBoardDTO.qnaSubject }</a></td> --%>
                      		<td><a data-toggle="modal" data-target="#myModal" data-info='{"key1": "${qnaBoardDTO.qnaSubject}", "key2": "${qnaBoardDTO.qnaContent}", "key3": "${qnaBoardDTO.qnaCategory}", "key4": "${qnaBoardDTO.createUser}", "key5": "${qnaBoardDTO.createDate}", "key6": "${qnaBoardDTO.qnaResponse}"}'>${qnaBoardDTO.qnaSubject}</a></td>
<%--                       		<td><a data-toggle="modal" data-target="#myModal" >${qnaBoardDTO.qnaSubject}</a></td> --%>
                      		<td>${qnaBoardDTO.createUser }</td>
                      		<td>${qnaBoardDTO.createDate }</td>
                      		<td>${qnaBoardDTO.responseUser }</td>
                      		<td>${qnaBoardDTO.responseDate }</td>
                      	</tr>	
                      	</c:forEach>
                        
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
	$("tr a[data-toggle='modal']").on("click", function () {
// 		debugger; // 문제점은 공지사항 내용쪽 텍스트가 공백이 너무 많아서 터져버림.
	    // data-info 속성에서 JSON 데이터 가져오기
	    var infoData = $(this).data("info");
	    console.log(typeof infoData); //1번째 글은 Object타입, 서면입력글은 string으로 잡힘.
	    
	    //Object면 String으로 바꾸고 String이면 그냥 통과해서 replaceAll 가능하게 함.
	    if(typeof infoData != 'string'){
	    	infoData = JSON.stringify(infoData);	
	    }
		
	    if (infoData.includes("\n")) {
	        // \n이 포함되어 있다면, replaceAll을 사용하여 모두 제거
	        infoData = infoData.replaceAll("\n", "");
	    }
	    if (infoData.includes("\t")) {
	    	infoData = infoData.replaceAll("\t", "");
	    }
// 	    infoData = infoData.replaceAll("\n", "");
// 	    infoData = infoData.replaceAll("\t", "");
	    infoData = JSON.parse(infoData);
	
	    // 필요한 정보 추출
	    var key1 = infoData.key1;
	    var key2 = infoData.key2;
	    var key3 = infoData.key3;
	    var key4 = infoData.key4;
	    var key5 = infoData.key5;
	    var key6 = infoData.key6;
	
	    // 추출한 정보를 출력하거나 다른 작업 수행
	    console.log("Key1:", key1);
	    console.log("Key2:", key2);
	    console.log("Key3:", key3);
	    console.log("Key4:", key4);
	    console.log("Key5:", key5);
	    console.log("Key6:", key6);
	
        if (infoData) {
            // 필요한 정보 추출
            $("#qnaCategory").val(infoData.key3); // 
            $("#recipient-name").val(infoData.key1); // a 태그에서 가져온 정보
            $("#message-text").text(infoData.key2); // a 태그에서 가져온 정보
            $("#qnaUser").val(infoData.key4);
            $("#qnaDate").val(infoData.key5);
            $("#qnaResponse").val(infoData.key6);
        } else {
            console.log("data-info not found");
        }
	    // 또는 다른 작업을 수행
	    // 예를 들어, 모달을 열거나 다른 페이지로 이동
	});//tr 누르면 모달 토글		
	
	</script>
  </body>
</html>