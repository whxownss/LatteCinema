<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>



  <main id="main">

    <%@include file="../_common/commonMovieSlide.jsp"%>

	<section class="category-section">
		<div class="container" data-aos="fade-up">
		  <div class="section-header d-flex justify-content-between align-items-center mb-5">
	        <h2>박스오피스</h2>
	        <div><a href="movie_now.jsp" class="more">2023.12.11 기준</a></div>
	      </div>
		
	      <div class="container" data-aos="fade-up">
			<div class="owl-carousel owl-theme">
		        <div class="item">
		          <img src="../assets/img/post1.jpg" >
		        </div>
		        <div class="item">
		          <img src="../assets/img/post2.jpg">
		        </div>
		        <div class="item">
		          <img src="../assets/img/post3.jpg">
		        </div>
		        <div class="item">
		          <img src="../assets/img/post4.jpg">
		        </div>
		        <div class="item">
		          <img src="../assets/img/post5.jpg">
		        </div>
		        <div class="item">
		          <img src="../assets/img/post6.jpg">
		        </div>
		        <div class="item">
		          <img src="../assets/img/post7.jpg">
		        </div>
		        <div class="item">
		          <img src="../assets/img/post8.jpg">
		        </div>
		        <div class="item">
		          <img src="../assets/img/post9.jpg">
		        </div>
		        <div class="item">
		          <img src="../assets/img/post10.jpg">
		        </div>
		        <div class="item">
		          <img src="../assets/img/post11.jpg">
		        </div>
		        <div class="item">
		          <img src="../assets/img/post12.jpg">
		        </div>
		     </div>
	       </div>
       </div>
     </section>
	    
    

    <!-- ======= Culture Category Section ======= -->
    <section class="category-section">
      <div class="container" data-aos="fade-up">

        <div class="section-header d-flex justify-content-between align-items-center mb-5">
          <h2>라떼는 말이야..</h2>
          <div><a href="movie_latte.jsp#vote" class="more">투표하러가기 &gt;</a></div>
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
    
	

    

    <!-- ======= Lifestyle Category Section ======= -->
    <section class="category-section">
      <div class="container" data-aos="fade-up">

        <div class="section-header d-flex justify-content-between align-items-center mb-5">
          <h2>공지사항</h2>
          <div><a href="category.html" class="more">더보기 &gt;</a></div>
        </div>

        <div class="row g-5">
           <div class="col-lg-12">

             <div class="post-entry-1 border-bottom">
               <div class="post-meta"><span>Jul 5th '22</span></div>
               <h2 class="mb-2"><a href="single-post.html">공지내용1공지내용1공지내용1공지내용1공지내용1공지내용1공지내용1공지내용1</a></h2>
             </div>

             <div class="post-entry-1 border-bottom">
               <div class="post-meta"><span>Jul 5th '22</span></div>
               <h2 class="mb-2"><a href="single-post.html">공지내용2공지내용2공지내용2공지내용2공지내용2공지내용2공지내용2공지내용2</a></h2>
             </div>

             <div class="post-entry-1 border-bottom">
               <div class="post-meta"><span>Jul 5th '22</span></div>
               <h2 class="mb-2"><a href="single-post.html">공지내용3공지내용3공지내용3공지내용3공지내용3공지내용3공지내용3공지내용3</a></h2>
             </div>
           </div>

        </div> <!-- End .row -->
      </div>
    </section><!-- End Lifestyle Category Section -->

	 
	
  </main><!-- End #main -->


	<script src="../owlcarousel/jquery.min.js"></script>
	<script src="../owlcarousel/jquery.mousewheel.min.js"></script>
	<script src="../owlcarousel/owl.carousel.min.js"></script>	
	<script>
            $(document).ready(function() {
              var owl = $('.owl-carousel');
              owl.owlCarousel({
                loop: true,
                nav: true,
                margin: 10,
                responsive: {
                  0: {
                    items: 1
                  },
                  600: {
                    items: 3
                  },
                  960: {
                    items: 5
                  },
                  1200: {
                    items: 6
                  }
                }
              });
              owl.on('mousewheel', '.owl-stage', function(e) {
                if (e.deltaY > 0) {
                  owl.trigger('next.owl');
                } else {
                  owl.trigger('prev.owl');
                }
                e.preventDefault();
              });
            })
          </script>

  

<%@include file ="../_common/commonFooter.jsp" %>