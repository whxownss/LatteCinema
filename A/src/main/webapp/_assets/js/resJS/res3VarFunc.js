var p1Price = $("#p1Price").val();
var p2Price = $("#p2Price").val();
var p3Price = $("#p3Price").val();

// 들어온 시간
var enterTime = new Date();


//구매자 정보
const user_email =  "" //response.req_user_email
const username = "홍홍길똥" //response.req_username

//결제창 함수 넣어주기
const buyButton = document.getElementById('lastPay')
buyButton.setAttribute('onclick', `kakaoPay('${user_email}', '${username}')`)

var IMP = window.IMP;

var today = new Date();
var hours = today.getHours();
var minutes = today.getMinutes();
var seconds = today.getSeconds();
var milliseconds = String(today.getMilliseconds()).slice(0, 1);
var makeMerchantUid = "" + hours + minutes + seconds + milliseconds;
makeMerchantUid = makeMerchantUid.length != 7 ? makeMerchantUid.padEnd(7, "L") : makeMerchantUid;

function kakaoPay(useremail, username) {
	debugger;

	
if (confirm("구매 하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
	
		
	// res3에 들어오고 이때까지 몇분 지났는지 확인
	//	var payTime = new Date();
	//	var canPayTime = (payTime.getTime() - enterTime.getTime()) / (60 * 60 * 1000);
	//	debugger;
	
	if (1 == 1) { // 회원만 결제 가능
//          const emoticonName = document.getElementById('title').innerText

		IMP.init("imp16802722"); // 가맹점 식별코드
     	IMP.request_pay({
             pg: 'html5_inicis.INIpayTest', // PG사 코드표에서 선택
             pay_method: 'card', // 결제 방식
             merchant_uid: "MOV" + makeMerchantUid, // 결제 고유 번호
             name: '라떼시네마', // 제품명
             amount: parseInt($("#rsPrice").text().replace("," , "")),
             //구매자 정보 ↓
             buyer_email: `${useremail}`,
             buyer_name: $("#sName").val()
             // buyer_tel : '010-1234-5678',
             // buyer_addr : '서울특별시 강남구 삼성동',
             // buyer_postcode : '123-456'
    	}, async function (rsp) { // callback
    	debugger;
             if (rsp.success) { //결제 성공시
             
             
             
             
			    // 내가 결제중에 SEAT테이블에 정보가 사라질 때 ******************************
				var isTimeOver = false;
				$.ajax({
					type: "GET",
					url: "res3ProSE.re",
					data: {schDTO: JSON.stringify(schDTO)},
					dataType: "text",
					async: false
				})
				.done(function(data){
					if(data == "true") {
						isTimeOver = true;
						alert('시간이 만료되었습니다.');
						location.href = "res3ProRF.re?mid=" + rsp.merchant_uid; // 포트원 환불
					}
				})
				.fail(function(){
				})
				if(isTimeOver) return;
				// 내가 결제중에 SEAT테이블에 정보가 사라질 때 ******************************	
             
             
//                  console.log(rsp);
//                  localStorage.setItem('rsp', JSON.stringify(rsp));
//          		 localStorage.setItem('schDTO', JSON.stringify(schDTO));
//          		 window.location = "res4.re";
				$.each(schDTO, (k, v) => {
					if(k == "seat"){
						v = v.join(", ");
					}
					rsp[k] = v;
				})
				// 이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?
				var date = new Date();
				var month = date.getMonth() + 1;
				var day = date.getDate();
				var hour = date.getHours();
				var minute = date.getMinutes();
				var second = date.getSeconds();
	
		        month = month >= 10 ? month : '0' + month;
		        day = day >= 10 ? day : '0' + day;
		        hour = hour >= 10 ? hour : '0' + hour;
		        minute = minute >= 10 ? minute : '0' + minute;
		        second = second >= 10 ? second : '0' + second;
		
				// 이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?이거 함수로 ?	
				rsp["pay_time"] = date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
				// 결제 정보 db에 insert, 포인트 처리
				debugger;
				$.ajax({
					type: "GET",
					url: "res3Pro.re",
					data: {rsp: JSON.stringify(rsp),
						   minusPoint: parseInt($("#salePrice").text()) + "",
						   plusPoint: parseInt($("#accPoint").text().replace(",", "")) + ""
					},
					dataType: "text" 
				})
				.done(function(data){
					alert(data);
					localStorage.setItem('rsp', JSON.stringify(rsp));
	        		window.location = "res4.re";
				})
				.fail(function(){
				})
	                 //결제 성공시 프로젝트 DB저장 요청
	//                  if (response.status == 200) { // DB저장 성공시
	//                      alert('결제 완료!')
	//                      window.location.reload();
	//                  } else { // 결제완료 후 DB저장 실패시
	//                      alert(`error:[${response.status}]\n결제요청이 승인된 경우 관리자에게 문의바랍니다.`);
	//                      // DB저장 실패시 status에 따라 추가적인 작업 가능성
	//                  }
             } else if (rsp.success == false) { // 결제 실패시  (결제창 닫을때)
             	debugger;
                 alert(rsp.error_msg)
             }
         });
     }
     else { // 비회원 결제 불가
         alert('로그인이 필요합니다!')
     }
 } else { // 구매 확인 알림창 취소 클릭시 돌아가기
// 	location.href = "res2.re";  포인트 내역 변경등의 이유도 ㅇ있을 수 있으니 좀 이상함 이건
     return false;
 }
}

var schDTO = JSON.parse(localStorage.getItem("schDTO"));