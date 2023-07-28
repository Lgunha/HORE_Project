<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
<br>
<div style="text-align:center;">
<a href="mainPage"> <img src="resources/img/logo.png" style="width: 180px; height: 150px; "></a> 
</div>

<br>
<hr>

	
<div class="container text-center">
      <!-- Stack the columns on mobile by making one full-width and the other half-width -->
      <div class="row">
         <div class="col-md-8">
            <!-- 이벤트 사진 캐러셀 -->
            <h3>방 등록</h3>
            <form action="join_room_save" method="post"
               encType="multipart/form-data">
               <input type="hidden" name="detailAddr_room" value="${hotelvo.detailAddr_hotel }">
               <input type="hidden" name="checkIn_room" value="${hotelvo.checkIn_hotel }">
               <input type="hidden" name="checkOut_room" value="${hotelvo.checkOut_hotel }">
               <div class="input-group mb-3">
                  <span class="input-group-text" id="basic-addon1">방번호</span> <input
                     type="text" class="form-control"
                     aria-label="Username" aria-describedby="basic-addon1"
                     name="roomNum_room" >
               </div>
               <div class="input-group mb-3">
                  <span class="input-group-text" id="basic-addon1">방 정보</span> <input
                     type="text" class="form-control"
                     aria-label="Username" aria-describedby="basic-addon1"
                     name="info_room">
               </div>
               <div class="input-group mb-3">
                  <span class="input-group-text" id="basic-addon1">금액</span> <input
                     type="text" class="form-control"
                     aria-label="Username" aria-describedby="basic-addon1"
                     name="price_room">
               </div>
               
               <div class="input-group mb-3" >
                  <span class="input-group-text" id="basic-addon1">사진1</span>   
                  <input type="file" class="form-control" name="file">
               </div>
               <div class="input-group mb-3" >
                  <span class="input-group-text" id="basic-addon1">사진2</span>   
                  <input type="file" class="form-control" name="file">
               </div>
               <div class="input-group mb-3" >
                  <span class="input-group-text" id="basic-addon1">사진3</span>   
                  <input type="file" class="form-control" name="file">
               </div>
               
                <input type="submit"
                  value="방 등록" style="margin-top: 15px;"
                  class="btn btn-outline-primary btn-lg">
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
								<a href="join_user" class="btn btn-outline-primary ">회원가입</a>
							</c:if>
							<a href="myPage?id_user=${nowUser }" class="btn btn-outline-primary ">마이페이지</a>
							<c:if test="${UserType == '사업주'}">
								<a href="join_hotel" class="btn btn-outline-primary ">숙소등록</a>
								<a href="myHotel?id_user=${nowUser}" class="btn btn-outline-primary ">내
									호텔 보기</a>
							</c:if>
						</p>
						<br>
					</div>
				</div>

			</div>
      </div>
   </div>
</body>
</html>




