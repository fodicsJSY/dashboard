<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ai VinUS DASHBOARD</title>
  <link rel="stylesheet" href="/resources/css/popup.css">
  <link rel="stylesheet" href="/resources/css/style.css">
  <link rel="stylesheet" href="/resources/css/camera.css">
  <link rel="stylesheet" href="/resources/font/nanumsquare.css">

  <link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="/resources/css/style_scrollBar.css"/>  
  
  <script src="./node_modules/jquery/3.6.0/jquery.min.js"></script>

  <link rel="stylesheet" href="./node_modules/tui-chart/dist/toastui-chart.css">
  <script src="./node_modules/tui-chart/dist/toastui-chart.js"></script>
  <link rel="stylesheet" href="./node_modules/tui-grid/dist/tui-grid.css" />
  <script src="./node_modules/tui-grid/dist/tui-grid.js"></script>      	
  <link rel="stylesheet" href="./node_modules/tui-date-picker/dist/tui-date-picker.css">
  <script src="./node_modules/tui-date-picker/dist/tui-date-picker.js"></script>
  
  <link rel="stylesheet" href="/resources/css/style_grid.css">
  <link rel="stylesheet" href="/resources/css/style_graph.css" />   
  
  <script src="/resources/js/commonFunctions.js"></script>    
  <script type="text/javascript" src="/resources/js/EventAccPieChart.js"></script>
  <script type="text/javascript" src="/resources/js/EventChart.js"></script>
  <script type="text/javascript" src="/resources/js/tabcontent.js"></script>
  <script type="text/javascript" src="/resources/js/popupSetting.js"></script>
  <script type="text/javascript" src="dashboard_config.json"></script> 
  <script>
		const chart = toastui.Chart;
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
					LoadInvasionCount();
					LoadLoiteringCount();	
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


	function LoadInvasionCount()
	{
		for( var i = 0; i < DataEvtObj.length ; i++){				
			var compare_value = parseInt(DataEvtObj[i].INV_CNT_BACK_1D) - parseInt(DataEvtObj[i].INV_CNT);
			var display_value;
			if(compare_value < 0){
				display_value = '▲' + Math.abs(compare_value);
				document.getElementById('compare_inv_cnt').style.color = '#eb6877';
				$('#compare_inv_cnt').html(display_value);
			}else{						
				display_value = '▼' +  Math.abs(compare_value);
				document.getElementById('compare_inv_cnt').style.color = '#00b7ee';
				$('#compare_inv_cnt').html(display_value);
			}
			$('#total_inv_cnt').html(DataEvtObj[i].INV_CNT);			
		}	
	}

	function LoadLoiteringCount()
	{
		for( var i = 0; i < DataEvtObj.length ; i++){				
			var compare_value = parseInt(DataEvtObj[i].LOT_CNT_BACK_1D) - parseInt(DataEvtObj[i].LOT_CNT);
			var display_value;
			if(compare_value < 0){
				display_value = '▲' + Math.abs(compare_value);
				document.getElementById('compare_lot_cnt').style.color = '#eb6877';
				$('#compare_lot_cnt').html(display_value);
			}else{						
				display_value = '▼' +  Math.abs(compare_value);
				document.getElementById('compare_lot_cnt').style.color = '#00b7ee';
				$('#compare_lot_cnt').html(display_value);
			}
			$('#total_lot_cnt').html(DataEvtObj[i].LOT_CNT);			
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

		grid_Inv = new tui.Grid({
			el: document.getElementById('Inv_grid_area'),
			data: DataGridObj,
			scrollX: false,
			scrollY: true,    

			rowHeight: 49,
			bodyHeight: 730,
			header: {
				height: '0px',					
			},
			columns: [
				{
				align: 'left',
				name: 'CAMERA_NAME',  
				width: 350,                             
				},
				{								
					align: 'right',               
					name: 'INV_CNT',   
					sortable:true,
					renderer: {
					styles: {
							color: '#94e9ec',
						},            			            
					}		
				}			  
			],

		});	

		grid_Lot = new tui.Grid({
			el: document.getElementById('Lot_grid_area'),
			data: DataGridObj,
			scrollX: false,
			scrollY: true,    

			rowHeight: 49,
			bodyHeight: 730,
			header: {
				height: '0px',					
			},
			columns: [
				{
				align: 'left',
				name: 'CAMERA_NAME',  
				width: 350,                             
				},
				{								
					align: 'right',               
					name: 'LOT_CNT',   
					sortable:true,
					renderer: {
					styles: {
							color: '#d4e079',
						},            			            
					}		
				}			  
			],

		});	
		
		grid_Inv.sort('INV_CNT', false, false);
		grid_Lot.sort('LOT_CNT', false, false);
	}
 </script>

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
					<div class="sectionBox">
						<div class="innerBox divCameraToday">
							<div class="contentsTitle">
								<div class="title">
									<h4>TODAY</h4>
								</div>								
							</div>
							<div class="data">
								<ul>
									<li class="today" style="height: 832px;">
										<div class="todayTXT todayIntrusion">
											<p class="todayIMG"><img src="/resources/img/icon_titleIntrusion.png"></p>
											<p class="todayTitle color-Intrusion" style="color:#4176df">침입</p>
											<p class="contrast">전일대비 <span class="lower" id="compare_inv_cnt">0</span></p>
											<p class="amount"  id="total_inv_cnt">0</p>
										</div>
										<a href="/mainCamera/subCamera">
											<div id="Inv_grid_area" onclick="location.href='sub_camera.html'">											
											</div>
										</a>
									</li>
									<li class="today" style="height: 832px;">
										<div class="todayTXT todayLoitering">
											<p class="todayIMG"><img src="/resources/img/icon_titleLoitering.png"></p>
											<p class="todayTitle color-Loitering" style="color:#fec070">배회</p>
											<p class="contrast">전일대비 <span class="lower" id="compare_lot_cnt">0</span></p>
											<p class="amount" id="total_lot_cnt">0</p>											
										</div>
										<a href="/mainCamera/subCamera">
											<div id="Lot_grid_area" onclick="location.href='sub_camera.html'">											
											</div>
										</a>
									</li>
								</ul>
							</div>
						</div>

					</div>
					<!-- 섹션 좌측.E -->

					<!-- 섹션 우측.S -->
					<div class="sectionBox">
						<div class="innerBox divEventAge">
							<div class="contentsTitle">
								<div class="title">
									<h4>연령별 출입자 현황&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</h4>
								</div>
								<div class="title">
									<h4>마스크 착용 비율</h4>
								</div>
							</div>
							<div class="data01">
								<div class="chart" id="chart_radial_age"></div>   
							</div>

							<div class="data02">								
								<div class="chart" id="chart_pie_donut" style="margin-top: 0px"></div>   								
								<div class="chart" id="chart_pie_donut2" style="margin-top: -10px"></div>   
								<div class="corlorGuide alignL" style="margin-left: 80px; ">
									<ul>
										<li><div class="colorBox cBG-Male" ></div> <div class="guideTXT">남자</div></li>
										<li><div class="colorBox cBG-Female" ></div> <div class="guideTXT">여자</div></li>
									</ul>
								</div>		
							</div>
						</div>		
	
						<div class="innerBox divEvent" style="height:25vh;  min-height:440px;">
							<div class="contentsTitle">
								<div class="title">
									<h4>이벤트 발생 비율</h4>
								</div>
							</div>
							<div class="data">
								<div id = "event_acc_wnd" style="margin-top: 30px; width:100%; height:350px; "></div>
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
 </body>
</html>
