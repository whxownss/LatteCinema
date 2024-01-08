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
    <th>영화코드</th>
    <th>제작사</th>
    <th>국가</th>
    <th>관람등급</th>
    <th>개봉일</th>
    <th>감독</th>
    <th>상영시간</th>
    <th>장르</th>
    <th>포스터</th>
    <th>스틸컷</th>
    <th>등록</th>
  </thead>
  <tbody>
  </tbody>
</table>
<style>
/* 줄거리 overflow 처리*/
 td { 
  white-space: nowrap;  
  text-overflow: ellipsis;  
  overflow: hidden;
  max-width: 130px;
 }  

/* 포스터 및 스틸컷 사이즈 조절용*/
td > img {
  width : 50px;
  height : 50px;
}
button {
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
        var movieCd = info.Codes.Code[0].CodeNo;
        
        if(movieCd === "") continue;                                                    // 영화코드 없는 영화는 상영할 수 없게
        
        var title = info.title.replace(/!HS | !HE /g, '');                      // 검색어에 !HS !HE 라는 글자가 같이 포함돼서 없애주는 작업
        var company = info.company.split(',')[0];                               // 제작사가 하나만 나오도록 
        var nation = info.nation.split(',')[0]; 
        var poster = info.posters.split('|')[0];
        
        var html = '';
        html += '<tr data-movieCd="'+ movieCd+'">'
        html += '<td><input type="checkbox" class="movie-checkbox" /></td>';
        html += '<td>'+ title + '</td>'
        html += '<td>'+ movieCd + '</td>'
        html += '<td>'+ company + '</td>'
        html += '<td>'+ nation + '</td>'
        html += '<td>'+ info.rating + '</td>'
        html += '<td>'+ info.repRlsDate + '</td>'
        html += '<td>'+ info.directors.director[0].directorNm + '</td>'
        html += '<td>'+ info.runtime + '분</td>'
        html += '<td>'+ info.genre + '</td>'
        html += '<td><img src="'+ poster + '"></td>'        // 첫번째 포스터만
        html += '<td><img src="'+ info.stlls.split('|')[0] + '"></td>'          // 첫번째 스틸컷만
        html += '<td><button type="button" class="btn-regist">등록하기</button></td>'          // 등록하기 버튼
        html += '</tr>';
        
        $('#search-result').find('tbody').append(html)
      }
      
      $('.btn-regist').click(function(){
        
        if(confirm("등록하실래용?")){
          var movieCd = $(this).closest('tr').attr('data-movieCd')  
          location.href="regist3.jsp?movieCd="+movieCd;         
        }
        
      })
      
    },
    
    error:function(){
      alert("상영 정보가 확실하지 않습니다.")  
    }
  });
}
</script>
</html>