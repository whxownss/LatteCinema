
document.write('<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>');
document.write('<script type="text/javascript" '+ 
					'src="/' + window.location.pathname.split("/")[1] + '/_assets/js/mypageJS/userInfoVarFunc.js"></script>');
$(function() {
      // 주소검색 버튼
      $('#addrBtn').on('click', function(e) {
          e.preventDefault();
        
          var target = $(this);
	
          // 다음 주소 API 호출
          daum.postcode.load(function() {
              new daum.Postcode({
                  oncomplete: function(d) {
                      var extraAddr = "";

                      if(d.bname !== '' && /[동|로|가]$/g.test(d.bname)){
                          extraAddr += d.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(d.buildingName !== '' && d.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + d.buildingName : d.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')';
                      }

                      target.prev().html(d.zonecode);
                      target.next().html(d.address+extraAddr);

                      $('[name=postcode]').val(d.zonecode);
                      $('[name=addr1]').val(d.address+extraAddr);
                  }
              }).open();
          });
      });
      
      // 주소변경시 상세주소 change
     $('#addr1').on('change', function(e) {
     	debugger;
     	$('#addr2').val('');
	});
      
});