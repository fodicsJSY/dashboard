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
												<table class="vehicleCount">
													<tr>
														<td>신촌사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>가정오거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>장수사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>연수사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>남동IC</td>
														<td>164</td>
													</tr>
													<tr>
														<td>숭의로타리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>간석사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>학익사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>원당사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>남동공단입구사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>작전역 사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>부평IC</td>
														<td>164</td>
													</tr>
													<tr>
														<td>길병원사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>매뜰사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>부평사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>부평사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>부평사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>부평사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>부평사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>부평사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>부평사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>부평사거리</td>
														<td>164</td>
													</tr>
													<tr>
														<td>부평사거리</td>
														<td>164</td>
													</tr>
													
												</table>
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
					<!-- 섹션 좌측.E -->

					<!-- 섹션 우측.S -->
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
									<!-- 연령별 출입자 현황 도넛그래프 영역 -->
									<div class="chart" id="chart_radial_age" style="width: 250px; height: 350px; margin: 0 0 0 5%; padding: 0 0 10% 0; ">
										<div id="chart_radial_age" style="width: 100%; height: 100%;" ></div>
									</div>   
								</div>
								<div class="genderMaskChart" >
									<div class="chart" style="width: 250px; height: 180px; ">
										<!-- 남성 마스크 착용 비율 게이지 차트 -->
										<div id="chart_pie_donut" style="width: 100%; height: 100%;"></div>
									</div>   								
									<div class="chart"  style="width: 250px; height: 180px;">
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
	
						<div class="innerBox divSide" style="width: 100%; height:25vh;  height:450px;">
							
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
	<script src="/resources/js/camera/main_camera_part1_Vehicle.js"></script>   

	<script src="/resources/js/commonFunctions.js"></script>   
	<script  src="/resources/js/EventAccPieChart.js"></script>
	<script  src="/resources/data/dailyCountByVechicle.js"></script>  
	<script  src="/resources/js/tabcontent.js"></script>
	<script  src="/resources/js/EventChart.js"></script>
	<script  src="/resources/js/popupSetting.js"></script>
	<script  src="dashboard_config.json"></script> 
  
	<!--
	<script>	    
		  const chart = toastui.Chart;
		  var DataGridObj = [];
		  var DataEvtObj = [];
		  var car_chart, cycle_chart;
  
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
			  readTextFile("./data/dailyCountByCamera.json",
				  function (text) {
					  DataGridObj = JSON.parse(text);		
					  LoadWndCountGrid(); 
				  }
			  );
  
			  readTextFile("./data/dailyCount.json",
				  function (text) {
					  DataEvtObj = JSON.parse(text);
					  LoadVehicleCount();	
					  LoadCarDonutChart();   
					  LoadCycleDonutChart();  
					  
					  // Righe Page 처리
					  LoadRadialBarChart();
					  LoadPieDonutChartMale();
					  LoadPieDonutChartFemale();
					  LoadEvemtAccPieChart(DataEvtObj);
				  }
			  );
			  
			});
  
		  function LoadVehicleCount()
		  {
			  for( var i = 0; i < DataEvtObj.length ; i++){					
				  var compare_value = parseInt(DataEvtObj[i].VEHICLE_BACK_1D) - parseInt(DataEvtObj[i].VEHICLE);
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
				  $('#total_vehicle_cnt').html(DataEvtObj[i].VEHICLE);				
			  }	
		  }  
  
		  function LoadWndCountGrid()
		  {
			  tui.Grid.applyTheme("default", {
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
					  background: "rgba(30,30,30,1)",
					  border: 'rgba(30,30,30,1)',
					  text: '#c5c5c5',
					  showHorizontalBorder: true,
					  showVerticalBorder: true,
				  },
				  header: {
					  background: "rgba(30,30,30,1)",
					  border: "rgba(30,30,30,1)",
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
			  }),
		  
			  grid_car_list = new tui.Grid({
				  el: document.getElementById('count_vehicle_display_wnd'),
				  theme: 'default',
				  data: DataGridObj,
				  scrollX: false,
				  scrollY: true,    				
  
				  rowHeight: 50,
				  bodyHeight: 760,
				  header: {
					  height: '0px',					
				  },
				  columns: [
					  {
					  align: 'left',
					  name: 'CAMERA_NAME',  
					  width: 320,   					                         
					  },
					  {								
						  align: 'right',               
						  name: 'VEHICLE',  
						  sortable: true, 						
						  renderer: {
						  styles: {
							  color: 'rgba(212, 224, 121, 1)',
							  },            			            
						  }		
					  }			  
				  ],
			  });
			  grid_car_list.sort('VEHICLE', false, false)
  
			  grid_car_list.on('focusChange', ev => {     			
				  cctvIndex = ev.rowKey;				
				  var row = grid_car_list.getRow(cctvIndex);				
				  SelChangeEvent(row);
				 });
		  }
  
		  function SelChangeEvent( select_cameraInfo )
		  {
			  if ( car_chart != null ){
				  car_chart.destroy();
				  car_chart = null;
			  };
  
			  if ( cycle_chart != null ){
				  cycle_chart.destroy();
				  cycle_chart = null;
			  };			
		  
			  DataEvtObj[0] = select_cameraInfo;
  
			  LoadCarDonutChart();   
			  LoadCycleDonutChart(); 
		  }
			  
		  function LoadCarDonutChart()
		  {
				 const el = document.getElementById('car_pie_chart');
					
			  var category_data = new Array;
			  var cjson = new Object();
			  cjson = "차량";
			  category_data.push(cjson);
			  
			  var object_data = new Array;
			  var tot_value = 0;
			  for( var i = 0; i < DataEvtObj.length ; i++){
				  var ajson;				
				  if( parseInt(DataEvtObj[i].VEHICLE_CAR) > 0 ){
					  ajson = new Object();
					  ajson.name = "자동차";
					  ajson.data = parseInt(DataEvtObj[i].VEHICLE_CAR);
					  object_data.push(ajson);
					  tot_value += ajson.data;
				  }
				  if( parseInt(DataEvtObj[i].VEHICLE_BUS) > 0 ){
					  ajson = new Object();
					  ajson.name  = "버스";
					  ajson.data = parseInt(DataEvtObj[i].VEHICLE_BUS);
					  object_data.push(ajson);
					  tot_value += ajson.data;
				  }
				  if( parseInt(DataEvtObj[i].VEHICLE_TRUCK) > 0 ){
					  ajson = new Object();
					  ajson.name  = "트럭";
					  ajson.data = parseInt(DataEvtObj[i].VEHICLE_TRUCK);
					  object_data.push(ajson);
					  tot_value += ajson.data;
				  }	
			  }
  
			  var totalInfo = new Object()
			  
			  totalInfo.categories = category_data;
			  totalInfo.series = object_data;
			  
			  data = totalInfo;
			  
			  const options = {
			  chart: { 
				  width: "100%", 
				  height: "100%", 
				  //title: {
				  //text: 'Donut',    // 출력 텍스트 & 가운데 출력
				  //offsetX: -70,
				  //offsetY: 220,     
				  //align:'center'   
				  //},  
				  animation: false
			  },        // 출력 그래프 크기
			  exportMenu: {
				  visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
			  },
			  legend: {
				  align: 'right',          // legend 출력 위치
			  }, 
			  theme:{   
				  title: { 
				  fontFamily: 'Verdana',     // 출력 텍스트 색상, 폰트 페밀리, 크기 굵기
				  fontSize: 45,
				  fontWeight: 100,    
				  color: '#ff416d'
				  },      
				  chart:{
				  fontFamily: 'vedana',     // 그래프 폰트             
				  backgroundColor:'rgba(30,30,30,1)',  // 그래프 배경색 
				  },         
				  legend: {                   // Legend 폰트 관련          
				  label: {            
					  fontFamily: 'vedana',
					  fontSize: 14,            
					  color: 'darkgray'
				  }
				  }, 
				  series:{
					  colors: ['rgba(240,120,95,1)', 'rgba(86,109,245,1)', 'rgba(165,245,60,1)'],       //  색상 지정 <색상을 해당 theme series>에서만 변경 가능
					  lineWidth: 2,
						strokeStyle: 'rgba(40,40,40,1)',
				  },        
			  }, 
			  series: {
				  dataLabels: {
					  visible: true,
					  /*formatter: (value) => {     
						  var result = value.replace("%", "");                      
						  var display_value = tot_value * Number(result);
						  return `${Math.round((display_value)/100)}`;
						  },*/
				  },
				  radiusRange: {              // 도우넛 설정 INNER / OUTER
				  inner: '40%',
				  outer: '100%',
				  },
			  }, 
			  yAxis: {          // 공간 칸 띄우기
				  width: 0,
				  height: 150
			  },  
			  plot: {           // 실제 원그래프 공간        
				  width: 300,
				  height: 300
			  }              
			  
			  };    
			  car_chart = chart.pieChart({ el, data, options }); 
		  }
  
		  function LoadCycleDonutChart()
		  {
			  const el = document.getElementById('cycle_pie_chart');
			  var category_data = new Array;
			  var cjson = new Object();
			  cjson = "이륜";
			  category_data.push(cjson);
			  
			  var object_data = new Array;
			  var tot_value = 0;
			  for( var i = 0; i < DataEvtObj.length ; i++){
				  var ajson;				
				  if( parseInt(DataEvtObj[i].VEHICLE_MOTORCYCLE) > 0 ){
					  ajson = new Object();
					  ajson.name = "오토바이";
					  ajson.data = parseInt(DataEvtObj[i].VEHICLE_MOTORCYCLE);
					  object_data.push(ajson);
					  tot_value += ajson.data;
				  }
				  if( parseInt(DataEvtObj[i].VEHICLE_BICYCLE) > 0 ){
					  ajson = new Object();
					  ajson.name  = "자전거";
					  ajson.data = parseInt(DataEvtObj[i].VEHICLE_BICYCLE);
					  object_data.push(ajson);
					  tot_value += ajson.data;
				  }	
			  }
  
			  var totalInfo = new Object()
			  
			  totalInfo.categories = category_data;
			  totalInfo.series = object_data;
			  
			  data = totalInfo;
  
			  const options = {
			  chart: { 
				  width: "100%", 
				  height: "100%", 
				  //title: {
				  //text: 'Donut',    // 출력 텍스트 & 가운데 출력
				  //offsetX: -70,
				  //offsetY: 220,     
				  //align:'center'   
				  //},  
				  animation: false
			  },        // 출력 그래프 크기
			  exportMenu: {
				  visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
			  },
			  legend: {
				  align: 'right',          // legend 출력 위치            
			  }, 
			  theme:{   
				  title: { 
				  fontFamily: 'Verdana',     // 출력 텍스트 색상, 폰트 페밀리, 크기 굵기
				  fontSize: 45,
				  fontWeight: 100,    
				  color: '#ff416d'
				  },      
				  chart:{
				  fontFamily: 'vedana',     // 그래프 폰트             
				  backgroundColor:'rgba(30,30,30,1)',  // 그래프 배경색 
				  },         
				  legend: {                   // Legend 폰트 관련          
				  label: {            
					  fontFamily: 'vedana',
					  fontSize: 14,            
					  color: 'darkgray',                   
				  }
				  },  
				  series:{
					  colors: ['rgba(73,245,170,1)', 'rgba(255,204,69,1)'],       //  색상 지정 <색상을 해당 theme series>에서만 변경 가능
					  lineWidth: 2,
						strokeStyle: 'rgba(40,40,40,1)',
				  },       
			  }, 
			  series: {
				  dataLabels: {
					  visible: true,
					  formatter: (value) => {     
						  var result = value.replace("%", "");                      
						  var display_value = tot_value * Number(result);
						  return `${Math.round((display_value)/100)}`;
						  },
				  },
				  radiusRange: {              // 도우넛 설정 INNER / OUTER
				  inner: '40%',
				  outer: '100%',
				  },
			  },
			  yAxis: {          // 공간 칸 띄우기
				  width: 0,
				  height: 150
			  },  
			  plot: {           // 실제 원그래프 공간        
				  width: 300,
				  height: 300
			  }       
			  };    
			  cycle_chart = chart.pieChart({ el, data, options }); 
		  } 
	 </script>
	 -->
 </body>
</html>
