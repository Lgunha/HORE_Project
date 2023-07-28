<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
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

<!-- 로그인 화면 -->
<div style="position:absolute; top:25%; left:38.5%; text-align:center;">
	<form action = "login" method = "post" id="loginform">
		<div class="input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">아이디</span>
		  <input type="text" name="id_user" class="form-control" placeholder="아이디" id="id_user">
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">비밀번호</span>
		  <input type="text"  name="pw_user" class="form-control" placeholder="비밀번호"  id="pw_user">
		</div>
		
		<input type="button" value="회원 로그인" id="user_chk" class="btn btn-outline-primary">
		<input type="button" value="비회원 로그인" onclick="unuser_chk()" class="btn btn-outline-primary">
	</form>
	<a href="join_user" class="btn btn-outline-primary btn-lg" style="margin-top:10px;">회원가입</a> 

</div>










</body>
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function user_chk(){
		document.getElementById("loginform").submit();
	}
	
	function unuser_chk(){
		document.getElementById("id_user").value = "비회원";
		document.getElementById("loginform").submit();
	}

	$('#user_chk').click(function(){
	       let ID = $('#id_user').val();
	       let pw = $('#pw_user').val();
	       
	       
	       $.ajax({
	          url: "LoginCheck.do",
	          type:"post",
	          data : {ID:ID,pw:pw},
	          dataType:"JSON",
	          success : function(result){
	             if(result==1){
	            	 document.getElementById("loginform").submit();
	             }else{
	            	 alert("아이디와 비밀번호를 확인해주세요.");
	             }
	          },
	          error : function(){
	             alert("서버요청 실패")
	          }
	       })
	    })
	
	
	

</script>
</html>
