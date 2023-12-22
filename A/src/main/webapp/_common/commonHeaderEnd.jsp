<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    </head>

<body class="d-flex flex-column min-vh-100">

  <!-- ======= Header ======= -->
  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="../_a/main.jsp" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1>LATTE CINEMA</h1>
      </a>

      <nav id="navbar" class="navbar">
        <ul>
          <li class="dropdown"><a href="../_reservation/res1.jsp"><span>예매</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="../_reservation/res1.jsp">예매하기</a></li>
              <li><a href="#">상영시간표</a></li>
              <li><a href="#">할인안내</a></li>
            </ul>
          </li>
          
          <li class="dropdown"><a href="../_a/movie_home.jsp"><span>영화</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="../_a/movie_home.jsp">홈</a></li>
              <li><a href="../_a/movie_now.jsp">현재상영작</a></li>
              <li><a href="../_a/movie_will.jsp">상영예정작</a></li>
              <li><a href="../_a/movie_latte.jsp">옛날영화</a></li>
            </ul>
          </li>
          
          <li class="dropdown"><a href="../_cinema/cinema.jsp"><span>영화관</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li class="dropdown"><a href="#"><span>서울</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="#">건대입구</a></li>
                  <li><a href="#">김포공항</a></li>
                  <li><a href="#">서울대입구</a></li>
                  <li><a href="#">수유</a></li>
                  <li><a href="#">영등포</a></li>
                  <li><a href="#">합정</a></li>
                  <li><a href="#">홍대입구</a></li>
                </ul>
              </li>
              <li class="dropdown"><a href="#"><span>경기/인천</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="#">광교아울렛</a></li>
                  <li><a href="#">동탄</a></li>
                  <li><a href="#">부천</a></li>
                  <li><a href="#">부평</a></li>
                  <li><a href="#">수원</a></li>
                  <li><a href="#">안산</a></li>
                  <li><a href="#">의정부</a></li>
                  <li><a href="#">인천터미널</a></li>
                  <li><a href="#">평택</a></li>
                </ul>
              </li>
              <li class="dropdown"><a href="#"><span>충청/대전</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="#">당진</a></li>
                  <li><a href="#">대전</a></li>
                  <li><a href="#">서산</a></li>
                  <li><a href="#">서청주</a></li>
                  <li><a href="#">충주</a></li>
                </ul>
              </li>
              <li class="dropdown"><a href="#"><span>전라/광주</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="#">광주</a></li>
                  <li><a href="#">군산</a></li>
                  <li><a href="#">익산모현</a></li>
                  <li><a href="#">전주</a></li>
                  <li><a href="#">충장로</a></li>
                </ul>
              </li>
              <li class="dropdown"><a href="#"><span>경북/대구</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="#">경주</a></li>
                  <li><a href="#">구미공단</a></li>
                  <li><a href="#">대구광장</a></li>
                  <li><a href="#">동성로</a></li>
                  <li><a href="#">상주</a></li>
                  <li><a href="#">영천</a></li>
                  <li><a href="#">포항</a></li>
                </ul>
              </li>
              <li class="dropdown"><a href="#"><span>경남/부산/울산</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="#">거창</a></li>
                  <li><a href="#">김해부원</a></li>
                  <li><a href="#">동래</a></li>
                  <li><a href="#">마산</a></li>
                  <li><a href="#">부산명지</a></li>
                  <li><a href="#">부산본점</a></li>
                  <li><a href="cinema_seomyeon">서면</a></li>
                  <li><a href="#">센텀시티</a></li>
                  <li><a href="#">울산</a></li>
                  <li><a href="#">진해</a></li>
                  <li><a href="#">창원</a></li>
                </ul>
              </li>
              <li class="dropdown"><a href="#"><span>강원</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="#">남원주</a></li>
                  <li><a href="#">동해</a></li>
                  <li><a href="#">원주무실</a></li>
                  <li><a href="#">춘천</a></li>
                </ul>
              </li>
              <li class="dropdown"><a href="#"><span>제주</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="#">서귀포</a></li>
                  <li><a href="#">제주아라</a></li>
                  <li><a href="#">제주연동</a></li>
                </ul>
              </li>
            </ul>
          </li>

          
          <li class="dropdown"><a href="../_store/store.jsp"><span>스토어</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="../_store/store.jsp#store1">베스트</a></li>
              <li><a href="../_store/store.jsp#store2">관람권</a></li>
              <li><a href="../_store/store.jsp#store3">스낵음료</a></li>
            </ul>
          </li>
          
          <li class="dropdown"><a href="#"><span>고객지원</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="../_cs/cs_member.jsp">멤버십</a></li>
              <li><a href="../_cs/cs_center.jsp">고객센터</a></li>
              <li><a href="../_cs/cs_rent.jsp">단체관람/대관문의</a></li>
            </ul>
          </li>
        </ul>
      </nav><!-- .navbar -->

      <div class="position-relative">
        <a href="#" class="mx-2 js-search-open"></a>	<!-- **의미없음. 오류 없애기 위한 태그일 뿐 -->
        <a href="../_member/login.jsp" class="mx-2">로그인</a>  				<!-- **로그인 세션 있으면 로그아웃으로 변경 -->
        <a href="../_member/signup3.jsp" class="mx-2">회원가입</a> 				<!-- **로그인 세션 있으면 마이페이지로 변경 -->
        <a href="../_mypage/myPage.jsp" class="mx-2">마이페이지</a>
        <a href="../_member/logout.jsp" class="mx-2">로그아웃</a>
        
        <i class="bi bi-list mobile-nav-toggle"></i>

<!--         ======= Search Form ======= -->
        <div class="search-form-wrap js-search-form-wrap">
          <form action="search-result.html" class="search-form">
            <span class="icon bi-search"></span>
            <input type="text" placeholder="Search" class="form-control">
            <button class="btn js-search-close"><span class="bi-x"></span></button>
          </form>
        </div> <!-- End Search Form -->
		

      </div>

    </div>

  </header><!-- End Header -->