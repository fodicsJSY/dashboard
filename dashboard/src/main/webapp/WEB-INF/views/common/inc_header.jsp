<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ai VinUS DASHBOARD</title>
</head>
<body>
	<div class="TopLeft">
		<a class="logo"> <img src="../../resources/img/fodics_bi.png"></a>
		<h1 id="main_title" >Ai VinUS DASHBOARD</h1>
	</div>
	<div class="TopRight">
		<p id="time_title" class="time">2021-00-00 10:00:00</p>
		<a class="rollover" alt="셋팅팝업"><img src="../../resources/img/btn_setting.png"> <img src="../../resources/img/btn_setting_hover.png" class="over" onclick="openPopupSetting();"></a>
		<!-- <a class="rollover" alt="최소화"><img src="img/btn_winMini.png"> <img src="img/btn_winMini_hover.png" class="over"></a>
		<a class="rollover" alt="창크기"><img src="img/btn_winTile.png"> <img src="img/btn_winTile_hover.png" class="over"></a> -->
		<a href="/logout"><img src="../../resources/img/btn_winClose.png"> <img src="../../resources/img/btn_winClose_hover.png" class="over"></a>
	</div>
</body>
</html>
			