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
	<br>
	<!-- 본문 및 내 로그인 정보화면 세션 나누기 -->
	<div class="container text-center">
		<!-- Stack the columns on mobile by making one full-width and the other half-width -->
		<div class="row" >
			<div class="col-md-8">
				<!-- 이벤트 사진 케러셀 -->
				<div id="carouselExampleIndicators" class="carousel slide"
					data-bs-ride="true">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" class="active" aria-current="true"
							aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>

					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="resources/img/logo.png"
								style="width: 768px; height: 400px;" class="d-block w-100"
								alt="...">
						</div>
						<div class="carousel-item">
							<img src="resources/img/bgLogo.png"
								style="width: 768px; height: 400px;" class="d-block w-100"
								alt="...">
						</div>
						<div class="carousel-item">
							<img src="resources/img/아기사자.jpg"
								style="width: 768px; height: 400px;" class="d-block w-100"
								alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>


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
								<a href="join_user" class="btn btn-outline-primary ">회원가입</a>
							</c:if>
							<a href="myPage?id_user=${nowUser }"
								class="btn btn-outline-primary">마이페이지</a>
							<c:if test="${UserType == '사업주'}">
								<a href="join_hotel" class="btn btn-outline-primary">숙소등록</a>
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
		<div class="row">
			<div class="col-md-8">
				<!-- 이벤트 사진 캐러셀 -->
				<table>
					<tr>
						<c:forEach var="chuchun" items="${chuchunList}">
							<td>
								<div style="width: 256px;">
									<div class="card" style="width: 255px;">
										<a
											href="detail_hotel?detailAddr_hotel=${chuchun.detailAddr_hotel}&id_hotel=${chuchun.id_hotel}">
											<img src="download?filename=${chuchun.img_hotel}"
											class="card-img-top" alt="..." style="height: 210px;">
											<br>
										</a>
										<div class="card-body">
											<h5 class="card-title">
												숙소 명 : ${chuchun.name_hotel}<br>

											</h5>


										</div>
									</div>
								</div>
							</td>
						</c:forEach>
					</tr>
				</table>
			</div>

		</div>
	</div>




</body>
</html>