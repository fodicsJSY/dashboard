<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Ai VinUS DASHBOARD</title>



    <%-- toust UI 시작 --%>
	<%-- <link rel="stylesheet" href="./node_modules/tui-chart/dist/toastui-chart.css">
	<script src="./node_modules/tui-chart/dist/toastui-chart.js"></script>
	<link rel="stylesheet" href="./node_modules/tui-grid/dist/tui-grid.css" />
	<script src="./node_modules/tui-grid/dist/tui-grid.js"></script>    
	<link rel="stylesheet" href="./node_modules/tui-date-picker/dist/tui-date-picker.css">
	<script src="./node_modules/tui-date-picker/dist/tui-date-picker.js"></script> --%>
	<%-- toust UI 끝 --%>

	<script src="/resources/node_modules/jquery/3.6.0/jquery.min.js"></script>

	<%-- css --%>
	<link rel="stylesheet" href="/resources/css/camera/main_camera_part1_Vehicle.css">
	<link rel="stylesheet" href="/resources/css/popup.css">
	<link rel="stylesheet" href="/resources/css/style.css">
	<link rel="stylesheet" href="/resources/css/camera.css">
	<link rel="stylesheet" href="/resources/css/style_grid.css">
	<link rel="stylesheet" href="/resources/font/nanumsquare.css">
	<link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="/resources/css/style_scrollBar.css"/>  
	<link rel="stylesheet" href="/resources/css/style_graph.css" /> 

</head>

<body>
	<%-- 전체 wrap.S --%>
	<div class="wrap"  id="indexWrap">  
		<%-- 헤더.S --%>
		<header id="header"> 
			<jsp:include page="/WEB-INF/views/common/inc_header.jsp"/>
		</header>
		<%-- 헤더.E --%>

		<%-- 내용.S --%>		
		<div class="container">

			<%-- side 영역.S --%>
			<div id="side">

				<%-- 좌측 네비.S --%>
				<div class="btn-navi" >
					<a href="/main">
						<button type="button" class="btn_object">M A I N</button>
					</a>
					<%-- <button type="button" class="btn_evnet" onClick="OnClickEvent();">E V E N T</button> --%>
					<a href="/mainCamera">
						<button type="button" class="btn_camera_on">C A M E R A</button>
					</a>
				</div>
				<%-- 좌측 네비.E --%>

				<%-- 실시간 채널.S --%>
				<jsp:include page="/WEB-INF/views/main/inc_side.jsp"/>
				<%-- 실시간 채널.E --%>
				
			</div>
			<%-- side 영역.E --%>


			<%-- 우측 메인.S --%>
			<div id="contentsWrap">
				<%-- 상단 날짜,버튼 영역.S --%>
				<div class="mainTop">
					<div class=" dateArea">

						<%-- 달력 --%>
						<div id="tui-date-picker-container"></div>
						<a class="rollover" alt="달력" id="tui-date-picker-main" style="display:none;">
							<img src="/resources/img/btn-calendar.png"> 
							<img src="/resources/img/btn-calendar_hover.png" class="over">
						</a>

						<p class="date" id='mainDate'></p>
						<button type="button" class="btn-date" style="display:none;">◀<%-- <img src="img/btn-calendarLeft.png">--%></button>
						<button type="button" class="btn" style="display:none;">오늘</button>
						<button type="button" class="btn-date" style="display:none;">▶<%-- <img src="img/btn-calendarRight.png">--%></button>
					</div>					
				</div>
				<%-- 상단 날짜,버튼 영역.E --%>

				<%-- 메인컨텐츠.S --%>
				<div class="contents">

					<%-- 섹션 좌측.S --%>
					<div class="sectionBox" style="width: 1050px; height:915px; margin: 0 18px 0 0 !important;">		
						<div class="innerBox divCameraToday">
							<div class="contentsTitle">
								<div class="title">
									<h4>TODAY</h4>
								</div>
							</div>
							<div class="data">
								<ul>
									<li class="today-part1" style="height:85%;">
										<div class="todayTXT todayCar">
											<p class="todayIMG"><img src="/resources/img/icon_titleCar.png"></p>
											<p class="todayTitle color-Car" style="color:#d4e079">차량</p>
											<p class="contrast">전일대비 <span class="lower" id="compare_cnt">0</span></p>
											<p class="amount" id="total_vehicle_cnt">0</p>

										</div>
										<div>
											<div style = "width:100%;"  id = "count_vehicle_display_wnd">
												<c:choose>
													<c:when test="${empty dailyVehicleCount[0]}">
														<!-- 리스트가 null이거나 비어 있을 경우 0 출력 -->
														<div>카메라 없음</div>
														<div class="vehicleCountRow">0</div>
													</c:when>
													<c:otherwise>
														<!-- 리스트의 요소 개수를 출력 -->
														<div>${dailyVehicleCount[0].cameraName}</div>
														<c:choose>
															<c:when test="${empty dailyVehicleCount[0].vehicleCount}">
																<div class="vehicleCountRow">0</div>
															</c:when>
															<c:otherwise>
																<div class="vehicleCountRow">${dailyVehicleCount[0].vehicleCount}</div>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</li>
								</ul>
								<div class="dounut" style="display: flex; flex-direction: column; ">
									<div class="todayData" style = "width:600px; height:400px; margin: 0 0 15px 15px;" >
										<div style = "width:100%; height:10%;">
											<div style = "text-align:left; padding-left: 3%; padding-top: 18px; font-size:16px; " >차량 종류별 검지 건(수)</div>
											<br/>
											<span style="width: 95%; height: 2px; background:#333333;">
											</div>
										<div style = "width:85%; height:85%; margin: 20px 0 0 40px; " >  
											<div id = "car_pie_chart" style="width: 100%; height: 100%;">

											</div>
										</div>
									</div>         
									<div class="todayData" style ="width:600px; height:400px; " >
										<div style = "width:100%; height:10%;">
											<div style = "text-align:left; padding-left: 3%; padding-top: 18px; font-size:16px; " >이륜차 종류별 검지 건(수)</div>
											<br />
											<span style="width: 95%; height: 2px; background:#333333;" >
										</div>									
										<div style = "width:85%; height:85%; margin: 20px 0 0 40px;" > 
											<div id = "cycle_pie_chart" style="width: 100%; height: 100%;">

											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>

					</div>
					<%-- 섹션 좌측.E --%>

					<%-- 섹션 우측.S --%>
					<div class="sectionBox2" style="width: 650px !important;">
						<div class="innerBox divSideAge" style="width: 100%; height:25vh;  height:450px; margin-bottom: 13px !important;">
							<div class="contentsTitle chartTitle">
								<div class="title">
									<h4>연령별 출입자 현황</h4>
								</div>								
								<div class="title">
									<h4>마스크 착용 비율</h4>
								</div>								
							</div>
							<div class="chart01">
								<div>
									<%-- 연령별 출입자 현황 도넛그래프 영역 --%>
									<div class="chart" id="chart_radial_age" style="width: 250px; height: 350px; margin: 0 0 0 5%; padding: 0 0 10% 0; ">
										<div id="chart_radial_age" style="width: 100%; height: 100%;" ></div>
									</div>   
								</div>
								<div class="genderMaskChart" >
									<div class="chart" style="width: 250px; height: 180px; ">
										<%-- 남성 마스크 착용 비율 게이지 차트 --%>
										<div id="chart_pie_donut" style="width: 100%; height: 100%;"></div>
									</div>   								
									<div class="chart"  style="width: 250px; height: 180px;">
										<%-- 여성 마스크 착용 비율 게이지 차트 --%>
										<div id="chart_pie_donut2" style="width: 100%; height: 100%;"></div>
									</div> 
									<div class="corlorGuide alignL">
										<div class="corlorGuide_male">
											<div class="colorBox cBG-Male" ></div> 
											<div class="guideTXT">남자</div>
										</div>
										<div class="corlorGuide_female">
											<div class="colorBox cBG-Female" ></div> 
											<div class="guideTXT">여자</div>
										</div>
									</div>	
								</div>

							</div>							
						</div>		
	
						<div class="innerBox divSide" style="width: 100%; height:446px !important;">
							
							<div class="data">								
								<div class="contentsTitle">
									<div class="title">
										<h4>이벤트 발생 비율</h4>
									</div>
								</div>
								<div class="data">
									<%--<div id = "event_acc_wnd" style="margin-top: 30px; width:100%; height:350px; "></div>--%>
									<div id = "event_acc_wnd" style="margin-top: 30px; width:100%; height:350px; ">
										<%-- 이벤트 발생 비율 도넛 차트 --%>
									</div>
								</div>
								
							</div>
						</div>	
					</div>	
					<%-- 섹션 우측.E --%>
				</div>
				<%-- 메인컨텐츠.E --%>
				<div id="bottom">
					<p class="Notice">※ 화면에 표시되는 모든 실시간 데이터는 1분마다 자동으로 업데이트 합니다. 다만 “시간대별 현황” 그래프의 실시간 데이터는 정시에 한 번씩 업데이트 합니다.</p>
					<div class="madeFodics">포딕스시스템</div>
				</div>
			</div>
			<%-- 우측 메인.E --%>

		</div>
		<%--  내용.E --%>
	</div>
	<%-- 전체 wrap.E --%>



	<%-- echarts --%>
	<script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
		


	<%-- 전역변수 시작--%>
	<script>
    /* 연령별 출입자 현황 도넛차트 시작*/
		var youngMale = ${summaryList[0] != null ? summaryList[0].face_youngMale : 0};
		var youngFemale = ${summaryList[1] != null ? summaryList[1].face_youngFemale : 0};
		var adultMale = ${summaryList[2] != null ? summaryList[2].face_adultMale : 0};
		var adultFemale = ${summaryList[3] != null ? summaryList[3].face_adultFemale : 0};
		var middleMale = ${summaryList[4] != null ? summaryList[4].face_middleMale : 0};
		var middleFemale = ${summaryList[5] != null ? summaryList[5].face_middleFemale : 0};
		var seniorMale = ${summaryList[6] != null ? summaryList[6].face_seniorMale : 0};
		var seniorFemale = ${summaryList[7] != null ? summaryList[7].face_seniorFemale : 0};
	/* 연령별 출입자 현황 도넛차트 끝*/


	/* 이벤트 발생 비율 차트(금일) 전역변수 초기화 시작*/
		var invCnt = ${selectMainEventList[13] != null ? selectMainEventList[13].invCnt : 0};
		var lotCnt = ${selectMainEventList[14] != null ? selectMainEventList[14].lotCnt : 0};
		var cntCnt = ${selectMainEventList[15] != null ? selectMainEventList[15].cntCnt : 0};
		var falCnt = ${selectMainEventList[16] != null ? selectMainEventList[16].falCnt : 0};
	/* 이벤트 발생 비율 차트(금일) 전역변수 초기화 끝*/


	/* 마스크를 착용한 남자의 비율 계산(금일) 전역변수 초기화 시작*/
		var maskManCount = ${maskManCount != null ? maskManCount : 0};
	/* 마스크를 착용한 남자의 비율 계산(금일) 전역변수 초기화 끝*/

	/* 마스크를 착용한 남자의 비율 계산(금일) 전역변수 초기화 시작*/
		var maskWomanCount = ${maskWomanCount != null ? maskWomanCount : 0};
	/* 마스크를 착용한 남자의 비율 계산(금일) 전역변수 초기화 끝*/



	

	</script>
	<%-- 전역변수 끝--%>


	<%-- js --%>	
	<script src="/resources/js/camera/main_camera_part1_Vehicle.js"></script>   

	<%-- <script src="/resources/js/commonFunctions.js"></script>    --%>
	<script  src="/resources/js/tabcontent.js"></script>

</body>
</html>
