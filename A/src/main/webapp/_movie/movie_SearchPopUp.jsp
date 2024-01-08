<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<input type="text" id="search-movie-title" placeholder="영화 이름으로 검색">

<select id="sort-option">
  <option value="prodYear">제작년도 정렬</option>
  <option value="RANK">정확도순 정렬</option>
  <option value="title">영화명 정렬</option>
  <option value="director">감독명 정렬</option>
  <option value="company">제작사명 정렬</option>
</select>

<button type="button" onclick="searchMovie()">찾기</button>
<button type="button" class="btn-regist">등록</button>  
                      
<table id="search-result" border="1">
  <thead>
    <th>선택</th>
    <!-- <th>영화코드</th> -->
    <th>제목</th>
    <th>제작사</th>
    <th>국가</th>
    <th>줄거리</th>
    <th>관람등급</th>
    <th>개봉일</th>
    <th>감독</th>
    <th>상영시간</th>
    <th>장르</th>
    <th>포스터</th>
  </thead>
  <tbody></tbody>
</table>

<style>
/* 줄거리 overflow 처리*/
/* td { */
/*  white-space: nowrap;  */
/*  text-overflow: ellipsis;  */
/* }  */

/* 포스터 및 스틸컷 사이즈 조절용*/
td > img {
  width : 50px;
  height : 50px;
}
</style>

<script>
$(function(){
  /**
  * 엔터키로 검색 버튼 활성화
  */
  $('#search-movie-title').keypress(function(e){
    if(e.which == 13) {
      searchMovie();
    }
  });
  
})

 function truncateText(text, maxLength) {
    if (text.length > maxLength) {
      // 문자열이 지정된 최대 길이를 초과하면 일정 길이로 자르고 생략 부호를 추가
      return text.substring(0, maxLength) + '...';
    } else {
      // 최대 길이를 초과하지 않으면 그대로 반환
      return text;
    }
  }

function searchMovie(){
  var info_movie_title = $('#search-movie-title').val();
  $('#search-result').find('tbody').html('');
  
  $.ajax({
    url : 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp',
    data : {
      collection : 'kmdb_new2',                   //고정값
      ServiceKey : 'N6BL7Q77SG0M41244297',        //키
      sort : $('#sort-option').val() + ',1',     //정렬옵션 제작년도 정렬이 그나마 제일 정확한 것 같음
      title : info_movie_title,
    },
    type : 'GET',
    dataType: 'json',
    success : function(data) {
      console.log(data);
    
      for(var i=0; i<data.Data[0].Count ; i++){
        var info = data.Data[0].Result[i];
        var title = info.title.replace(/!HS | !HE /g, '');  
        // 검색어에 !HS !HE 라는 글자가 같이 포함돼서 없애주는 작업
        //var actors = '';                                  
 		var movieIdx = info.Codes.Code[0].CodeNo;
        
        if(movieIdx === "") continue;           
        
        var filmMade = info.company;
        var openDate = info.repRlsDate || 'N/A';
        var poster = info.posters.split('|')[0] || 'N/A';
        var nation = info.nation;
        var synopsis = truncateText(info.plots.plot[0].plotText, 200);
        var rating = info.rating;
        var director = info.directors.director[0].directorNm || 'N/A';
        var runtime = info.runtime;
        var genre = info.genre;
        
        
        console.log("filmMade : "+filmMade);
        console.log("openDate : "+openDate);
        console.log("poster : "+poster);
                            
        var html = '';
        html += '<tr data-movieIdx="'+ movieIdx+'">'
        html += '<td><input type="checkbox" class="movie-checkbox" data-title="'+ title +'" data-rating="'+ rating +'" data-runtime="'+ runtime +'" data-filmMade="'+ filmMade +'" data-nation="'+ nation +'" data-synopsis="'+ synopsis +'" data-openDate="'+ openDate +'" data-director="'+ director +'" data-genre="'+ genre +'" data-poster="'+ poster +'"/></td>';
        html += '<td>'+ title + '</td>'
        html += '<td>'+ filmMade + '</td>'
        html += '<td>'+ nation + '</td>'
        html += '<td>'+ synopsis + '</td>'
        html += '<td>'+ rating + '</td>'
        html += '<td>'+ openDate + '</td>'
        html += '<td>'+ director + '</td>'
        //         html += '<td>'+ actors + '</td>'                                     // 배우가 수십개씩 나올 수도 있어서, 적당히 추려주는 로직 필요함
      	html += '<td>'+ runtime + '분</td>'
    	html += '<td>'+ genre + '</td>'
    	html += '<td><img src="' + poster + '"></td>'
   		/* html += '<td><img src="'+ info.posters.split('|')[0] + '"></td>'  */  // 첫번째 포스터만
     /*    html += '<td><img src="'+ info.stlls.split('|')[0] + '"></td>'      */     // 첫번째 스틸컷만
        html += '</tr>';
        
        $('#search-result').find('tbody').append(html)
      }
      
      $('.btn-regist').click(function(){
          
          if(confirm("등록하실래용?")){
        	  var formData = new FormData();
        	  
        	  // 선택된 체크박스 가져오기
              var selectedCheckboxes = $('.movie-checkbox:checked');
        	  
              // 각 체크박스에 대한 처리
             selectedCheckboxes.each(function (index, checkbox) {
	            var movieIdx = $(checkbox).closest('tr').attr('data-movieIdx');
	            var title = $(checkbox).data('title');
	            var rating = $(checkbox).data('rating');
	            var runtime = $(checkbox).data('runtime');
	            var filmMade = $(checkbox).data('filmMade');
	            var openDate = $(checkbox).data('openDate');
	            var nation = $(checkbox).data('nation');
	            var synopsis = $(checkbox).data('synopsis');
	            var director = $(checkbox).data('director');
	            var genre = $(checkbox).data('genre');
	            var poster = $(checkbox).data('poster');
	            
	            console.log("filmMade : "+filmMade);
	            console.log("openDate : "+openDate);
	            console.log("poster : "+poster);
	
	            formData.append("movieIdx", movieIdx);
	            formData.append("title", title);
	            formData.append("rating", rating);
	            formData.append("runtime", runtime);
	            formData.append("filmMade", filmMade);
	            formData.append("nation", nation);
	            formData.append("synopsis", synopsis);
	            formData.append("openDate", openDate);
	            formData.append("director", director);
	            formData.append("genre", genre);
	            // 파일 업로드 시
	            var posterFile = $(checkbox).data('posterFile');
	            if (posterFile) {
	              // posterFile이 존재할 경우에만 FormData에 추가
	              formData.append("poster", posterFile);
	            }
	          });
              
             $.ajax({
                 type: 'POST',
                 url: '/A/movie_insert.mo',
                 data: formData,
                 processData: false,
                 contentType: false,
                 success: function () {
                   // 서버로부터의 응답을 받았을 때 실행되는 코드
                   
                   
                   <!-- insertMovie 자바 코드 넣을 곳 -->
                   location.href = "adm_mv_inout.ad";
                   
                   console.log('등록 성공');
                   window.close();
                   
                
                 },
                 error: function () {
                   // 서버로부터의 응답을 받지 못했을 때 실행되는 코드
                   console.log('등록 실패');
                 }
               });
             }
           });
         },
    error:function(){
      alert("상영 정보가 확실하지 않습니다.")  
    }
  });
}
  
  /*   location.href="movie_insert.mo?movieIdx="+movieIdx
  + "&title=" + title
  + "&rating=" + rating
  + "&filmMade=" + filmMade
  + "&nation=" + nation
  + "&synopsis=" + synopsis
  + "&openDate=" + openDate
  + "&director=" + director
  + "&genre=" + genre
  + "&runtime=" + runtime
	  + "&poster=" + poster; */

</script>


