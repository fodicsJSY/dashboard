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
  
	<script src=  "./node_modules/tui-etc/Fabric/fabric.min.js"></script>
	<script src="./node_modules/jquery/3.6.0/jquery.min.js"></script>

  <!-- css -->
  <link rel="stylesheet" href="/resources/css/popup.css">
  <link rel="stylesheet" href="/resources/css/style.css">
  <link rel="stylesheet" href="/resources/css/camera.css">
  <link rel="stylesheet" href="/resources/css/style_grid.css">
  <link rel="stylesheet" href="/resources/font/nanumsquare.css">
  <link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="/resources/css/style_scrollBar.css"/>  
  <link rel="stylesheet" href="/resources/css/style_graph.css" />
  <link rel="stylesheet" href="/resources/css/camera/main_camera_part1_human.css" />


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
				</div>
				<!-- 상단 날짜,버튼 영역.E -->

				<!-- 메인컨텐츠.S -->
				<div class="contents">

					<!-- 섹션 좌측.S -->
					<div class="sectionBox2" style="height: 930px; display: flex; flex-direction: row;">
						<div class="innerBox divCameraToday">
							<div class="contentsTitle">
								<div class="title">
									<h4>TODAY</h4>
								</div>
							</div>
							<div class="data">
								<li class="today-part1" style="height:85%;">
									<div class="todayTXT todayHuman">
										<p class="todayIMG"><img src="/resources/img/icon_titleHuman.png"></p>
										<p class="todayTitle color-Human" style="color:#94e9ec">사람</p>
										<p class="contrast">전일대비 <span class="lower" id="compare_cnt">0</span></p>
										<p class="amount" id="total_person_cnt">0</p>

									</div>
									<div>
										<div style = "width:100%;"  id = "count_human_display_wnd">
											<table class="humanCount">
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

								<div>	
									<div>
										<div class="todayData" style = "width:26%; height:400px; "> 
											<div style="width:100%; height:10%;">
												<div style="text-align:left; padding-left: 5%; padding-top: 18px; font-size:16px; ">성별</div>
												<br />
												<span style="width: 90%; height: 2px; background:#333333;">
											</div>
											<div style="width:80%; height:80%; margin: 0 0 0 10%; padding: 8% 0 0 0;">
												<div style="width:100%; height:100%; " id="sex_pie_wnd"></div>
													<!--<div id = "sex_pie_wnd" style="width: 200px; height: 333px;"> -->
											</div>
											
										</div>
											
										<div class="todayData" style="width:30.5%; height:400px; ">
											<div style="width:100%; height:10%;">
												<div style="text-align:left; padding-left: 5%; padding-top: 18px; font-size:16px; ">악세사리</div>
												<br />
												<span style="width: 80%; height: 2px; background:#333333;">
											</div>
											<div style="width:70%; height:70%; margin: 15% 0 0 15%;">
												<div style="width:100%; height:100%; " id="etc_line_bar_wnd"></div>
											</div>
										</div>
									</div>

								
									<div class="todayData" style = "width:58%; height:396px; margin-top:20px; margin-bottom: 10px; float:left;">     
										<div style = "width:100%; height:10%;">
											<div style = "text-align:left; padding-left: 3%; padding-top: 18px; font-size:16px; " >의류 선호도</div>
											<br />
											<span style="width: 95%; height: 2px; background:#333333;" >
											<div style="display: flex; flex-direction: column; justify-content: center;">
												<div class="corlorGuide" style = "margin: 15px 0px 20px 30px; display: flex; flex-direction: row; justify-content: end;">
															<div class="colorBox cBG-Gray" style="margin: 0 5px;"></div> <div class="guideTXT" style="margin-right: 5px;">White, Black, Gray</div>
															<div class="colorBox cBG-Female" style="margin: 0 5px;"></div> <div class="guideTXT" style="margin-right: 5px;">Red, Orange, Yellow</div>
															<div class="colorBox cBG-Senior" style="margin: 0 5px;"></div> <div class="guideTXT" style="margin-right: 5px;">Green, Blue, Purple</div>
												</div>
												<div>
													<table class="clothesTable">
														<tr>
															<th></th>
															<th><img src="/resources/img/icon_titleMale.png">남성</th>
															<th><img src="/resources/img/icon_titleFemale.png">여성</th>
														</tr>
														<tr>
															<th>상의 길이</th>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<th>상의 색 비중</th>
															<td>
																<div id = "man_top_color_rate" style="width: 178.32px; height: 50px;"></div>																</div>
															</td>
															<td>
																<div id = "woman_top_color_rate" style="width: 178.32px; height: 50px;"></div>	
															</td>
														</tr>
														<tr>
															<th>하의 길이</th>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<th>하의 색 비중</th>
															<td>
																<div id = "man_down_color_rate" style="width: 178.32px; height: 50px;"></div>
															</td>
															<td>
																<div id = "woman_down_color_rate" style="width: 178.32px; height: 50px;"></div>
															</td>
														</tr>
		
													</table>
												</div>
											</div>
										<!-- 토스트 Grid 테마 중복으로 인해 CSS Grid 사용 -->
										<!--
										<div class="grid-container" style = "padding-left:3%; padding-top:13%; width:98%; height:100px; " id = "cloth_wnd"> 	
											<div class="grid-item_header"> </div>
											<div class="grid-item_header"><img src="/resources/img/icon_titleMale.png" style = "margin-top: -5px; margin-left: 60px; float:left;"><div style = "margin-top: 3px; text-align: left;">&nbsp;&nbsp;남자</div></div>
											<div class="grid-item_header"><img src="/resources/img/icon_titleFemale.png" style = "margin-top: -5px; margin-left: 60px; float:left;"><div style = "margin-top: 3px; text-align: left;">&nbsp;&nbsp;여성</div></div>
											<div class="grid-item">상의 길이</div>
											<div class="grid-item" id = "man_top_win"></div>
											<div class="grid-item" id = "woman_top_win"></div>
											<div class="grid-item">상의 색 비중</div>
											<div class="grid-item" id = "man_top_color_rate">
											</div>
											<div class="grid-item" id = "woman_top_color_rate"></div>											
											<div class="grid-item">하의 길이</div>											
											<div class="grid-item" id = "man_down_win"></div>											
											<div class="grid-item" id = "woman_down_win"></div>											
											<div class="grid-item">하의 색 비중</div>											
											<div class="grid-item" id = "man_down_color_rate"></div>
											<div class="grid-item" id = "woman_down_color_rate"></div>
										</div >				
										-->
									</div>  
								</div>
							</div>
						</div>
					</div>
					<!-- 섹션 좌측.E -->


					<!-- 섹션 우측.S -->
					<div class="sectionBox2" style="width: 600px; height: 930px; margin: 0 0 0 15px;">
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
	
						<div class="innerBox divSide" style="height:25vh; height:450px;">
							
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
	<script src="/resources/js/camera/main_camera_part1_human.js"></script> 
	<script src="/resources/js/commonFunctions.js"></script> 
	<script type="text/javascript" src="/resources/js/EventAccPieChart.js"></script>
	<script type="text/javascript" src="/resources/js/EventChart.js"></script>
	<script type="text/javascript" src="/resources/js/tabcontent.js"></script>
	<script type="text/javascript" src="/resources/js/popupSetting.js"></script>
	<script type="text/javascript" src="dashboard_config.json"></script> 

 


	<!--
	<script>	    
		  const chart = toastui.Chart;
		  var DataGridObj = [];
		  var DataEvtObj = [];
		  var grid_human_list;
		  var person_sex_pie_chart, person_etc_chart;
		  var canvas, W_graphMale, R_graphMale, G_graphMale;
		  var img1 = null, img2 = null, img3 = null, img4 = null;
  
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
					  drawClothColorRatio();
  
					  LoadHumanCount();	
					  LoadSexPieChart();   
					  LoadColumnLineChart();  
					  LoadClothTableData();  
					  
					  // Righe Page 처리
					  LoadRadialBarChart();
					  LoadPieDonutChartMale();
					  LoadPieDonutChartFemale();		
					  LoadEvemtAccPieChart(DataEvtObj);
				  }
			  ); 
  
		  
			});
  
			function CreateRatioGraph(parm1,parm2,parm3, width) {
  
				if( canvas != null){
				  canvas.remove(W_graphMale);
				  canvas.remove(R_graphMale);
				  canvas.remove(G_graphMale);
  
				  canvas.remove(canvas.getActiveObject());
				  canvas.discardActiveObject();
				  canvas.requestRenderAll();
				  canvas = null;
				}
  
				const c = document.querySelector('canvas_t');
				let bg;
				canvas = new fabric.Canvas(c);
  
				var height = 10;
				canvas.setHeight(height);
				canvas.setWidth(width);
  
			  
				   var left_ = -3;
				   W_graphMale = new fabric.Rect({
					   fill: '#d2d2d2',
					   left: -1,
					   top: -3,
					   width: parm1,
					   height: 51
				   });
				   left_ += parm1;
  
				   R_graphMale = new fabric.Rect({
					   fill: '#e8534c',
					   left: left_,
					   top: -3,
					   width: parm2,
					   height: 51
				   });
				   left_ += parm2;
  
				   G_graphMale = new fabric.Rect({
					   fill: '#0174cf',
					   left: left_,
					   top: -3,
					   width: parm3,
					   height: 51
				   });
				  
  
				   canvas.add(W_graphMale);
				   canvas.add(R_graphMale);
				   canvas.add(G_graphMale);
  
				   canvas.setBackgroundImage(null);
				   let dataURL = canvas.toDataURL({
					   format: 'png',
					   multiplier: 2,
				   });
  
				   return dataURL;
			   }
  
		   function drawClothColorRatio()
		   {
			  var maxWidth = 70;
  
			   //상의 색상 남성 
			   var WBGcolorTopMale = 0;
			   var ROYcolorTopMale = 0;
			   var GBPcolorTopMale = 0;
  
			   //하의 색상 남성
			   var WBGcolorBotMale = 0;
			   var ROYcolorBotMale = 0;
			   var GBPcolorBotMale = 0;
  
			   //상의 색상 여성 
			   var WBGcolorTopFemale = 0;
			   var ROYcolorTopFemale = 0;
			   var GBPcolorTopFemale = 0;
  
			   //하의 색상 여성
			   var WBGcolorBotFemale = 0;
			   var ROYcolorBotFemale = 0;
			   var GBPcolorBotFemale = 0;
  
  
			   for (var i = 0; i < DataEvtObj.length; i++) {
				   WBGcolorTopMale += Number(DataEvtObj[i].PERSON_TOPWEARBLACKMALE);
				   WBGcolorTopMale += Number(DataEvtObj[i].PERSON_TOPWEARGRAYMALE);
				   WBGcolorTopMale += Number(DataEvtObj[i].PERSON_TOPWEARWHITEFEMALE);
				   ROYcolorTopMale += Number(DataEvtObj[i].PERSON_TOPWEARREDMALE);
				   ROYcolorTopMale += Number(DataEvtObj[i].PERSON_TOPWEARORANGEMALE);
				   ROYcolorTopMale += Number(DataEvtObj[i].PERSON_TOPWEARYELLOWFEMALE);
				   GBPcolorTopMale += Number(DataEvtObj[i].PERSON_TOPWEARGREENMALE);
				   GBPcolorTopMale += Number(DataEvtObj[i].PERSON_TOPWEARBLUEMALE);
				   GBPcolorTopMale += Number(DataEvtObj[i].PERSON_TOPWEARPURPLEMALE);
  
				   WBGcolorBotMale += Number(DataEvtObj[i].PERSON_BOTTOMWEARBLACKMALE);
				   WBGcolorBotMale += Number(DataEvtObj[i].PERSON_BOTTOMWEARGRAYMALE);
				   WBGcolorBotMale += Number(DataEvtObj[i].PERSON_BOTTOMWEARWHITEFEMALE);
				   ROYcolorBotMale += Number(DataEvtObj[i].PERSON_BOTTOMWEARREDMALE);
				   ROYcolorBotMale += Number(DataEvtObj[i].PERSON_BOTTOMWEARORANGEMALE);
				   ROYcolorBotMale += Number(DataEvtObj[i].PERSON_BOTTOMWEARYELLOWFEMALE);
				   GBPcolorBotMale += Number(DataEvtObj[i].PERSON_BOTTOMWEARGREENMALE);
				   GBPcolorBotMale += Number(DataEvtObj[i].PERSON_BOTTOMWEARBLUEMALE);
				   GBPcolorBotMale += Number(DataEvtObj[i].PERSON_BOTTOMWEARPURPLEMALE);
  
				   WBGcolorTopFemale += Number(DataEvtObj[i].PERSON_TOPWEARBLACKFEMALE);
				   WBGcolorTopFemale += Number(DataEvtObj[i].PERSON_TOPWEARGRAYFEMALE);
				   WBGcolorTopFemale += Number(DataEvtObj[i].PERSON_TOPWEARWHITEFEMALE);
				   ROYcolorTopFemale += Number(DataEvtObj[i].PERSON_TOPWEARREDFEMALE);
				   ROYcolorTopFemale += Number(DataEvtObj[i].PERSON_TOPWEARORANGEFEMALE);
				   ROYcolorTopFemale += Number(DataEvtObj[i].PERSON_TOPWEARYELLOWFEMALE);
				   GBPcolorTopFemale += Number(DataEvtObj[i].PERSON_TOPWEARGREENFEMALE);
				   GBPcolorTopFemale += Number(DataEvtObj[i].PERSON_TOPWEARBLUEFEMALE);
				   GBPcolorTopFemale += Number(DataEvtObj[i].PERSON_TOPWEARPURPLEFEMALE);
  
				   WBGcolorBotFemale += Number(DataEvtObj[i].PERSON_BOTTOMWEARBLACKFEMALE);
				   WBGcolorBotFemale += Number(DataEvtObj[i].PERSON_BOTTOMWEARGRAYFEMALE);
				   WBGcolorBotFemale += Number(DataEvtObj[i].PERSON_BOTTOMWEARWHITEFEMALE);
				   ROYcolorBotFemale += Number(DataEvtObj[i].PERSON_BOTTOMWEARREDFEMALE);
				   ROYcolorBotFemale += Number(DataEvtObj[i].PERSON_BOTTOMWEARORANGEFEMALE);
				   ROYcolorBotFemale += Number(DataEvtObj[i].PERSON_BOTTOMWEARYELLOWFEMALE);
				   GBPcolorBotFemale += Number(DataEvtObj[i].PERSON_BOTTOMWEARGREENFEMALE);
				   GBPcolorBotFemale += Number(DataEvtObj[i].PERSON_BOTTOMWEARBLUEFEMALE);
				   GBPcolorBotFemale += Number(DataEvtObj[i].PERSON_BOTTOMWEARPURPLEFEMALE);
			   }
  
  
			   //상의 남성
			   var MaleTopTotal = 0;
			   MaleTopTotal = (WBGcolorTopMale + ROYcolorTopMale + GBPcolorTopMale);
			   var ratio = maxWidth / MaleTopTotal;
			   var WBG_opt = WBGcolorTopMale * ratio;
			   var ROY_opt = ROYcolorTopMale * ratio;
			   var GBP_opt = GBPcolorTopMale * ratio;
  
			   var el = document.getElementById("man_top_color_rate");
			   if( img1 == null) 	img1 = document.createElement('img');			
			   img1.src = CreateRatioGraph(WBG_opt,ROY_opt,GBP_opt,maxWidth);
			   el.appendChild(img1);
  
			   //하의 남성
			   var MaleBotTotal = 0;
			   MaleBotTotal = (WBGcolorBotMale + ROYcolorBotMale + GBPcolorBotMale);
			   ratio = maxWidth / MaleBotTotal;
			   WBG_opt = WBGcolorBotMale * ratio;
			   ROY_opt = ROYcolorBotMale * ratio;
			   GBP_opt = GBPcolorBotMale * ratio;
  
			   el = document.getElementById("man_down_color_rate");
			   if( img2 == null) 	img2 = document.createElement('img');
			   img2.src = CreateRatioGraph(WBG_opt,ROY_opt,GBP_opt,maxWidth);
			   el.appendChild(img2);
  
			   //상의 여성
			   var FemaleTopTotal = 0;
			   FemaleTopTotal = (WBGcolorTopFemale + ROYcolorTopFemale + GBPcolorTopFemale);
			   ratio = maxWidth / FemaleTopTotal;
			   WBG_opt = WBGcolorTopFemale * ratio;
			   ROY_opt = ROYcolorTopFemale * ratio;
			   GBP_opt = GBPcolorTopFemale * ratio;
  
			   el = document.getElementById("woman_top_color_rate");
			   if( img3 == null) img3 = document.createElement('img');
			   img3.src = CreateRatioGraph(WBG_opt, ROY_opt, GBP_opt, maxWidth);
			   el.appendChild(img3);
  
			   //하의 여성
			   var FemaleBotTotal = 0;
			   FemaleBotTotal = (WBGcolorBotFemale + ROYcolorBotFemale + GBPcolorBotFemale);
			   ratio = maxWidth / FemaleBotTotal;
			   WBG_opt = WBGcolorBotFemale * ratio;
			   ROY_opt = ROYcolorBotFemale * ratio;
			   GBP_opt = GBPcolorBotFemale * ratio;
  
			   el = document.getElementById("woman_down_color_rate");
			   if( img4 == null) img4 = document.createElement('img');
			   img4.src = CreateRatioGraph(WBG_opt, ROY_opt, GBP_opt, maxWidth);
			   el.appendChild(img4);
		   }
  
  
		  function LoadHumanCount()
		  {
			  for( var i = 0; i < DataEvtObj.length ; i++){					
				  var compare_value = parseInt(DataEvtObj[i].PERSON_BACK_1D) - parseInt(DataEvtObj[i].PERSON);
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
				  $('#total_person_cnt').html(DataEvtObj[i].PERSON);				
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
		  
			  grid_human_list = new tui.Grid({
				  el: document.getElementById('count_human_display_wnd'),
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
						  name: 'PERSON',
						  sortable: true,    						
						  renderer: {
						  styles: {
								  color: 'rgba(148, 233, 236, 1)',
							  },            			            
						  }		
					  }			  
				  ],
			  });
			  grid_human_list.sort('PERSON', false, false)
  
			  grid_human_list.on('focusChange', ev => {     			
				  cctvIndex = ev.rowKey;				
				  var row = grid_human_list.getRow(cctvIndex);				
				  SelChangeEvent(row);
				 });
		  }
		  
		  function SelChangeEvent( select_cameraInfo )
		  {
			  if ( person_sex_pie_chart != null ){
				  person_sex_pie_chart.destroy();
				  person_sex_pie_chart = null;
			  };
  
			  if ( person_etc_chart != null ){
				  person_etc_chart.destroy();
				  person_etc_chart = null;
			  };
					  
			  DataEvtObj[0] = select_cameraInfo;
  
			  LoadSexPieChart();   
			  LoadColumnLineChart();  
			  LoadClothTableData();  
			  drawClothColorRatio();
		  }
  
		  function LoadSexPieChart()              // 성별
		  {
			  const el = document.getElementById('sex_pie_wnd');
			  
			  var category_data = new Array;
			  var cjson = new Object();
			  cjson = "성별";
			  category_data.push(cjson);
			  
			  var object_data = new Array;
			  var tot_value = 0;
			  for( var i = 0; i < DataEvtObj.length ; i++){
				  var ajson;				
				  if( parseInt(DataEvtObj[i].PERSON_MALE) > 0 ){
					  ajson = new Object();
					  ajson.name = "남성";
					  ajson.data = parseInt(DataEvtObj[i].PERSON_MALE);
					  object_data.push(ajson);
					  tot_value += ajson.data;
				  }
				  if( parseInt(DataEvtObj[i].PERSON_FEMALE) > 0 ){
					  ajson = new Object();
					  ajson.name  = "여성";
					  ajson.data = parseInt(DataEvtObj[i].PERSON_FEMALE);
					  object_data.push(ajson);
					  tot_value += ajson.data;
				  }					
			  }
  
			  var totalInfo = new Object()
			  
			  totalInfo.categories = category_data;
			  totalInfo.series = object_data;
			  
			  data = totalInfo;
			  //var data = sex_human_data;    // 읽은 내용을 data에 넣어주어야만 정상적으로 그래프가 그려짐.
			  const options = {
			  chart: { 
				  width: '100px',        // 출력 그래프 크기 Width
				  height: '100px',      // 출력 그래프 크기 Height
				  animation: false          // 출력시 애니매이션 효과 비활성 : 기본 
			  },  
			  exportMenu: {
				  visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
			  },
			  legend:{
				  align: 'bottom',          // legend 출력 위치
				  showCheckbox: false,
			  },           
			  theme:{
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
					  colors: ['rgba(15,159,175,1)', 'rgba(232,83,76,1)'],       //  색상 지정 <색상을 해당 theme series>에서만 변경 가능
					  lineWidth: 2,
						strokeStyle: 'rgba(40,40,40,1)',
				  },      
			  }, 
			  series: {               
				  selectable: true,            // SELECT = TRUE를 지정해야만 정상적으로 Select 처리가 된다. 
				  radiusRange: {              // 도우넛 설정 INNER / OUTER
					  inner: '30%',
					  outer: '100%',
				  },
				  dataLabels: {
					  visible: true,
					  formatter: (value) => {     
						  var result = value.replace("%", "");                      
						  var display_value = tot_value * Number(result);
						  return `${Math.round((display_value)/100)}`;
						  },
				  },
			  }, 
			  tooltip: {						// 출력 툴팁이 옆에 그래프와 겹치면 툴팁이 잘린다. 이점 처리
				  offsetX: -100,
				  offsetY: 0,
			  }, 
			  };
			  person_sex_pie_chart = chart.pieChart({ el, data, options }); 			
		  }
  
		  function LoadColumnLineChart()                  // 악세사리
		  {
			  const el = document.getElementById('etc_line_bar_wnd');
			  
			  var category_data = new Array;
			  var cjson = new Object();
			  
			  category_data.push('남자');
			  category_data.push('여자');
						  
			  var object_column_data = new Array;
			  var object_line_data = new Array;
			  for( var i = 0; i < DataEvtObj.length ; i++){				
				  if( DataEvtObj[i].PERSON_HATMALE) 
				  {				
					  object_column_data.push(parseInt(DataEvtObj[i].PERSON_HATMALE));
				  }					
				  if( DataEvtObj[i].PERSON_HATFEMALE )
				  {				
					  object_column_data.push(parseInt(DataEvtObj[i].PERSON_HATFEMALE));
				  }
				  if( DataEvtObj[i].PERSON_BAGMALE ) 
				  {
					  object_line_data.push(parseInt(DataEvtObj[i].PERSON_BAGMALE));			
				  }
				  if( DataEvtObj[i].PERSON_BAGFEMALE ) 
				  {				
					  object_line_data.push(parseInt(DataEvtObj[i].PERSON_BAGFEMALE));
				  }	
			  }	
				  
			  var man_obj = new Array;
			  var ajson = new Object();			
			  ajson.name = "모자 착용";
			  ajson.data = object_column_data;
			  man_obj.push(ajson);
  
			  var woman_obj = new Array;
			  var bjson = new Object();			
			  bjson.name = "가방 착용";
			  bjson.data = object_line_data;
			  woman_obj.push(bjson);
  
			  var totalInfo = new Object();
			  var columnInfo = new Object();
			  columnInfo.column = man_obj;
			  columnInfo.line = woman_obj;
  
			  totalInfo.categories = category_data;
			  totalInfo.series = columnInfo;			
			  data = totalInfo; 
  
			  //var data = etc_human_data; 
			  const options = {        
				  chart: { 
				  width: '100%',        // 출력 그래프 크기 Width
				  height: '100%',      // 출력 그래프 크기 Height
				  animation: false          // 출력시 애니매이션 효과 비활성 : 기본 
				  },               
				  exportMenu: {
				  visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
				  },                  
				  legend: {
				  align: 'bottom',          // legend 출력 위치
				  }, 
				  series: {
				  stack: true
				  },       
				  theme:{        
				  chart:{
					  fontFamily: 'vedana',     // 그래프 폰트             
					  backgroundColor:'rgba(30,30,30,1)',  // 그래프 배경색 
				  }, 
							  
				  xAxis: {                    // X 축 테마 처리 (색상,폰트,폰트두께,크기)            
					  label: {
					  fontFamily: 'vedana',
					  fontSize: 12,             
					  color: 'darkgray'
					  },
					  width: 1,
					  color: 'gray'
				  },
				  yAxis: {                     // Y 축 테마 처리 (색상,폰트,폰트두께,크기)            
					  label: {
					  fontFamily: 'vedana',
					  fontSize: 10,
					  color: 'darkgray'
					  },
					  width: 1,
					  color: 'gray'
				  },
				  legend: {                  // Legend 폰트 관련
					  label: {
					  fontFamily: 'vedana',
					  fontSize: 14,
					  color: 'darkgray'
					  },         
				  },
				  plot: {                   // 그래프 내부 라인처리
					  vertical: {
					  lineColor: 'rgba(57, 57, 57, 0.3)',
					  lineWidth: 1,           
					  },
					  horizontal: {
					  lineColor: 'rgba(57, 57, 57, 0.3)',
					  lineWidth: 1, 
					  },        
				  },
				  series:{
					  colors: ['rgba(0,189,159,1)', 'rgba(236,190,66,1)'],       //  색상 지정 <색상을 해당 theme series>에서만 변경 가능					
					  barWidth: 40,             // 출력바 굵기 체크.                
				  },      
				  },
			  };   
			  person_etc_chart = chart.columnLineChart({ el, data, options });                 
		  }
  
		  function LoadClothTableData()
		  {
			  var display_man_top_value, display_woman_top_value;
			  var display_man_down_value, display_woman_down_value;
			  var percent_value, tot_value;
  
			  var top_short_male, top_long_male;
			  var top_short_female, top_long_female;
			  var bottom_short_male, bottom_long_male;
			  var bottom_short_female, bottom_long_female;
			  
			  for( var i = 0; i < DataEvtObj.length ; i++){	
  
				  top_short_male = parseInt(DataEvtObj[i].PERSON_TOPWEARSHORTMALE);
				  top_long_male = parseInt(DataEvtObj[i].PERSON_TOPWEARLONGMALE);
  
				  tot_value = top_short_male + top_long_male;
				  if( top_short_male > top_long_male ){					
					  percent_value = 100 * Math.round(( top_short_male - top_long_male)/tot_value);
					  display_man_top_value = '반팔 우의 (' + percent_value + '%)';					
				  }else if( top_short_male < top_long_male ){					
					  percent_value = 100 * Math.round(( top_long_male- top_short_male)/tot_value);
					  display_man_top_value = '긴팔 우의 (' + percent_value + '%)';
				  }else if( top_short_male == top_long_male ){	
					  display_man_top_value = '-';
				  }				
				  
				  top_short_female = parseInt(DataEvtObj[i].PERSON_TOPWEARSHORTFEMALE);
				  top_long_female = parseInt(DataEvtObj[i].PERSON_TOPWEARLONGFEMALE);
  
				  tot_value = top_short_female + top_long_female;
				  if( top_short_female > top_long_female ){					
					  percent_value = 100 * Math.round(( top_short_female - top_long_female)/tot_value);
					  display_woman_top_value = '반팔 우의 (' + percent_value + '%)';							 
				  }else if( top_short_female < top_long_female ){					
					  percent_value = 100 * Math.round(( top_long_female - top_short_female)/tot_value);
					  display_woman_top_value = '긴팔 우의 (' + percent_value + '%)';				
				  }else if( top_short_female == top_long_female ){	
					  display_woman_top_value = '-';
				  }	
  
				  bottom_short_male = parseInt(DataEvtObj[i].PERSON_BOTTOMWEARSHORTMALE);
				  bottom_long_male =  parseInt(DataEvtObj[i].PERSON_BOTTOMWEARLONGMALE);
  
				  tot_value = bottom_short_male + bottom_long_male;
				  if( bottom_short_male > bottom_long_male ){
					  percent_value = 100 * Math.round((bottom_short_male - bottom_long_male)/tot_value);
					  display_man_down_value = '반바지 우의 (' + percent_value + '%)';		
				  }else if( bottom_short_male < bottom_long_male ){
					  percent_value = 100 * Math.round(( bottom_long_male - bottom_short_male)/tot_value);
					  display_man_down_value = '긴바지 우의 (' + percent_value + '%)';		
				  }else if( bottom_short_male == bottom_long_male ){	
					  display_man_down_value = '-';
				  }	
				  
				  bottom_short_female = parseInt(DataEvtObj[i].PERSON_BOTTOMWEARSHORTFEMALE);
				  bottom_long_female = parseInt(DataEvtObj[i].PERSON_BOTTOMWEARLONGFEMALE);
  
				  tot_value = bottom_short_female + bottom_long_female;
				  if( bottom_short_female > bottom_long_female ){
					  percent_value = 100 * Math.round(( bottom_short_female - bottom_long_female)/tot_value);
					  display_woman_down_value = '반바지 우의 (' + percent_value + '%)';		
				  }else if( bottom_short_female < bottom_long_female ){
					  percent_value = 100 * Math.round(( bottom_long_female - bottom_short_female)/tot_value);
					  display_woman_down_value = '긴바지 우의 (' + percent_value + '%)';		
				  }else if( bottom_short_female == bottom_long_female ){	
					  display_woman_down_value = '-';
				  }				
				  
				  $('#man_top_win').html(display_man_top_value);
				  $('#woman_top_win').html(display_woman_top_value);
				  $('#man_down_win').html(display_man_down_value);
				  $('#woman_down_win').html(display_woman_down_value);				
			  }
		  }
	 </script>
	 -->
 </body>
</html>
