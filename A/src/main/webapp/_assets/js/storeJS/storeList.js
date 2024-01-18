document.write('<script type="text/javascript" '+ 
						'src="/' + window.location.pathname.split("/")[1] + '/_assets/js/storeJS/storeListVarFunc.js"></script>');

	  // 수량 옵션 
      $(function(){
		  
		  var storeItem;
		$.ajax({
			type: "GET",
			url: "storeListview.st",
			data: {itemIdx: new URL(window.location.href).searchParams.get('itemIdx')},
			dataType: "text",
			async: false,
		})
		.done(function(data){
			 storeItem = JSON.parse(data);
		})
		.fail(function(){})
		  
 		$("#itemImage").attr("src", storeItem.itemImage);
 		$("#itemName").text(storeItem .itemName);
 		$("#price").text(storeItem.itemPrice);
 		$("#detail").text(storeItem.itemDetail);
    		
    	var price = storeItem.itemPrice + "";
    	  
    	$("#sPrice").text(price.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    	  
        $('._count :button').on({
            'click' : function(e){

               e.preventDefault();
               var count = $(this).parent('._count').find('.inpp').text();
               var now = parseInt(count);
               var min = 1;
               var max = 5;
               var num = now;
               
               if($(this).hasClass('minus')){
                   var type = 'm';
               }else{
                   var type = 'p';
               }
               if(type=='m'){
                   if(now>min){
                       num = now - 1;
                   }
               }else{
                   if(now<max){
                       num = now + 1;
                   }
               }
               
               if(num != now){
                   $(this).parent('._count').find('.inpp').text(num);
               }
           }
       });
         
         // 상품금액
         $(".inpp").on("DOMSubtreeModified", function(){
        	 
			var p1 = parseInt($("#price").text().replace(/[^\d]+/g, ""));
			var p2 = parseInt($(".inpp").text());
			
			var sum = p1 * p2;
			
			var sPrice = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
			$("#sPrice").text(sPrice);
			
		});
		
         // 3자리 콤마(,)
         var price = $('#price').text();
         var money = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         $('#price').text(money);
         
      });
