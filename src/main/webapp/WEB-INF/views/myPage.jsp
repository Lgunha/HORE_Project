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


	<!--  nav -->
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid ">

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-1">
					<li class="nav-item  me-5"></li>
					<li class="nav-item dropdown me-5"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Menu </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">공지사항</a></li>
							<li><a class="dropdown-item" href="#">이벤트</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">고객센터</a></li>
						</ul></li>

					<c:forEach var="category" items="${cList}">
						<li class="nav-item "><a class="nav-link me-5"
							href="list_hotel?category_hotel=${category }"> ${category} </a></li>


					</c:forEach>




				</ul>

			</div>
		</div>
	</nav>
	<hr>


	<div class="container text-center">
		<!-- Stack the columns on mobile by making one full-width and the other half-width -->
		<div class="row" >
			<div class="col-md-8">
				<!-- 이벤트 사진 케러셀 -->
				<table class="table-dark table table-striped" border=1
					style="width: 768px">
					<tr>
						<td colspan=4>내정보</td>
						
					</tr>

					<c:if test="${nowUser == '비회원' }">
						비회원은 개인정보가 없습니다.
	
					</c:if>
					<c:if test="${nowUser != '비회원'}">
						
							<tr class="table-success">
								<td>아이디</td>
								<td>${uservo.id_user }</td>
							</tr>
							<tr class="table-success">
								<td>이름</td>
								<td>${uservo.name_user }</td>
							</tr>
							<tr class="table-success">
								<td>전화번호</td>
								<td>${uservo.tel_user }</td>
							</tr>
							<tr class="table-success">
								<td>e-mail</td>
								<td>${uservo.email_user }</td>
							</tr>
							<tr class="table-success">
								<td>회원유형</td>
								<td>${uservo.type_user}</td>
							</tr>
							<tr class="table-success">
								<td>정보수정 및 회원 탈퇴</td>
								<td><a href="update_user?id_user=${nowUser }" class="btn btn-outline-primary ">정보수정</a>
								<a href="delete_user?id_user=${nowUser }" class="btn btn-outline-primary ">회원탈퇴</a></td>
							</tr>



					
					</c:if>
				</table>
				<table class="table-dark table table-striped" border=1 style="width: 768px">
					<tr>
						<td colspan=4>예약정보</td>
						
					</tr>

					<c:if test="${nowUser == '비회원' }">
						비회원은 예약정보가 없습니다.
	
					</c:if>
					<c:if test="${nowUser != '비회원'}">
						<tr class="table-success">
							<td colspan=2>숙소 </td>
							<td colspan=2>날짜</td>
						</tr>
					<c:forEach var="resvo" items="${resList}" >
						<tr class="table-success">
							<td colspan=2><a href="detail_room_res?id_hotel=${id_hotel}&detailAddr_roomNum_room=${resvo.detailAddr_roomNum_res}">${resvo.hotelName }</a></td>
							<td>${resvo.checkIn_res }~${resvo.checkOut_res }  
							<a href="reservation_delete?detailAddr_roomNum_res=${resvo.detailAddr_roomNum_res }&id_res=${resvo.id_res}&checkInDate=${resvo.checkInDate}" 
								class="btn btn-outline-primary" style="margin-left:20px">예약취소</a>
							
							</td>
						</tr>

					</c:forEach>
					</c:if>
				</table>

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
								<a href="join_user" class="btn btn-outline-primary"> 회원가입 </a>
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





	<hr>



</body>
</html>