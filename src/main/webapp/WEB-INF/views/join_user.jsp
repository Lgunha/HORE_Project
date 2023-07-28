<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join_user</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>

<br>
<!-- header -->
<div style= "text-align:center">
	<a href="<%=request.getContextPath()%>/">	<img src = "resources/img/logo.png" style = "width : 150px; height : 130px;"></a>	
</div>
<!-- 메인 페이지 -->
<hr>

<div style="position:absolute; top:25%; left:38.5%; text-align:center;">
<h3>회원가입</h3>
<form action="join_user_save" method="post"> <!--  encType 이 서버에게 첨부파일을 전송해주는 역할을 한다 -->
		<div class="input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">아이디</span>
		  <input type="text" name="id_user" class="form-control" placeholder="아이디" id="id_user" onkeyPress="keypress()">
		  <input type="button" value="중복확인" class="btn btn-outline-primary" id="join_user_chk">
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">비밀번호</span>
		  <input type="text"  name="pw_user" class="form-control" placeholder="비밀번호" >
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">이름</span>
		  <input type="text" name="name_user" class="form-control" placeholder="이름" >
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">나이</span>
		  <input type="text" name="age_user" class="form-control" placeholder="나이" >
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">전화번호</span>
		  <input type="text" name="tel_user" class="form-control" placeholder="전화번호" >
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">이메일</span>
		  <input type="text" name="email_user" class="form-control" placeholder="이메일" >
		</div>
		
		<div class="input-group" style="margin-left:22px;">
		  <div class="input-group-text">
		  	<span class="input-group-text" id="basic-addon1">일반회원</span>
		    <input class="form-check-input mt-0" type="radio" value="일반회원"  checked="checked" name ="type_user">
		  </div>
		  <div class="input-group-text">
		  	<span class="input-group-text" id="basic-addon1">사업주</span>
		    <input class="form-check-input mt-0" type="radio" value="사업주"  name ="type_user">
		  </div>
		</div>
		
		
		
		<input type="submit" value="회원가입" class="btn btn-outline-primary btn-lg" style="margin-top:10px;" id="join_user_save">	
	</form>
</div>
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	const target =document.getElementById("join_user_save");
	target.disabled=true;
	function keypress(){
		target.disabled=true;
	} 
	
	
	$('#join_user_chk').click(function(){
      let ID = $('#id_user').val();
       
       $.ajax({
          url: "join_user_check.do",
          type:"post",
          data : {ID:ID},
          dataType:"JSON",
          success : function(result){
             if(result==1){
            	 alert("사용가능한 아이디입니다.")
            	 target.disabled=false;
             }else{
            	 alert("중복된 아이디입니다.");
             }
          },
          error : function(){
             alert("서버요청 실패")
          }
       })
	})
	

</script>



</body>
</html>