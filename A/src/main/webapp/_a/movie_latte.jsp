<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../_common/commonHeader.jsp"%>

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
              <a href="single-post.html"><img src="../assets/img/post20.jpg" alt="" class="img-fluid" style="width: 100%;"></a>
              <div class="post-meta"><span class="date">영화제목1</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '97</span></div>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="post-entry-1 lg">
              <a href="single-post.html"><img src="../assets/img/post21.jpg" alt="" class="img-fluid" style="width: 100%;"></a>
              <div class="post-meta"><span class="date">영화제목2</span> <span class="mx-1">&bullet;</span> <span>Jan 15th '99</span></div>
            </div>
          </div>
          
          <div class="col-lg-4">
            <div class="post-entry-1 lg">
              <a href="single-post.html"><img src="../assets/img/post22.jpg" alt="" class="img-fluid" style="width: 100%;"></a>
              <div class="post-meta"><span class="date">영화제목3</span> <span class="mx-1">&bullet;</span> <span>Feb 7th '02</span></div>
            </div>
          </div>

        </div> <!-- End .row -->
      </div>
    </section><!-- End Lifestyle Category Section -->
    
    
    
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
						<label for="vote-1"><img src="../assets/img/post6.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
						<div><label for="vote-1"><span>말하고싶은 비밀</span> <span>&bullet;</span> <span>홍길동</span></label></div>
					</div>
				</div>
				<div class="col-lg">
					<div class="post-entry-1 lg">
						<div>
							<input type="radio" id="vote-2" name="vote">
							<label for="vote-2"><span class="date">후보 2</span></label>
						</div>
						<label for="vote-2"><img src="../assets/img/post7.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
						<div><label for="vote-2"><span>괴물</span> <span>&bullet;</span> <span>홍길동</span></label></div>
					</div>
				</div>
				<div class="col-lg">
					<div class="post-entry-1 lg">
						<div>
							<input type="radio" id="vote-3" name="vote">
							<label for="vote-3"><span class="date">후보 3</span></label>
						</div>
						<label for="vote-3"><img src="../assets/img/post8.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
						<div><label for="vote-3"><span>쏘우</span> <span>&bullet;</span> <span>제임스완</span></label></div>
					</div>
				</div>
				<div class="col-lg">
					<div class="post-entry-1 lg">
						<div>
							<input type="radio" id="vote-4" name="vote">
							<label for="vote-4"><span class="date">후보 4</span></label>
						</div>
						<label for="vote-4"><img src="../assets/img/post9.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
						<div><label for="vote-4"><span>싱글인서울</span> <span>&bullet;</span> <span>홍길동</span></label></div>
					</div>
				</div>
				<div class="col-lg">
					<div class="post-entry-1 lg">
						<div>
							<input type="radio" id="vote-5" name="vote">
							<label for="vote-5"><span class="date">후보 5</span></label>
						</div>
						<label for="vote-5"><img src="../assets/img/post10.jpg" alt="" class="img-fluid" style="width: 100%;"></label>
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