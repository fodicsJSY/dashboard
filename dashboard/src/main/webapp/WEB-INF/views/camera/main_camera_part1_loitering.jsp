<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Ai VinUS DASHBOARD</title>




<script src="/resources/node_modules/jquery/3.6.0/jquery.min.js"></script>
	<%-- css --%>
	<link rel="stylesheet" href="/resources/css/camera/main_camera_part1_loitering.css">

	<link rel="stylesheet" href="/resources/css/popup.css">
	<link rel="stylesheet" href="/resources/css/style.css">
	<link rel="stylesheet" href="/resources/css/camera.css">
	<link rel="stylesheet" href="/resources/font/nanumsquare.css">
	<link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="/resources/css/style_scrollBar.css"/>  
	<link rel="stylesheet" href="/resources/css/style_grid.css">
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
					<div class="sectionBox" style="width: 1055px;">
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
											<div id="Inv_grid_area">
												<c:choose>
													<c:when test="${empty dailyInvCntCount[0]}">
														<!-- 리스트가 null이거나 비어 있을 경우 0 출력 -->
														<div class="tableCon">
															<div>카메라 없음</div>
															<div class="invCountRow">0</div>
														</div>
												</c:when>
													<c:otherwise>
													<div class="tableCon">
														<!-- 리스트의 요소 개수를 출력 -->
														<div>${dailyInvCntCount[0].cameraName}</div>
														<c:choose>
															<c:when test="${empty dailyInvCntCount[0].invCntCount}">
																<div class="invCountRow">0</div>
															</c:when>
															<c:otherwise>
																<div class="invCountRow">${dailyInvCntCount[0].invCntCount}</div>
															</c:otherwise>
														</c:choose>
													</div>
													</c:otherwise>
												</c:choose>
											</div>
										</a>
										<div class="invasion_display">
										</div>
									</li>
									<li class="today" style="height: 832px;">
										<div class="todayTXT todayLoitering">
											<p class="todayIMG"><img src="/resources/img/icon_titleLoitering.png"></p>
											<p class="todayTitle color-Loitering" style="color:#fec070">배회</p>
											<p class="contrast">전일대비 <span class="lower" id="compare_lot_cnt">0</span></p>
											<p class="amount" id="total_lot_cnt">0</p>											
										</div>
										<a href="/mainCamera/subCamera">
											<div id="Lot_grid_area" >											
												<c:choose>
													<c:when test="${empty dailyLotCntCount[0]}">
														<!-- 리스트가 null이거나 비어 있을 경우 0 출력 -->
														<div class="tableCon">
															<div>카메라 없음</div>
															<div class="lotCountRow">0</div>
														</div>
													</c:when>
													<c:otherwise>
														<div class="tableCon">
															<!-- 리스트의 요소 개수를 출력 -->
															<div>${dailyLotCntCount[0].cameraName}</div>
															<c:choose>
																<c:when test="${empty dailyLotCntCount[0].lotCntCount}">
																	<div class="lotCountRow">0</div>
																</c:when>
																<c:otherwise>
																	<div class="lotCountRow">${dailyLotCntCount[0].lotCntCount}</div>
																</c:otherwise>
															</c:choose>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
										</a>
									</li>
								</ul>
							</div>
						</div>

					</div>
					<%-- 섹션 좌측.E --%>

					<%-- 섹션 우측.S --%>
					<div class="sectionBox2" style="width: 650px !important;">
						<div class="innerBox divSideAge" style="width: 100%; height:450px; margin-bottom: 13px !important;">
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
	
						<div class="innerBox divSide" style="width: 100%; height:450px">
							
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
	<script src="/resources/js/camera/main_camera_part1_loitering.js"></script>    
	<%-- <script src="/resources/js/commonFunctions.js"></script>     --%>
	<script src="/resources/js/tabcontent.js"></script>
	<%--
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
--%>

</body>
</html>
