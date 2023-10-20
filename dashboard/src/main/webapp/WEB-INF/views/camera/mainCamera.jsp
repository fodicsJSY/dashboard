<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ai VinUS DASHBOARD</title>


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
        <jsp:include page="/WEB-INF/views/main/Setting.jsp"/>

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
										<a href="/mainCamera/mainCameraPart1Invasion">
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
                                <div class="data01">
                                    <div class="chart" id="chart_radial_age">
										<!-- 연령별 출입자 현황 도넛그래프 영역 -->
										<div id="age_chart" style="width: 250px; height: 400px;"></div>
                                    </div>   
                                </div>
                                
                                <div class="data02">	
                                    <!--
									<div class="chart" id="chart_pie_donut" style="margin-top: -15px"></div>   								
                                    <div class="chart" id="chart_pie_donut2" style="margin-top: -10px"></div> 
									-->
                                    <div class="chart" id="chart_pie_donut" style="width: 250px; height: 200px;">
										<!-- 남성 마스크 착용 비율 게이지 차트 -->
									</div>   								
                                    <div class="chart" id="chart_pie_donut2" style="width: 250px; height: 200px;">
										<!-- 여성 마스크 착용 비율 게이지 차트 -->
									</div> 
                                
                                    <!--<div class="corlorGuide alignL" style="margin-left: 80px; ">-->
                                    <div class="corlorGuide alignL" >
                                        <ul>
                                            <li><div class="colorBox cBG-Male" ></div> <div class="guideTXT">남자</div></li>
                                            <li><div class="colorBox cBG-Female" ></div> <div class="guideTXT">여자</div></li>
                                        </ul>
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
    <script>
		var myChart = echarts.init(document.getElementById('age_chart'))

		var option = {
		tooltip: {
			trigger: 'item'
		},
		legend: {
			top: '90%',
			data: ['미성년', '청년', '중장년', '노년']
		},
		series: [
			{
			name: '여성',
			type: 'pie',
			radius: ['23%', '46%'], // 첫 번째 도넛의 반지름 범위
			avoidLabelOverlap: false,
			itemStyle: {
				borderColor: 'black',
				borderWidth: 2,
				
			},
			label: {
				show: false,
				position: 'center'
			},
			emphasis: {
				
			},
			labelLine: {
				show: false
			},
			data: [
				{ value: 1048, name: '미성년',  itemStyle: { color: '#d3f1f9' }},
				{ value: 735, name: '청년',  itemStyle: { color: '#3fd5e3' }},
				{ value: 580, name: '중장년',  itemStyle: { color: '#00a0de' } },
				{ value: 580, name: '노년',  itemStyle: { color: '#0174cf' } }
				
			]
			},
			{
			name: '남성',
			type: 'pie',
			radius: ['50%', '73%'], // 두 번째 도넛의 반지름 범위
			avoidLabelOverlap: false,
			itemStyle: {
				borderColor: 'black',
				borderWidth: 2
			},
			label: {
				show: false,
				position: 'center'
			},
			emphasis: {

			},
			labelLine: {
				show: false
			},
			data: [
				{ value: 1048, name: '미성년',  itemStyle: { color: '#d3f1f9' }},
				{ value: 735, name: '청년',  itemStyle: { color: '#3fd5e3' }},
				{ value: 580, name: '중장년',  itemStyle: { color: '#00a0de' } },
				{ value: 310, name: '노년',  itemStyle: { color: '#0174cf' } }
			]
			}
		]
		};

		  //  차트 옵션 설정하기
		  myChart.setOption(option)


		// 남성 마스크착용비율 도넛차트
		var manMaskChart = echarts.init(document.getElementById('chart_pie_donut'))
		const gaugeData1 = [
			{
				value: 20,
				title: {
				offsetCenter: ['0%', '-30%']
				},
				detail: {
				valueAnimation: true,
				offsetCenter: ['0%', '-20%']
				}
			}
		];
		option = {
			series: [
				{
					type: 'gauge',
					startAngle: 90,
					endAngle: -270,
					pointer: {
						show: false
					},
					progress: {
						show: true,
						overlap: false,
						roundCap: false,
						clip: false,
						itemStyle: {
						// borderWidth: 1,
						// borderColor: '#464646'
						color: '#0f9faf'
						}
					},
					axisLine: {
						lineStyle: {
						width: 20
						}
					},
					splitLine: {
						show: false,
						distance: 0,
						length: 10
					},
					axisTick: {
						show: false
					},
					axisLabel: {
						show: false,
						distance: 50
					},
					data: gaugeData1,
					title: {
						fontSize: 20
					},
					detail: {
						width: 50,
						height: 14,
						fontSize: 20,
						color: '#fff',
						borderColor: 'inherit',
						formatter: '{value}%'
					}
				}
			]
		};
		//  차트 옵션 설정하기
		manMaskChart.setOption(option)


		// 여성 마스크착용비율 도넛차트
		var manMaskChart = echarts.init(document.getElementById('chart_pie_donut2'))
		const gaugeData2 = [
			{
				value: 80,
				title: {
				offsetCenter: ['0%', '-30%']
				},
				detail: {
				valueAnimation: true,
				offsetCenter: ['0%', '-20%']
				}
			}
		];
		option = {
			series: [
				{
					type: 'gauge',
					startAngle: 90,
					endAngle: -270,
					pointer: {
						show: false
					},
					progress: {
						show: true,
						overlap: false,
						roundCap: false,
						clip: false,
						itemStyle: {
						// borderWidth: 1,
						// borderColor: '#464646'
							color: '#e8534c'
						}
					},
					axisLine: {
						lineStyle: {
						width: 20
						}
					},
					splitLine: {
						show: false,
						distance: 0,
						length: 10
					},
					axisTick: {
						show: false
					},
					axisLabel: {
						show: false,
						distance: 50
					},
					data: gaugeData2,
					title: {
						fontSize: 20
					},
					detail: {
						width: 50,
						height: 14,
						fontSize: 20,
						color: '#fff',
						formatter: '{value}%'
					}
				}
			]
		};
		//  차트 옵션 설정하기
		manMaskChart.setOption(option)


		var eventChart = echarts.init(document.getElementById('event_acc_wnd'))

		var option = {
			tooltip: {
				trigger: 'item'
			},
			legend: {
				top: '90%',
				data: ['침입', '배회', '카운트', '쓰러짐']
			},
			series: [
				{
				name: '여성',
				type: 'pie',
				radius: ['23%', '76%'], // 첫 번째 도넛의 반지름 범위
				avoidLabelOverlap: false,
				itemStyle: {
					borderColor: 'black',
					borderWidth: 2,
					
					
				},
				label: {
					show: true,
					position: 'inside',
					formatter: '{c}',
					fontSize: 20,
        			fontWeight: 'bold',
					fontColor: '#fff'


				},
				emphasis: {
					
				},
				labelLine: {
					show: false
				},
				data: [
					{ value: 1048, name: '침입',  itemStyle: { color: '#4176df' }},
					{ value: 735, name: '배회',  itemStyle: { color: '#fec070' }},
					{ value: 580, name: '카운트',  itemStyle: { color: '#ff7978' } },
					{ value: 580, name: '쓰러짐',  itemStyle: { color: '#52c3f7' } }
				]
				}
			]
		}
		//  차트 옵션 설정하기
		eventChart.setOption(option)
    </script>



</body>
</html>