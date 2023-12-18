<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file ="../_common/commonHeaderStart.jsp" %>
<%@include file ="../_common/commonHeaderEnd.jsp" %>

	<main id="main">
			
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				<div class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>자주찾는질문</h2>
					<div>
<!-- 						<a href="#" class="more"> -->
<!-- 							"2023.12.11 기준" -->
<!-- 						</a> -->
					</div>
				</div>
			</div>
		</section>
		
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<!-- 이곳에 코드작성 -->
				  <div class="row">
				    <div class="col-md-6 offset-md-3">
				      <div class="bg-light">
				        <ul class="d-flex flex-wrap justify-content-between list-unstyled">
				          <li><a href="../_cs/cs_center.jsp">공지사항</a></li>
				          <li><a href="../_cs/cs_exque.jsp">자주찾는질문</a></li>
				          <li><a href="../_cs/cs_qna.jsp">1:1문의</a></li>
				          <li><a href="../_cs/cs_lost.jsp">분실물</a></li>
				        </ul>
				      </div>
				    </div>
				  </div>
			</div>
		</section>
		
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<div class="row">
				  <div class="col-2">
				    <select class="form-select" id="inputGroupSelect01" style="text-align: center;">
				      <option selected class="text-muted">구분 선택</option>
				      <option value="1">예매</option>
				      <option value="2">관람권</option>
				      <option value="3">멤버십</option>
				      <option value="4">할인혜택</option>
				      <option value="5">영화관이용</option>
				    </select>
				  </div>
				</div> 		
				<table class="table">
				  <thead>
				    <tr class="table-secondary">
				      <th scope="col">#</th>
				      <th scope="col">구분</th>
				      <th scope="col" colspan="2">질문</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr class="table-secondary">
				      <td scope="col">1</td>
				      <td scope="col">멤버십</td>
				      <td scope="col" colspan="2"><a data-bs-toggle="collapse" href="#collapseEx1" role="button" aria-expanded="false" aria-controls="collapseEx1">적립한 포인트를 다 써도 VIP가 될 수 있나요?</a></td>
				    </tr>
				    <tr class="collapse" id="collapseEx1">
				      <td colspan="4">
				      	  <div class="card card-body">
						    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
						  </div>
				      </td>
				    </tr>
				    <tr class="table-secondary">
				      <td scope="col">2</td>
				      <td scope="col">멤버십</td>
				      <td scope="col" colspan="2"><a data-bs-toggle="collapse" href="#collapseEx2" role="button" aria-expanded="false" aria-controls="collapseEx2">포인트 소멸은 어떻게 이루어 지나요?</a></td>
				    </tr>
				    <tr class="collapse" id="collapseEx2">
				      <td colspan="4">
				      	  <div class="card card-body">
						    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
						  </div>
				      </td>
				    </tr>
				    <tr class="table-secondary">
				      <td scope="col">3</td>
				      <td scope="col">멤버십</td>
				      <td scope="col" colspan="2"><a data-bs-toggle="collapse" href="#collapseEx3" role="button" aria-expanded="false" aria-controls="collapseEx3">VIP 선정 기준이 어떻게 되나요?</a></td>
				    </tr>
				    <tr class="collapse" id="collapseEx3">
				      <td colspan="4">
				      	  <div class="card card-body">
						    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
						  </div>
				      </td>
				    </tr>
				    <tr class="table-secondary">
				      <td scope="col">4</td>
				      <td scope="col">관람권</td>
				      <td scope="col" colspan="2"><a data-bs-toggle="collapse" href="#collapseEx4" role="button" aria-expanded="false" aria-controls="collapseEx4">특별한 전용 관람권이 따로 있나요?</a></td>
				    </tr>
				    <tr class="collapse" id="collapseEx4">
				      <td colspan="4">
				      	  <div class="card card-body">
						    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
						  </div>
				      </td>
				    </tr>
				    <tr class="table-secondary">
				      <td scope="col">5</td>
				      <td scope="col">영화관이용</td>
				      <td scope="col" colspan="2"><a data-bs-toggle="collapse" href="#collapseEx5" role="button" aria-expanded="false" aria-controls="collapseEx5">주차가 가능한가요?</a></td>
				    </tr>
				    <tr class="collapse" id="collapseEx5">
				      <td colspan="4">
				      	  <div class="card card-body">
						    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
						  </div>
				      </td>
				    </tr>
				    <tr class="table-secondary">
				      <td scope="col">6</td>
				      <td scope="col">영화관이용</td>
				      <td scope="col" colspan="2"><a data-bs-toggle="collapse" href="#collapseEx6" role="button" aria-expanded="false" aria-controls="collapseEx6">관람등급에 대해 알고 싶습니다.</a></td>
				    </tr>
				    <tr class="collapse" id="collapseEx6">
				      <td colspan="4">
				      	  <div class="card card-body">
						    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
						  </div>
				      </td>
				    </tr>
				    <tr class="table-secondary">
				      <td scope="col">7</td>
				      <td scope="col">영화관이용</td>
				      <td scope="col" colspan="2"><a data-bs-toggle="collapse" href="#collapseEx7" role="button" aria-expanded="false" aria-controls="collapseEx7">상영관 내 다른 음식물의 반입이 되나요?</a></td>
				    </tr>
				    <tr class="collapse" id="collapseEx7">
				      <td colspan="4">
				      	  <div class="card card-body">
						    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
						  </div>
				      </td>
				    </tr>
				    <tr class="table-secondary">
				      <td scope="col">8</td>
				      <td scope="col">할인혜택</td>
				      <td scope="col" colspan="2"><a data-bs-toggle="collapse" href="#collapseEx8" role="button" aria-expanded="false" aria-controls="collapseEx8">장애인, 경로 등 우대 할인에 대해 알고 싶습니다.</a></td>
				    </tr>
				    <tr class="collapse" id="collapseEx8">
				      <td colspan="4">
				      	  <div class="card card-body">
						    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
						  </div>
				      </td>
				    </tr>
				    <tr class="table-secondary">
				      <td scope="col">9</td>
				      <td scope="col">예매</td>
				      <td scope="col" colspan="2"><a data-bs-toggle="collapse" href="#collapseEx9" role="button" aria-expanded="false" aria-controls="collapseEx9">예매는 몇 장까지 가능한가요?</a></td>
				    </tr>
				    <tr class="collapse" id="collapseEx9">
				      <td colspan="4">
				      	  <div class="card card-body">
						    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
						  </div>
				      </td>
				    </tr>
				    <tr class="table-secondary">
				      <td scope="col">10</td>
				      <td scope="col">예매</td>
				      <td scope="col" colspan="2"><a data-bs-toggle="collapse" href="#collapseEx10" role="button" aria-expanded="false" aria-controls="collapseEx10">예매 취소를 하였는데 환불이 안된것 같아요?</a></td>
				    </tr>
				    <tr class="collapse" id="collapseEx10">
				      <td colspan="4">
				      	  <div class="card card-body">
						    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
						  </div>
				      </td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</section>
		<section class="category-section" id="">
			<div class="container" data-aos="fade-up">
				<div class="pagination-container d-flex justify-content-center">
				  <ul class="pagination">
				    <li class="page-item disabled">
				      <a class="page-link text-secondary" href="#" tabindex="-1" aria-disabled="true">이전</a>
				    </li>
				    <li class="page-item" aria-current="page">
				      <a class="page-link text-secondary" href="#">1</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link text-secondary" href="#">2</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link text-secondary" href="#">3</a>
				    </li>
				    <!-- 나머지 페이지 번호 추가 -->
				    <li class="page-item">
				      <a class="page-link text-secondary" href="#">다음</a>
				    </li>
				  </ul>
				</div>
			</div>
		</section>	
	</main>
	
<%@include file ="../_common/commonFooter.jsp" %>