<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<!-- header -->
<div style= "text-align:center">
	<a href="mainPage">	<img src = "resources/img/logo.png" style = "width : 150px; height : 130px;"></a>	
</div>
<!-- 메인 페이지 -->


<hr>

<div style="position:absolute; top:25%; left:38.5%; text-align:center;">
<h3>회원정보수정</h3>
<form action="update_user_save" method="post"> <!--  encType 이 서버에게 첨부파일을 전송해주는 역할을 한다 -->
		<div class="input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">아이디</span>
		  <input type="text" name="id_user" class="form-control" readonly value="${uvo.id_user }" >
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">비밀번호</span>
		  <input type="text"  name="pw_user" class="form-control" value="${uvo.pw_user }">
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">이름</span>
		  <input type="text" name="name_user" class="form-control" value="${uvo.name_user }" >
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">전화번호</span>
		  <input type="text" name="tel_user" class="form-control" value="${uvo.tel_user }">
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">이메일</span>
		  <input type="text" name="email_user" class="form-control" value="${uvo.email_user }" >
		</div>
		
		
		
		
		
		<input type="submit" value="정보수정" class="btn btn-outline-primary btn-lg" style="margin-top:10px;">	
		<a href="myPage?id_user=${nowUser }">
		<input type="button" value="돌아가기" class="btn btn-outline-primary btn-lg" style="margin-top:10px;">	
		</a>
	</form>
</div>







</body>
</html>