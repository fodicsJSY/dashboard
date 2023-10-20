<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Ai VinUS DASHBOARD</title>

	<!-- css -->
	<!-- <link rel="stylesheet" href="css/style.css"> -->
	<link rel="stylesheet" href="/resources/css/popup.css">
	<link rel="stylesheet" href="/resources/css/camera.css">
	<link rel="stylesheet" href="/resources/font/nanumsquare.css">
	<link rel="stylesheet" href="/resources/css/style_graph.css"/>  
	<link rel="stylesheet" href="/resources/css/style_grid.css"/>  
	<link rel="stylesheet" href="/resources/css/style_scrollBar.css"/>  
	<!-- <link rel="stylesheet" href="css/style.css"/>   -->
	<link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon" />
	
	<link rel="stylesheet" href="./node_modules/tui-chart/dist/toastui-chart.css">
	<link rel="stylesheet" href="./node_modules/tui-grid/dist/tui-grid.css" />
	<link rel="stylesheet" href="./node_modules/tui-date-picker/dist/tui-date-picker.css">
	
	
	<!-- // 다른 테이블에 영향이 있을 수 있어 여기에 따로 스타일 정의  -->
	<style>
		
		
		.tui-datepicker-input {margin-top: 1px; z-index: 998; }
		#tui-date-picker-target {color:#f5f5f5; background-color: #0c0c0c97; margin: -1px;  height: 28px; width: 170px;}
		#tui-date-picker-container {margin-left: -1px; filter: invert(92%);}
		
		table tr> td:first-child {text-align:left;}	
		/*table tr>* {padding: 10px 5px;}*/
		
		.type_tr > tr:last-child {border-bottom:1px solid rgba(45,45,45,1);}
		.type_table { table-layout: fixed; font-family: NanumSquareEB; font-size: 9pt; color: rgba(197,197,197,1); border-left:1px solid rgba(45,45,45,1); border-right:1px solid rgba(45,45,45,1);}
		.type_tr {border-top:1px solid rgba(45,45,45,1); height: 33px; padding: 10px 5px;}
		.type_th {padding: 10px 5px; color: rgba(197,197,197,1); background:rgba(26,26,26,1); border-right:1px solid rgba(45,45,45,1); }
		.type_td {background:rgba(37,37,37,1); text-align:right; border-right:1px solid rgba(45,45,45,1);  height: 32px;} 
		.type_td_name {padding: 10px 5px; width: 180px; text-overflow:ellipsis; overflow:hidden; white-space: nowrap; display:block; background:rgba(37,37,37,1); text-align:right; border-right:1px solid rgba(45,45,45,1); height: 32px;}  		
		
		</style> 	

	
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
						<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
							<input type="text" id="tui-date-picker-target"
								aria-label="Date-Time">
							<span class="tui-ico-date"></span>
							<div id="tui-date-picker-container"></div>
						</div>
						<!-- <div id="tui-date-picker-container"></div>
						<a class="rollover" alt="달력" id="tui-date-picker-main" style = "margin-top: 1px;">
							<img src="img/btn-calendar.png"> 
							<img src="img/btn-calendar.png" class="over">
						</a>

						<div class="tui-datepicker-input tui-datetime-input tui-has-focus" style = "margin-top: 2px;">
							<input type="text" id="datepicker-input" aria-label="Date-Time">
							<div id="wrapper" style="margin-left : -3px; margin-top : 5px;"></div>								
						</div> -->
						<!-- <p class="date" id='mainDate'>2021년 07월 21일</p> -->
						<button type="button" class="btn-date" onClick="OnPrevDate()" href="#"  style = "margin-top: 1px;">◀<!-- <img src="img/btn-calendarLeft.png">--></button>
						<button type="button" class="btn" onClick="OnTodayDate()" href="#"  style = "margin-top: 1px;">오늘</button>
						<button type="button" class="btn-date" onClick="OnNextDate()" href="#"  style = "margin-top: 1px;">▶<!-- <img src="img/btn-calendarRight.png">--></button>
					</div>	
				</div>
				<!-- 상단 날짜,버튼 영역.E -->

				<!-- 메인컨텐츠.S -->
				<div class="contents">

					<!-- 섹션 좌측.S -->
					<div class="sectionBox">
						<div class="innerBox subCamera">
							<div class="subTabs">
								<div class="tabsTitle"><img src="/resources/img/navi_camera.png"></div>
						        <ul class="tabs" data-persist="true">
						            <li><a href="#view1" onClick="TabOneChange()" class="tab-viewTime">전체 카메라 이벤트 발생 현황</a></li>
						            <li><a href="#view2" onClick="TabTwoChange()" class="tab-viewTime">카메라 이벤트별 데이터 비교</a></li>
						        </ul>
								<div class="sub-btnArea">
									<a class="rollover" alt="csv파일" OnClick="OnCSV_OK()"><img src="/resources/img/btn-downCSV.png"> <img src="/resources/img/btn-downCSV_hover.png" class="over"></a>
									<a class="rollover" alt="HOME" onClick="location.href='main.html'"><img src="/resources/img/btn-goMain.png"> <img src="/resources/img/btn-goMain_hover.png" class="over"></a>
								</div>
							</div>
							<!-- 전체 카메라 이벤트 발생 현황 -->
							<div id="view1" class="data ">
								<!-- <div class="dataSelect"> -->
									<div class="corlorGuide alignL" style="margin-left: 20px; margin-top : 120px">
										색상 Guide
										<ul>
											<li><div class="colorBox cBG-Male"></div> <div class="guideTXT">남자</div></li>
											<li><div class="colorBox cBG-Female"></div> <div class="guideTXT">여자</div></li>
											<li><div class="colorBox cBG-Mask"></div> <div class="guideTXT">마스크</div></li>
											<li><div class="colorBox cBG-Car"></div> <div class="guideTXT">차량</div></li>
											<li><div class="colorBox cBG-LPR"></div> <div class="guideTXT">차량번호 인식</div></li>
										</ul>
										<ul>
											<li><div class="colorBox cBG-Intrusion"></div> <div class="guideTXT">침입</div></li>
											<li><div class="colorBox cBG-Loitering"></div> <div class="guideTXT">배회</div></li>
											<li><div class="colorBox cBG-Counting"></div> <div class="guideTXT">카운팅</div></li>
											<li><div class="colorBox cBG-Parking"></div> <div class="guideTXT">불법 주·정차</div></li>
											<li><div class="colorBox cBG-BlackList"></div> <div class="guideTXT">블랙리스트</div></li>
										</ul>
									</div>
									<div class="alignR" style = "float:right">
										<div  style = "width:10px; height: 100px; float:right;"></div>
										<div  style = "margin-top: -10px; float:right;" id = "event_pie_wnd"></div>   
										<div  style = "width:10px; height: 100px; float:right;"></div>
										<div style = "margin-top: -10px; float:right;"  id = "ctrl_pie_wnd"></div>    
									</div>
								<!-- </div> -->

								<div class="clearfix" style="margin-left: 15px; margin-right: 15px; height:635px; border:1px solid gray"> 
									<div style = "overflow:auto; width:100%; height:630px; background-color:rgba(30,30,30,1);"  >     
										<div style = "width:900px;" class="chart" id="chart_bar_dual"></div> 
									</div>    
								</div>								
							</div>

							<!-- 카메라 이벤트별 데이터 비교 -->
							<div id="view2" class="data" style="height:865px;">
								<div class="dataSelect" style="margin-bottom:0px;" >									
								</div> 
								<div style = "height: 26px;">
									<input class="text_cam_name"  style = "color:white;" onkeydown="KeyDownSearch()" type="text" id="edt_camera_name" name="name" required="" minlength="4" maxlength="80" size="43" placeholder="CCTV명 검색">					
									<button type="button" class="btn" onclick="FindData()" style="margin-top: -5px; margin-left: -2px;" >검색</button> 
								</div>
								<div class="data">									
									<div class="camera-ListBox" style = "padding-top:1px; width:36%;" id = "cctv_display_wnd">
									</div>
								</div>								
								<div class="camera-sub-data" style="margin-left: 12px; height:795px;";>
									<div class="contentsTitle">
										<div class="title">
											<h4>이벤트 기간별 추이 비교성별/연령 비교</h4>
										</div>
									</div>									
									<div style = "width:100%; height:40px; background-color:rgba(30,30,30,1);"></div>
									<div style = "margin-left: 10px; width:100%; height:450px; background-color:rgba(30,30,30,1);" id = "camera_evt_graph"></div>
																											
									<!-- 토스트 Grid 테마 중복으로 인해 CSS Grid 사용 -->
									<div class="grid-camera-container" style = "padding-top:2%; width:100%; height:100px; " id = "compare_wnd"> 	
										<div class="grid-item-camera-header" style = "width: 50"> </div>
										<div class="grid-item-camera-header" style = "width: 80">오늘</div>
										<div class="grid-item-camera-header">어제</div>
										<div class="grid-item-camera-header">전일 대비</div>
										<div class="grid-item-camera-header">한주 전</div>
										<div class="grid-item-camera-header">직전주 대비</div>
										<div class="grid-camera-item">카운팅</div>
										<div class="grid-camera-item-day" id = "count_today">0</div>
										<div class="grid-camera-item-other" id = "count_yesterday">0</div>
										<div class="grid-camera-item-other" id = "count_yesterdayCompare">0%</div>
										<div class="grid-camera-item-other" id = "count_Week">0</div>
										<div class="grid-camera-item-other" id = "count_WeekCompare">0%</div>
										<div class="grid-camera-item">침입</div>											
										<div class="grid-camera-item-day" id = "invade_today">0</div>
										<div class="grid-camera-item-other" id = "invade_yesterday">0</div>
										<div class="grid-camera-item-other" id = "invade_yesterdayCompare">0%</div>
										<div class="grid-camera-item-other" id = "invade_Week">0</div>										
										<div class="grid-camera-item-other" id = "invade_WeekCompare">0%</div>	
										<div class="grid-camera-item">배회</div>											
										<div class="grid-camera-item-day" id = "loitering_today">0</div>
										<div class="grid-camera-item-other" id = "loitering_yesterday">0</div>
										<div class="grid-camera-item-other" id = "loitering_yesterdayCompare">0%</div>
										<div class="grid-camera-item-other" id = "loitering_Week">0</div>
										<div class="grid-camera-item-other" id = "loitering_WeekCompare">0%</div>										
										<div class="grid-camera-item">마스크 미착용</div>
										<div class="grid-camera-item-day" id = "unmask_today">0</div>
										<div class="grid-camera-item-other" id = "unmask_yesterday">0</div>
										<div class="grid-camera-item-other" id = "unmask_yesterdayCompare">0%</div>
										<div class="grid-camera-item-other" id = "unmask_Week">0</div>
										<div class="grid-camera-item-other" id = "unmask_WeekCompare">0%</div>		
									</div >			     
								</div>
							</div>	
							<div id="loading"><img id="loading-image" src="/resources/img/loading_animated.png" alt="Loading..." /></div>						
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
	
						<div class="clearfix innerBox divTop10" style="height:25vh;  min-height:435px;" >
							<div class="contentsTitle">
								<div class="title">
									<h4>최다검지 카메라 TOP10 CH</h4>
								</div>
								<div class="partBTN">
									<a class="changeGraph" onclick="setMainEventTop10()"; style="margin-top:3px;"><img id="changeEvent_btn" src="/resources/img/btn_human.png"><img id="changeEvent_btn" src="/resources/img/btn_human_on.png" class="over"></a>
									<a class="changeGraph" onclick="setMainVehicleTop10()"; style="margin-top:3px;"><img id="changeVehicle_btn" src="/resources/img/btn_car.png"> <img src="/resources/img/btn_car_on.png" class="over"></a>									
								</div>
							</div>
							<div class="data" style="height: 10px !important;">
								<!--  테이블 영역.S -->

								<div id="grid_main_event" style = "margin-left : 15px; margin-top : 10px;" >
									<div class="container">
										<table class = "type_table">
											<tr class = "type_tr">
												<th class = "type_th" style = "width: 180px;">카메라명</th>
												<th class = "type_th" style = "width: 65px">사람</th>
												<th class = "type_th" style = "width: 65px">얼굴</th>
												<th class = "type_th" style = "width: 65px">침입</th>
												<th class = "type_th" style = "width: 65px">배회</th>
												<th class = "type_th" style = "width: 65px">쓰러짐</th>
												<th class = "type_th" style = "width: 65px">카운팅</th>
											</tr>
											<tbody class="row_drag">											
												<tr class = "type_tr" id="col1">
													<td class="type_td_name" id="camera1"></td>
													<td class="type_td" id="person1">-</td>
													<td class="type_td" id="face1">-</td>
													<td class="type_td" id="inv1">-</td>
													<td class="type_td" id="lot1">-</td>
													<td class="type_td" id="fail1">-</td>
													<td class="type_td" id="count1">-</td>
												</tr>
												<tr class = "type_tr" id="col2">
													<td class="type_td_name"id="camera2"></td>
													<td class="type_td"id="person2">-</td>
													<td class="type_td"id="face2">-</td>
													<td class="type_td"id="inv2">-</td>
													<td class="type_td"id="lot2">-</td>
													<td class="type_td"id="fail2">-</td>
													<td class="type_td"id="count2">-</td>
												</tr>
												<tr class = "type_tr" id="col3">
													<td class="type_td_name" id="camera3"></td>
													<td class="type_td" id="person3">-</td>
													<td class="type_td" id="face3">-</td>
													<td class="type_td" id="inv3">-</td>
													<td class="type_td" id="lot3">-</td>
													<td class="type_td" id="fail3">-</td>
													<td class="type_td" id="count3">-</td>
												</tr>
												<tr class = "type_tr" id="col4">
													<td class="type_td_name" id="camera4"></td>
													<td class="type_td" id="person4">-</td>
													<td class="type_td" id="face4">-</td>
													<td class="type_td" id="inv4">-</td>
													<td class="type_td" id="lot4">-</td>
													<td class="type_td" id="fail4">-</td>
													<td class="type_td" id="count4">-</td>
												</tr>
												
												<tr class = "type_tr" id="col5">
													<td class="type_td_name" id="camera5"></td>
													<td class="type_td" id="person5">-</td>
													<td class="type_td" id="face5">-</td>
													<td class="type_td" id="inv5">-</td>
													<td class="type_td" id="lot5">-</td>
													<td class="type_td" id="fail5">-</td>
													<td class="type_td" id="count5">-</td>
												</tr>
												<tr class = "type_tr" id="col6">
													<td class="type_td_name" id="camera6"></td>
													<td class="type_td" id="person6">-</td>
													<td class="type_td" id="face6">-</td>
													<td class="type_td" id="inv6">-</td>
													<td class="type_td" id="lot6">-</td>
													<td class="type_td" id="fail6">-</td>
													<td class="type_td" id="count6">-</td>
												</tr>
												<tr class = "type_tr" id="col7">
													<td class="type_td_name" id="camera7"></td>
													<td class="type_td" id="person7">-</td>
													<td class="type_td" id="face7">-</td>
													<td class="type_td" id="inv7">-</td>
													<td class="type_td" id="lot7">-</td>
													<td class="type_td" id="fail7">-</td>
													<td class="type_td" id="count7">-</td>
												</tr>
												<tr class = "type_tr" id="col8">
													<td class="type_td_name" id="camera8"></td>
													<td class="type_td" id="person8">-</td>
													<td class="type_td" id="face8">-</td>
													<td class="type_td" id="inv8">-</td>
													<td class="type_td" id="lot8">-</td>
													<td class="type_td" id="fail8">-</td>
													<td class="type_td" id="count8">-</td>
												</tr>
												<tr class = "type_tr" id="col9">
													<td class="type_td_name" id="camera9"></td>
													<td class="type_td" id="person9">-</td>
													<td class="type_td" id="face9">-</td>
													<td class="type_td" id="inv9">-</td>
													<td class="type_td" id="lot9">-</td>
													<td class="type_td" id="fail9">-</td>
													<td class="type_td" id="count9">-</td>
												</tr>												
												<tr class = "type_tr" id="col10">
													<td class="type_td_name" id="camera10"></td>
													<td class="type_td" id="person10">-</td>
													<td class="type_td" id="face10">-</td>
													<td class="type_td" id="inv10">-</td>
													<td class="type_td" id="lot10">-</td>
													<td class="type_td" id="fail10">-</td>
													<td class="type_td" id="count10">-</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!--  테이블 영역.E -->
								<div id="grid_main_vehicle" style = "margin-left : 15px; margin-top : 10px;" >
									<div class="container">
										<table class="type_table">
											<tr class="type_tr" >
												<th class="type_th" style = "width: 180px;">카메라명</th>
												<th class="type_th" style = "width: 78px">자동차</th>
												<th class="type_th" style = "width: 78px">버스</th>
												<th class="type_th" style = "width: 78px">트럭</th>
												<th class="type_th" style = "width: 78px">오토바이</th>
												<th class="type_th" style = "width: 78px">자전거</th>
												
											</tr>
											<tbody class="row_drag">											
												<tr   class="type_tr" id="col1">
													<td class="type_td_name" id="camera_vec1" ></td>
													<td class="type_td" id="car1">-</td>
													<td class="type_td" id="bus1">-</td>
													<td class="type_td" id="truck1">-</td>
													<td class="type_td" id="motorcycle1">-</td>
													<td class="type_td" id="bicycle1">-</td>
													
												</tr>
												<tr  class="type_tr"id="col2">
													<td class="type_td_name" id="camera_vec2"></td>
													<td class="type_td" id="car2">-</td>
													<td class="type_td" id="bus2">-</td>
													<td class="type_td" id="truck2">-</td>
													<td class="type_td" id="motorcycle2">-</td>
													<td class="type_td" id="bicycle2">-</td>
												</tr>
												<tr  class="type_tr" id="col3">
													<td class="type_td_name" id="camera_vec3"></td>
													<td class="type_td" id="car3">-</td>
													<td class="type_td" id="bus3">-</td>
													<td class="type_td" id="truck3">-</td>
													<td class="type_td" id="motorcycle3">-</td>
													<td class="type_td" id="bicycle3">-</td>
												</tr>
												<tr  class="type_tr" id="col4">
													<td class="type_td_name" id="camera_vec4"></td>
													<td class="type_td" id="car4">-</td>
													<td class="type_td" id="bus4">-</td>
													<td class="type_td" id="truck4">-</td>
													<td class="type_td" id="motorcycle4">-</td>
													<td class="type_td" id="bicycle4">-</td>
												</tr>												
												<tr class="type_tr"  id="col5">
													<td class="type_td_name" id="camera_vec5"></td>
													<td class="type_td" id="car5">-</td>
													<td class="type_td" id="bus5">-</td>
													<td class="type_td" id="truck5">-</td>
													<td class="type_td" id="motorcycle5">-</td>
													<td class="type_td" id="bicycle5">-</td>
												</tr>
												<tr class="type_tr" id="col6">
													<td class="type_td_name" id="camera_vec6"></td>
													<td class="type_td" id="car6">-</td>
													<td class="type_td" id="bus6">-</td>
													<td class="type_td" id="truck6">-</td>
													<td class="type_td" id="motorcycle6">-</td>
													<td class="type_td" id="bicycle6">-</td>
												</tr>
												<tr class="type_tr" id="col7">
													<td class="type_td_name" id="camera_vec7"></td>
													<td class="type_td" id="car7">-</td>
													<td class="type_td" id="bus7">-</td>
													<td class="type_td" id="truck7">-</td>
													<td class="type_td" id="motorcycle7">-</td>
													<td class="type_td" id="bicycle7">-</td>
												</tr>
												<tr class="type_tr" id="col8">
													<td class="type_td_name" id="camera_vec8"></td>
													<td class="type_td" id="car8">-</td>
													<td class="type_td" id="bus8">-</td>
													<td class="type_td" id="truck8">-</td>
													<td class="type_td" id="motorcycle8">-</td>
													<td class="type_td" id="bicycle8">-</td>
												</tr>
												<tr class="type_tr"  id="col9">
													<td class="type_td_name" id="camera_vec9"></td>
													<td class="type_td" id="car9">-</td>
													<td class="type_td" id="bus9">-</td>
													<td class="type_td" id="truck9">-</td>
													<td class="type_td" id="motorcycle9">-</td>
													<td class="type_td" id="bicycle9">-</td>
												</tr>												
												<tr class="type_tr" id="col10">
													<td class="type_td_name" id="camera_vec10"></td>
													<td class="type_td" id="car10">-</td>
													<td class="type_td" id="bus10">-</td>
													<td class="type_td" id="truck10">-</td>
													<td class="type_td" id="motorcycle10">-</td>
													<td class="type_td" id="bicycle10">-</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

								<!-- document.getElementById('camera_vec'+parseInt(i+1)).innerHTML = grid_top10_data[i].CAMERA_NAME;
								document.getElementById('car'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_CAR;
								document.getElementById('bus'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_BUS;
								document.getElementById('truck'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_TRUCK;
								document.getElementById('motorcycle'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_MOTORCYCLE;
								document.getElementById('bicycle'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_BICYCLE;	 -->

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


	<script src="/resources/data/data_sample.js"></script>
	<script type="text/javascript" src="/resources/js/EventChart.js"></script>

	<script src="./node_modules/jquery/3.6.0/jquery.min.js"></script>

	<script src="./node_modules/tui-chart/dist/toastui-chart.js"></script>
	<script src="./node_modules/tui-grid/dist/tui-grid.js"></script>      	
	<script src="./node_modules/tui-date-picker/dist/tui-date-picker.js"></script>	

	<script src="/resources/js/commonFunctions.js"></script>   
	<!-- 탭버튼 스크립트.S-->
	<script type="text/javascript" src="/resources/js/tabcontent.js"></script>
	<!-- 탭버튼 스크립트.E-->
	<script type="text/javascript" src="/resources/js/popupSetting.js"></script>
	<script type="text/javascript" src="/resources/js/CsvMakeFile.js"></script>
	<script type="text/javascript" src="dashboard_config.json"></script> 

	<script>		
		const chart = toastui.Chart;
		var camera_evt_chart;
		var chart_pie_ctrl = null;
		var chart_pie_event = null; 		
		var chart_bar = null;
		var grid_camera_list;
		var DataDualObj = [];
		var DataEvtObj = [];
		var select_camera_name;
		var grid_data = [];	
		var show_page;

		var today_count_file_name;
		var today_count_Camera_file_name;
		var move_day = 0;
		var datePicker1;

		var size = {                                      // 그래프 출력 크기를 지정
            width: ( window.innerWidth || document.body.clientWidth ) * 1/3,
            height: ( window.innerHeight || document.body.clientHeight ) 
        }

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
				
		today_count_file_name = "./data/dailyCount.json";
		today_count_Camera_file_name = "./data/dailyCountByCamera.json";		
	
		window.onload = function () {
			$('#loading').hide();
			
			show_page = 1;
			loadData();		
			//setInterval('loadData()', 60 * 1000);
			
			LoadRadialBarChart();  
			LoadPieDonutChartMale();
			LoadPieDonutChartFemale();	
			setMainEventTop10();				
			
			// 날짜
			var today = new Date();
			var year = today.getFullYear();
			var month = today.getMonth() + 1;
			var day = today.getDate();

			const DatePicker = tui.DatePicker;
			const container = document.getElementById('tui-date-picker-container');
			const target = document.getElementById('tui-date-picker-target');
			datePicker1 = new DatePicker(container, {
				language: 'ko',
				date: new Date(),
				input: {
					element: target,
					format: 'yyyy년 MM월 dd일',
				},
			});

			// datePicker1 = new tui.DatePicker('#wrapper', {
			// 	language: 'ko',
			// 	date: new Date(),
			// 	input: {
			// 		element: '#datepicker-input',
			// 		format: 'yyyy년 MM월 dd일',
			// 	}
			// });	

			datePicker1.on('change', () => {
				console.log(`Selected date: ${datePicker1.getDate()}`);
				OnSelectDate(datePicker1.getDate());
			});

		
		}

		function loadData()
		{
			// view#1
			readTextFile(today_count_file_name ,
				function (text) {
					DataEvtObj = [];
					DataEvtObj = JSON.parse(text);	

					if( chart_pie_ctrl != null ) chart_pie_ctrl.destroy();
					if( chart_pie_event != null ) chart_pie_event.destroy();
					chart_pie_ctrl = null;
					chart_pie_event = null;
					LoadCtrlPieChart();
					LoadEvtPieChart();
				}
			); 
			readTextFile(today_count_Camera_file_name,
				function (text) {
					DataDualObj = [];
					DataDualObj = JSON.parse(text);					
					if( chart_bar != null ) chart_bar.destroy();
					chart_bar = null;					
					LoadBarDualChart();	

					if( grid_camera_list != null ) grid_camera_list.destroy();
					if( camera_evt_chart != null ) camera_evt_chart.destroy();
					grid_camera_list = null;
					camera_evt_chart = null;
					// view#2			
					LoadWndCountGrid();
					LoadColumnLineChart();
				}
			);	
		}

		function setMainEventTop10() {	
			grid_main_vehicle.style.display = "none";
			grid_main_event.style.display = "block";

			var btnEvt = document.getElementById('changeEvent_btn');
			btnEvt.src = "./img/btn_human_on.png";
			var btnCar = document.getElementById('changeVehicle_btn');
			btnCar.src = "./img/btn_car.png";

			var grid_top10_data = [];
			readTextFile("./data/dailyCountByCamera.json",
				function (text) {
					grid_data = JSON.parse(text);

					//정렬을 한 번 진행 후 
					temp = grid_data;
					temp.sort(function (a, b) {
						return parseFloat(a.PERSON_RANK) - parseFloat(b.PERSON_RANK);
					});
					//위에서 10개만 뽑아서 새 배열에 저장하여 쓴다.
					for (var i = 0; i < temp.length; i++) {
						if (i == 10)
							break;

						grid_top10_data.push(temp[i]);
					}	

					var camera, person, face, inv, lot, fail, count;

					for( var i = 0 ; i < grid_top10_data.length ; i++ ){										
						document.getElementById('camera'+parseInt(i+1)).innerHTML = grid_top10_data[i].CAMERA_NAME;
						document.getElementById('person'+parseInt(i+1)).innerHTML = grid_top10_data[i].PERSON;
						document.getElementById('face'+parseInt(i+1)).innerHTML = grid_top10_data[i].FACE;
						document.getElementById('inv'+parseInt(i+1)).innerHTML = grid_top10_data[i].INV_CNT;
						document.getElementById('lot'+parseInt(i+1)).innerHTML = grid_top10_data[i].LOT_CNT;
						document.getElementById('fail'+parseInt(i+1)).innerHTML = grid_top10_data[i].FAL_CNT;
						document.getElementById('count'+parseInt(i+1)).innerHTML = grid_top10_data[i].CNT_CNT;		
					}
				}				
			);					
		}			

		function setMainVehicleTop10() {	
			
			grid_main_event.style.display = "none";
			grid_main_vehicle.style.display = "block";

			var btnEvt = document.getElementById('changeEvent_btn');
			btnEvt.src = "./img/btn_human.png";
			var btnCar = document.getElementById('changeVehicle_btn');
			btnCar.src = "./img/btn_car_on.png";

			var grid_top10_data = [];
			readTextFile("./data/dailyCountByCamera.json",
				function (text) {
					grid_data = JSON.parse(text);

					//정렬을 한 번 진행 후 
					temp = grid_data;
					temp.sort(function (a, b) {
						return parseFloat(a.VEHICLE_RANK) - parseFloat(b.VEHICLE_RANK);
					});
					//위에서 10개만 뽑아서 새 배열에 저장하여 쓴다.
					for (var i = 0; i < temp.length; i++) {
						if (i == 10)
							break;

						grid_top10_data.push(temp[i]);
					}	

					var camera, person, face, inv, lot, fail, count;

					for( var i = 0 ; i < grid_top10_data.length ; i++ ){	
						document.getElementById('camera_vec'+parseInt(i+1)).innerHTML = grid_top10_data[i].CAMERA_NAME;
						document.getElementById('car'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_CAR;
						document.getElementById('bus'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_BUS;
						document.getElementById('truck'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_TRUCK;
						document.getElementById('motorcycle'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_MOTORCYCLE;
						document.getElementById('bicycle'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_BICYCLE;																	
					}
				}				
			);					
		}			

		function TabOneChange()
		{
			$('#loading').hide();			
			show_page = 1;
		}

		function TabTwoChange()
		{		
			$('#loading').hide();
			grid_camera_list.destroy();
			if( camera_evt_chart != null ) camera_evt_chart.destroy();
			
			grid_camera_list = null;
			camera_evt_chart = null;
						
			LoadWndCountGrid();
			LoadColumnLineChart();
			//window.location.reload();	
			show_page = 2;
		}

		function LoadCtrlPieChart()
        {
            const el = document.getElementById('ctrl_pie_wnd');
            
            //var data = camera_event_ctrl_pie_data;          // data 변수에 왜 넣어줘야 되지? 안넣어주면 PieGraph가 그려지지 않음.          
			var category_data = new Array;
			var cjson = new Object();
			cjson = "객체";
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
				if( parseInt(DataEvtObj[i].FACE_MASK) > 0 ){
					ajson = new Object();
					ajson.name  = "마스크";
					ajson.data = parseInt(DataEvtObj[i].FACE_MASK);
					object_data.push(ajson);
					tot_value += ajson.data;
				}
				if( parseInt(DataEvtObj[i].VEHICLE) > 0 ){
					ajson = new Object();
					ajson.name  = "차량";
					ajson.data = parseInt(DataEvtObj[i].VEHICLE);
					object_data.push(ajson);
					tot_value += ajson.data;
				}	
				if( parseInt(DataEvtObj[i].LPR) > 0 ){
					ajson = new Object();
					ajson.name  = "차량번호 인식";
					ajson.data = parseInt(DataEvtObj[i].LPR);
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
					width: 190, 
					height: 200,     
					title: {
						text: '객체',    // 출력 텍스트 & 가운데 출력
						offsetX: -5,
						offsetY: 95,     
						align:'center'   
					},  
					format: '1,000',							
					animation: false
				},  
				exportMenu: {
					visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
				},
				legend: {
					visible: false
				},  
				theme:{
					title: { 
						fontFamily: 'Verdana',     // 출력 텍스트 색상, 폰트 페밀리, 크기 굵기
						fontSize: 15,
						fontWeight: 100,    
						color: '#FFFFFF'
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
					series: {  						
						colors: ['rgba(15,159,175,1)', 'rgba(232,83,76,1)', 'rgba(0,169,225,1)','rgba(212,224,121,1)', 'rgba(241,158,194,1)'],       // 바 색상 지정 <색상을 해당 theme series>에서만 변경 가능								
						lineWidth: 2,
      					strokeStyle: 'rgba(40,40,40,1)',
						dataLabels: {
							fontFamily: 'vedana',							
							fontSize: 12,
							fontWeight: 600,
							useSeriesColor: true,
							lineWidth: 2,
							textStrokeColor: '#ffffff',
							shadowColor: '#ffffff',
							shadowBlur: 6,							
						},
						
					}     
				},
				series: {				
					dataLabels: {               // 데이터 출력 라벨					
						visible: true,										
                        formatter: (value) => {     
                            var result = value.replace("%", "");                      
                            var display_value = tot_value * Number(result);
                            return `${Math.round((display_value)/100)}`;
                        },
					},  
					radiusRange: {              // 도우넛 설정 INNER / OUTER
						inner: '45%',
						outer: '100%',
					},    				
				},
				
				xAxis: {
					width: 160,
					height: 160
				}, 
				plot: {           // 실제 원그래프 공간   				    
					width: 160,
					height: 160
				},
				tooltip: {						// 출력 툴팁이 옆에 그래프와 겹치면 툴팁이 잘린다. 이점 처리					
					offsetX: -50,
					offsetY: 0,
				},      
            };
            chart_pie_ctrl = toastui.Chart.pieChart({ el, data, options });                         
        }

		function LoadEvtPieChart()
        {
            const el = document.getElementById('event_pie_wnd');
            
            //var data = camera_event_evt_pie_data;          // data 변수에 왜 넣어줘야 되지? 안넣어주면 PieGraph가 그려지지 않음.
			var category_data = new Array;
			var cjson = new Object();
			cjson = "이벤트";
			category_data.push(cjson);
			
			var object_data = new Array;
			var tot_value = 0;
			for( var i = 0; i < DataEvtObj.length ; i++){			
				var ajson;				
				if( parseInt(DataEvtObj[i].INV_CNT) > 0 ){
					ajson = new Object();
					ajson.name = "침입";
					ajson.data = parseInt(DataEvtObj[i].INV_CNT);
					object_data.push(ajson);
					tot_value += ajson.data;
				}
				if( parseInt(DataEvtObj[i].LOT_CNT) > 0 ){
					ajson = new Object();
					ajson.name  = "배회";
					ajson.data = parseInt(DataEvtObj[i].LOT_CNT);
					object_data.push(ajson);
					tot_value += ajson.data;
				}
				if( parseInt(DataEvtObj[i].CNT_CNT) > 0 ){
					ajson = new Object();
					ajson.name  = "카운팅";
					ajson.data = parseInt(DataEvtObj[i].CNT_CNT);
					object_data.push(ajson);
					tot_value += ajson.data;
				}
				if( parseInt(DataEvtObj[i].PAK_CNT) > 0 ){
					ajson = new Object();
					ajson.name  = "불법주정차";
					ajson.data = parseInt(DataEvtObj[i].PAK_CNT);
					object_data.push(ajson);
					tot_value += ajson.data;
				}
				if( parseInt(DataEvtObj[i].PAK_CNT) > 0 ){
					ajson = new Object();
					ajson.name  = "블랙리스트";
					ajson.data = parseInt(DataEvtObj[i].PAK_CNT);
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
					width: 190, 
					height: 200, 					
					title: {
					text: '이벤트',    // 출력 텍스트 & 가운데 출력
					offsetX: -5,
					offsetY: 95,     
					align:'center'   
					},  
					animation: false,	
					format: '1,000',			
				},  
				exportMenu: {
					visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
				},
				legend: {
					visible: false
				},
				theme:{
					title: { 
						fontFamily: 'Verdana',     // 출력 텍스트 색상, 폰트 페밀리, 크기 굵기
						fontSize: 15,
						fontWeight: 100,    
						color: '#FFFFFF'
					},
					chart:{
						fontFamily: 'vedana',     // 그래프 폰트   
						backgroundColor:'rgba(30,30,30,1)',  // 그래프 배경색 
					},         
					legend: {                   // Legend 폰트 관련          
						label: {            
							fontFamily: 'vedana',
							mfontSize: 14,                    
							color: 'darkgray'
						}
					},
					series: {
						colors: ['rgba(65,118,223,1)', 'rgba(254,192,112,1)','rgba(255,121,120,1)' ,'rgba(174,207,97,1)', 'rgba(123,255,213,1)'],       // 바 색상 지정 <색상을 해당 theme series>에서만 변경 가능					              
						lineWidth: 2,
      					strokeStyle: 'rgba(40,40,40,1)',
						dataLabels: {
							fontFamily: 'vedana',
							fontSize: 12,
							fontWeight: 600,
							useSeriesColor: true,
							lineWidth: 2,
							textStrokeColor: '#ffffff',
							shadowColor: '#ffffff',
							shadowBlur: 6,		
						}
					},  
						
					/*tooltip: {						
						borderStyle: 'single',
						header: {
							fontSize: 5,
							fontFamily: 'verdana',	
						},						
						body: {
							fontFamily: 'verdana',		
							fontSize: 50,																
							color: 'red',			
						},
					},*/
				}, 
				series: {
					dataLabels: {               // 데이터 출력 라벨		
						visible: true,										
                        formatter: (value) => {     
                            var result = value.replace("%", "");                      
                            var display_value = tot_value * Number(result);
                            return `${Math.round((display_value)/100)}`;
                        },
					}, 
					radiusRange: {              // 도우넛 설정 INNER / OUTER
						inner: '45%',
						outer: '100%',
					}, 							
				},  
				xAxis: {
					width: 160,
					height: 160
				},
				plot: {           // 실제 원그래프 공간        
					width: 160,
					height: 160
				},   
				tooltip: {						// 출력 툴팁이 옆에 그래프와 겹치면 툴팁이 잘린다. 이점 처리					
					offsetX: -80,
					offsetY: 0,				
				},  
            };
            chart_pie_event = toastui.Chart.pieChart({ el, data, options }); 
        }
	
		function LoadBarDualChart()
        {   
			const el = document.getElementById('chart_bar_dual');  
			
			var category_data = new Array;
			var cjson = new Object();
			var chk_data_val = true;		
			
			for( var i = 0 ; i < DataDualObj.length ; i++){
				if( DataDualObj[i].CAMERA_NAME != null) category_data.push(DataDualObj[i].CAMERA_NAME);
			};		
					
			var object_series_data = new Array;
			var select_name , select_group;
			var man_obj = new Array;
			var ajson;	
						
			// Dual Graph Series 작성
			ajson = new Object();
			ajson.name = '남자';	
			var rData = new Array;
			for( var i = 0; i < DataDualObj.length ; i++){	
				if( DataDualObj[i].CAMERA_NAME != null) rData.push(parseInt(DataDualObj[i].PERSON_MALE));					
			}
			ajson.data = rData;
			ajson.stackGroup = 'Control';
			man_obj.push(ajson);
		
			ajson = new Object();
			ajson.name = '여자';	
			var rData = new Array;
			for( var i = 0; i < DataDualObj.length ; i++){	
				if( DataDualObj[i].CAMERA_NAME != null) rData.push(parseInt(DataDualObj[i].PERSON_FEMALE));					
			}
			ajson.data = rData;
			ajson.stackGroup = 'Control';
			man_obj.push(ajson);
			
			ajson = new Object();
			ajson.name = '마스크';	
			var rData = new Array;
			for( var i = 0; i < DataDualObj.length ; i++){	
				if( DataDualObj[i].CAMERA_NAME != null) rData.push(parseInt(DataDualObj[i].FACE_MASK));					
			}
			ajson.data = rData;
			ajson.stackGroup = 'Control';
			man_obj.push(ajson);

			ajson = new Object();
			ajson.name = '차량';	
			var rData = new Array;
			for( var i = 0; i < DataDualObj.length ; i++){	
				if( DataDualObj[i].CAMERA_NAME != null) rData.push(parseInt(DataDualObj[i].VEHICLE));					
			}
			ajson.data = rData;
			ajson.stackGroup = 'Control';
			man_obj.push(ajson);

			ajson = new Object();
			ajson.name = '차량번호 인식';	
			var rData = new Array;
			for( var i = 0; i < DataDualObj.length ; i++){	
				if( DataDualObj[i].CAMERA_NAME != null) rData.push(parseInt(DataDualObj[i].CNT_LPR));					
			}
			ajson.data = rData;
			ajson.stackGroup = 'Control';
			man_obj.push(ajson);

			ajson = new Object();
			ajson.name = '침입';	
			var rData = new Array;
			for( var i = 0; i < DataDualObj.length ; i++){	
				if( DataDualObj[i].CAMERA_NAME != null) rData.push(parseInt(DataDualObj[i].INV_CNT));					
			}
			ajson.data = rData;
			ajson.stackGroup = 'Event';
			man_obj.push(ajson);

			ajson = new Object();
			ajson.name = '배회';	
			var rData = new Array;
			for( var i = 0; i < DataDualObj.length ; i++){	
				if( DataDualObj[i].CAMERA_NAME != null) rData.push(parseInt(DataDualObj[i].LOT_CNT));					
			}
			ajson.data = rData;
			ajson.stackGroup = 'Event';
			man_obj.push(ajson);

			ajson = new Object();
			ajson.name = '카운팅';	
			var rData = new Array;
			for( var i = 0; i < DataDualObj.length ; i++){	
				if( DataDualObj[i].CAMERA_NAME != null) rData.push(parseInt(DataDualObj[i].CNT_CNT));					
			}
			ajson.data = rData;
			ajson.stackGroup = 'Event';
			man_obj.push(ajson);

			ajson = new Object();
			ajson.name = '불법주정차';	
			var rData = new Array;
			for( var i = 0; i < DataDualObj.length ; i++){	
				if( DataDualObj[i].CAMERA_NAME != null) rData.push(0);
			}
			ajson.data = rData;
			ajson.stackGroup = 'Event';
			man_obj.push(ajson);

			ajson = new Object();
			ajson.name = '블랙리스트';	
			for( var i = 0; i < DataDualObj.length ; i++){	
				if( DataDualObj[i].CAMERA_NAME != null) rData.push(parseInt(0));
			}
			ajson.data = rData;
			ajson.stackGroup = 'Event';
			man_obj.push(ajson);

			var totalInfo = new Object();
			totalInfo.categories = category_data;
			totalInfo.series = man_obj;			
			var data = totalInfo;
			            
			var graph_height;
			if( DataDualObj.length < 6){			// 그래프가 너무 없으면 조밀하게 붙어나온다 출력 크기 조정
				graph_height = DataDualObj.length * 100;
			}else{
				graph_height = DataDualObj.length * 70;
			}
            const options = {        
            chart: { 
				width: size.width * 1.6,        // 출력 그래프 크기 Width
                height: graph_height,      // 출력 그래프 크기 Height
                animation: false          // 출력시 애니매이션 효과 비활성 : 기본 
            },               
            exportMenu: {
                visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
            }, 
			legend: {
				visible : false,
				align: 'top',
				showCheckbox: true,
			},
            series: {
                stack: true,        
            },   
            xAxis: {
                title: 'value',           // X축 명칭 출력  				
            },
            yAxis: {
                title: 'date',            // Y축 명칭 출력 
            },           
            theme:{        
                chart:{
                fontFamily: 'vedana',     // 그래프 폰트             
                backgroundColor:'rgba(30,30,30,1)',  // 그래프 배경색 
                },  
                series:{
                 colors: ['rgba(15,159,175,0.3)', 'rgba(232,83,76,1)', 'rgba(0,169,225,1)','rgba(212,224,121,1)', 'rgba(241,158,194,1)', 'rgba(65,118,223,1)', 'rgba(254,192,112,1)', 'rgba(255,121,120,1)','rgba(174,207,97,1)', 'rgba(123,255,213,1)'],       // 바 색상 지정 <색상을 해당 theme series>에서만 변경 가능
				 barWidth: 10,    				 
                },
                xAxis: {                    // X 축 테마 처리 (색상,폰트,폰트두께,크기)
                title: {
                    fontFamily: 'vedana',
                    fontSize: 12,             
                    color: 'lightgray'
                },
                label: {
                    fontFamily: 'vedana',
                    fontSize: 10,             
                    color: 'darkgray'
                },
                width: 1,
                color: 'gray'
                },
                yAxis: {                     // Y 축 테마 처리 (색상,폰트,폰트두께,크기)
                title: {
                    fontFamily: 'vedana',
                    fontSize: 12,              
                    color: 'lightgray'
                },
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
						fontSize: 10,
						color: 'darkgray'
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
                }
            },
            };    
			
            chart_bar = toastui.Chart.barChart({ el, data, options });           
        }

		// view#2
		function LoadWndCountGrid()
		{	
			var camera_grid = tui.Grid;
			camera_grid.applyTheme("default", {
				area: {
				header: {
					border: '#2d2d2d',					
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
		
			grid_camera_list = new camera_grid({
				el: document.getElementById('cctv_display_wnd'),
				theme: 'default',
				data: DataDualObj,
				scrollX: false,
				scrollY: true,    

				rowHeight: 50,
				bodyHeight: 790,				
				header: {
					height: '0px',					
				},
				columns: [
					{
					align: 'left',
					name: 'CAMERA_NAME', 
					//sortable: true,  
					width: 367,   					                         
					},							  
				],
            });
			//grid_camera_list.sort('CAMERA_NAME', true, false)

			if( DataDualObj.length > 0 ){
				// 등록된 데이터중 CAMERA 이름이 없는 데이터 삭제 ( 의미 없음 )					
				grid_camera_list.focusAt(0, 0, true);
				const ctl_camera_name = document.getElementById('edt_camera_name');
				var row = grid_camera_list.getRow(0);				
				ctl_camera_name.value = row.CAMERA_NAME;
				select_camera_name = row.CAMERA_NAME;
				SelChangeEvent(select_camera_name);
			}
			
			grid_camera_list.on('focusChange', ev => {     			
				cctvIndex = ev.rowKey;				
				var row = grid_camera_list.getRow(cctvIndex);				
				const ctl_camera_name = document.getElementById('edt_camera_name');
				ctl_camera_name.value = row.CAMERA_NAME;

				var data = grid_camera_list.findRows({CAMERA_NAME:ctl_camera_name.value});
				if(  data.length > 0 ){
					console.log('change focused cell!', data[0].CAMERA_NAME);
					select_camera_name = data[0].CAMERA_NAME;
					// 불러들여 그래프 출력 코드 파트
					if( camera_evt_chart != null ) camera_evt_chart.destroy();
					camera_evt_chart = null;
					LoadColumnLineChart();

					SelChangeEvent(select_camera_name);
				}else{
					console.log('CAMERA NAME Not Define!', );
				}
   			});
    	}

		function SelChangeEvent( select_cameraName )
		{
			// 표 데이터 변경
			// 카운트
			var count_today = document.getElementById('count_today');
			var count_yesterday = document.getElementById('count_yesterday');
			var count_yesterdayCompare = document.getElementById('count_yesterdayCompare');
			var count_Week = document.getElementById('count_Week');
			var count_WeekCompare = document.getElementById('count_WeekCompare');
			// 침입		
			var invade_today = document.getElementById('invade_today');
			var invade_yesterday = document.getElementById('invade_yesterday');
			var invade_yesterdayCompare = document.getElementById('invade_yesterdayCompare');
			var invade_Week = document.getElementById('invade_Week');
			var invade_WeekCompare = document.getElementById('invade_WeekCompare');
			// 배회		
			var loitering_today = document.getElementById('loitering_today');
			var loitering_yesterday = document.getElementById('loitering_yesterday');
			var loitering_yesterdayCompare = document.getElementById('loitering_yesterdayCompare');
			var loitering_Week = document.getElementById('loitering_Week');
			var loitering_WeekCompare = document.getElementById('loitering_WeekCompare');
			// 마스크 미착용
			var unmask_today = document.getElementById('unmask_today');
			var unmask_yesterday = document.getElementById('unmask_yesterday');
			var unmask_yesterdayCompare = document.getElementById('unmask_yesterdayCompare');
			var unmask_Week = document.getElementById('unmask_Week');
			var unmask_WeekCompare = document.getElementById('unmask_WeekCompare');

			for( var i = 0; i < DataDualObj.length ; i++){	
				if( DataDualObj[i].CAMERA_NAME == select_cameraName ){
					// 카운트
					count_today.innerText = DataDualObj[i].CNT_CNT;							
					count_yesterday.innerText = DataDualObj[i].CNT_CNT_BACK_1D;					
					if( DataDualObj[i].CNT_CNT_BACK_1D  == null) count_yesterday.innerText = 0;						
					
					count_yesterdayCompare.innerText = CompareDisplayValue( DataDualObj[i].CNT_CNT, DataDualObj[i].CNT_CNT_BACK_1D , count_yesterdayCompare);				
					if( DataDualObj[i].CNT_CNT_BACK_1D == null) count_yesterdayCompare.innerText = 0;	

					count_Week.innerText = DataDualObj[i].CNT_CNT_BACK_7D;	
					if( DataDualObj[i].CNT_CNT_BACK_7D == null) count_Week.innerText = 0;	

					count_WeekCompare.innerText = CompareDisplayValue( DataDualObj[i].CNT_CNT, DataDualObj[i].CNT_CNT_BACK_7D , count_WeekCompare);
					if( DataDualObj[i].CNT_CNT_BACK_7D == null) count_WeekCompare.innerText = 0;						

					// // 침입					
					invade_today.innerText = DataDualObj[i].INV_CNT;					
					invade_yesterday.innerText = DataDualObj[i].INV_CNT_BACK_1D;	
					if( DataDualObj[i].INV_CNT_BACK_1D  == null) invade_yesterday.innerText = 0;	

					invade_yesterdayCompare.innerText = CompareDisplayValue( DataDualObj[i].INV_CNT, DataDualObj[i].CNT_CNT_BACK_1D , invade_yesterdayCompare);				
					if( DataDualObj[i].CNT_CNT_BACK_1D  == null) invade_yesterdayCompare.innerText = 0;	

					invade_Week.innerText = DataDualObj[i].INV_CNT_BACK_7D;	
					if( DataDualObj[i].INV_CNT_BACK_7D  == null) invade_Week.innerText = 0;	

					invade_WeekCompare.innerText = CompareDisplayValue( DataDualObj[i].INV_CNT, DataDualObj[i].CNT_CNT_BACK_7D , invade_WeekCompare );
					if( DataDualObj[i].INV_CNT_BACK_7D  == null) invade_WeekCompare.innerText = 0;	

					// // 배회					
					loitering_today.innerText = DataDualObj[i].LOT_CNT;
					loitering_yesterday.innerText = DataDualObj[i].LOT_CNT_BACK_1D;	
					if( DataDualObj[i].LOT_CNT_BACK_1D  == null) loitering_yesterday.innerText = 0;
					
					loitering_yesterdayCompare.innerText = CompareDisplayValue( DataDualObj[i].LOT_CNT, DataDualObj[i].LOT_CNT_BACK_1D , loitering_yesterdayCompare);					
					if( DataDualObj[i].LOT_CNT_BACK_1D  == null) loitering_yesterdayCompare.innerText = 0;

					loitering_Week.innerText = DataDualObj[i].LOT_CNT_BACK_7D;					
					if( DataDualObj[i].LOT_CNT_BACK_7D  == null) loitering_Week.innerText = 0;
					
					loitering_WeekCompare.innerText = CompareDisplayValue( DataDualObj[i].LOT_CNT, DataDualObj[i].LOT_CNT_BACK_7D , loitering_WeekCompare);
					if( DataDualObj[i].LOT_CNT_BACK_7D  == null) loitering_WeekCompare.innerText = 0;

					// // 마스크 미착용
					unmask_today.innerText = DataDualObj[i].FACE_NOMASK;				
					unmask_yesterday.innerText = DataDualObj[i].FACE_NOMASK_BACK_1D;		
					if( DataDualObj[i].FACE_NOMASK_BACK_1D  == null) unmask_yesterday.innerText = 0;

					unmask_yesterdayCompare.innerText = CompareDisplayValue( DataDualObj[i].FACE_NOMASK, DataDualObj[i].FACE_NOMASK_BACK_1D , unmask_yesterdayCompare);				
					if( DataDualObj[i].FACE_NOMASK_BACK_1D  == null) unmask_yesterdayCompare.innerText = 0;

					unmask_Week.innerText = DataDualObj[i].FACE_NOMASK_BACK_7D;			
					if( DataDualObj[i].FACE_NOMASK_BACK_7D  == null) unmask_Week.innerText = 0;

					unmask_WeekCompare.innerText = CompareDisplayValue( DataDualObj[i].FACE_NOMASK, DataDualObj[i].FACE_NOMASK_BACK_7D , unmask_WeekCompare);
					if( DataDualObj[i].FACE_NOMASK_BACK_7D  == null) unmask_WeekCompare.innerText = 0;

					break;
				}
			}
		}

		function CompareDisplayValue( totalValue, compareValue , ctrlPanel)
		{
			var display_value;
				
			var compare_value = parseInt(totalValue) - parseInt(compareValue);
			
			if(compare_value < 0){
				display_value = '▲' + Math.abs(compare_value);
				ctrlPanel.style.color = '#eb6877';				
			}else if(compare_value > 0){		
				display_value = '▼' +  Math.abs(compare_value);
				ctrlPanel.style.color = '#00b7ee';				
			}else if(compare_value == 0){
				display_value = '0%';
			}						
			return display_value;
		}

		function LoadColumnLineChart()                  // 악세사리
        {           
            const el = document.getElementById('camera_evt_graph');
            
			var category_data = new Array;
			var cjson = new Object();
			
			category_data.push('카운팅');
			category_data.push('침입');
			category_data.push('배회');
			category_data.push('마스크 미착용');
						
			var object_today_data = new Array;
			var object_yesterday_data = new Array;
			var object_week_data = new Array;
			for( var i = 0; i < DataDualObj.length ; i++){	
				if( DataDualObj[i].CAMERA_NAME === select_camera_name ){
					// 오늘 ///////////////////////////		
					if( DataDualObj[i].CNT_CNT) 
					{									
						object_today_data.push(parseInt(DataDualObj[i].CNT_CNT));
					}					
					if( DataDualObj[i].INV_CNT )
					{				
						object_today_data.push(parseInt(DataDualObj[i].INV_CNT));
					}
					if( DataDualObj[i].LOT_CNT) 
					{				
						object_today_data.push(parseInt(DataDualObj[i].LOT_CNT));
					}					
					if( DataDualObj[i].FACE_NOMASK)
					{				
						object_today_data.push(parseInt(DataDualObj[i].FACE_NOMASK));
					}
					// 어제 ///////////////////////////
					if( DataDualObj[i].CNT_CNT_BACK_1D ) 
					{
						object_yesterday_data.push(parseInt(DataDualObj[i].CNT_CNT_BACK_1D));			
					}
					if( DataDualObj[i].INV_CNT_BACK_1D ) 
					{				
						object_yesterday_data.push(parseInt(DataDualObj[i].INV_CNT_BACK_1D));
					}
					if( DataDualObj[i].LOT_CNT_BACK_1D ) 
					{
						object_yesterday_data.push(parseInt(DataDualObj[i].LOT_CNT_BACK_1D));			
					}
					if( DataDualObj[i].FACE_NOMASK_BACK_1D ) 
					{				
						object_yesterday_data.push(parseInt(DataDualObj[i].FACE_NOMASK_BACK_1D));
					}		
					// 1주 전 ///////////////////////////
					if( DataDualObj[i].CNT_CNTT_BACK_7D ) 
					{
						object_week_data.push(parseInt(DataDualObj[i].CNT_CNT_BACK_7D));			
					}
					if( DataDualObj[i].INV_CNT_BACK_7D ) 
					{				
						object_week_data.push(parseInt(DataDualObj[i].INV_CNT_BACK_7D));
					}
					if( DataDualObj[i].LOT_CNT_BACK_7D ) 
					{
						object_week_data.push(parseInt(DataDualObj[i].LOT_CNT_BACK_7D));			
					}
					if( DataDualObj[i].FACE_NOMASK_BACK_7D ) 
					{				
						object_week_data.push(parseInt(DataDualObj[i].FACE_NOMASK_BACK_7D));
					}	
				}		
			}	
				
			var today_obj = new Array;
			var ajson = new Object();			
			ajson.name = "오늘";
			ajson.data = object_today_data;
			today_obj.push(ajson);

			var line_obj = new Array;
			var bjson = new Object();			
			bjson.name = "어제";
			bjson.data = object_yesterday_data;
			line_obj.push(bjson);
			
			var bjson = new Object();			
			bjson.name = "1주전";
			bjson.data = object_week_data;
			line_obj.push(bjson);

			var totalInfo = new Object();
			var columnInfo = new Object();
			columnInfo.column = today_obj;
			columnInfo.line = line_obj;

			totalInfo.categories = category_data;
			totalInfo.series = columnInfo;			
			data = totalInfo; 
			
            const options = {        
                chart: { 
					width: 600,        // 출력 그래프 크기 Width
					height: 430,      // 출력 그래프 크기 Height
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
						color: 'white'
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
						colors: ['rgba(126,206,244,1)', 'rgba(229,144,2,1)', 'rgba(0,255,0,1)'],       //  색상 지정 <색상을 해당 theme series>에서만 변경 가능
						barWidth: 40
					},      
                },
            };               
            camera_evt_chart = toastui.Chart.columnLineChart({ el, data, options });              
        }	

		function KeyDownSearch()
		{
			if(event.keyCode == 13) {
				FindData();
			}
		}
				
		function FindData()
		{
			
			const camera_name = document.getElementById('edt_camera_name');
			
			if(camera_name.value != ""){					/// 무언가 검색 값이 있는 경우
				var data = grid_camera_list.getData();	
				var list_str;		
				for( var i = 0 ; i < data.length ; i++ ){	
					list_str = data[i].CAMERA_NAME;						
					if( list_str.indexOf(camera_name.value) == -1){
						//grid_camera_list.focusAt(i, 0, true);
						grid_camera_list.removeRow(i);					
					}
				}
			}else{									// 값이 없는 경우 전체 출력
				
				if( grid_camera_list != null ) grid_camera_list.destroy();
				grid_camera_list = null;
				LoadWndCountGrid();
			}
		}	

		function OnCSV_OK()
		{
			if( show_page == 1 ){
				var itemsFormatted = [];
				var itemsNotFormatted = [];

				var headers_top = {	
				};

				var headers = {						
					CAMERA_NAME: '카메라명'.replace(/,/g, ''), // remove commas to avoid errors
					PERSON_MALE: '남성',
					PERSON_FEMALE: '여성',
					FACE_MASK: '마스크',
					VEHICLE: '차량',
					CNT_LPR: '차량번호 인식',
					INV_CNT: '침입',
					LOT_CNT: '배회',
					CNT_CNT: '카운팅',
					PAK_CNT: '불법 주정차'
				};

				itemsNotFormatted = DataDualObj;

				// format the data
				itemsNotFormatted.forEach((item) => {
					itemsFormatted.push({
						CAMERA_NAME: item.CAMERA_NAME.replace(/,/g, ''), // remove commas to avoid errors,
						PERSON_MALE: item.PERSON_MALE,
						PERSON_FEMALE: item.PERSON_FEMALE,
						FACE_MASK: item.FACE_MASK,
						VEHICLE: item.VEHICLE,
						CNT_LPR: item.CNT_LPR,
						INV_CNT: item.INV_CNT,
						LOT_CNT: item.LOT_CNT,
						CNT_CNT: item.CNT_CNT,
						PAK_CNT: item.PAK_CNT,
					});
				});

				var fileTitle = '카메라이벤트발생_' + getDateStr();
				exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
			}else{			// show_page == 2
				var itemsFormatted = [];
				var itemsNotFormatted = [];

				var headers_top = {	
					CAMERA_NAME: ' ',
					CNT_CNT: '카운트',
					CNT_CNT_BACK_1D: '',
					CNT_CNT_BACK_7D: '',
					INV_CNT: '침입',
					INV_CNT_BACK_1D: '',
					INV_CNT_BACK_7D: '',
					LOT_CNT: '배회',
					LOT_CNT_BACK_1D: '',
					LOT_CNT_BACK_7D: '',
					FACE_NOMASK: '배회',
					FACE_NOMASK_BACK_1D: '',
					FACE_NOMASK_BACK_7D: ''
				};

				var headers = {						
					CAMERA_NAME: '카메라명',
					CNT_CNT: '오늘',
					CNT_CNT_BACK_1D: '어제',
					CNT_CNT_BACK_7D: '1주 전',
					INV_CNT: '오늘',
					INV_CNT_BACK_1D: '어제',
					INV_CNT_BACK_7D: '1주 전',
					LOT_CNT: '오늘',
					LOT_CNT_BACK_1D: '어제',
					LOT_CNT_BACK_7D: '1주 전',
					FACE_NOMASK: '오늘',
					FACE_NOMASK_BACK_1D: '어제',
					FACE_NOMASK_BACK_7D: '1주 전'
				};

				itemsNotFormatted = DataDualObj;

				// format the data
				itemsNotFormatted.forEach((item) => {
					itemsFormatted.push({
						CAMERA_NAME: item.CAMERA_NAME.replace(/,/g, ''), // remove commas to avoid errors,
						CNT_CNT: item.CNT_CNT,
						CNT_CNT_BACK_1D: item.CNT_CNT_BACK_1D,
						CNT_CNT_BACK_7D: item.CNT_CNT_BACK_7D,
						INV_CNT: item.INV_CNT,
						INV_CNT_BACK_1D: item.INV_CNT_BACK_1D,
						INV_CNT_BACK_7D: item.INV_CNT_BACK_7D,
						LOT_CNT: item.LOT_CNT,
						LOT_CNT_BACK_1D: item.LOT_CNT_BACK_1D,
						LOT_CNT_BACK_7D: item.LOT_CNT_BACK_7D,
						FACE_NOMASK: item.FACE_NOMASK,
						FACE_NOMASK_BACK_1D: item.FACE_NOMASK_BACK_1D,
						FACE_NOMASK_BACK_7D: item.FACE_NOMASK_BACK_7D
						
					});
				});

				var fileTitle = '카메라이벤트데이터_' + getDateStr();
				exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
			}
		}

		function OnSelectDate(select_day)
		{	
			$('#loading').show();			

			// 날짜 양식 - 화면 출력
			var year = select_day.getFullYear();
			var month = select_day.getMonth() + 1;
			var day = select_day.getDate();	  			
  			datePicker1.setDate(select_day);

			// 인자 작성 (날짜)
			if (Number(month) < 10)
				month = '0' + month;
			if (Number(day) < 10)
				day = '0' + day;
			var startfullDate = String(year) + String(month) + String(day);

			var xhttp = new XMLHttpRequest();
			var param = 'getBackDateValue?';
			param += 'startDate=' + startfullDate;
			xhttp.onreadystatechange = function () {

				if (this.readyState == 4 && this.status == 200) {
					if (this.responseURL.includes('getBackDateValue')) {
						
						$('#loading').hide();						
						var today_str = GetTodayStr();	
						if( startfullDate == today_str){
							today_count_file_name = "./data/dailyCount.json";
							today_count_Camera_file_name = "./data/dailyCountByCamera.json";	
						}else{
							today_count_file_name = "./data/dailyCountBack.json";
							today_count_Camera_file_name = "./data/dailyCountByCameraBack.json";	
						}
						loadData();
					}
				}				
			}	
			xhttp.open('GET', param, true);
			xhttp.send();	
		}

		function OnPrevDate()
		{
			$('#loading').show();			

			move_day = move_day - 1;				
			var yesterday = new Date();
			yesterday.setDate(yesterday.getDate() + move_day);

			// 날짜 양식 - 화면 출력
			var year = yesterday.getFullYear();
			var month = yesterday.getMonth() + 1;
			var day = yesterday.getDate();	  			
  			datePicker1.setDate(yesterday); 			
		}

		function OnTodayDate()
		{	
			move_day = 0;		
			calendarPickerToday();

			today_count_file_name = "./data/dailyCount.json";
			today_count_Camera_file_name = "./data/dailyCountByCamera.json";		
	
			loadData();
		}

		function OnNextDate()
		{	
			$('#loading').show();			

			move_day = move_day + 1;				
			var yesterday = new Date();
			yesterday.setDate(yesterday.getDate() + move_day);

			// 날짜 양식 - 화면 출력
			var year = yesterday.getFullYear();
			var month = yesterday.getMonth() + 1;
			var day = yesterday.getDate();	  			
  			datePicker1.setDate(yesterday);			
		}
		
		function calendarPickerToday() {
			// 날짜
			var today = new Date();
			var year = today.getFullYear();
			var month = today.getMonth() + 1;
			var day = today.getDate();
			// 날짜 및 캘린더
			datePicker1.setDate(today);
		}
	</script>

 </body>
</html>
