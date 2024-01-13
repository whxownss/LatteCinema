<%@page import="com.itwillbs.domain.MemberDTO"%>
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
<%
ArrayList<MemberDTO> memberList = (ArrayList<MemberDTO>)request.getAttribute("memberList");
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
                  <li><a href="adm_cinema.ad"><i class="fa fa-beer"></i>영화관 관리</a></li>
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

            <div class="clearfix"></div>

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Member Management</h2>
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
                          <th>회원 아이디</th>
                          <th>이름</th>
                          <th>주소</th>
                          <th>생년월일</th>
                          <th>가입일</th>
                          <th>핸드폰 번호</th>
                          <th>E-mail</th>
                          <th>정지여부</th>
                          <th>정지일</th>
                        </tr>
                      </thead>
                      <tbody id="tbody">
                      	<c:forEach var="memberDTO" items="${memberList }">
                      	<tr>
                      		<td>${memberDTO.memId }</td>
                      		<td>${memberDTO.memName }</td>
                      		<td>${memberDTO.memAddress }</td>
                      		<td>${memberDTO.memBirthD }</td>
                      		<td>${memberDTO.memJoinD }</td>
                      		<td>${memberDTO.memPhone }</td>
                      		<td>${memberDTO.memEmail }</td>
	                          <td>
<!-- 								<select> -->
<%-- 									<c:if test="${memberDTO.memStatus eq 0 }"> --%>
<!-- 										<option value="0" selected>N</option> -->
<!-- 										<option value="1">Y</option> -->
<%-- 									</c:if> --%>
<%-- 									<c:if test="${memberDTO.memStatus eq 1 }"> --%>
<!-- 										<option value="0">N</option> -->
<!-- 										<option value="1" selected>Y</option> -->
<%-- 									</c:if> --%>
<!-- 								</select> -->
									<c:if test="${memberDTO.memStatus eq 0 }">
										<a>No</a>
									</c:if>
									<c:if test="${memberDTO.memStatus eq 1 }">
										<a>Yes</a>
									</c:if>
							  </td>
							  <td>${memberDTO.memStopD }</td>
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
$(document).ready(function() {
	
});//document ready 끝
	$("#datatable-responsive tbody").on("click","tr a",function(e) {
	    e.preventDefault(); // 앵커 태그의 기본 동작을 막습니다.
	    // 클릭한 앵커 태그와 연관된 가장 가까운 테이블 행 (tr)을 찾습니다.
	    var $row = $(this).closest("tr");
	    // 해당 행 안에 있는 'memId' 셀의 텍스트 내용
	    var memId = $row.find("td:first-child").text();
	    // 이제 'memId' 변수에 클릭된 행의 'memId'가 포함되어 있습니다.
	    //alert("클릭한 memId: " + memId);
	    // 클릭한 앵커 태그의 텍스트 내용을 가져옵니다.
	    var memStatusText = $(this).text();
	    // 이제 'clickedText' 변수에 클릭한 앵커 태그의 텍스트가 포함되어 있습니다.
	    //alert("클릭한 앵커 태그의 텍스트: " + memStatus);
	    
	    // 데이터를 JavaScript 객체에 저장합니다.
	    var msg = '';
	    var memStatus = '1';
	    if(memStatusText === 'Yes'){
	    	msg = '해제';
	    	memStatus = '0';
	    }
	    
	    var data = {
	      memId: memId,
	      memStatus: memStatus
	    };
	    if(!confirm(memId+'회원을 정지'+msg+' 하시겠습니까?')){
	    	alert('취소하셨습니다.');	
	    	return;
	    }
		// AJAX 요청을 생성
	    $.ajax({
	      type: "POST",
	      url: "memStatusChange.ad",
	      data: data, // 전송할 데이터
	      success: function(response) {
	        console.log("데이터 전송 완료");
	        //window.location.href="adm_member.me";
	        // 두 번째 AJAX 요청
	        $.ajax({
        	  type: "GET",
        	  url: "adm_member.ad",
        	  data: { memStatusText: memStatusText },
        	  dataType: "json", //dataType을 명시적으로 설정하여 JSON 데이터로 처리
        	  success: function(userList) {
        		  $('#tbody').empty();
        		  userList.forEach(function(user){
        		      var memId = user.memId;
        		      var memName = user.memName;
        		      var memAddress = user.memAddress;
        		      var memBirthD = user.memBirthD;
        		      var memJoinD = user.memJoinD;
        		      var memPhone = user.memPhone;
        		      var memEmail = user.memEmail;
        		      var memStatus = user.memStatus;
        		      if(memStatus == '0'){
        		    	  memStatus = 'No';
        		      } else {
        		    	  memStatus = 'Yes';
        		      }
        		      var memStopD = user.memStopD;
        		      
        		      var newRow = $('<tr></tr>');
        		      newRow.append($('<td></td>').text(memId));  
        		      newRow.append($('<td></td>').text(memName));  
        		      newRow.append($('<td></td>').text(memAddress));  
        		      newRow.append($('<td></td>').text(memBirthD));  
        		      newRow.append($('<td></td>').text(memJoinD));  
        		      newRow.append($('<td></td>').text(memPhone));  
        		      newRow.append($('<td></td>').text(memEmail));  
        		      newRow.append($('<td></td>').html("<a>"+memStatus+"</a>"));  
        		      newRow.append($('<td></td>').text(memStopD));  
        		      $('#tbody').append(newRow);

        		  });
        	  },
        	  error: function() {
        	    console.error("데이터 요청 실패");
        	  }
        	});
	      },
	      error: function() {
	        // 요청이 실패한 경우 실행할 코드를 여기에 작성
	        console.error("데이터 전송 실패");
	      }
	    });
	    
	});//datatable-responsive tbody tr a 끝


</script>

  </body>
</html>