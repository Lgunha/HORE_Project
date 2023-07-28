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
		<a href="mainPage">	<img src = "resources/img/logo.png" style = "width : 150px; height : 130px;"></a></div>
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
						<td></td>
						<td>숙소 정보</td>
					<tr class="table-success">
						<td>숙소이름</td>
						<td>${hotelvo.name_hotel}</td>
					</tr>
					<tr class="table-success">
						<td>주소</td>
						<td>${hotelvo.bigAddr_hotel}${hotelvo.detailAddr_hotel}</td>
					</tr>
					<tr class="table-success">
						<td>이미지</td>
						<td><img src="download?filename=${hotelvo.img_hotel}" width=400 height=250 style=" object-fit: fill;"></td>
					</tr>
					<tr class="table-success">
						<td>주차 가능 여부</td>
						<c:if test="${hotelvo.park_hotel== 'T'}">
							<td>주차가능</td>
						</c:if>
						<c:if test="${hotelvo.park_hotel=='F'}">
							<td>주차 불가능</td>
						</c:if>
					</tr>
					<c:if test="${nowUser == id_hotel}">
						<tr class="table-success">
							<td colspan=4>
								<a href="join_room?detailAddr_hotel=${detailAddr_hotel }" class="btn btn-outline-primary ">
								방등록</a>
								<a href="update_hotel?detailAddr_hotel=${detailAddr_hotel }" class="btn btn-outline-primary ">
								숙소수정</a>
								<a href="delete_hotel?detailAddr_hotel=${detailAddr_hotel }" class="btn btn-outline-primary ">
								숙소삭제</a>
							
							</td>
						</tr>
					</c:if>



				</table>
				<br>
				<hr>
				<br>
				
				
				
				<table class="table-dark table table-striped" border=1
					style="width: 768px">
					<tr>
						<td colspan=4>날짜 선택 </td>
					</tr>
					<tr>
						<td colspan=2>
							<div class="input-group-text">
								<span class="input-group-text" id="basic-addon1">입실날짜</span>
								<input class="form-control" type="date"  id="checkIn_res" name="checkIn_res" min="${sysdate }" value="2023-01-01">
							</div>
						</td>
						<td colspan=2>
							<div class="input-group-text">
								<span class="input-group-text" id="basic-addon1">퇴실날짜</span>
								<input class="form-control" type="date"  name="checkOut_res"
								 id="checkOut_res" min="${sysdate }"value="2023-01-01">
								 <input type="hidden" id="detailAddr_hotel" value="${detailAddr_hotel }"> 
							</div>	
						</td>
					</tr>
					</table>
					<div id="roomListDiv" style="width: 768px; height=250px;">
					<table  class="table-dark table table-striped"  border=1 style="width: 768px">
					<tr>

						<td colspan=4>방정보</td>

					</tr>
					<!--  리스트를 가져옴.. foreach -->
					<c:forEach var="rvo" items="${roomList}">
						<!--  리스트나 배열을 제어하는 명령어 -->
						<tr>
							<c:if test="${nowUser != id_hotel}">
							<td colspan=2><a
								href="detail_room?detailAddr_roomNum_room=${rvo.detailAddr_roomNum_room}&id_hotel=${hotelvo.id_hotel}&checkIn='2023-01-01'&checkOut='2023-01-02'">
									<img src="download?filename=${rvo.filename_room[0]}" width=400
									height=250 style="object-fit: fill;">

							</a></td></c:if>
							<c:if test="${nowUser == id_hotel}">
							<td colspan=2><a
								href="detail_room?detailAddr_roomNum_room=${rvo.detailAddr_roomNum_room}&id_hotel=${hotelvo.id_hotel}&checkIn=${sysdate}&checkOut=${sysdatePlus}">
									<img src="download?filename=${rvo.filename_room[0]}" width=400
									height=250 style="object-fit: fill;">

							</a></td></c:if>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
								방번호 : ${rvo.roomNum_room}<br>
								1박 : ${rvo.price_room }<br>
								 
							</td>



						</tr>
					</c:forEach>
				</table>
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
				<br>
				
				<div class="text-bg-dark p-3" style="width: 350px; margin-left: 13px; height:50px;"><span>숙소위치</span></div>
            	<div id="map" style="width: 350px; margin-left: 13px; height:350px;"></div>
			</div>
		</div>
	</div>









	<hr>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af65596fa26e9265fd5487531d23f586&libraries=LIBRARY,services,clusterer,drawing"></script>
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var plus = "${hotelvo.bigAddr_hotel}&nbsp;${hotelvo.detailAddr_hotel}";
//주소로 좌표를 검색합니다
geocoder.addressSearch(plus, function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">${hotelvo.name_hotel}</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    




function checkDate(){
    
    var checkIn = document.getElementById("checkIn_res").value;
    var checkOut = document.getElementById("checkOut_res").value;
    console.log(checkIn);
    if(checkIn<checkOut){
       //alert("예약이 완료되었습니다");
      
    }else{
       
    }
 }   
 
$('#checkOut_res').change(function(){
       let checkIn = $('#checkIn_res').val();
       let checkOut = $('#checkOut_res').val();
       let detailAddr = $('#detailAddr_hotel').val();
         var set = checkIn + "/" + checkOut + "/" + detailAddr;
         console.log(set);
       $.ajax({
          url: "CheckDate.do",
          type:"post",
          data : {checkIn:checkIn, checkOut:checkOut, detailAddr:detailAddr},
          dataType:"JSON",
          success : function(result){
             
             var a= "";
             document.getElementById("roomListDiv").innerHTML="";		
             for(var i in result){
            	 console.log(checkIn);
            	 a+="<table class='table-dark table table-striped' border=1 style='width: 768px'><tr><td colspan=4>방정보</td></tr>";
            	 a+="<tr ><td colspan=2 ><a href='detail_room?detailAddr_roomNum_room=";
            	 a+=result[i].detailAddr_roomNum_room+"&id_hotel=${hotelvo.id_hotel}&checkIn="+checkIn+"&checkOut="+checkOut+"'><img src='download?filename=";
            	 a+=result[i].filename_room[0]+"' width=400 height=250 style='object-fit: fill;'></a></td>";
            	 a+="<td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
            	 a+="<br>방번호 :";
            	 a+=result[i].roomNum_room+"<br>1박 : ";
            	 a+=result[i].price_room +"<br>";
            	 a+="<p id='price_room'> 총금액 :";
            	 a+=result[i].price_room * result[i].days +"</p></td></tr>";
            	 a+="</table>";
             }
            
             $("#roomListDiv").append(a);
             //document.getElementById("roomListDiv").append 
          },
          error : function(){
             alert("서버요청 실패")
          }
       })
    })
 
 /* $('#checkOut_res').change(function(){
     let checkIn = $('#checkIn_res').val();
     let checkOut = $('#checkOut_res').val();
     let detailAddr_roomNum = $('#detailAddr_roomNum_res').val();
     let data = checkIn+"/"+checkOut+"/"+detailAddr_roomNum;
     console.log(data);
     $.ajax({
        url: "priceCheck.do",
        type:"post",
        data :{data:data},
        dataType:'json',
        success : function(result){
        	 
          $("#price_room").html(${roomvo.price_room } * result + '\\');
          $("#price_res").val((${roomvo.price_room } * result ));
        },
        error : function(){
           alert("서버요청 실패")
        }
     })
  })
 */   
   
   
</script>

</body>
</html>