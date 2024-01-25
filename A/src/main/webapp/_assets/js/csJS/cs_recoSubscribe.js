/**
 * 
 */
$(document).ready(function() {
	$("#submitReco").click(function(event) {
		if($('#movieName').val()==='' || $('#director').val()===''){
			alert('영화명 또는 감독명을 입력하세요.')
			event.preventDefault(); // 폼 제출을 막음
		}
    });
//     var serviceKey = "L5BI6RFWUZ7B4WG0K4U6";
//     var base_url = "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp";
//     var releaseStart = "19800101";
//     var releaseEnd = "19801231";
//     var listCount = 500; // 한 페이지당 결과 수

//     function fetchTotalCount(callback) {
//         var parameters = "?collection=kmdb_new2&detail=N&ServiceKey=" + serviceKey + "&releaseDts=" + releaseStart + "&releaseDte=" + releaseEnd + "&listCount=1";
//         $.ajax({
//             url: base_url + parameters,
//             type: 'GET',
//             dataType: 'json', 
//             success: function(response) {
//                 var totalCount = response.Data[0].TotalCount; 
//                 var totalPages = Math.ceil(totalCount / listCount);
//                 callback(totalPages);
//             },
//             error: function(xhr, status, error) {
//                 console.error("Error: " + error);
//             }
//         });
//     }

//     function fetchMoviesByReleaseYear(page) {
//         var startCount = (page - 1) * listCount;
//         var parameters = "?collection=kmdb_new2&detail=N&ServiceKey=" + serviceKey + "&releaseDts=" + releaseStart + "&releaseDte=" + releaseEnd + "&listCount=" + listCount + "&startCount=" + startCount;
//         $.ajax({
//             url: base_url + parameters,
//             type: 'GET',
//             dataType: 'json',
//             success: function(response) {
//             	debugger;
//                 response.Data[0].Result.forEach(function(item) { // JSON 배열을 반복 처리
//                     var title = item.title;
//                     $('#movieList').append($('<option>').text(title));
//                 });
//             },
//             error: function(xhr, status, error) {
//                 console.error("Error: " + error);
//             }
//         });
//     }

//     fetchTotalCount(function(totalPages) {
//         for (var page = 1; page <= totalPages; page++) {
//             fetchMoviesByReleaseYear(page);
//         }
//     });
});



$('#movieName').on("change", function() {
    var serviceKey = "L5BI6RFWUZ7B4WG0K4U6";
    var base_url = "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp";
    var releaseStart = $('#movieYear').val()+'0101';
    var releaseEnd = $('#movieYear').val()+'1231';
    var movieName = encodeURIComponent($('#movieName').val());

    function fetchMoviesByReleaseYear(start, end) {
        var parameters = "?collection=kmdb_new2&detail=Y&ServiceKey=" + serviceKey + "&releaseDts=" + start + "&releaseDte=" + end + "&title=" + movieName;
        var url = base_url + parameters;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'json',
            success: function(response) {
//            	debugger;
                response.Data[0].Result.forEach(function(movie) {
                    // 감독 이름 추출
                    var directorNames = movie.directors.director.map(function(director) {
                        return director.directorNm;
                    });
                    console.log("Directors: " + directorNames.join(", "));
                    $('#director').val(directorNames.join(", ")); // 감독 이름을 #director 필드에 설정
                    
                    var posterUrl = movie.posters;
                    var posterParts = posterUrl.split("|");
                    var poster = posterParts[0];
                    console.log("Poster URL: " + poster);
                    $('#poster').val(poster);
                    
	                // 이미지 요소에 대한 jQuery 선택자
                    var posterImg = $("#posterImg");
                    // 동적으로 src 속성 설정
                    var imageUrl = "이미지의 URL을 여기에 입력하세요"; // 이미지의 URL을 지정합니다
                    posterImg.attr("src", poster);

                });
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
            }
        });
    }

    fetchMoviesByReleaseYear(releaseStart, releaseEnd); // 특정 개봉연도의 영화 데이터 불러오기
});

$('#movieYear').on("change",function(){
// 	alert('선택연도: ' + $('#movieYear').val()+'0101');
	$('#movieName').val('');
	$('#director').val('');
	$('#poster').val('');
	$("#movieList").empty();
	
    var serviceKey = "L5BI6RFWUZ7B4WG0K4U6";
    var base_url = "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp";
//     var releaseStart = "19990101";
//     var releaseEnd = "19991231";
    var releaseStart = $('#movieYear').val()+'0101';
    var releaseEnd = $('#movieYear').val()+'1231';
    var listCount = 500; // 한 페이지당 결과 수

    function fetchTotalCount(callback) {
        var parameters = "?collection=kmdb_new2&detail=N&ServiceKey=" + serviceKey + "&releaseDts=" + releaseStart + "&releaseDte=" + releaseEnd + "&listCount=1";
        $.ajax({
            url: base_url + parameters,
            type: 'GET',
            dataType: 'json', 
            success: function(response) {
                var totalCount = response.Data[0].TotalCount; 
                var totalPages = Math.ceil(totalCount / listCount);
                callback(totalPages);
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
            }
        });//callback으로 totalpages 가지고 fetchTotalCount(function(totalPages)... 이 쪽으로 가서 page를 구한다.
    }

    function fetchMoviesByReleaseYear(page) {
        var startCount = (page - 1) * listCount;
        var parameters = "?collection=kmdb_new2&detail=N&ServiceKey=" + serviceKey + "&releaseDts=" + releaseStart + "&releaseDte=" + releaseEnd + "&listCount=" + listCount + "&startCount=" + startCount + "&genre!=" + "에로";
        $.ajax({
            url: base_url + parameters,
            type: 'GET',
            dataType: 'json',
            success: function(response) {
				//debugger;
				console.log(base_url + parameters);
                response.Data[0].Result.forEach(function(item) {
                    var title = item.title;
                    $('#movieList').append($('<option>').text(title));
                });
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
            }
        });
    }

    fetchTotalCount(function(totalPages) {
        for (var page = 1; page <= totalPages; page++) {
            fetchMoviesByReleaseYear(page);
        }
    }); 
    /*
    코드에서 사용된 callback 함수는 JavaScript의 비동기 프로그래밍 패턴에서 자주 사용되는 개념
    callback 함수는 다른 함수에 인자로 전달되는 함수로, 주로 비동기적인 작업(예를 들어, 네트워크 요청)이 완료된 후 실행되어야 하는 로직을 포함
    */
	
});  
