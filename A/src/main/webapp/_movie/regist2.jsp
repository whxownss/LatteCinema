<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<html>
<input type="text" id="search-movie-title" placeholder="영화 이름으로 검색">

<select id="sort-option">
  <option value="prodYear">제작년도 정렬</option>
  <option value="RANK">정확도순 정렬</option>
  <option value="title">영화명 정렬</option>
  <option value="director">감독명 정렬</option>
  <option value="company">제작사명 정렬</option>
</select>

<button type="button" onclick="searchMovie()">찾기</button>
<table id="search-result" border="1">
  <thead>
    <th>제목</th>
    <th>제작사</th>
    <th>국가</th>
<!--     <th>줄거리</th> -->
    <th>관람등급</th>
    <th>개봉일</th>
    <th>감독</th>
<!--     <th>배우</th> -->
    <th>상영시간</th>
    <th>장르</th>
    <th>포스터</th>
    <th>스틸컷</th>
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
        var title = info.title.replace(/!HS | !HE /g, '');                      // 검색어에 !HS !HE 라는 글자가 같이 포함돼서 없애주는 작업
        //var actors = '';                                                      
        var html = '';
        html += '<tr>'
        // html += '<td>'+ info.plots.plot[0].plotText + '</td>'                // 줄거리가 길어서 적당히 자르는 로직 필요함 
        html += '<td>'+ title + '</td>'
        html += '<td>'+ info.company + '</td>'
        html += '<td>'+ info.nation + '</td>'
        html += '<td>'+ info.rating + '</td>'
        html += '<td>'+ info.repRlsDate + '</td>'
        html += '<td>'+ info.directors.director[0].directorNm + '</td>'
//         html += '<td>'+ actors + '</td>'                                     // 배우가 수십개씩 나올 수도 있어서, 적당히 추려주는 로직 필요함
        html += '<td>'+ info.runtime + '분</td>'
        html += '<td>'+ info.genre + '</td>'
        html += '<td><img src="'+ info.posters.split('|')[0] + '"></td>'        // 첫번째 포스터만
        html += '<td><img src="'+ info.stlls.split('|')[0] + '"></td>'          // 첫번째 스틸컷만
        html += '</tr>';
        
        $('#search-result').find('tbody').append(html)
      }
      
    },
    
    error:function(){
      alert("상영 정보가 확실하지 않습니다.")  
    }
  });
}
</script>
</html>