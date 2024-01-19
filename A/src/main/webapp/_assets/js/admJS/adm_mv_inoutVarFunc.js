 /*박스오피스 조회*/
	  function openBoxOffice() {
	  $('.movie_contents').css('display','block')
	  $('.boxmovie').find('tbody').html('');
	  var category = "NOW";
		$.ajax({
			url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
			type : 'GET',
			data : {
					key : "ee9ed756bb3f15468dceccf766e69e7b",
					targetDt : "20190900"                         //날짜형식이 틀리면 최신날짜를 보여주는걸로 알고있음
			},
			async : false,                                    //비동기식인 ajax를 동기식으로 만들어줌 만약 출력해야될 결과가 많거나 제대로 출력되지 않을때, 이 옵션을 사용
			success : function(data) {                        //data에 들어오는 값들은 앞에서 출력되던 예시와 같음
			  console.log(data)
			  var boxofficehead = `
			  <tr>
          <th>순위</th>
          <th>제목</th>
          <th>개봉일</th>
          <th>등록</th>
        </tr>`
        $('.boxmovie').find('thead').html(boxofficehead)
        
        for (var i = 0; i < data.boxOfficeResult.dailyBoxOfficeList.length; i++) {
          var html = '';
        	var movieCode = data.boxOfficeResult.dailyBoxOfficeList[i].movieCd;
        	var rank = data.boxOfficeResult.dailyBoxOfficeList[i].rank;
        	var title = data.boxOfficeResult.dailyBoxOfficeList[i].movieNm;
        	var openDate = data.boxOfficeResult.dailyBoxOfficeList[i].openDt;
          html += '<tr>'
          html += '<td>'+ rank + '</td>'
          html += '<td>'+ title + '</td>'
          html += '<td>'+ openDate + '</td>'
          html += '<td><button class="btn btn-success" type="button" data-toggle="modal" data-target="#movieModal"'+
                  ' data-moviecode="'+ movieCode + '"data-title="' + title + '"data-opendate="' + openDate +'"data-category="'+ category +'">등록</button></td>';
          html += '</tr>';
          
          $('.boxmovie').find('tbody').append(html)
        }
        
			}
		});
	}
  /**
  *kmdb에서 검색한 결과에서 누락된 결과를 조회하기 위해서
  *kobis에 영화제목과 영화감독명으로 재조회하는 기능
  */
  function searchMovieIndex(){
    const title = $('#movie-title').val()
    const director = $('#movie-director').val()
    $.ajax({
      url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json',
      type : 'GET',
      data : {
          key : "ee9ed756bb3f15468dceccf766e69e7b",
          movieNm : title,
          itemPerPage : "1",                            //결과 ROW의 개수
          directorNm : director
      },
      async : false,
      success : function(data) {
        console.log(data)
        // 제목과 감독으로 검색한 결과가 있는지 검증
        if(data.movieListResult.totCnt != 0){ 
          const movieCode = data.movieListResult.movieList[0].movieCd
          if(movieCode !== undefined){
            $('#movie-moviecode').val(movieCode)
          }  
        }
      },
      error : function(){
        alert("해당 영화에 대한 정보를 찾을 수 없습니다.")
      }
    });
    
  }
  /**
  ajax 분리
  @param title
  */
  function detailSearch(title){
    var result = '';
    $.ajax({
      url : 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp',
      data : {
        collection : 'kmdb_new2',                   //고정값
        ServiceKey : 'N6BL7Q77SG0M41244297',        //키
        sort : 'prodYear,1',     //정렬옵션 제작년도 정렬이 그나마 제일 정확한 것 같음
        title : title,
      },
      type : 'GET',
      dataType: 'json',
      async : false,
      timeout : 3000,                                   //KMDB 서버가 불안정해서 3초 이내 응답 받을 수 있도록
      success : function(data) {
        console.log(data)
        result = data;
       },
      error:function(xhr, status, error){
        console.log(xhr.statusText)
        alert("서버와 연결할 수 없습니다.\n" + xhr.statusText)  
      }
    });
    return result;
  }
   
   
   /*검색 영화 조회*/
  function openSearchMovie(){
    $('.movie_contents').css('display','block')
    $('.boxmovie').find('tbody').html('');
    var category = "OLD";
    
    var moviesearchhead = `
      <tr>
      <td>제목</td>
      <td>국가</td>
      <td>관람등급</td>
      <td>개봉일</td>
      <td>감독</td>
      <td>장르</td>
      <td>등록</td>
      </tr>`
    $('.boxmovie').find('thead').html(moviesearchhead)
    
    const data = detailSearch($('.input-movie-title').val());
      
    for(var i=0; i<data.Data[0].Count ; i++){
      var info = data.Data[0].Result[i];
      var title = info.title.replace(/!HS | !HE /g, '').trim(); // 검색어에 !HS !HE 라는 글자가 같이 포함돼서 없애주는 작업  
      var movieCode = info.Codes.Code[0].CodeNo;
      var filmMade = info.company;
      // openDate를 YYYYMMDD 형식에서 YYYY-MM-DD 형식으로 변경
      // openDate가 ""일때 kmdb 등록일(regDate)을 대신 넣도록 함
      var openDate = (info.repRlsDate !== "") ? moment(info.repRlsDate).format("YYYY-MM-DD")
                      : (info.regDate !== "") ? moment(info.regDate).format("YYYY-MM-DD") : "";
                                               
      var poster = info.posters.split('|')[0];
      var nation = info.nation;
      var synopsis = info.plots.plot[0].plotText;
      var rating = info.rating.includes("전체") ? "all" : info.rating.substr(0,2); 
      var director = info.directors.director[0].directorNm;
      var runtime = info.runtime;
      var genre = info.genre;
      var html = '';
      
      var actorArr = [];
      let count = info.actors.actor.length > 3 ? 3 : info.actors.actor.length;
      for(let i = 0; i < count ; i++){
        actorArr.push(info.actors.actor[i].actorNm);
      }
      var actor = actorArr.join(', ');
      var stillcut = info.stlls.replace(/thm\/01/g, "still").replace(/tn_/g,"").replace(/.jpg|.JPG/g,"_01.jpg");
      
      html += '<tr>'
      html += '<td>'+ title + '</td>'
      html += '<td>'+ nation + '</td>'
      html += '<td>'+ rating + '</td>'
      html += '<td>'+ openDate + '</td>'
      html += '<td>'+ director + '</td>'
      html += '<td>'+ genre + '</td>'
      html += '<td><button class="btn btn-success" type="button" data-toggle="modal" data-target="#movieModal" data-moviecode="'+ movieCode +
              '"data-title="' + title +
              '"data-rating="'+ rating +
              '"data-runtime="'+ runtime +
              '"data-filmmade="'+ filmMade +
              '"data-nation="'+ nation +
              '"data-synopsis="'+ synopsis +
              '"data-opendate="'+ openDate +
              '"data-director="'+ director +
              '"data-genre="'+ genre +
              '"data-poster="'+ poster +
              '"data-actor="'+ actor +
              '"data-stillcut="'+ stillcut +
              '"data-category="'+ category + '">등록</button></td>';
      html += '</tr>';
      
      $('.boxmovie').find('tbody').append(html)
  }
      
  }
  /**
   유효성 검사하는 로직 작성
   영화 등록 버튼 눌렀을 때 실행
  */
  function registMovie(){
    if(confirm("등록하시겠습니까?")){
       if($('#movie-title').val() === ""){ alert("이름을 입력해 주세요"); return false; }
       if($('#movie-genre').val() === ""){ alert("장르를 입력해 주세요"); return false; }
       if($('#movie-rating').val() === ""){ alert("관람등급을 입력해 주세요"); return false; }
       if($('#movie-runtime').val() === ""){ alert("상영시간을 입력해 주세요"); return false; }
       if($('#movie-filmmade').val() === ""){ alert("제작사를 입력해주세요"); return false; }
       if($('#movie-nation').val() === ""){ alert("제작국가 입력해 주세요"); return false; }
       if($('#movie-startdate').val() === ""){ alert("상영시작을 입력해 주세요"); return false; }
       if($('#movie-opendate').val() === ""){ alert("상영일을 입력해 주세요"); return false; }
       if($('#movie-endDate').val() === ""){ alert("종영일을 입력해 주세요"); return false; }
       if($('#movie-synopsis').val() === ""){ alert("줄거리를 입력해 주세요"); return false; }
       if($('#movie-director').val() === ""){ alert("감독을 입력해 주세요"); return false; }
      return true;
    }
    return false;
  }

   function deleteMovie(){
    if(confirm("등록된 영화를 삭제하시겠습니까?")){
      location.href="movie_delete.mo?movieCode="+$('#movie-moviecode2').val()
    } 
  }
  
  function modifyMovie(){
    if(confirm("수정하시겠습니까?")){
      if($('#movie-startdate2').val() === ""){ alert("상영시작을 입력해 주세요"); return false; }
      if($('#movie-opendate2').val() === ""){ alert("상영일을 입력해 주세요"); return false; }
      if($('#movie-endDate2').val() === ""){ alert("종영일을 입력해 주세요"); return false; }
     return true;
   }
   return false;
  }

 