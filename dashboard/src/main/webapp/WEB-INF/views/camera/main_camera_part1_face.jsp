<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
  <link rel="stylesheet" href="/resources/css/camera/main_camera_part1_face.css">
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
					<div class="sectionBox2">
						<div class="innerBox divCameraToday">
							<div class="contentsTitle">
								<div class="title">
									<h4>TODAY</h4>
								</div>
							</div>
							<div class="data">
								<ul>
									<li class="today-part1" style="height:85%;">
										<div class="todayTXT todayFace">
											<p class="todayIMG"><img src="/resources/img/icon_titleFace.png"></p>
											<p class="todayTitle color-Face" style="color:#b4a1d8">얼굴</p>
											<p class="contrast">전일대비 <span id="compare_cnt">0</span></p>
											<p class="amount" id="total_face_cnt">0</p>
										</div>
										<div>
											<div style = "width:100%;"  id = "count_display_wnd">
												<table class="faceCount">
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
													<tr>
														<td>신복사거리</td>
														<td>156</td>
													</tr>
												</table>

											</div>
										</div>
									</li>
								</ul>

								<div class="todayData" style = "width:26%; height:450px; "> 
									<div style = "width:100%; height:10%;">
										<div style = "text-align:left; padding-left: 5%; padding-top: 18px; font-size:16px; " >성별</div>
										<br />
										<span style="width: 90%; height: 2px; background:#333333;" >
									</div>
									<span style = "padding-left:5%; padding-top:10%; width:80%; height:80%; " id = "sex_pie_wnd">  
								</div>

								<div class="todayData" style = "width:31%; height:450px; " >
									<div style = "width:100%; height:10%;">
										<div style = "text-align:left; padding-left: 5%; padding-top: 18px; font-size:16px; " >악세사리</div>
										<br />
										<span style="width: 90%; height: 2px; background:#333333;" >
									</div>									
									<span style = "padding-top:7%; width:80%; height:80%; " id = "etc_line_bar_wnd"> 
								</div>
								
								<div class="todayData" style = "width:58%; height:396px; margin-top:20px; float:left;">     
									<div style = "width:100%; height:10%;">
										<div style = "text-align:left; padding-left: 3%; padding-top: 18px; font-size:16px; " >연령 분포</div>
										<br/>
										<div style="width: 95%; height: 2px; background:#333333;" ></div>								
									</div>
									<div style = "padding-top:5%; width:95%; height:80%;" > 
										<div id = "age_line_bar_wnd" style ="width: 100%; height: 100%;" >

										</div>
									</div>										
								</div>   
							</div>
						</div>

					</div>
					<!-- 섹션 좌측.E -->

					<!-- 섹션 우측.S -->
					<div class="sectionBox2">
						<div class="innerBox divSideAge" style="height:25vh;  min-height:450px; margin-bottom: 13px !important;">
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
	
						<div class="innerBox divSide" style="height:25vh;  min-height:450px;">
							
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
	<script src="/resources/js/camera/main_camera_part1_face.js"></script>    
	<script src="/resources/js/commonFunctions.js"></script>    
  <script type="text/javascript" src="/resources/js/EventAccPieChart.js"></script>
  <script type="text/javascript" src="/resources/js/EventChart.js"></script>
  <script type="text/javascript" src="/resources/js/tabcontent.js"></script>
  <script type="text/javascript" src="/resources/js/popupSetting.js"></script>
  <script type="text/javascript" src="dashboard_config.json"></script> 
  
 <!--
 <script>	    

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
		});
		const chart = toastui.Chart;
		var DataGridObj = [];
		var DataEvtObj = [];
		var chart_face_sex_pie = null;
		var chart_face_etc_graph = null;
		var chart_face_age_graph = null;

		window.onload = function () {
			readTextFile("./data/dailyCountByCamera.json",
				function (text) {
					DataGridObj = JSON.parse(text);		
					LoadWndCountGrid(); 
				}
			);
			calendarToday();
			
			readTextFile("./data/dailyCount.json",
				function (text) {
					DataEvtObj = JSON.parse(text);		
					LoadFaceCount();		
					LoadSexPieChart();   
					LoadColumnLineChart();   
					LoadAreaLineAgeChart();      
					
					// Righe Page 처리
					LoadRadialBarChart();
					LoadPieDonutChartMale();
					LoadPieDonutChartFemale();
					LoadEvemtAccPieChart(DataEvtObj);
				}
			);

		
		};	
  
        var grid_cloth;   
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

            
			grid_cloth = new tui.Grid({
				el: document.getElementById('count_display_wnd'),
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
						name: 'FACE',   
						sortable: true, 						
						renderer: {
						styles: {
								color: 'rgba(180, 161, 216, 1)',
							},            			            
						},	
						
					}			  
				],
            });	
			// sorting option 체크 필요
			grid_cloth.sort('FACE', false, false)
			
			grid_cloth.on('focusChange', ev => {     			
				cctvIndex = ev.rowKey;				
				var row = grid_cloth.getRow(cctvIndex);				
				SelChangeEvent(row);
   			});
		}

		function SelChangeEvent( select_cameraInfo )
		{
			if ( chart_face_sex_pie != null ){
				chart_face_sex_pie.destroy();
				chart_face_sex_pie = null;
			};

			if ( chart_face_etc_graph != null ){
				chart_face_etc_graph.destroy();
				chart_face_etc_graph = null;
			};

			if ( chart_face_age_graph != null ){
				chart_face_age_graph.destroy();
				chart_face_age_graph = null;
			};
		
			DataEvtObj[0] = select_cameraInfo;

			LoadSexPieChart();   
			LoadColumnLineChart(); 
			LoadAreaLineAgeChart(); 
		}
	
		function LoadFaceCount()
		{
			for( var i = 0; i < DataEvtObj.length ; i++){				
				var compare_value = parseInt(DataEvtObj[i].FACE_BACK_1D) - parseInt(DataEvtObj[i].FACE);
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
				$('#total_face_cnt').html(DataEvtObj[i].FACE);
			}		
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
				if( parseInt(DataEvtObj[i].FACE_MALE) > 0 ){
					ajson = new Object();
					ajson.name = "남성";
					ajson.data = parseInt(DataEvtObj[i].FACE_MALE);
					object_data.push(ajson);
					tot_value += ajson.data;
				}
				if( parseInt(DataEvtObj[i].FACE_FEMALE) > 0 ){
					ajson = new Object();
					ajson.name  = "여성";
					ajson.data = parseInt(DataEvtObj[i].FACE_FEMALE);
					object_data.push(ajson);
					tot_value += ajson.data;
				}						
			}		

			var totalInfo = new Object()			
			totalInfo.categories = category_data;
			totalInfo.series = object_data;
			
			data = totalInfo;
            //var data = face_pie_data;    // 읽은 내용을 data에 넣어주어야만 정상적으로 그래프가 그려짐.
            const options = {
            chart: { 
                width: '100px',        // 출력 그래프 크기 Width
                height: '100px',      // 출력 그래프 크기 Height
                animation: false          // 출력시 애니매이션 효과 비활성 : 기본 
            },  
            exportMenu: {
                visible: false,            // 내보내기 버튼 화면에 출력하지 않는다. 				
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
                    colors: ['rgba(15,159,175,1)', 'rgba(232,83,76,1)'],     //  색상 지정 <색상을 해당 theme series>에서만 변경 가능
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
                selectable: true,            // SELECT = TRUE를 지정해야만 정상적으로 Select 처리가 된다. 
				radiusRange: {              // 도우넛 설정 INNER / OUTER
					inner: '30%',
					outer: '100%',
                },
            }, 
			tooltip: {						// 출력 툴팁이 옆에 그래프와 겹치면 툴팁이 잘린다. 이점 처리
				offsetX: -100,
				offsetY: 0,
			}, 
            };
            chart_face_sex_pie = chart.pieChart({ el, data, options }); 
        }

        function LoadColumnLineChart()                  // 악세사리
        {
            const el = document.getElementById('etc_line_bar_wnd');
            
			var category_data = new Array;
			var cjson = new Object();
			
			category_data.push('모자');
			category_data.push('안경');
			category_data.push('마스크');
			
			var object_column_data = new Array;
			var object_line_data = new Array;
			
			for( var i = 0; i < DataEvtObj.length ; i++){				
				if( DataEvtObj[i].FACE_HATMALE ) // 남성모자
				{				
					object_column_data.push(parseInt(DataEvtObj[i].FACE_HATMALE));
				}
				
				if( DataEvtObj[i].FACE_GLASSESMALE ) // 남성안경
				{				
					object_column_data.push(parseInt(DataEvtObj[i].FACE_GLASSESMALE));
				}
				
				if( DataEvtObj[i].FACE_MASKMALE ) // 남성마스크
				{				
					object_column_data.push(parseInt(DataEvtObj[i].FACE_MASKMALE));
				}
				
				if( DataEvtObj[i].FACE_HATFEMALE ) // 여성모자
				{
					object_line_data.push(parseInt(DataEvtObj[i].FACE_HATFEMALE));			
				}

				if( DataEvtObj[i].FACE_GLASSESFEMALE ) // 여성안경
				{				
					object_line_data.push(parseInt(DataEvtObj[i].FACE_GLASSESFEMALE));
				}
				
				if( DataEvtObj[i].FACE_MASKFEMALE ) // 여성마스크 
				{				
					object_line_data.push(parseInt(DataEvtObj[i].FACE_MASKFEMALE));
				}	
			}	
			
				
			var man_obj = new Array;
			var ajson = new Object();			
			ajson.name = "남성";
			ajson.data = object_column_data;
			man_obj.push(ajson);

			var woman_obj = new Array;
			var bjson = new Object();			
			bjson.name = "여성";
			bjson.data = object_line_data;
			woman_obj.push(bjson);

			var totalInfo = new Object();
			var columnInfo = new Object();
			columnInfo.column = man_obj;
			columnInfo.line = woman_obj;

			totalInfo.categories = category_data;
			totalInfo.series = columnInfo;			
			data = totalInfo; 
	
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
                    lineColor: 'rgba(60, 80, 180, 0.3)',
                    lineWidth: 1,           
                    },
                    horizontal: {
                    lineColor: 'rgba(60, 80, 180, 0.3)',
                    lineWidth: 1, 
                    },        
                },
                series:{
					colors: ['rgba(165,245,60,1)', 'rgba(236,190,66,1)'],       //  색상 지정 <색상을 해당 theme series>에서만 변경 가능
					barWidth: 30,             // 출력바 굵기 체크.  
                },      
                },
            };  
			
			chart_face_etc_graph = chart.columnLineChart({ el, data, options });               
        }

        function LoadAreaLineAgeChart()
        {
        const el = document.getElementById('age_line_bar_wnd');
       
		            
		var category_data = new Array;
		var cjson = new Object();
		
		category_data.push('미성년');
		category_data.push('청년');
		category_data.push('중.장년');
		category_data.push('노년');
		
		var object_man_data = new Array;
		var object_woman_data = new Array;
		for( var i = 0; i < DataEvtObj.length ; i++){			
			if( DataEvtObj[i].FACE_YOUNGMALE) 
			{				
				object_man_data.push(parseInt(DataEvtObj[i].FACE_YOUNGMALE));
			}
			if( DataEvtObj[i].FACE_MIDDLEMALE) 
			{				
				object_man_data.push(parseInt(DataEvtObj[i].FACE_MIDDLEMALE));
			}
			if( DataEvtObj[i].FACE_SENIORMALE) 
			{				
				object_man_data.push(parseInt(DataEvtObj[i].FACE_SENIORMALE));
			}
			if( DataEvtObj[i].FACE_ADULTMALE) 
			{				
				object_man_data.push(parseInt(DataEvtObj[i].FACE_ADULTMALE));
			}

			if( DataEvtObj[i].FACE_YOUNGFEMALE) 
			{				
				object_woman_data.push(parseInt(DataEvtObj[i].FACE_YOUNGFEMALE));
			}
			if( DataEvtObj[i].FACE_MIDDLEFEMALE) 
			{				
				object_woman_data.push(parseInt(DataEvtObj[i].FACE_MIDDLEFEMALE));
			}
			if( DataEvtObj[i].FACE_SENIORFEMALE) 
			{				
				object_woman_data.push(parseInt(DataEvtObj[i].FACE_SENIORFEMALE));
			}
			if( DataEvtObj[i].FACE_ADULTFEMALE) 
			{				
				object_woman_data.push(parseInt(DataEvtObj[i].FACE_ADULTFEMALE));
			}			
		}					
		var arr_obj = new Array;
		var ajson = new Object();	
		ajson.data = object_man_data;
		ajson.name = "남성";
		arr_obj.push(ajson);
		
		var bjson = new Object();	
		bjson.data = object_woman_data;
		bjson.name = "여성";
		arr_obj.push(bjson);

		var totalInfo = new Object();
		totalInfo.categories = category_data;
		totalInfo.series = arr_obj;		
			
		data = totalInfo; 

        const options = {        
            chart: { 
            width: "100%",        // 출력 그래프 크기 Width
            height: "100%",      // 출력 그래프 크기 Height
            animation: false          // 출력시 애니매이션 효과 비활성 : 기본 
            },               
            exportMenu: {
            visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
            },                  
            legend: {
            align: 'bottom',          // legend 출력 위치
            }, 
            series: {
            //stack: true,
            },       
            theme:{        
            chart:{
                fontFamily: 'vedana',     // 그래프 폰트             
                backgroundColor:'rgba(30,30,30,1)',  // 그래프 배경색 
            }, 
            series:{
                colors: ['rgba(70,115,200,1)', 'rgba(255,106,107,1)'],       //  색상 지정 <색상을 해당 theme series>에서만 변경 가능								
            },     
			
            xAxis: {                    // X 축 테마 처리 (색상,폰트,폰트두께,크기)            
                label: {
                fontFamily: 'vedana',
                fontSize: 14,             
                color: 'darkgray'
                },
                width: 1,
                color: 'gray'
            },
            yAxis: {                     // Y 축 테마 처리 (색상,폰트,폰트두께,크기)            
                label: {
                fontFamily: 'vedana',
                fontSize: 14,
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
                lineColor: 'rgba(60, 80, 180, 0.3)',
                lineWidth: 1,           
                },
                horizontal: {
                lineColor: 'rgba(60, 80, 180, 0.3)',
                lineWidth: 1, 
                },        
            }
            },
        };          
        chart_face_age_graph = chart.areaChart({ el, data, options }); 
        }	  
   </script>

   -->
 </body>
</html>