<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</head>
<body>
	<br>
	<!-- header -->
	<div style="text-align: center">
		<a href="mainPage"> <img src="resources/img/logo.png"
			style="width: 150px; height: 130px;"></a>
	</div>
	<!-- 메인 페이지 -->
	<hr>

	<div class="container text-center">
		<!-- Stack the columns on mobile by making one full-width and the other half-width -->
		<div class="row">
			<div class="col-md-8">
				<form action="join_hotel_save" method="post" encType="multipart/form-data">
					<!--  encType 이 서버에게 첨부파일을 전송해주는 역할을 한다 -->
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">지역주소</span> <input
							type="text" name="bigAddr_hotel" class="form-control" placeholder="지역주소">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">상세주소</span> <input
							type="text"name="detailAddr_hotel" class="form-control" placeholder="상세주소"	>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">숙소명</span> <input
							type="text" name="name_hotel" class="form-control" placeholder="숙소명"	>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">사업주ID</span> <input
							type="text" name="id_hotel" class="form-control" value="${nowUser }" readonly
							>
					</div>
					
		  			<div class="input-group-text">
						<span class="input-group-text" id="basic-addon1">입실시간</span>
						<input class="form-control" type="time"  value="13:00:00" min="13:00:00" max="16:00:00" name="checkIn_hotel">
					</div>
					<div class="input-group-text">
						<span class="input-group-text" id="basic-addon1">퇴실시간</span>
						<input class="form-control" type="time" value="11:00:00" min="11:00:00" max="12:00:00" name="checkOut_hotel">
					</div>
					
					
					<div class="input-group" >
						<span class="input-group-text" id="basic-addon1">숙소 유형</span>
			  			<div class="input-group-text">
							<span class="input-group-text" id="basic-addon1">호텔</span>
							<input class="form-check-input mt-0" type="radio" value="호텔"  checked="checked" name="category_hotel">
						</div>
						<div class="input-group-text">
						 	<span class="input-group-text" id="basic-addon1">모텔</span>
						    <input class="form-check-input mt-0" type="radio" value="모텔"  name="category_hotel">
						</div>
						<div class="input-group-text">
						 	<span class="input-group-text" id="basic-addon1">펜션</span>
						    <input class="form-check-input mt-0" type="radio" value="펜션"  name="category_hotel">
						</div>
						<div class="input-group-text">
						 	<span class="input-group-text" id="basic-addon1">리조트</span>
						    <input class="form-check-input mt-0" type="radio" value="리조트"  name="category_hotel">
						</div>
					</div>
					<div class="input-group" >
						<span class="input-group-text" id="basic-addon1">특징</span>
			  			<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="오션 뷰" name="character">
						  	<label class="form-check-label" for="inlineCheckbox1">오션 뷰</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="시티 뷰" name="character">
						  	<label class="form-check-label" for="inlineCheckbox2">시티 뷰</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="산 뷰" name="character">
						  	<label class="form-check-label" for="inlineCheckbox1">산 뷰</label>
						</div>
						<br>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="금연 객실" name="character">
						  	<label class="form-check-label" for="inlineCheckbox2">금연 객실</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="흡연 객실" name="character">
						  	<label class="form-check-label" for="inlineCheckbox1">흡연 객실</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="넷플릭스" name="character">
						  	<label class="form-check-label" for="inlineCheckbox2">넷플릭스</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="디즈니 플러스" name="character">
						  	<label class="form-check-label" for="inlineCheckbox1">디즈니 플러스</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="티빙" name="character">
						  	<label class="form-check-label" for="inlineCheckbox2">티빙</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="고사양 PC" name="character">
						  	<label class="form-check-label" for="inlineCheckbox1">고사양 PC</label>
						</div>
						<br>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="커플 PC" name="character">
						  	<label class="form-check-label" for="inlineCheckbox2">커플 PC</label>
						</div>
						

						
					</div>
					
					<div class="input-group" >
						<div class="input-group-text">
							<span class="input-group-text" id="basic-addon1">주차 가능</span>
							<input class="form-check-input mt-0" type="radio" value="T"  checked="checked" name="park_hotel">
						</div>
						<div class="input-group-text">
							<span class="input-group-text" id="basic-addon1">주차 불가능</span>
							<input class="form-check-input mt-0" type="radio" value="F"   name="park_hotel">
						</div>
					</div>
					
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">대표사진</span> 
						<input type="file" name="file" class="form-control">
					</div>
					

					<input type="submit" value="숙소 등록"
						class="btn btn-outline-primary btn-lg" style="margin-top: 10px;">
				</form>


			</div>
			<div class="col-6 col-md-4">
				<div class="card" style="width: 350px; margin-left: 13px">
					<img src="resources/img/bgLogo.png" style="height: 210px;"
						class="card-img-top" alt="..."> <br>
					<div class="card-body">
						<h5 class="card-title">
							${nowUser }&nbsp;&nbsp;<a href="logout"
								class="btn btn-outline-primary btn-sm">로그아웃</a>
						</h5>

						<br>
						<p class="card-text">
							<c:if test="${nowUser == '비회원'}">
								<a href="join_user" class="btn btn-outline-primary">회원가입</a>
							</c:if>
							<a href="myPage?id_user=${nowUser }"
								class="btn btn-outline-primary ">마이페이지</a>
							<c:if test="${UserType == '사업주'}">
								<a href="join_hotel" class="btn btn-outline-primary ">숙소등록</a>

								<a href="myHotel?id_user=${nowUser}"
									class="btn btn-outline-primary ">내 호텔 보기 </a>
							</c:if>
						</p>
						<br>
					</div>
				</div>
				<!-- <div style="padding-top:50%">
				loginUser : "${nowUser }" <a href="logout">[로그아웃]</a><br>

				<c:if test="${nowUser == '비회원'}">
					<a href="join_user">[회원가입]</a>
				</c:if>
				<a href="myPage?id_user=${nowUser }">[마이페이지]</a>
				<c:if test="${UserType == '사업주'}">
					<a href="join_hotel">[숙소등록]</a>
				</c:if>
				</div> -->
			</div>
		</div>
	</div>


	



</body>
</html>