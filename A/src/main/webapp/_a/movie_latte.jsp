<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>>
	<link rel="stylesheet" href="_assets/css/hover.css">
<%@include file ="../_common/commonHeaderEnd.jsp" %>

<main id="main">

	<%@include file="../_common/commonMovieSlide.jsp"%>

	<!-- ======= Culture Category Section ======= -->
    <section class="category-section">
      <div class="container" data-aos="fade-up">

        <div class="section-header d-flex justify-content-between align-items-center mb-5">
          <h3>1월의 라떼..</h3>
        </div>

        <div class="row g-5">
	          <div class="col-lg-4">
	            <div class="post-entry-1 lg">
              <div class="item position-relative" id="wrap">
			          <img src="assets/img/post20.jpg" style="width: 100%;">
						<div class="titlee">
							<a href="" class="moree">예매하기</a>
							<a href="" class="moree">상세정보</a>
						</div>
		        	</div>
              <div class="post-meta"><span class="date">영화제목1</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '97</span></div>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="post-entry-1 lg">
              <div class="item position-relative" id="wrap">
			          <img src="assets/img/post21.jpg" style="width: 100%;">
						<div class="titlee">
							<a href="" class="moree">예매하기</a>
							<a href="" class="moree">상세정보</a>
						</div>
		        	</div>
              <div class="post-meta"><span class="date">영화제목2</span> <span class="mx-1">&bullet;</span> <span>Jan 15th '99</span></div>
            </div>
          </div>
          
          <div class="col-lg-4">
            <div class="post-entry-1 lg">
              <div class="item position-relative" id="wrap">
			          <img src="assets/img/post22.jpg" style="width: 100%;">
						<div class="titlee">
							<a href="" class="moree">예매하기</a>
							<a href="" class="moree">상세정보</a>
						</div>
		        	</div>
              <div class="post-meta"><span class="date">영화제목3</span> <span class="mx-1">&bullet;</span> <span>Feb 7th '02</span></div>
            </div>
          </div>

        </div> <!-- End .row -->
      </div>
    </section><!-- End Lifestyle Category Section -->
    
    
    <script>
  function vote() {
    // Check if user has voted in January or February 2024
    if (hasVotedInJanuaryOrFebruary()) {
      alert('2024년 1월 또는 2월에 이미 투표하셨습니다. 재투표는 불가합니다.');
      return;
    }

    // Get the selected radio button value
    var selectedCandidate = document.querySelector('input[name="vote"]:checked');

    // Check if a candidate is selected
    if (selectedCandidate) {
      // Log the selected candidate value (you can replace this with your own logic)
      console.log('투표한 후보:', selectedCandidate.id);

      // Disable the vote button to prevent multiple votes
      document.getElementById('voteButton').disabled = true;

      // Record the date of the current vote
      recordVoteDate();

      alert('투표가 완료되었습니다!');
    } else {
      // Alert if no candidate is selected
      alert('투표할 후보를 선택하세요!');
    }
  }

  function hasVotedInJanuaryOrFebruary() {
    // Retrieve the last vote date from cookies or local storage
    var lastVoteDate = localStorage.getItem('lastVoteDate');

    // Check if there is a last vote date and if it is in January or February 2024
    if (lastVoteDate) {
      var lastVoteMonth = new Date(lastVoteDate).getMonth();
      return lastVoteMonth === 0 || lastVoteMonth === 1;
    }

    return false;
  }

  function recordVoteDate() {
    // Record the current date as the last vote date in cookies or local storage
    var currentDate = new Date();
    localStorage.setItem('lastVoteDate', currentDate.toISOString());
  }
</script>
    
    
    <section class="category-section" id="vote">
		<div class="container" data-aos="fade-up">
			<div
				class="section-header d-flex justify-content-between align-items-center mb-5">
				<h3>익월의 라떼 투표</h3>
				<div>
					<input type="submit" value="투표"	 class="btn btn-secondary p-1">
				</div>
			</div>

			<div class="row g-5">
				<div class="col-lg">
					<div class="post-entry-1 lg">
						<div>
							<input type="radio" id="vote-1" name="vote">
							<label for="vote-1"><span class="date">후보 1</span></label>
						</div>
						<label for="vote-1"><img src="assets/img/post6.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
						<div><label for="vote-1"><span>말하고싶은 비밀</span> <span>&bullet;</span> <span>홍길동</span></label></div>
					</div>
				</div>
				<div class="col-lg">
					<div class="post-entry-1 lg">
						<div>
							<input type="radio" id="vote-2" name="vote">
							<label for="vote-2"><span class="date">후보 2</span></label>
						</div>
						<label for="vote-2"><img src="assets/img/post7.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
						<div><label for="vote-2"><span>괴물</span> <span>&bullet;</span> <span>홍길동</span></label></div>
					</div>
				</div>
				<div class="col-lg">
					<div class="post-entry-1 lg">
						<div>
							<input type="radio" id="vote-3" name="vote">
							<label for="vote-3"><span class="date">후보 3</span></label>
						</div>
						<label for="vote-3"><img src="assets/img/post8.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
						<div><label for="vote-3"><span>쏘우</span> <span>&bullet;</span> <span>제임스완</span></label></div>
					</div>
				</div>
				<div class="col-lg">
					<div class="post-entry-1 lg">
						<div>
							<input type="radio" id="vote-4" name="vote">
							<label for="vote-4"><span class="date">후보 4</span></label>
						</div>
						<label for="vote-4"><img src="assets/img/post9.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
						<div><label for="vote-4"><span>싱글인서울</span> <span>&bullet;</span> <span>홍길동</span></label></div>
					</div>
				</div>
				<div class="col-lg">
					<div class="post-entry-1 lg">
						<div>
							<input type="radio" id="vote-5" name="vote">
							<label for="vote-5"><span class="date">후보 5</span></label>
						</div>
						<label for="vote-5"><img src="assets/img/post10.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
						<div><label for="vote-5"><span>나폴레옹</span> <span>&bullet;</span> <span>홍길동</span></label></div>
					</div>
				</div>
			</div>
			<!-- End .row -->
		</div>
	</section>
	<!-- End Lifestyle Category Section -->
	
	<section class="category-section" id="vote">
  <div class="container" data-aos="fade-up">
    <div class="section-header d-flex justify-content-between align-items-center mb-5">
      <h3>익월의 라떼 투표</h3>
      <div>
        <input type="submit" value="투표" class="btn btn-secondary p-1" onclick="vote()" id="voteButton">
      </div>
    </div>

    <div class="row g-5">
      <!-- Add your candidate entries here -->
    </div>
  </div>
</section>



</main>

<%@include file="../_common/commonFooter.jsp"%> --%>




<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>>
  <link rel="stylesheet" href="_assets/css/hover.css">
<%@include file ="../_common/commonHeaderEnd.jsp" %>

<main id="main">

  <%@include file="../_common/commonMovieSlide.jsp"%>

  <!-- ======= Culture Category Section ======= -->
  <section class="category-section">
    <div class="container" data-aos="fade-up">

      <div class="section-header d-flex justify-content-between align-items-center mb-5">
        <h3>1월의 라떼..</h3>
      </div>

      <div class="row g-5">
        <div class="col-lg-4">
          <div class="post-entry-1 lg">
            <div class="item position-relative" id="wrap">
              <img src="assets/img/post20.jpg" style="width: 100%;">
              <div class="titlee">
                <a href="" class="moree">예매하기</a>
                <a href="" class="moree">상세정보</a>
              </div>
            </div>
            <div class="post-meta"><span class="date">영화제목1</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '97</span></div>
          </div>
        </div>

        <div class="col-lg-4">
          <div class="post-entry-1 lg">
            <div class="item position-relative" id="wrap">
              <img src="assets/img/post21.jpg" style="width: 100%;">
              <div class="titlee">
                <a href="" class="moree">예매하기</a>
                <a href="" class="moree">상세정보</a>
              </div>
            </div>
            <div class="post-meta"><span class="date">영화제목2</span> <span class="mx-1">&bullet;</span> <span>Jan 15th '99</span></div>
          </div>
        </div>

        <div class="col-lg-4">
          <div class="post-entry-1 lg">
            <div class="item position-relative" id="wrap">
              <img src="assets/img/post22.jpg" style="width: 100%;">
              <div class="titlee">
                <a href="" class="moree">예매하기</a>
                <a href="" class="moree">상세정보</a>
              </div>
            </div>
            <div class="post-meta"><span class="date">영화제목3</span> <span class="mx-1">&bullet;</span> <span>Feb 7th '02</span></div>
          </div>
        </div>

      </div> <!-- End .row -->
    </div>
  </section><!-- End Lifestyle Category Section -->

  <script>
    function vote() {
      // Check if user has voted in January or February 2024
      if (hasVotedInJanuaryOrFebruary()) {
        alert('3월 상영작에 이미 투표하셨습니다. 5월 상영작에 투표 가능합니다.');
        return;
      }

      // Get the selected radio button value
      var selectedCandidate = document.querySelector('input[name="vote"]:checked');

      // Check if a candidate is selected
      if (selectedCandidate) {
        // Log the selected candidate value (you can replace this with your own logic)
        console.log('투표한 후보:', selectedCandidate.id);

        // Disable the vote button to prevent multiple votes
        document.getElementById('voteButton').disabled = true;

        // Record the date of the current vote
        recordVoteDate();

        alert('투표가 완료되었습니다!');
      } else {
        // Alert if no candidate is selected
        alert('투표할 후보를 선택하세요!');
      }
    }

    function hasVotedInJanuaryOrFebruary() {
      // Retrieve the last vote date from cookies or local storage
      var lastVoteDate = localStorage.getItem('lastVoteDate');

      // Check if there is a last vote date and if it is in January or February 2024
      if (lastVoteDate) {
        var lastVoteMonth = new Date(lastVoteDate).getMonth();
        return lastVoteMonth === 0 || lastVoteMonth === 1;
      }

      return false;
    }

    function recordVoteDate() {
      // Record the current date as the last vote date in cookies or local storage
      var currentDate = new Date();
      localStorage.setItem('lastVoteDate', currentDate.toISOString());
    }
  </script>

  <section class="category-section" id="vote">
    <div class="container" data-aos="fade-up">
      <div class="section-header d-flex justify-content-between align-items-center mb-5">
        <h3>라떼 무비 - 3월의 상영 유력 후보</h3>
       <!--  <div>
          <input type="submit" value="투표" class="btn btn-secondary p-1" onclick="vote()" id="voteButton">
        </div> -->
      </div> 

      <div class="row g-5">
        <div class="col-lg">
          <div class="post-entry-1 lg">
           <!--  <div>
              <input type="radio" id="vote-1" name="vote">
              <label for="vote-1"><span class="date">후보 1</span></label>
            </div> -->
            <label for="vote-1"><img src="assets/img/post6.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
            <div><label for="vote-1"><span>말하고싶은 비밀</span> <span>&bullet;</span> <span>홍길동</span></label></div>
          </div>
        </div>
        <div class="col-lg">
          <div class="post-entry-1 lg">
           <!--  <div>
              <input type="radio" id="vote-2" name="vote">
              <label for="vote-2"><span class="date">후보 2</span></label>
            </div> -->
            <label for="vote-2"><img src="assets/img/post7.jpg" alt="" class="class="img-fluid" style="width: 100%;"></label>
						<div><label for="vote-2"><span>괴물</span> <span>&bullet;</span> <span>홍길동</span></label></div>
					</div>
				</div>
				<div class="col-lg">
					<div class="post-entry-1 lg">
						<!-- <div>
							<input type="radio" id="vote-3" name="vote">
							<label for="vote-3"><span class="date">후보 3</span></label>
						</div> -->
						<label for="vote-3"><img src="assets/img/post8.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
						<div><label for="vote-3"><span>쏘우</span> <span>&bullet;</span> <span>제임스완</span></label></div>
					</div>
				</div>
				<div class="col-lg">
					<div class="post-entry-1 lg">
						<!-- <div>
							<input type="radio" id="vote-4" name="vote">
							<label for="vote-4"><span class="date">후보 4</span></label>
						</div> -->
						<label for="vote-4"><img src="assets/img/post9.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
						<div><label for="vote-4"><span>싱글인서울</span> <span>&bullet;</span> <span>홍길동</span></label></div>
					</div>
				</div>
				<div class="col-lg">
					<div class="post-entry-1 lg">
						<!-- <div>
							<input type="radio" id="vote-5" name="vote">
							<label for="vote-5"><span class="date">후보 5</span></label>
						</div> -->
						<label for="vote-5"><img src="assets/img/post10.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
						<div><label for="vote-5"><span>나폴레옹</span> <span>&bullet;</span> <span>홍길동</span></label></div>
					</div>
				</div>
			</div>
			<!-- End .row -->
		</div>
	</section>
	<!-- End Lifestyle Category Section -->
	



</main>

<%@include file="../_common/commonFooter.jsp"%>
