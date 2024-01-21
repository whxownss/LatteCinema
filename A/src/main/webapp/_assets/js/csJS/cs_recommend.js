/**
 * 
 */
var lastClickedReco = null; // 마지막으로 클릭한 추천
$(document).ready(function(){
	
});
$('.btn').on("click",function(){
	// 클릭된 버튼의 ID 가져오기
    var buttonId = $(this).attr('id');
	var buttonText = $(this).text();
    var searchName = $('#recoSearch').val();
    var recoUser = [];
	recoUser.push($('#recoUser').val()); // 문자열 값을 배열에 추가
    
        // 'this'는 클릭된 버튼을 가리킵니다.
        // closest() 함수를 사용하여 가장 가까운 <tr> 요소를 찾습니다.
        var row = $(this).closest('tr');
        // find() 함수와 선택자를 사용하여 해당 행에서 createUser의 값을 찾습니다.
        var createUser = row.find('td:nth-child(5)').text(); // 'createUser' 값이 5번째 열에 있다고 가정
        console.log('선택한 행의 createUser: ' + createUser);
        var recommendIdx = row.find('td:nth-child(1)').text();
        console.log('선택한 행의 recommendIdx: ' + recommendIdx)
        // find() 함수와 선택자를 사용하여 해당 행에서 추천 수의 값을 찾습니다.
        var countRecoCell = row.find('td:nth-child(7)'); // 'countReco' 값이 7번째 열에 있다고 가정
        var countReco = parseInt(countRecoCell.text());
		
		var currentClickedReco = {
	   	    row: row,
	        countRecoCell: countRecoCell,
	        countReco: countReco + 1,
	        recommendIdx: recommendIdx
	    };
	    //debugger;
		
        if(buttonText === '삭제'){
        	if (  recoUser.includes(createUser)  // 지가 썻거
        	   || recoUser.some(user => user.toLowerCase().startsWith('admin'))) { // 관리자면
        		if(confirm('삭제하시겠습니까?')){
        			window.location.href="deleteRecoData.cs?recommendIdx=" + recommendIdx;        			
        		} 
        		return;
        	} 
        	
        	alert('본인 글이 아닙니다.')
    		return;
        }
        if(buttonText === '검색'){
        	window.location.href="searchReco.cs?movieName=" + searchName;
        	return;
        }
        var recoUser = $('#recoUser').val();
        console.log('선택하는 유저의 아이디: ' + recoUser)
        
        
        if(confirm('정말 추천하시겠습니까? 이전 추천 내용은 삭제됩니다.')){
			// 이전 추천과 현재 추천이 다른 경우
	        if (lastClickedReco && lastClickedReco.recommendIdx !== currentClickedReco.recommendIdx) {
	            // 이전 추천의 카운트가 0보다 크면 감소
	            if(lastClickedReco.countReco > 0) {
	                lastClickedReco.countReco--;
	                lastClickedReco.countRecoCell.text(lastClickedReco.countReco);
	            }
	        }
			
	        $.ajax({
		            url: 'doRecommend.cs',
		            type: 'POST',
		            data: { createUser: createUser, recommendIdx: recommendIdx, recoUser: recoUser },
		            success: function(response) {
		                var recoSuccess = response.recoSuccess;
		                if(recoSuccess == '1'){
		                    countReco++;
		                    countRecoCell.text(countReco);
		                    // 성공 후 lastClickedReco 업데이트
		                    lastClickedReco = $.extend(true, {}, currentClickedReco);
		                    //debugger;
		                } else {
		                    alert('추천불가');
		                }
		            },
		            error: function() {
		                alert('추천 수 업데이트 오류');
		            }
		        });
		    } else {
		        alert('추천을 취소하셨습니다.');
		    }
});
