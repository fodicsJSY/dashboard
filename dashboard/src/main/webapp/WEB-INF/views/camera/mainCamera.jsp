<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ai VinUS DASHBOARD</title>


	<!-- toust UI 시작-->
	<link rel="stylesheet" href="./node_modules/tui-chart/dist/toastui-chart.css">
	<script src="./node_modules/tui-chart/dist/toastui-chart.js"></script>
	<link rel="stylesheet" href="./node_modules/tui-grid/dist/tui-grid.css" />
	<script src="./node_modules/tui-grid/dist/tui-grid.js"></script>    
	<link rel="stylesheet" href="./node_modules/tui-date-picker/dist/tui-date-picker.css">
	<script src="./node_modules/tui-date-picker/dist/tui-date-picker.js"></script> 
	<!-- toust UI 끝-->


	<script src="./node_modules/jquery/3.6.0/jquery.min.js"></script>


    <!-- css -->
	<link rel="stylesheet" href="/resources/css/camera/mainCamera/mainCameraStyle.css">
	<link rel="stylesheet" href="/resources/css/camera/mainCamera/mainCamera_camera.css"/>  
	
	<link rel="stylesheet" href="/resources/css/popup.css">
	<link rel="stylesheet" href="/resources/css/style_scrollBar.css"/>  
	<link rel="stylesheet" href="/resources/css/style_grid.css">
	<link rel="stylesheet" href="/resources/css/style_graph.css" />  
	<!-- <link rel="stylesheet" href="font/nanumsquare.css"> -->
	<link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon" />
</head>
<body>
    
    <!-- 전체 wrap.S -->
	<div class="wrap" id="indexWrap">  
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
						<button type="button" class="btn-date" style="display:none;">◀<!-- <img src="img/btn-calendarLeft.png">--></button>
						<button type="button" class="btn" style="display:none;">오늘</button>
						<button type="button" class="btn-date" style="display:none;">▶<!-- <img src="img/btn-calendarRight.png">--></button>
					</div>	
					<!-- <div class="btnArea">						
						<a class="rollover" alt="csv파일" ><img src="img/btn-downCSV.png"> <img src="img/btn-downCSV_hover.png" class="over"></a>
						<a class="rollover" alt="csv파일" ><img src="img/btn-downBMP.png"> <img src="img/btn-downBMP_hover.png" class="over"></a>
						<a class="rollover" alt="csv파일" ><img src="img/btn-downPrint.png"> <img src="img/btn-downPrint_hover.png" class="over"></a>
					</div> -->
				</div>
				<!-- 상단 날짜,버튼 영역.E -->

				<!-- 메인컨텐츠.S -->
				<div class="contents">

					<!-- 섹션 좌측.S -->
					<div class="sectionBox1">
						<div id="innerBox1" class="innerBox divCameraToday">
							<div class="contentsTitle">
								<div class="title">
									<h4>TODAY</h4>								
									
								</div>
								<!--
								<div style="position: relative; left: 700px; float: left;">
									 <button type="button" style="margin-top: 3px" class ="btn" onClick="location.href='main_camera_part2.html'">2분할</button>
								  	<button type="button" style="margin-top: 3px" class="btn" onClick="location.href='main_camera_part4.html'">4분할</button>
								    <button type="button" style="margin-top: 3px" class="btn" onClick="location.href='main_camera_part6.html'">6분할</button>
									<button type="button" style="margin-top: 3px" class="btn" onClick="location.href='main_camera.html'">8분할</button> 
								</div>-->
							</div>
							<div class="data">
								<ul>
									<li class="today-part8" >
										<a href="/mainCamera/mainCameraPart1Human">
											<div class="todayTXT todayHuman" style="margin-right:0px; width: 40%;" >
												<p class="todayIMG"><img src="/resources/img/icon_titleHuman.png"></p>
												<p class="todayTitle color-Human">사람</p>
												<p class="amount" id="total_person_cnt">0</p>
												<p class="contrast">전일대비 <span class="lower"  id="compare_person_cnt">0</span></p>
											</div>
										</a>
										<a href="/mainCamera/subCamera">
											<div id="Human_grid_area" style="width: 60%; float: left;">	
											</div>								
										</a>
									</li>
									<li class="today-part8" >
										<a href="/mainCamera/mainCameraPart1Vehicle">
											<div class="todayTXT todayCar"  style="margin-right:0px; width: 40%;">
												<p class="todayIMG"><img src="/resources/img/icon_titleCar.png"></p>
												<p class="todayTitle color-Car">차량</p>
												<p class="amount" id="total_vehicle_cnt">0</p>
												<p class="contrast">전일대비 <span class="upper" id="compare_vehicle_cnt">0</span></p>
											</div>
										</a>
										<a href="/mainCamera/subCamera">
											<div id="Car_grid_area" style="width: 60%; float: left;">
											</div>
										</a>
									</li>
									<li class="today-part8" >
										<a href="/mainCamera/mainCameraPart1Face">
											<div class="todayTXT todayFace"  style="margin-right:0px; width: 40%;">
												<p class="todayIMG"><img src="/resources/img/icon_titleFace.png"></p>
												<p class="todayTitle color-Face">얼굴</p>
												<p class="amount" id="total_face_cnt">0</p>
												<p class="contrast">전일대비 <span class="upper"  id="compare_face_cnt">0</span></p>
											</div>
										</a>
										<a href="/mainCamera/subCamera">
											<div id="Face_grid_area" style="width: 60%; float: left;">	
											</div>
										</a>
									</li>
									<li class="today-part8" >
										<a href="/mainCamera/mainCameraPart1Counting">
											<div class="todayTXT todayCounting"  style="margin-right:0px; width: 40%;">
												<p class="todayIMG"><img src="/resources/img/icon_titleCounting.png"></p>
												<p class="todayTitle color-Counting">카운팅</p>
												<p class="amount" id="total_count_cnt">0</p>
												<p class="contrast">전일대비 <span class="upper" id="compare_count_cnt">0</span></p>
											</div>
										</a>
										<a href="/mainCamera/subCamera">
											<div id="Counting_grid_area" style="width: 60%; float: left;">	
											</div>
										</a>
									</li>
									<li class="today-part8" >
										<a href="/mainCamera/mainCameraPart1Loitering">
											<div class="todayTXT todayIntrusion"  style="margin-right:0px; width: 40%;" >
												<p class="todayIMG"><img src="/resources/img/icon_titleIntrusion.png"></p>
												<p class="todayTitle color-Intrusion">침입</p>
												<p class="amount" id="total_inv_cnt">0</p>
												<p class="contrast">전일대비 <span class="lower" id="compare_inv_cnt">0</span></p>
											</div>
										</a>
										<a href="/mainCamera/subCamera">
											<div id="Invasion_grid_area" style="width: 60%; float: left;">		
											</div>										
										</a>
									</li>									
									<li class="today-part8" >
										<a href="/mainCamera/mainCameraPart1Loitering">
											<div class="todayTXT todayLoitering"  style="margin-right:0px; width: 40%;">
												<p class="todayIMG"><img src="/resources/img/icon_titleLoitering.png"></p>
												<p class="todayTitle color-Loitering">배회</p>
												<p class="amount" id="total_lot_cnt">0</p>
												<p class="contrast" >전일대비 <span class="lower" id="compare_lot_cnt">0</span></p>
											</div>
										</a>
										<a href="/mainCamera/subCamera">
											<div id="Loitering_grid_area" style="width: 60%; float: left;">		
											</div>
										</a>
									</li>
									<li class="today-part8">
										<div class="todayTXT todayLPR"  style="margin-right:0px; width: 40%;">
											<p class="todayIMG"><img src="/resources/img/icon_titleLPR.png"></p>
											<p class="todayTitle color-LPR">차량 번호 인식</p>
											<p class="amount">0</p>
											<p class="contrast">전일대비 <span class="lower">0</span></p>
										</div>
										<a href="/mainCamera/subCamera">
											<div id="LPR_grid_area" style="width: 60%; float: left;">	
											</div>
										</a>
									</li>
									<li class="today-part8">
										<div class="todayTXT todayParking"  style="margin-right:0px; width: 40%;">
											<p class="todayIMG"><img src="/resources/img/icon_titleNoParking.png"></p>
											<p class="todayTitle color-Parking">불법 주·정차</p>
											<p class="amount">0</p>
											<p class="contrast">전일대비 <span class="lower">0</span></p>
										</div>
										<a href="/mainCamera/subCamera">
											<div id="Parking_grid_area" style="width: 60%; float: left'">	
											</div>
										</a>
									</li>
								</ul>

							</div>
						</div>

					</div>
					<!-- 섹션 좌측.E -->

					<!-- 섹션 우측.S -->
					<div class="sectionBox22">
						<div class="innerBox1 divEventAge">
							<div class="contentsTitle mainCameraContentsTitle" >
								<div class="title">
									<h4>연령별 출입자 현황</h4>
								</div>
								<div class="title">
									<h4>마스크 착용 비율</h4>
								</div>
							</div>
                            <div class="totalData mainCameraTotalData">
                                <div class="data01" >
									<!-- 연령별 출입자 현황 도넛그래프 영역 -->
                                    <div class="chart" style="width: 250px; height: 350px; margin: 0 0 0 5%; padding: 0 0 5% 0;">
										<div id="chart_radial_age" style="width: 100%; height: 100%;" ></div>
									</div>   
                                </div>
                                
                                <div class="data02">	
                                    <div class="chart" style="width: 250px; height: 180px; ">
										<!-- 남성 마스크 착용 비율 게이지 차트 -->
										<div id="chart_pie_donut" style="width: 100%; height: 100%;"></div>
									</div>   								
									<div class="chart"  style="width: 250px; height: 180px;">
										<!-- 여성 마스크 착용 비율 게이지 차트 -->
										<div id="chart_pie_donut2" style="width: 100%; height: 100%;"></div>
									</div> 
                                    <div class="corlorGuide alignL" >
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
	
						<!--<div class="innerBox divEvent" style="height:25vh;  min-height:435px;">-->
						<div class="innerBox divEvent" >
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



    <!-- js -->

	<!-- echarts -->
	<script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>

	 <!-- 전역변수 시작-->
	 <script>
      
	 </script>
	 <!-- 전역변수 끝-->
 


	<!-- mainCamera js-->
	<script src="/resources/js/camera/mainCamera.js"></script>




</body>
</html>