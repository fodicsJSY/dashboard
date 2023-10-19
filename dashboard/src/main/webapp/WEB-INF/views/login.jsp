<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ai VinUS DASHBOARD</title>


    
    <!-- css -->
    <!-- sweetalert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css">

    <link rel="stylesheet" href="../../resources/css/style.css">
    <link rel="shortcut icon" href="../../img/favicon.ico" type="image/x-icon" />


</head>
<body>


    <!-- 로그인 -->
	<section class="loginWrap">  
		<div class="loginTop">
			<div class="loginLogo">
				<p><img src="../../resources/img/admin/vinus_bi.png"></p>
				<p><img src="../../resources/img/admin/vinus_biLogo.png"></p>
			</div>
		</div>
        <div class="loginBox">
            <p><img src="../../resources/img/admin/btn_login.png"></p>
            <form action="/login" method="POST" id="loginFrm" class="loginForm">
				<input class="id-field" type="text" name="userId" placeholder="아이디" >
				<input class="pw-field" type="password" name="userPw" placeholder="비밀번호" >
				<button class="submit-btn" id="log-in">로그인</button>
            </div>
            <form>
        <div class="loginCompany"> 
            <img src="../../resources/img/fodics_logo.png">
		</div>
	</section>



    <!-- js -->
    <!-- sweetalert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
    <script>
        const loginForm = document.getElementById("loginFrm"); //로그인 폼
        const userId = document.querySelector("#loginFrm input[name='userId']");
        const userPw = document.querySelector("#loginFrm input[name='userPw']");
        
        loginForm.addEventListener("submit", e => {
            
            if(userId.value.trim().length == 0){
                // console.log(userId.value);
                Swal.fire('아이디를 입력해주세요.')
                // alert("아이디를 입력해주세요.");
                
                userId.value =""; // 잘못 입력된 값(공백) 제거
                
                userId.focus(); // 아이디 input태그에 초점을 맞춤
                
                e.preventDefault(); // 제출 못하게 하기
                return;
            }
            
            // 비밀번호가 입력되지 않은 경우
            if(userPw.value.trim().length == 0){
                // console.log(userPw.value);
                Swal.fire('비밀번호를 입력해주세요.')
                // alert("비밀번호를 입력해주세요.");

                userPw.focus(); // 비밀번호 input태그에 초점을 맞춤

                e.preventDefault(); // 제출 못하게 하기
                return;
            }

        })
   </script>

</body>
</html>