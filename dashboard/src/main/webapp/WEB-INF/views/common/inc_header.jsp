<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ai VinUS DASHBOARD</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/resources/css/popup.css">

</head>
<body>
	<div class="TopLeft">
		<a class="logo"> <img src="../../resources/img/fodics_bi.png"></a>
		<h1 id="main_title" >Ai VinUS DASHBOARD</h1>
	</div>
	<div class="TopRight">
		<p id="time_title" class="time">2021-00-00 10:00:00</p>
		<a href="/setting" class="rollover" alt="셋팅팝업" ><img src="../../resources/img/btn_setting.png"> <img src="../../resources/img/btn_setting_hover.png" class="over"></a>

		<!-- <a class="rollover" alt="최소화"><img src="img/btn_winMini.png"> <img src="img/btn_winMini_hover.png" class="over"></a>
		<a class="rollover" alt="창크기"><img src="img/btn_winTile.png"> <img src="img/btn_winTile_hover.png" class="over"></a> -->
		<a href="/logout" class="rollover" ><img src="../../resources/img/btn_winClose.png"><img src="../../resources/img/btn_winClose_hover.png" class="over"></a>
	</div>



	<script>
		setTimeout(setInterval( getTime, 10), 100);

		function getTime() {
			var d = new Date();	// 현재 날짜와 시간
			var year = d.getFullYear();		// 시
			var month = d.getMonth()+1;		// 시
			var day = d.getDate();		// 시

			var hur = d.getHours();		// 시
			var min = d.getMinutes();	//분
			var sec = d.getSeconds();	//초

			
			var timeBoard = document.getElementById("time_title"); // 값이 입력될 공간

			if(timeBoard == null)
			{
				return;
			}

			if (Number(month) < 10)
				month = '0' + month;

			if (Number(day) < 10)
				day = '0' + day;

			if (Number(hur) < 10)
				hur = '0' + hur;

			if (Number(min) < 10)
				min = '0' + min;

			if (Number(sec) < 10)
				sec = '0' + sec;

			//var startfullDate = String(year) + String(month) + String(day);
			var time = year + "-" + month + "-" + day + " "+ hur + ":" + min + ":" + sec // 형식 지정
			timeBoard.innerText = time;	// 출력
		}


	</script>
</body>
</html>
