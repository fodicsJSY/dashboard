<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Ai VinUS DASHBOARD</title>
</head>
<body>
	<%-- 실시간 채널.S --%>
<div class="LiveCH clearfix">
	<h3 class="LiveCH-title">실시간 카메라 정보</h3>

	<%--
	<div class="LiveCamera" id="cameraGroup">

	</div>
	--%>

	
	<div  style="overflow:auto; height:250px" id="LiveCamera" >
		<div class="ch-Total">Total </div>
		<%-- <div class="ch-Group">그룹명 01 </div>
		<dl class="ch-Live">
			<dt class="signalOK">1,212CH </dt>
			<dt class="signalNO">101CH </dt>
		</dl>
		<div class="ch-Group">그룹명 02 </div>
		<dl class="ch-Live">
			<dt class="signalOK">1,212CH </dt>
			<dt class="signalNO">11CH </dt>
		</dl>
		<div class="ch-Group">그룹명 03 </div>
		<dl class="ch-Live">
			<dt class="signalOK">1,212CH </dt>
			<dt class="signalNO">11CH </dt>
		</dl> --%>
	</div>

	<h3 class="LiveCH-title">실시간 검지현황</h3>
	<div class="LiveDetect">
		<dl class="DetectDetail">
			<dt class="live-view01">사람</dt>
			<dd> 건</dd>
		</dl>
		<%-- <dl class="DetectDetail">
			<dt class="live-view02">자동차</dt>
			<dd> 건</dd>
		</dl> --%>
		<dl class="DetectDetail">
			<dt class="live-view03">사람얼굴</dt>
			<dd> 건</dd>
		</dl>
		<%-- <dl class="DetectDetail">
			<dt class="live-view04">차량번호</dt>
			<dd> 건</dd>
		</dl>
		<dl class="DetectDetail">
			<dt class="live-view05">침입</dt>
			<dd> 건</dd>
		</dl>
		<dl class="DetectDetail">
			<dt class="live-view06">배회</dt>
			<dd> 건</dd>
		</dl>
		<dl class="DetectDetail">
			<dt class="live-view08">카운트</dt>
			<dd> 건</dd>
		</dl>
		<dl class="DetectDetail">
			<dt class="live-view07">넘어짐</dt>
			<dd> 건</dd>
		</dl> --%>

	</div>
	
</div>
<%-- 실시간 채널.E --%>
</body>
</html>



