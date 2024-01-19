   /* Bootstrap */
 
 
document.write('<script type="text/javascript" src="_admin/vendors/bootstrap/dist/js/bootstrap.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/fastclick/lib/fastclick.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/nprogress/nprogress.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/iCheck/icheck.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/moment/min/moment.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/datatables.net/js/jquery.dataTables.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>'); 
document.write('<script type="text/javascript" src="_admin/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/jszip/dist/jszip.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/pdfmake/build/pdfmake.min.js"></script>');
document.write('<script type="text/javascript" src="_admin/vendors/pdfmake/build/vfs_fonts.js"></script>');
document.write('<script type="text/javascript" src="_admin/build/js/custom.min.js"></script>');
document.write('<script type="text/javascript" '+ 
                  'src="/' + window.location.pathname.split("/")[1] + '/_assets/js/admJS/adm_mv_inoutVarFunc.js"></script>');      
  
   $(function(){
    /* 검색창 엔터 활성화 */
     $('.input-movie-title').keypress(function(e){
       if(e.which == 13) {
         openSearchMovie();
       }
     });
    
    /* 저장 모달*/
     $('#movieModal').on('show.bs.modal', function (event) {

    	debugger;
       var button    = $(event.relatedTarget)
       var modal = $(this)
       var movieCode = button.data('moviecode')
       
       var category  = button.data('category')
       var title     = button.data('title')
       var opendate  = button.data('opendate')
       var rating    = button.data('rating')
       var runtime   = button.data('runtime')
       var filmMade  = button.data('filmmade')
       var nation    = button.data('nation')
       var synopsis  = button.data('synopsis')
       var director  = button.data('director')
       var genre     = button.data('genre')
       var poster    = button.data('poster')
       var actor     = button.data('actor')
       var rating    = button.data('rating')
       var stillcut  = button.data('stillcut')
       var startdate = moment().format('YYYY-MM-DD')
       var enddate   = moment(startdate).add(30,'days').format('YYYY-MM-DD')    	   
   	   var rating    = button.data('rating')
       
       if(category === "NOW"){
         const result = detailSearch(title)
         var info = result.Data[0].Result[0];
         filmMade = info.company;
         poster = info.posters.split('|')[0];
         nation = info.nation;
         synopsis = info.plots.plot[0].plotText;
         rating = info.rating.includes("전체")? "all" :
                       info.rating.includes("12")  ? "12"  : 
                       info.rating.includes("15")  ? "15"  :
                       info.rating.includes("18")  ? "18"  : "";
         director = info.directors.director[0].directorNm;
         runtime = info.runtime;
         genre = info.genre;
         const actorArr = [];
         let count = info.actors.actor.length > 3 ? 3 : info.actors.actor.length;
         for(let i = 0; i < count ; i++){
           actorArr.push(info.actors.actor[i].actorNm);
         }
         actor = actorArr.join(', ');
         stillcut = info.stlls.replace(/thm\/01/g, "still").replace(/tn_/g,"").replace(/.jpg|.JPG/g,"_01.jpg");
      //검색일때 영화코드 조회 
       }else if(category === "OLD"){
         searchMovieIndex()
       }
       
       modal.find('#movie-title').val(title.replaceAll('  ', ' '))
       modal.find('#movie-opendate').val(opendate)
       modal.find('#movie-moviecode').val(movieCode)
       modal.find('#movie-genre').val(genre)
       modal.find('#movie-rating').val(rating)
       modal.find('#movie-runtime').val(runtime)
       modal.find('#movie-filmmade').val(filmMade)
       modal.find('#movie-nation').val(nation)
       modal.find('#movie-startdate').val(startdate)   //상영일(startdate) : 개봉일(opendate)을 디폴트값으로 넣었음
       modal.find('#movie-enddate').val(enddate)
       modal.find('#movie-synopsis').val(synopsis)
       modal.find('#movie-director').val(director)
       modal.find('#movie-poster').val(poster)
       modal.find('#movie-actor').val(actor)
       modal.find('#movie-category').val(category)
       modal.find('#movie-stillcut').val(stillcut)
       modal.find('#movie-preview').attr('src',poster) //포스터 미리보기 삽입
       
     })
    /* 수정 모달*/
     $('#modifyModal').on('show.bs.modal', function (event) {

       var button    = $(event.relatedTarget)
       var movieCode = button.data('moviecode')
       var modal = $(this)
       
       $.ajax({
         url : 'movie_detail.mo',
         type : 'GET',
         data : {movieCode:movieCode},
         async : false,
         success : function(movie){
           modal.find('#movie-title2').val(movie.title.replaceAll('  ', ' '))
           modal.find('#movie-opendate2').val(movie.openDate)
           modal.find('#movie-moviecode2').val(movieCode)
           modal.find('#movie-genre2').val(movie.genre)
           modal.find('#movie-rating2').val(movie.rating)
           modal.find('#movie-runtime2').val(movie.runTime)
           modal.find('#movie-filmmade2').val(movie.filmMade)
           modal.find('#movie-nation2').val(movie.nation)
           modal.find('#movie-startdate2').val(movie.startdate)   //상영일(startdate) : 개봉일(opendate)을 디폴트값으로 넣었음
           modal.find('#movie-enddate2').val(movie.enddate)
           modal.find('#movie-synopsis2').val(movie.synopsis)
           modal.find('#movie-director2').val(movie.director)
           modal.find('#movie-poster2').val(movie.poster)
           modal.find('#movie-actor2').val(movie.actor)
           modal.find('#movie-category2').val(movie.category)
           modal.find('#movie-stillcut2').val(movie.stillcut)
           modal.find('#movie-preview2').attr('src',movie.poster) //포스터 미리보기 삽입
           
         },
         error : function(xhr, status, error){
           alert("상세조회 ajax 실패\n" + xhr.statusText)
         }
       })
     }) 
   })
   
  