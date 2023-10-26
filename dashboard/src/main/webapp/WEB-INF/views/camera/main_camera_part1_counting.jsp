<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ai VinUS DASHBOARD</title>


    <!-- toust UI 시작 -->
	<link rel="stylesheet" href="./node_modules/tui-chart/dist/toastui-chart.css">
	<script src="./node_modules/tui-chart/dist/toastui-chart.js"></script>
	<link rel="stylesheet" href="./node_modules/tui-grid/dist/tui-grid.css" />
	<script src="./node_modules/tui-grid/dist/tui-grid.js"></script>    
	<link rel="stylesheet" href="./node_modules/tui-date-picker/dist/tui-date-picker.css">
	<script src="./node_modules/tui-date-picker/dist/tui-date-picker.js"></script>
	<!-- toust UI 끝 -->

	<script src="./node_modules/jquery/3.6.0/jquery.min.js"></script>

  <!-- css -->
  <link rel="stylesheet" href="/resources/css/camera/main_camera_part1_counting.css">
  <link rel="stylesheet" href="/resources/css/popup.css">
  <link rel="stylesheet" href="/resources/css/style.css">
  <link rel="stylesheet" href="/resources/css/camera.css">
  <link rel="stylesheet" href="/resources/css/style_graph.css" />  
  <link rel="stylesheet" href="/resources/css/style_grid.css">
  <link rel="stylesheet" href="/resources/font/nanumsquare.css">
  <link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="/resources/css/style_scrollBar.css"/>  
  <link rel="stylesheet" href="/resources/css/style_small_grid.css" />   
  
  

  
 </head>

 <body>
	<!-- 전체 wrap.S -->
	<div class="wrap"  id="indexWrap">  

		<!-- 헤더.S -->
		<header id="header"> 
			<jsp:include page="/WEB-INF/views/common/inc_header.jsp"/>
		</header>
		<!-- 헤더.E -->

		<!-- 내용.S -->		
		<div class="container">

			<!-- side 영역.S -->
			<div id="side">

				<!-- 좌측 네비.S -->
				<div class="btn-navi" >
					<a href="/main">
						<button type="button" class="btn_object">M A I N</button>
					</a>
					<!-- <button type="button" class="btn_evnet" onClick="OnClickEvent();">E V E N T</button> -->
					<a href="/mainCamera">
						<button type="button" class="btn_camera_on">C A M E R A</button>
					</a>
				</div>
				<!-- 좌측 네비.E -->

				<!-- 실시간 채널.S -->
				<jsp:include page="/WEB-INF/views/main/inc_side.jsp"/>
				<!-- 실시간 채널.E -->
				
			</div>
			<!-- side 영역.E -->


			<!-- 우측 메인.S -->
			<div id="contentsWrap">
				<!-- 상단 날짜,버튼 영역.S -->
				<div class="mainTop">
					<div class=" dateArea">

						<!-- 달력 -->
						<div id="tui-date-picker-container"></div>
						<a class="rollover" alt="달력" id="tui-date-picker-main" style="display:none;">
							<img src="/resources/img/btn-calendar.png"> 
							<img src="/resources/img/btn-calendar_hover.png" class="over">
						</a>

						<p class="date" id='mainDate'>2021년 07월 21일</p>
						<button type="button" class="btn-date" href="#" style="display:none;">◀<!-- <img src="img/btn-calendarLeft.png">--></button>
						<button type="button" class="btn" href="#" style="display:none;">오늘</button>
						<button type="button" class="btn-date" href="#" style="display:none;">▶<!-- <img src="img/btn-calendarRight.png">--></button>
					</div>						
				</div>
				<!-- 상단 날짜,버튼 영역.E -->

				<!-- 메인컨텐츠.S -->
				<div class="contents">

					<!-- 섹션 좌측.S -->
					<div class="sectionBox" style="width: 1080px; height:915px;";>						
						<div class="innerBox divCameraToday" style="width: 100%;">
							<div class="contentsTitle">
								<div class="title">
									<h4>TODAY</h4>
								</div>
							</div>
							<div class="data">
								<ul>
									<li class="today-part1" style="width: 100%; height:85%;">
										<div class="todayTXT todayCounting">
											<p class="todayIMG"><img src="/resources/img/icon_titleCounting.png"></p>
											<p class="todayTitle color-Counting" style="color:#ff7978">카운팅</p>
											<p class="contrast">전일대비 <span class="lower" id="compare_cnt">▼0</span></p>
											<p class="amount" id="total_counting_cnt">0</p>

										</div>
										<div>
											<div style = "width:100%;"  id = "count_display_wnd">
												<table class="countingTable">
													<thead>
														<tr>
															<th>카메라이름</th>
															<th>합계</th>
															<th>사람</th>
															<th>차량</th>
															<th>얼굴</th>
															<th>LPR</th>
															<th>침입합계</th>
															<th>사람</th>
															<th>차량</th>
															<th>얼굴</th>
															<th>LPR</th>
															<th>배회합계</th>
															<th>사람</th>
															<th>얼굴</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th>먼우금사거리</th>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>

														</tr>
														<tr>
															<th>원당사거리</th>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
														</tr>
														<tr>
															<th>길병원사거리</th>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
														</tr>
														<tr>
															<th>동인천역</th>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
														</tr>
														<tr>
															<th>신복사거리</th>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
														</tr>
														<tr>
															<th>임학사거리</th>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
														</tr>
														<tr>
															<th>만수사거리</th>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
														</tr>
														<tr>
															<th>송림오거리</th>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
														</tr>
														<tr>
															<th>가정사거리</th>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
														</tr>
														<tr>
															<th>도화초교사거리</th>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
														</tr>
														<tr>
															<th>선학역사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>가정오거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>석바위사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>수산물검사원사거리</th>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
														</tr>
														<tr>
															<th>간석오거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>능해IC</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>장승백이사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
														<tr>
															<th>남동공단입구사거리</th>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
															<td>123456</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- 섹션 좌측.E -->

					<!-- 섹션 우측.S -->
					<div class="sectionBox2">
						<div class="innerBox divSideAge" style="height:25vh;  height:450px;">
							<div class="contentsTitle chartTitle">
								<div class="title">
									<h4>연령별 출입자 현황</h4>
								</div>								
								<div class="title">
									<h4>마스크 착용 비율</h4>
								</div>								
							</div>
							<div class="chart01" >
								<div>
									<!-- 연령별 출입자 현황 도넛그래프 영역 -->
									<div class="chart" style="width: 250px; height: 350px; margin: 0 0 0 5%; padding: 0 0 10% 0; ">
										<div id="chart_radial_age" style="width: 100%; height: 100%;" ></div>
									</div>   
								</div>
								<div class="genderMaskChart" style="margin: 15px 0 0 0;">
									<div class="chart" style="width: 250px; height: 160px; ">
										<!-- 남성 마스크 착용 비율 게이지 차트 -->
										<div id="chart_pie_donut" style="width: 100%; height: 100%;"></div>
									</div>   								
									<div class="chart"  style="width: 250px; height: 160px;">
										<!-- 여성 마스크 착용 비율 게이지 차트 -->
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
	
						<div class="innerBox divSide" style="height:25vh;  height:450px;">
							
							<div class="data">								
								<div class="contentsTitle">
									<div class="title">
										<h4>이벤트 발생 비율</h4>
									</div>
								</div>
								<div class="data">
									<!--<div id = "event_acc_wnd" style="margin-top: 30px; width:100%; height:350px; "></div>-->
									<div id = "event_acc_wnd" style="margin-top: 30px; width:100%; height:350px; ">
										<!-- 이벤트 발생 비율 도넛 차트 -->
									</div>
								</div>
								
							</div>
						</div>	
					</div>	
					<!-- 섹션 우측.E -->
				</div>
				<!-- 메인컨텐츠.E -->
				<div id="bottom">
					<p class="Notice">※ 화면에 표시되는 모든 실시간 데이터는 1분마다 자동으로 업데이트 합니다. 다만 “시간대별 현황” 그래프의 실시간 데이터는 정시에 한 번씩 업데이트 합니다.</p>
					<div class="madeFodics">포딕스시스템</div>
				</div>
			</div>
			<!-- 우측 메인.E -->

		</div>
		<!--  내용.E -->
	</div>
	<!-- 전체 wrap.E -->


	<!-- echarts -->
	<script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>

	<!-- js -->
  <script src="/resources/js/camera/main_camera_part1_counting.js"></script>   
  <script src="/resources/js/commonFunctions.js"></script>   
  <script src="/resources/js/EventAccPieChart.js"></script>
  <script src="/resources/js/EventChart.js"></script>
  <script src="/resources/js/tabcontent.js"></script>
  <script src="/resources/js/popupSetting.js"></script>
  <script src="/resources/dashboard_config.json"></script> 
  
  <!--
  <script>	    
		const chart = toastui.Chart;
		var DataGridObj = [];

       	window.addEventListener('load', function() {
			var allElements = document.getElementsByTagName('*');
			Array.prototype.forEach.call(allElements, function(el) {
				var includePath = el.dataset.includePath;
				if (includePath) {
					var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function () {
						if (this.readyState == 4 && this.status == 200) {
							var file = el.getAttribute('file');
							if (file == "inc_side") {
								readTextFile("/data/dailyCount.json", saveDailyData);
								loadCameraGroupData();
							}
							el.outerHTML = this.responseText;

							if (file == "inc_header") {
								if(config_data[0].exe_type=='1')
								{
									document.getElementById("main_title").innerText = "Ai VinUS DASHBOARD SERVER";
								}
							}
						}
                  	};
					xhttp.open('GET', includePath, true);
					xhttp.send();
              	}
          	});
			calendarToday();

			readTextFile("./data/dailyCount.json",
				function (text) {
					DataEvtObj = JSON.parse(text);		
					LoadCntCount();
					LoadEvemtAccPieChart(DataEvtObj);
				}
			); 	
			readTextFile("./data/dailyCountByCamera.json",
				function (text) {
					DataGridObj = JSON.parse(text);		
					LoadWndCountGrid(); 
				}
			);       			

			// Righe Page 처리
			LoadRadialBarChart();
			LoadPieDonutChartMale();
			LoadPieDonutChartFemale();		
			
      	});
	
		function LoadCntCount()
		{
			for( var i = 0; i < DataEvtObj.length ; i++){					
				var compare_value = parseInt(DataEvtObj[i].CNT_CNT_BACK_1D) - parseInt(DataEvtObj[i].CNT_CNT);
				var display_value;
				if(compare_value < 0){
					display_value = '▲' + Math.abs(compare_value);
					document.getElementById('compare_cnt').style.color = '#eb6877';
					$('#compare_cnt').html(display_value);
				}else{						
					display_value = '▼' +  Math.abs(compare_value);
					document.getElementById('compare_cnt').style.color = '#00b7ee';
					$('#compare_cnt').html(display_value);
				}
				$('#total_counting_cnt').html(DataEvtObj[i].CNT_CNT);
			}		
		}

		function LoadWndCountGrid()
		{
			tui.Grid.applyTheme("normal", {
			area: {
				header: {
					border: '#2d2d2d'
				}
			},
			outline: {
				border: "#2d2d2d",
			},
			cell: {
				normal: {
					background: "#252525",
					border: '#2d2d2d',
					text: '#c5c5c5',
					showHorizontalBorder: true,
					showVerticalBorder: true,
					fontSize: 10,	
				},
				header: {
					background: "#1a1a1a",
					border: "#2d2d2d",
					text: '#c5c5c5',
					showHorizontalBorder: true,
					showVerticalBorder: true,
				},
			},
			scrollbar:
				{
					border: "#2d2d2d",
					background: "#2d2d2d",
					emptySpace: "#1a1a1a",
					thumb : "#838383",
					active: "#aaa",
				},
			});
		
			grid_list = new tui.Grid({
				el: document.getElementById('count_display_wnd'),
				theme: 'default',
				data: DataGridObj,
				scrollX: false,
				scrollY: true,    

				fontSize: 7,
				rowHeight: 33,				
				bodyHeight: 725,				
				columns: [
					{
						align: 'left',
						header: '카메라 이름',
						name: 'CAMERA_NAME', 
						sortingType: 'desc', 
						sortable: true,
						fontSize: 7,
						width: 190, 										                         
					},
					{								
						align: 'right',   
						header: '합계',            
						name: 'CNT_CNT',						
						renderer: {
						styles: {
								color: 'rgba(255, 204, 69, 1)',
							},            			            
						},
						width: 70, 
					},
					{								
						align: 'right',   
						header: '사람',            
						name: 'PERSON',						
						renderer: {
						styles: {
								color: 'rgba(255, 255, 255, 1)',
							},            			            
						},
						width: 60, 
					},
					{								
						align: 'right',   
						header: '차량',            
						name: 'VEHICLE',						
						renderer: {
						styles: {
								color: 'rgba(255, 255, 255, 1)',
							},            			            
						},
						width: 60, 
					},
					{								
						align: 'right',   
						header: '얼굴',            
						name: 'FACE',						
						renderer: {
						styles: {
								color: 'rgba(255, 255, 255, 1)',
							},            			            
						},
						width: 60, 
					},
					{								
						align: 'right',   
						header: 'LPR',            
						name: 'LPR',
						renderer: {
						styles: {
								color: 'rgba(255, 255, 255, 1)',
							},            			            
						},
						width: 60, 
					},
					{								
						align: 'right',   
						header: '침입합계',            
						name: 'INV_CNT',						
						renderer: {
						styles: {
								color: 'rgba(255, 204, 69, 1)',
							},            			            
						},
						width: 70, 
					},
					{								
						align: 'right',   
						header: '사람',            
						name: 'INV_PERSON',						
						renderer: {
						styles: {
								color: 'rgba(255, 255, 255, 1)',
							},            			            
						},
						width: 60, 
					},
					{								
						align: 'right',   
						header: '차량',            
						name: 'INV_VEHICLE',						
						renderer: {
						styles: {
								color: 'rgba(255, 255, 255, 1)',
							},            			            
						},
						width: 60, 
					},
					{								
						align: 'right',   
						header: '얼굴',            
						name: 'INV_FACE',						
						renderer: {
						styles: {
								color: 'rgba(255, 255, 255, 1)',
							},            			            
						},
						width: 60, 
					},
					{								
						align: 'right',   
						header: 'LPR',            
						name: 'INV_LPR',						
						renderer: {
						styles: {
								color: 'rgba(255, 255, 255, 1)',
							},            			            
						},
						width: 70, 
					},
					{								
						align: 'right',   
						header: '배회합계',            
						name: 'LOT_CNT',
						renderer: {
						styles: {
								color: 'rgba(255, 204, 69, 1)',
							},            			            
						},
						width: 70, 
					},
					{								
						align: 'right',   
						header: '사람',            
						name: 'LOT_PERSON',						
						renderer: {
						styles: {
								color: 'rgba(255, 255, 255, 1)',
							},            			            
						},
						width: 60, 
					},					
					{								
						align: 'right',   
						header: '얼굴',            
						name: 'LOT_FACE',						
						renderer: {
						styles: {
								color: 'rgba(255, 255, 255, 1)',
							},            			            
						},
						width: 60, 
					},					
				],
            });			
    	}
   </script>
   -->
 </body>
</html>
