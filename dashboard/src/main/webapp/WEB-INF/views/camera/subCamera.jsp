<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Ai VinUS DASHBOARD</title>

	<%-- css --%>
	<%-- <link rel="stylesheet" href="css/style.css"> --%>
	<link rel="stylesheet" href="/resources/css/camera/subCamera.css">

	<link rel="stylesheet" href="/resources/css/popup.css">
	<link rel="stylesheet" href="/resources/css/camera.css">
	<link rel="stylesheet" href="/resources/font/nanumsquare.css">
	<link rel="stylesheet" href="/resources/css/style_graph.css"/>  
	<link rel="stylesheet" href="/resources/css/style_grid.css"/>  
	<link rel="stylesheet" href="/resources/css/style_scrollBar.css"/>  
	<%-- <link rel="stylesheet" href="css/style.css"/>   --%>
	<link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon" />
	
	<link rel="stylesheet" href="./node_modules/tui-chart/dist/toastui-chart.css">
	<link rel="stylesheet" href="./node_modules/tui-grid/dist/tui-grid.css" />
	<link rel="stylesheet" href="./node_modules/tui-date-picker/dist/tui-date-picker.css">
	
	
	<%-- // 다른 테이블에 영향이 있을 수 있어 여기에 따로 스타일 정의  --%>
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
	<%-- 전체 wrap.S --%>
	<div class="wrap" id="indexWrap">  
		<jsp:include page="/WEB-INF/views/main/setting.jsp"/>

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
					<div class=" dateArea" style="display: flex; flex-direction: row; align-items: center;">

						<%-- 달력 --%>
						<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
							<input type="date" id="tui-date-picker-target"
								aria-label="Date-Time" style = "margin-top: 1px;">
							<span class="tui-ico-date"></span>
							<div id="tui-date-picker-container"></div>
						</div>
						<%-- <div id="tui-date-picker-container"></div>
						<a class="rollover" alt="달력" id="tui-date-picker-main" style = "margin-top: 1px;">
							<img src="img/btn-calendar.png"> 
							<img src="img/btn-calendar.png" class="over">
						</a>

						<div class="tui-datepicker-input tui-datetime-input tui-has-focus" style = "margin-top: 2px;">
							<input type="text" id="datepicker-input" aria-label="Date-Time">
							<div id="wrapper" style="margin-left : -3px; margin-top : 5px;"></div>								
						</div> --%>
						<%-- <p class="date" id='mainDate'>2021년 07월 21일</p> --%>
						<button type="button" class="btn-date" onClick="OnPrevDate()"   style = "margin-top: 1px;">◀<%-- <img src="img/btn-calendarLeft.png">--%></button>
						<button type="button" class="btn" onClick="OnTodayDate()"  style = "margin: 1px 4px 0 4px;">오늘</button>
						<button type="button" class="btn-date" onClick="OnNextDate()" style = "margin-top: 1px;">▶<%-- <img src="img/btn-calendarRight.png">--%></button>
					</div>	
				</div>
				<%-- 상단 날짜,버튼 영역.E --%>

				<%-- 메인컨텐츠.S --%>
				<div class="contents">

					<%-- 섹션 좌측.S --%>
					<div class="sectionBox" style="width: 1055px;">
						<div class="innerBox subCamera">
							<div class="subTabs">
								<div class="tabsTitle"><img src="/resources/img/navi_camera.png"></div>
									<ul class="tabs" data-persist="true">
										<li><a href="/mainCamera/subCamera" onClick="TabOneChange()" class="tab-viewTime" style="background-color: #1e1e1e; color: white;">전체 카메라 이벤트 발생 현황</a></li>
										<li><a href="/mainCamera/subCamera2" onClick="TabTwoChange()" class="tab-viewTime">카메라 이벤트별 데이터 비교</a></li>
									</ul>
								<div class="sub-btnArea" style="display: flex; flex-direction: row; ">
									<div class="csvContainer" style="position: relative; margin: 0 10px;">
										<a class="rollover" alt="csv파일" onClick="OnCSV_Click()"><img src="../../resources/img/btn-downCSV.png"> <img src="../../resources/img/btn-downCSV_hover.png" class="over"></a>
										<%-- CSV 대화상자 --%>
										<dialog open id="csv_dialog" style = "display:none; background-color: rgba(30,30,30,1); color:rgba(192,192,192,1); width: 336px; padding: 0px; top:30px; left:900px; position: absolute; z-index: 1; left: -8px;">		
											<div style = "font-size: 14px; width: 330px; background-color: rgba(45,45,45,1); color:rgba(255,255,255,1); padding: 16px; ">
												<p>.csv 파일로 내려받기를 원하시는 항목을 선택</p>						
												<p style = "margin-top: 6px">하여 체크한 후 [확인] 버튼을 누르세요.</p>
											</div>
											<div style = "width: 330px;  border: 1px solid gray;"></div>
											<div style = "margin : 15px;"><input name="round" id="chk_csv_human" type="checkbox">  사람</div>
											<div style = "margin : 15px;"><input name="round" id="chk_csv_vehicle" type="checkbox">  차량</div>
											<div style = "margin : 15px;"><input name="round" id="chk_csv_event_acc" type="checkbox">  이벤트 발생 비율</div>
											<div style = "margin : 15px;"><input name="round" id="chk_csv_unmask_sex" type="checkbox">  마스크 미착용자 성별/연령 비교</div>
											<div style = "margin : 15px;"><input name="round" id="chk_csv_time_chk" type="checkbox">  시간대별 객체 현황</div>
											<div style = "margin : 15px;"><input name="round" id="chk_csv_camera_10ch_human" type="checkbox">  검지 카메라 TOP 10ch - 사람</div>
											<div style = "margin : 15px;"><input name="round" id="chk_csv_camera_10ch_vehicle" type="checkbox">  검지 카메라 TOP 10ch - 차량</div>
											<div style = "margin : 10px; float: right;">
												<a class="rollover" alt="확인" OnClick="OnCSV_OK()"><img  src="../../resources/img/btn_popConfirm.png"> <img src="../../resources/img/btn_popConfirm_hover.png" class="over"></a>
												<a class="rollover" alt="취소" OnClick="OnCSV_Cancel()"><img src="../../resources/img/btn_popCancel.png"> <img src="../../resources/img/btn_popCancel_hover.png" class="over"></a>
											</div>
										</dialog>
									</div>
									<a class="rollover" alt="HOME" href="/main"><img src="/resources/img/btn-goMain.png"> <img src="/resources/img/btn-goMain_hover.png" class="over"></a>
								</div>
							</div>
							<%-- 전체 카메라 이벤트 발생 현황 --%>
							<div id="view1" class="data ">
								<div class="dataSelect1" style="display: flex; flex-direction: row; justify-content: space-between; align-items: end;"> 
									<div class="corlorGuide alignL" style="margin-left: 20px; margin-top : 120px; display:flex; flex-direction: column; align-items: start;">
										<div class="colorGuide_title">색상 Guide</div>
										<div class="colorGuide_model">
											<div class="colorBox cBG-Male"></div> <div class="guideTXT">남자</div>
											<div class="colorBox cBG-Female"></div> <div class="guideTXT">여자</div>
											<div class="colorBox cBG-Mask"></div> <div class="guideTXT">마스크</div>
											<div class="colorBox cBG-Car"></div> <div class="guideTXT">차량</div>
											<div class="colorBox cBG-LPR"></div> <div class="guideTXT">차량번호 인식</div>
										</div>
										<div class="colorGuide_event">
											<div class="colorBox cBG-Intrusion"></div> <div class="guideTXT">침입</div>
											<div class="colorBox cBG-Loitering"></div> <div class="guideTXT">배회</div>
											<div class="colorBox cBG-Counting"></div> <div class="guideTXT">카운팅</div>
											<div class="colorBox cBG-Parking"></div> <div class="guideTXT">불법 주·정차</div>
											<div class="colorBox cBG-BlackList"></div> <div class="guideTXT">블랙리스트</div>
										</div>
									</div>

									<div class="chartCon" style="width: 400px; height: 200px; display: flex; flex-direction: row; justify-content: space-between; align-items: center;">
									
										<div style="width: 50%; height: 100%;">
											<div id = "model_pie_wnd" style="width: 100%; height: 100%;"></div>
										</div>
										<div style="width: 50%; height: 100%;">
											<div id = "event_pie_wnd" style="width: 100%; height: 100%;"></div>
										</div>
									</div>
									<%--
									<div class="alignR" style = "float:right">
										<div  style = "width:10px; height: 100px; float:right;">1</div>
										<div  style = "margin-top: -10px; float:right;" id = "event_pie_wnd">123</div>   
										<div  style = "width:10px; height: 100px; float:right;">9</div>
										<div style = "margin-top: -10px; float:right;"  id = "ctrl_pie_wnd">456</div>    
									</div>
									--%>
								</div> 

								<div class="clearfix" style="margin-left: 15px; margin-right: 15px; height:635px; border:1px solid gray"> 
									<div style = "overflow:auto; width:100%; height:630px; background-color:rgba(30,30,30,1);"  >     
										<div style = "width:900px; height: 1000px;" class="chart" id="chart_bar_dual"></div> 
									</div>    
								</div>								
							</div>


							<%-- !!!!!! 차후에 비동기로 데이터 불러오면서 진행할 것!!!!!! --%>
							<%-- 카메라 이벤트별 데이터 비교 --%>
							<%--
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
																											
									// 토스트 Grid 테마 중복으로 인해 CSS Grid 사용
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
							--%>
							<div id="loading"><img id="loading-image" src="/resources/img/loading_animated.png" alt="Loading..." /></div>						
						</div>
					</div>
					<%-- 섹션 좌측.E --%>

					<%-- 섹션 우측.S --%>
					<div class="sectionBox2">
						<div class="innerBox divSideAge" style="height:25vh;  height:450px; margin-bottom: 13px !important;">
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
	
						<div class="clearfix innerBox divTop10" style="height:25vh;  min-height:435px;" >
							<div class="contentsTitle" style="display: flex; flex-direction: row; justify-content: space-between;">
								<div class="title">
									<h4>최다검지 카메라 TOP10 CH</h4>
								</div>
								<div class="partBTN">
									<a class="changeGraph" onclick="setMainEventTop10()"; style="margin-top:3px;"><img id="changeEvent_btn" src="/resources/img/btn_human.png"><img id="changeEvent_btn" src="/resources/img/btn_human_on.png" class="over"></a>
									<a class="changeGraph" onclick="setMainVehicleTop10()"; style="margin-top:3px;"><img id="changeVehicle_btn" src="/resources/img/btn_car.png"> <img src="/resources/img/btn_car_on.png" class="over"></a>									
								</div>
							</div>
							<div class="data" style="height: 10px !important;">
								<%--  테이블 영역.S --%>

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
								<%--  테이블 영역.E --%>

								<%-- !!!!!차후에 비동기로 데이터 불러오면서 같이 진행할 것!!!!!!!--%>
								<%--
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
								--%>

								<%-- document.getElementById('camera_vec'+parseInt(i+1)).innerHTML = grid_top10_data[i].CAMERA_NAME;
								document.getElementById('car'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_CAR;
								document.getElementById('bus'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_BUS;
								document.getElementById('truck'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_TRUCK;
								document.getElementById('motorcycle'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_MOTORCYCLE;
								document.getElementById('bicycle'+parseInt(i+1)).innerHTML = grid_top10_data[i].VEHICLE_BICYCLE;	--%>

							</div>
						</div>
					</div>	
					<%-- 섹션 우측.E --%>
				</div>
				<%-- 메인컨텐츠.E --%>
				<div id="bottom">
					<p class="Notice">※ 화면에 표시되는 모든 실시간 데이터는 1분마다 자동으로 업데이트 합니다. 다만 “시간대별 현황” 그래프의 실시간 데이터는 정시에 한 번씩 업데이트 합니다.</p>
					<div class="madeFodics" style="margin: 0 40px 0 0;">포딕스시스템</div>
				</div>
				
			</div>
			<%-- 우측 메인.E --%>

		</div>
		<%--  내용.E --%>
	</div>
	<%-- 전체 wrap.E --%>


	<%-- echarts --%>
	<script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>

	<script src="/resources/js/camera/subCamera.js"></script>
	<script src="../../../resources/js/main/loading.js"></script>

	<script src="/resources/data/data_sample.js"></script>
	<script type="text/javascript" src="/resources/js/EventChart.js"></script>

	<script src="./node_modules/jquery/3.6.0/jquery.min.js"></script>

	<script src="./node_modules/tui-chart/dist/toastui-chart.js"></script>
	<script src="./node_modules/tui-grid/dist/tui-grid.js"></script>      	
	<script src="./node_modules/tui-date-picker/dist/tui-date-picker.js"></script>	

	<script src="/resources/js/commonFunctions.js"></script>   
	<%-- 탭버튼 스크립트.S--%>
	<script type="text/javascript" src="/resources/js/tabcontent.js"></script>
	<%-- 탭버튼 스크립트.E--%>
	<script type="text/javascript" src="/resources/js/popupSetting.js"></script>
	<script type="text/javascript" src="/resources/js/CsvMakeFile.js"></script>
	<script type="text/javascript" src="dashboard_config.json"></script> 

		
	<script>
		// input date태그 기본값 변경
		document.getElementById('tui-date-picker-target').value = new Date().toISOString().substring(0, 10);	
	</script>

	<script>
		function OnCSV_Click(){			
			document.getElementById("csv_dialog").open = true;  
			document.getElementById('csv_dialog').style.display='block';			

		}

		function OnCSV_OK(){

        document.getElementById("csv_dialog").open = false; 
        document.getElementById('csv_dialog').style.display='none';	
        
        var chk_val = document.getElementById("chk_csv_human").checked; 
        if(chk_val == true) OnCSV_Human_Select();

        chk_val = document.getElementById("chk_csv_vehicle").checked; 
        if(chk_val == true) OnCSV_Vehicle_Select();

        chk_val = document.getElementById("chk_csv_event_acc").checked; 
        if(chk_val == true) OnCSV_Event_Acc_Select();

        chk_val = document.getElementById("chk_csv_unmask_sex").checked; 
        if(chk_val == true) OnCSV_UnMask_Select();

        chk_val = document.getElementById("chk_csv_time_chk").checked; 
        if(chk_val == true) OnCSV_Time_Select();

        chk_val = document.getElementById("chk_csv_camera_10ch_human").checked; 
        if(chk_val == true){
			setMainEventTop10();
			setTimeout(() => OnCSV_camera_10_human_Select(), 1000);	
        }
        
        chk_val = document.getElementById("chk_csv_camera_10ch_vehicle").checked; 
        if(chk_val == true){
			setMainVehicleTop10();
          // 인쇄시 '차량' 페이지 전환이 되지 않은 상태에서 값을읽고 동시에 출력하면 버퍼가 빈상태일때가 있다.
			setTimeout(() => OnCSV_camera_10_vehicle_Select(), 1000);			
        }

	}

	function OnCSV_Human_Select(){
		var itemsFormatted = [];
		var itemsNotFormatted = [];

		var headers_top = {						
			FACE_SENIORMALE: '남성'.replace(/,/g, ''), // remove commas to avoid errors
			FACE_MIDDLEMALE: '',
			FACE_ADULTMALE: '',
			FACE_YOUNGMALE: '',
			FACE_SENIORFEMALE: '여성',
			FACE_MIDDLEFEMALE: '',
			FACE_ADULTFEMALE: '',
			FACE_YOUNGFEMALE: '',
		};
		var headers = {						
			FACE_SENIORMALE: '노년'.replace(/,/g, ''), // remove commas to avoid errors
			FACE_MIDDLEMALE: '중년',
			FACE_ADULTMALE: "청년",
			FACE_YOUNGMALE: "미성년",
			FACE_SENIORFEMALE: '노년',
			FACE_MIDDLEFEMALE: '중년',
			FACE_ADULTFEMALE: "청년",
			FACE_YOUNGFEMALE: "미성년"
		};

		itemsNotFormatted = jsonDailyCount;			

		// format the data
		itemsNotFormatted.forEach((item) => {
			itemsFormatted.push({
				FACE_SENIORMALE: item.FACE_SENIORMALE.replace(/,/g, ''), // remove commas to avoid errors,
				FACE_MIDDLEMALE: item.FACE_MIDDLEMALE,
				FACE_ADULTMALE: item.FACE_ADULTMALE,
				FACE_YOUNGMALE: item.FACE_YOUNGMALE,
				FACE_SENIORFEMALE: item.FACE_SENIORFEMALE,
				FACE_MIDDLEFEMALE: item.FACE_MIDDLEFEMALE,
				FACE_ADULTFEMALE: item.FACE_ADULTFEMALE,
				FACE_YOUNGFEMALE: item.FACE_YOUNGFEMALE,
			});
		});

		var fileTitle = '사람_' + getDateStr();
		exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
	}
		
	function OnCSV_Vehicle_Select(){
		var itemsFormatted = [];
		var itemsNotFormatted = [];
		var headers_top = {};
		var headers = {						
			VEHICLE_CAR: '자동차'.replace(/,/g, ''), // remove commas to avoid errors
			VEHICLE_BUS: '버스',
			VEHICLE_TRUCK: "트럭",
			VEHICLE_MOTORCYCLE: "오토바이",
			VEHICLE_BICYCLE: '자전거',				
		};

		itemsNotFormatted = jsonDailyCount;			

		// format the data
		itemsNotFormatted.forEach((item) => {
			itemsFormatted.push({
				VEHICLE_CAR: item.VEHICLE_CAR.replace(/,/g, ''), // remove commas to avoid errors,
				VEHICLE_BUS: item.VEHICLE_BUS,
				VEHICLE_TRUCK: item.VEHICLE_TRUCK,
				VEHICLE_MOTORCYCLE: item.VEHICLE_MOTORCYCLE,
				VEHICLE_BICYCLE: item.VEHICLE_BICYCLE,
				
			});
		});

		var fileTitle = '차량_' + getDateStr();
		exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
	}
	
	function OnCSV_Event_Acc_Select(){
		var itemsFormatted = [];
		var itemsNotFormatted = [];
		var headers_top = {};
		var headers = {						
			INV_CNT: '침입'.replace(/,/g, ''), // remove commas to avoid errors
			LOT_CNT: '배회',
			CNT_CNT: "카운팅",
			FAL_CNT: "쓰러짐",				
		};

		itemsNotFormatted = jsonDailyCount;			

		// format the data
		itemsNotFormatted.forEach((item) => {
			itemsFormatted.push({
				INV_CNT: item.INV_CNT.replace(/,/g, ''), // remove commas to avoid errors,
				LOT_CNT: item.LOT_CNT,
				CNT_CNT: item.CNT_CNT,
				FAL_CNT: item.FAL_CNT,
			});
		});

		var fileTitle = '이벤트발생_' + getDateStr();
		exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
	}

	function OnCSV_UnMask_Select(){
		var itemsFormatted = [];
		var itemsNotFormatted = [];
		var headers_top = {						
			FACE_NOMASKMALESENIOR: '남성'.replace(/,/g, ''), // remove commas to avoid errors
			FACE_NOMASKMALEMIDDLE: '',
			FACE_NOMASKMALEADULT: '',
			FACE_NOMASKMALEYOUNG: '',
			FACE_NOMASKFEMALESENIOR: '여성',
			FACE_NOMASKFEMALEMIDDLE: '',
			FACE_NOMASKFEMALEADULT: '',
			FACE_NOMASKFEMALEYOUNG: '',
		};
		var headers = {						
			FACE_NOMASKMALESENIOR: '노년'.replace(/,/g, ''), // remove commas to avoid errors
			FACE_NOMASKMALEMIDDLE: '중년',
			FACE_NOMASKMALEADULT: "청년",
			FACE_NOMASKMALEYOUNG: "미성년",
			FACE_NOMASKFEMALESENIOR: '노년',
			FACE_NOMASKFEMALEMIDDLE: '중년',
			FACE_NOMASKFEMALEADULT: "청년",
			FACE_NOMASKFEMALEYOUNG: "미성년"
		};

		itemsNotFormatted = jsonDailyCount;			

		// format the data
		itemsNotFormatted.forEach((item) => {
			itemsFormatted.push({
				FACE_NOMASKMALESENIOR: item.FACE_NOMASKMALESENIOR.replace(/,/g, ''), // remove commas to avoid errors,
				FACE_NOMASKMALEMIDDLE: item.FACE_NOMASKMALEMIDDLE,
				FACE_NOMASKMALEADULT: item.FACE_NOMASKMALEADULT,
				FACE_NOMASKMALEYOUNG: item.FACE_NOMASKMALEYOUNG,
				FACE_NOMASKFEMALESENIOR: item.FACE_NOMASKFEMALESENIOR,
				FACE_NOMASKFEMALEMIDDLE: item.FACE_NOMASKFEMALEMIDDLE,
				FACE_NOMASKFEMALEADULT: item.FACE_NOMASKFEMALEADULT,
				FACE_NOMASKFEMALEYOUNG: item.FACE_NOMASKFEMALEYOUNG,
			});
		});
		var fileTitle = '마스크미착용자_' + getDateStr();
		exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
	}
	
	function OnCSV_Time_Select(){
		var itemsFormatted = [];
		var itemsNotFormatted = [];
		var headers_top = {};
		var headers = {						
			OCCU_TIME: '시간'.replace(/,/g, ''), // remove commas to avoid errors
			PERSON: '사람',
			VEHICLE: '차량',
			FACE: '얼굴',
			LPR: '번호판',				
			INV_CNT: '침입',
			LOT_CNT: '배회',
			CNT_CNT: '카운팅',
			FAL_CNT: '쓰러짐'
		};

		itemsNotFormatted = jsonHourlyCount;			

		// format the data
		itemsNotFormatted.forEach((item) => {
			itemsFormatted.push({
				OCCU_TIME: item.OCCU_TIME, // remove commas to avoid errors,
				PERSON: item.PERSON,
				VEHICLE: item.VEHICLE,
				FACE: item.FACE,
				LPR: item.LPR,
				INV_CNT: item.INV_CNT,
				LOT_CNT: item.LOT_CNT,
				CNT_CNT: item.CNT_CNT,
				FAL_CNT: item.FAL_CNT,					
			});
		});

		var fileTitle = '시간대별현황_' + getDateStr();
		exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
	}

	function OnCSV_camera_10_human_Select(){	
		var itemsFormatted = [];
		var itemsNotFormatted = [];
		var headers_top = {};
		var headers = {						
			CAMERA_NAME: '카메라명'.replace(/,/g, ''), // remove commas to avoid errors
			PERSON: '사람',
			FACE: "얼굴",
			INV_CNT: "침입",				
			LOT_CNT: "배회",
			FAL_CNT: "쓰러짐",
			CNT_CNT: "카운팅",				
		};

		itemsNotFormatted = jsonTop10CtrlCamera;			

		// format the data
		itemsNotFormatted.forEach((item) => {
			itemsFormatted.push({
				CAMERA_NAME: item.CAMERA_NAME.replace(/,/g, ''), // remove commas to avoid errors,
				PERSON: item.PERSON,
				FACE: item.FACE,
				INV_CNT: item.INV_CNT,
				LOT_CNT: item.LOT_CNT,
				FAL_CNT: item.FAL_CNT,
				CNT_CNT: item.CNT_CNT,
			});
		});

		var fileTitle = '검지카메라_TOP10_사람' + getDateStr();
		exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
		
	}

	function OnCSV_camera_10_vehicle_Select(){
		var itemsFormatted = [];
		var itemsNotFormatted = [];
		var headers_top = {};
		var headers = {						
			CAMERA_NAME: '카메라명'.replace(/,/g, ''), // remove commas to avoid errors
			VEHICLE_CAR: '자동차',
			VEHICLE_BUS: "버스",
			VEHICLE_TRUCK: "트럭",				
			VEHICLE_MOTORCYCLE: "오토바이",
			VEHICLE_BICYCLE: "자전거",				
		};

		itemsNotFormatted = jsonTop10VehicleCamera;			

		// format the data
		itemsNotFormatted.forEach((item) => {
			itemsFormatted.push({
				CAMERA_NAME: item.CAMERA_NAME.replace(/,/g, ''), // remove commas to avoid errors,
				VEHICLE_CAR: item.VEHICLE_CAR,
				VEHICLE_BUS: item.VEHICLE_BUS,
				VEHICLE_TRUCK: item.VEHICLE_TRUCK,
				VEHICLE_MOTORCYCLE: item.VEHICLE_MOTORCYCLE,
				VEHICLE_BICYCLE: item.VEHICLE_BICYCLE,					
			});
		});

		var fileTitle = '검지카메라_TOP10_차량_' + getDateStr();
		exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
	}

	function OnCSV_Cancel(){			
		document.getElementById("csv_dialog").open = false;  
		document.getElementById('csv_dialog').style.display='none';     
	}
		

    
	</script>	



</body>
</html>
