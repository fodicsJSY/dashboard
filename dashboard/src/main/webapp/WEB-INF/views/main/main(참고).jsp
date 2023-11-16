<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Ai VinUS DASHBOARD</title>


	<%-- css --%>



	<%-- <link rel="stylesheet" href="css/style.css"> --%>
	<link rel="stylesheet" href="/resources/css/style.css">
	<%-- <link rel="stylesheet" href="css/object.css"> --%>
	<link rel="stylesheet" href="/resources/css/object.css">
	<%-- <link rel="stylesheet" href="css/popup.css"> --%>
	<link rel="stylesheet" href="/resources/css/popup.css">
	<%-- <link rel="stylesheet" href="css/style_scrollBar.css"/>   --%>
	<link rel="stylesheet" href="/resources/css/style_scrollBar.css"/>  
	
	<%-- <link rel="stylesheet" href="font/nanumsquare.css"> --%>
	<link rel="stylesheet" href="/resources/font/nanumsquare.css">

	<%-- <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" /> --%>
	<link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon" />
	
	<%-- <link rel="stylesheet" href="/css/style_grid.css"> --%>
	<link rel="stylesheet" href="/resources/css/style_grid.css">


	<%--
	<link rel="stylesheet" href="/resources/node_modules/tui-chart/dist/toastui-chart.css">
	<link rel="stylesheet" href="/resources/node_modules/tui-grid/dist/tui-grid.css" />
	<link rel="stylesheet" href="/resources/node_modules/tui-date-picker/dist/tui-date-picker.css">
	--%>
	
	<style>
		
		.tui-datepicker-input {margin-top: 1px; z-index: 998; }
		#tui-date-picker-target {color:#f5f5f5; background-color: #0c0c0c97; margin: -1px;  height: 28px; width: 170px;}
		#tui-date-picker-container {margin-left: -1px; filter: invert(92%);}

		.image-thumbnail-mask_man {   
			position: absolute;
			float: left;
			z-index: 1;
			padding-top : 135px;			
			margin-left : -237px;			
		}
		.image-thumbnail-mask_woman {   
			position: absolute;
			float: right;
			z-index: 1;
			padding-top : 135px;			
			margin-left : 185px;			
		}
		table {font-family: NanumSquareEB; font-size: 9pt !important;}
		td {padding-left: 10px !important; padding-right: 10px !important;}
	</style>




</head>

<body>
	<%-- 전체 wrap.S --%>
	<div class="wrap" id="indexWrap">  
		<div data-include-path="Setting.html" file="Setting"></div>
		
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
					<a href="/main"><button type="button" class="btn_object_on" onClick="OnClickCtrl();">M A I N</button></a>
					<%-- <button type="button" class="btn_evnet" onClick="OnClickEvent();">E V E N T</button> --%>
					<a href="/camera/mainCamera"><button type="button" class="btn_camera" onClick="OnClickDivide();">C A M E R A</button></a>
				</div>
				<%-- 좌측 네비.E --%>

				<%-- 실시간 채널.S --%>
				<div data-include-path="inc_side.html" file="inc_side"></div>
				<%-- 실시간 채널.E --%>
			</div>
			<%-- side 영역.E --%>


			<%-- 우측 메인.S --%>
			<div id="contentsWrap">
				<%-- 상단 날짜,버튼 영역.S --%>
				<div class="mainTop">
					<div class=" dateArea">


						<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
							<input type="text" id="tui-date-picker-target"
								aria-label="Date-Time">
							<span class="tui-ico-date"></span>
							<div id="tui-date-picker-container"></div>
						</div>

						<%-- 달력						
						<div id="tui-date-picker-container"></div>
						<a class="rollover" alt="달력" id="tui-date-picker-main">
							<img src="img/btn-calendar.png"> 
							<img src="img/btn-calendar_hover.png" class="over">
						</a>

						<p class="date" id='mainDate'>2021년 07월 21일</p>
						--%>
						<button type="button" class="btn-date" onclick="OnPrevDate();" href="#">◀<%-- <img src="img/btn-calendarLeft.png">--%></button>
						<button type="button" class="btn" onclick="OnTodayDate();" href="#">오늘</button>
						<button type="button" class="btn-date" onclick="OnNextDate();" href="#">▶<%-- <img src="img/btn-calendarRight.png">--%></button>
					</div>
					<div class="btnArea">						
						<%-- <a class="rollover" alt="csv파일" OnClick="OnCSV_Click()"><img src="img/btn-downCSV.png"> <img src="img/btn-downCSV_hover.png" class="over"></a> --%>
						<a class="rollover" alt="csv파일" OnClick="OnCSV_Click()"><img src="../../resources/img/btn-downCSV.png"> <img src="../../resources/img/btn-downCSV_hover.png" class="over"></a>
						<a class="rollover" alt="bmp파일" OnClick="OnBMP_Click()"><img src="../../resources/img/btn-downBMP.png"> <img src="../../resources/img/btn-downBMP_hover.png" class="over"></a>
						<a class="rollover" alt="csv파일" OnClick="OnPrint_Click()"><img src="../../resources/img/btn-downPrint.png"> <img src="../../resources/img/btn-downPrint_hover.png" class="over"></a>
					</div>
				</div>
				<%-- 상단 날짜,버튼 영역.E --%>

				<%-- 메인컨텐츠.S --%>
				<div class="contents">

					<%-- 섹션 좌측.S --%>
					<div class="sectionBox">
						<div class="innerBox divHuman" id="human_rect">
							<div class="contentsTitle">
								<div class="title">
									<h4>사람</h4>
									<p class="summary">일 누적 <span>12,812</span>명</p>
								</div>
								<div class="partBTN">
									<a class="changeGraph" onclick="OnHumanGraphChange()" ><img src="../../resources/img/btn_cangeDiagram.png"> <img src="../../resources/img/btn_cangeDiagram_hover.png" class="over"></a>									
								</div>
							</div>
							<div class="data" id="mainPerson" style="margin-top : 20px;" onclick="location.href='sub_object.html'">
							</div>
						</div>
						<%-- <div class="innerBox divCar" id="vehicle_rect" >
							<div class="contentsTitle">
								<div class="title">
									<h4>차량</h4>
									<p class="summary">일 누적 <span>12,812</span>개</p>
								</div>
								<div class="partBTN">
									<a class="changeGraph" onclick="OnCarGraphChange()"><img src="img/btn_cangeDiagram.png"> <img src="img/btn_cangeDiagram_hover.png" class="over"></a>									
								</div>
							</div>
							<div class="data" id="mainVehicle" style="margin-left : 20px; margin-top : 20px;" onclick="location.href='sub_object.html'">						
							</div>
						</div> --%>
						<div class="innerBox divAge" id="nomask_rect">
							<div class="contentsTitle">
								<div class="title">
									<h4>마스크 미착용자 성별/연령 비교</h4>
								</div>
							</div>
							<div class="data" id="mainFace1" style="margin-top: 20px; margin-left: 30px" onclick="location.href='sub_object.html'">							
							</div>
							<img class="image-thumbnail-mask_man" src = "../../resources/img/icon_male75px.png"></img>
							<div class="data" id="mainFace2" style="margin-top: 20px" onclick="location.href='sub_object.html'">							
							</div>
							<img class="image-thumbnail-mask_woman" src = "../../resources/img/icon_female75px.png"></img> 

						</div>						
					</div>
					<%-- 섹션 좌측.E --%>

					<%-- 섹션 우측.S --%>
					<div class="sectionBox">
						<%-- <div class="innerBox divEvent" id="event_acc_rect">
							<div class="contentsTitle">
								<div class="title">
									<h4>이벤트 발생 비율</h4>
								</div>
							</div>
							<div class="data" id="subEventRatio" style="margin-top: 20px;">								
							</div>
						</div>	 --%>	
						
						<div class="innerBox divTime" id="time_rect">
							<div class="contentsTitle">
								<div class="title">
									<h4>시간대별 현황</h4>
								</div>
							</div>
							<div class="data" id="mainHourly" style="margin-top : 20px">
								<%--  테이블 영역 샘플.s --%>							
							</div>
						</div>

						<div class="innerBox divTop10" id="top10_rect" style="margin-top: 15px;">
							<div class="contentsTitle">
								<div class="title">
									<h4>최다검지 카메라 TOP10 CH</h4>
								</div>
								<div class="partBTN">
									<%-- <a class="changeGraph" onclick="setMainEventTop10()"; style="margin-top:3px;"><img id="changeEvent_btn" src="img/btn_human.png"><img id="changeEvent_btn" src="img/btn_human_on.png" class="over"></a> --%>
									<%-- <a class="changeGraph" onclick="setMainVehicleTop10()"; style="margin-top:3px;"><img id="changeVehicle_btn" src="img/btn_car.png"> <img src="img/btn_car_on.png" class="over"></a>									 --%>
								</div>
							</div>
							<div class="data" id="subTop10Cameras" style="margin: 10px"></div>						
							<div class="data" id="subTop10CamerasCar" style="margin: 10px"></div>
						</div>
					</div>	
					<%-- 섹션 우측.E --%>
				</div>

				<%-- 로딩 --%>
				<div id="loading"><img id="loading-image" src="../../resources/img/loading_animated.png" alt="Loading..." /></div>

				<%-- 메인컨텐츠.E --%>
				<div id="bottom">
					<p class="Notice">※ 화면에 표시되는 모든 실시간 데이터는 1분마다 자동으로 업데이트 합니다. 다만 “시간대별 현황” 그래프의 실시간 데이터는 정시에 한 번씩 업데이트 합니다.</p>
					<div class="madeFodics">포딕스시스템</div>
				</div>
				<%-- CSV 대화상자 --%>
				<dialog open id="csv_dialog" style = "display:none; background-color: rgba(30,30,30,1); color:rgba(192,192,192,1); width: 336px; padding: 0px; top:30px; left:900px;">		
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
				<%-- BMP 대화상자 --%>
				<dialog open id="bmp_dialog" style = "display:none; background-color: rgba(30,30,30,1); color:rgba(192,192,192,1); width: 336px; padding: 0px; top:30px; left:1070px;">		
					<div style = "font-size: 14px; width: 330px; background-color: rgba(45,45,45,1); color:rgba(255,255,255,1); padding: 16px; ">
						<p>.bmp 파일로 내려받기를 원하시는 항목을 선택</p>						
						<p style = "margin-top: 6px">하여 체크한 후 [확인] 버튼을 누르세요.</p>
					</div>
					<div style = "width: 330px;  border: 1px solid gray;"></div>
					<div style = "margin : 15px;"><input name="round" id="chk_bmp_human" type="checkbox">  사람</div>
					<div style = "margin : 15px;"><input name="round" id="chk_bmp_vehicle" type="checkbox">  차량</div>
					<div style = "margin : 15px;"><input name="round" id="chk_bmp_event_acc" type="checkbox">  이벤트 발생 비율</div>
					<div style = "margin : 15px;"><input name="round" id="chk_bmp_unmask_sex" type="checkbox">  마스크 미착용자 성별/연령 비교</div>
					<div style = "margin : 15px;"><input name="round" id="chk_bmp_time_chk" type="checkbox">  시간대별 객체 현황</div>
					<div style = "margin : 15px;"><input name="10ch" onclick="chkHumanVehicleClick(this)" id="chk_bmp_camera_10ch_human" type="checkbox">  검지 카메라 TOP 10ch - 사람</div>
					<div style = "margin : 15px;"><input name="10ch" onclick="chkHumanVehicleClick(this)" id="chk_bmp_camera_10ch_vehicle" type="checkbox">  검지 카메라 TOP 10ch - 차량</div>
					<div style = "margin : 10px; float: right;">
						<a class="rollover" alt="확인" OnClick="OnBMP_OK()"><img  src="../../resources/img/btn_popConfirm.png"> <img src="../../resources/img/btn_popConfirm_hover.png" class="over "></a>
						<a class="rollover" alt="취소" OnClick="OnBMP_Cancel()"><img src="../../resources/img/btn_popCancel.png"> <img src="../../resources/img/btn_popCancel_hover.png" class="over "></a>
					</div>
				</dialog>
<%-- 출력 대화상자 --%>
				<dialog open id="print_dialog" style = "display:none; background-color: rgba(30,30,30,1); color:rgba(192,192,192,1); width: 566px; padding: 0px; top:30px; left:1040px;">		
					<div style = "font-size: 14px; width: 560px; background-color: rgba(45,45,45,1); color:rgba(255,255,255,1); padding: 16px; ">
						<p>보고서 인쇄를 원하시는 항목을 선택하여</p>						
						<p style = "margin-top: 6px"> 체크 한 후 [확인] 버튼을 누르세요.</p>
					</div>
					<div style = "width: 560px;  border: 1px solid gray;"></div>
					<div id='check_rect' style="float:left">
						
						<div style = "margin : 15px;"><input name="round" onclick="chkPrintClick(this)" id="chk_print_human" type="checkbox">  사람</div>
						<div style = "margin : 15px;"><input name="round" onclick="chkPrintClick(this)" id="chk_print_vehicle" type="checkbox">  차량</div>
						<div style = "margin : 15px;"><input name="round" onclick="chkPrintClick(this)" id="chk_print_event_acc" type="checkbox">  이벤트 발생 비율</div>
						<div style = "margin : 15px;"><input name="round" onclick="chkPrintClick(this)" id="chk_print_unmask_sex" type="checkbox">  마스크 미착용자 성별/연령 비교</div>
						<div style = "margin : 15px;"><input name="round" onclick="chkPrintClick(this)" id="chk_print_time_chk" type="checkbox">  시간대별 객체 현황</div>
						<div style = "margin : 15px;"><input name="round" onclick="chkPrintClick(this)" id="chk_print_camera_10ch_human" type="checkbox">  검지 카메라 TOP 10ch - 사람</div>
						<div style = "margin : 15px;"><input name="round" onclick="chkPrintClick(this)" id="chk_print_camera_10ch_vehicle" type="checkbox">  검지 카메라 TOP 10ch - 차량</div>						
					</div>					
					<div id='display_option_rect'>
						<div style = "margin-top : 15px;">&emsp;&emsp;&emsp;관리 번호<input type="text" id="manage_num" style = "margin-left : 40px;"></div>
						<div style = "margin-top : 15px;">&emsp;&emsp;&emsp;관할 기관<input type="text" id="manage_agency" style = "margin-left : 40px;"></div>
						<div style = "margin-top : 15px;">&emsp;&emsp;&emsp;관리 부서<input type="text" id="manage_department" style = "margin-left : 40px;"></div>
						<div style = "margin-top : 15px;">&emsp;&emsp;&emsp;보고서 제목<input type="text" id="report_title" style = "margin-left : 28px;"></div>
						<div style = "margin-top : 15px;">&emsp;&emsp;&emsp;보고자 이름<input type="text" id="report_name" style = "margin-left : 28px;"></div>
						<div style = "margin-top : 15px;">&emsp;&emsp;&emsp;목적 및 요지<input type="text" id="report_purpose" style = "margin-left : 25px;"></div>
						<%-- <div style = "margin : 15px;">&emsp;&emsp;&emsp;결재란 유/무<input type="checkbox" name="type" onclick="chkPaymentClick(this)" id="report_payment_block" style = "margin-left : 25px;">  유<input type="checkbox"  name="type" onclick="chkPaymentClick(this)" id="report_payment_none" style = "margin-left : 25px;">  무</div> --%>
						<div style = "margin-top : 15px; ">&emsp;&emsp;&emsp;결재란 유/무<input type="file" id="input_file_yes" style = "width: 180px; margin-left : 25px;"></div>
						
					</div>
					<div style = "margin : 10px; float: right;">
						<a class="rollover" alt="확인" OnClick="OnPRINT_OK()"><img  src="/resources/img/btn_popConfirm.png"> <img src="../../resources/img/btn_popConfirm_hover.png" class="over "></a>
						<a class="rollover" alt="취소" OnClick="OnPRINT_Cancel()"><img src="/resources/img/btn_popCancel.png"> <img src="../../resources/img/btn_popCancel_hover.png" class="over "></a>
					</div>
				</dialog>
			</div>
			<%-- 우측 메인.E --%>

		</div>
		<%--  내용.E --%>
	</div>
	<%-- 전체 wrap.E --%>



	<%-- js --%>
	<script src="/resources/js/commonFunctions.js"></script>
	<script src="/resources/js/tabcontent.js"></script>
	<script src="/resources/js/popupSetting.js"></script>
	<script src="/resources/js/inc_side.js"></script>
	<script src="/resources/js/CsvMakeFile.js"></script>

	<%-- echarts --%>
	<script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
	
	
	<%--jquery--%>
	<script src="/resources/node_modules/jquery/3.6.0/jquery.min.js"></script>
	
	<%--toastui --%>
	<script src="/resources/node_modules/tui-chart/dist/toastui-chart.js"></script>
	<script src="/resources/node_modules/tui-grid/dist/tui-grid.js"></script>      	
	<script src="/resources/node_modules/tui-date-picker/dist/tui-date-picker.js"></script>
	
	<%-- node_modules --%>
	<%--
	<script src = "/resources/node_modules/tui-etc/FileSaver/FileSaver.js"></script>	
	<script src = "/resources/node_modules/tui-etc/html2canvas/html2canvas.min.js"></script>
	<script src=  "/resources/node_modules/tui-etc/Fabric/fabric.min.js"></script>
	--%>

	<%--<script type="text/javascript" src="dashboard_config.json"></script> --%>

  	<script>
		var move_day = 0;

		var dailyCountFileName = "/data/dailyCount.json";
		var dailyCountByEveryHourFileName = "/data/dailyCountByEveryHour.json";
		var dailyCountByCameraFileName = "/data/dailyCountByCamera.json";		
		
		var jsonDailyCount = null;
		var jsonHourlyCount = null;		
		var jsonTop10CtrlCamera = [];
		var jsonTop10VehicleCamera = [];

		// 이벤트

		// 사람(얼굴)
		var maleYoung = 0, femaleYoung = 0;
		var maleAdult = 0, femaleAdult = 0;
		var maleMiddle = 0, femaleMiddle = 0;
		var maleSenior = 0, femaleSenior = 0;

		// 차량
		var vehicleCar = 0, vehicleBus = 0, vehicleTruck = 0, vehicleMotorcycle = 0, vehicleBicycle = 0;

		// 마스크 미착용자
		var noMaskMaleYoung = 0, noMaskFemaleYoung = 0;
		var noMaskMaleAdult = 0, noMaskFemaleAdult = 0;
		var noMaskMaleMiddle = 0, noMaskFemaleMiddle = 0;
		var noMaskMaleSenior = 0, noMaskFemaleSenior = 0;

		// 시간대별
		var hourlyPerson = [], hourlyVehicle = [], hourlyFace = [], hourlyLPR = [];
		var hourlyIntrusion = [], hourlyLoitering = [], hourlyCounting = [], hourlyFalldown = [];

		// 최다검지 카메라
		var cameraTop10 = [];
		
		// 날짜
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var day = today.getDate();

		var image_display;

		sessionStorage.setItem('isToday', true);
		sessionStorage.setItem('isIncSide', false);

		window.onload = function() {
			var checkAccount = sessionStorage.getItem('checkAccount');

			if( !checkAccount )
			{
				const mainUrl = new URL(location.href);
				const mainUrlParams = mainUrl.searchParams;
				var checkId = mainUrlParams.get('id');
				var checkPw = mainUrlParams.get('pw');

				console.log(checkId);
				console.log(checkPw);

				if( checkId == '' || checkId == null || checkPw == '' || checkPw == null )
				{
					console.log('NullExceptionError : Id or password is null');
					return;
				}

				sessionStorage.setItem('checkAccount', true);
			}

			$('#loading').hide();

			// 대화상자 숨김처리  
			document.getElementById("csv_dialog").open = false;
			document.getElementById("bmp_dialog").open = false;  
			document.getElementById("print_dialog").open = false;  
			
			// 페이지 로드시 데이터 읽기
			jsonHandler();

			// 1분에 한번씩 데이터 읽기
			setInterval(jsonHandler, 60 * 1000);	

			gridInit();
			showPersonChart();
			//showVehicleChart();
			showFaceChart1();
			showFaceChart2();
			showHourlyChart();
			//showEventRatio();				
			setMainEventTop10();

			// 날짜 및 캘린더
			/*
			var mainDate = document.getElementById('mainDate');
			mainDate.innerText = year + '년 ' + month + '월 ' + day + '일';

			const DatePicker = tui.DatePicker;
			const container = document.getElementById('tui-date-picker-container');
			const target = document.getElementById('tui-date-picker-main');
			const instance = new DatePicker(container, {
				language: 'ko',
				date: today,
				input: {
					element: target,
					format: 'yyyy년 MM월 dd일',
				},
			});			
			*/
			
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

			datePicker1.on('change', () => {
				console.log(`Selected date: ${datePicker1.getDate()}`);
				OnSelectDate(datePicker1.getDate());
			});
			
			var allElements = document.getElementsByTagName('*');
          	Array.prototype.forEach.call(allElements, function(el) {
              	var includePath = el.dataset.includePath;
              	if (includePath) {
                  	var xhttp = new XMLHttpRequest();
                  	xhttp.onreadystatechange = function () {
                      	if (this.readyState == 4 && this.status == 200) {
							var file = el.getAttribute('file');

							el.outerHTML = this.responseText;

							if( file == "inc_side" )
							{
								sessionStorage.setItem('isIncSide', true);

								//isIncSide 로드 후 진행
								//createLiveCameraGrid();
								// 배열로 넘기면 편할것같은데 일단...
								readTextFile("./data/dailyCount.json", saveDailyData);								

								//사용자 그룹 데이터 로드
								loadCameraGroupData();
							}

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
		};
				
		function jsonHandler() {
			//readTextFile("/data/dailyCountByEveryHour.json", saveHourlyData);
			//readTextFile("/data/dailyCountByCamera.json", saveCameraData);

			readTextFile(dailyCountFileName, saveDailyData);
			readTextFile(dailyCountByEveryHourFileName, saveHourlyData);
			readTextFile(dailyCountByCameraFileName, saveCameraData);
		}

		function gridInit(){
			tui.Grid.applyTheme('default', {
				area: {
					header: {
						border: '#2d2d2d'
					}
				},
				outline: {
					border: "#2d2d2d"
				},
				cell: {
					normal: {
						background: '#252525',
						border: '#2d2d2d',
						text: '#c5c5c5',
						showHorizontalBorder: true,
						showVerticalBorder: true
					},
					header: {
						background: '#1a1a1a',
						border: '#2d2d2d',
						text: '#c5c5c5',
						showHorizontalBorder: true,
						showVerticalBorder: true
					}
				},				
			});
		}
		
		
				
		function saveHourlyData(text)
		{
			jsonHourlyCount = JSON.parse(text); 			

			// 초기화
			hourlyPerson = [], hourlyVehicle = [], hourlyFace = [], hourlyLPR = [];
			hourlyIntrusion = [], hourlyLoitering = [], hourlyCounting = [], hourlyFalldown = [];

			for( var i=0; i<jsonHourlyCount.length; i++ )
			{
				var time = jsonHourlyCount[i].OCCU_TIME;
				//console.log(time);
				
				var year = parseInt(time.substring(0, 4));
				var month = parseInt(time.substring(4, 6));
				var day = parseInt(time.substring(6, 8));
				var hour = parseInt(time.substring(8, 10));

				var cntPerson = parseInt(jsonHourlyCount[i].PERSON);
				var cntVehicle = parseInt(jsonHourlyCount[i].VEHICLE);
				var cntFace = parseInt(jsonHourlyCount[i].FACE);
				var cntLPR = parseInt(jsonHourlyCount[i].LPR);
				var cntIntrusion = parseInt(jsonHourlyCount[i].INV_CNT);
				var cntLoitering = parseInt(jsonHourlyCount[i].LOT_CNT);
				var cntCounting = parseInt(jsonHourlyCount[i].CNT_CNT);
				var cntFalldown = parseInt(jsonHourlyCount[i].FAL_CNT);
			
				hourlyPerson.push({
					hour: hour,
					cnt : cntPerson
				});

				hourlyVehicle.push({
					hour: hour,
					cnt : cntVehicle
				});

				hourlyFace.push({
					hour: hour,
					cnt : cntFace
				});

				hourlyLPR.push({
					hour: hour,
					cnt : cntLPR
				});

				hourlyIntrusion.push({
					hour: hour,
					cnt : cntIntrusion
				});

				hourlyLoitering.push({
					hour: hour,
					cnt : cntLoitering
				});

				hourlyCounting.push({
					hour: hour,
					cnt : cntCounting
				});

				hourlyFalldown.push({
					hour: hour,
					cnt : cntFalldown
				});
			}

			// 정렬
			hourlyPerson = hourlyDataCheck(hourlyPerson);
			hourlyVehicle = hourlyDataCheck(hourlyVehicle);
			hourlyFace = hourlyDataCheck(hourlyFace);
			hourlyLPR = hourlyDataCheck(hourlyLPR);
			hourlyIntrusion = hourlyDataCheck(hourlyIntrusion);
			hourlyLoitering = hourlyDataCheck(hourlyLoitering);
			hourlyCounting = hourlyDataCheck(hourlyCounting);
			hourlyFalldown = hourlyDataCheck(hourlyFalldown);

			//console.log(hourlyPerson);

			// 차트에 넣기 쉽도록 value만 빼내기
			var arrPerson = new Array();
			var arrVehicle = new Array();
			var arrFace = new Array();
			var arrLPR = new Array();
			var arrIntrusion = new Array();
			var arrLoitering = new Array();
			var arrCounting = new Array();
			var arrFalldown = new Array();

			for( var i=0; i<24; i++ )
			{
				arrPerson.push(hourlyPerson[i].cnt);
				arrVehicle.push(hourlyVehicle[i].cnt);
				arrFace.push(hourlyFace[i].cnt);
				arrLPR.push(hourlyLPR[i].cnt);
				arrIntrusion.push(hourlyIntrusion[i].cnt);
				arrLoitering.push(hourlyLoitering[i].cnt);
				arrCounting.push(hourlyCounting[i].cnt);
				arrFalldown.push(hourlyFalldown[i].cnt);
			}

			//console.log(arrPerson);


			/*
			hourly_chart.setData({
				categories: [
					'0시', '1시', '2시', '3시', '4시', '5시', '6시', '7시', '8시', '9시',
					'10시', '11시', '12시', '13시', '14시', '15시', '16시', '17시', '18시', '19시',
					'20시', '21시', '22시', '23시'
				],
				series: [
					{
						name: '사람',
						data: arrPerson
					},
					// {
					// 	name: '차량',
					// 	data: arrVehicle
					// },
					{
						name: '얼굴',
						data: arrFace
					},
					// {
					// 	name: '번호판',
					// 	data: arrLPR
					// },
					// {
					// 	name: '침입',
					// 	data: arrIntrusion
					// },
					// {
					// 	name: '배회',
					// 	data: arrLoitering
					// },
					// {
					// 	name: '카운팅',
					// 	data: arrCounting
					// },
					// {
					// 	name: '쓰러짐',
					// 	data: arrFalldown
					// }
				]
			});
			//console.log(jsonHourlyCount);
		}

		*/

		/*
       	window.addEventListener('load', function() {
          	var allElements = document.getElementsByTagName('*');
          	Array.prototype.forEach.call(allElements, function(el) {
              	var includePath = el.dataset.includePath;
              	if (includePath) {
                  	var xhttp = new XMLHttpRequest();
                  	xhttp.onreadystatechange = function () {
                      	if (this.readyState == 4 && this.status == 200) {
							var file = el.getAttribute('file');

							if( file == "inc_side" )
								sessionStorage.setItem('isIncSide', true);

							el.outerHTML = this.responseText;

							var isIncSide = sessionStorage.getItem('isIncSide');
							if( isIncSide )
							{
								//isIncSide 로드 후 진행
								//createLiveCameraGrid();
								// 배열로 넘기면 편할것같은데 일단...
								readTextFile("./data/dailyCount.json", saveDailyData);								

								//사용자 그룹 데이터 로드
								loadCameraGroupData();
							}
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
		*/

	  	const chart = toastui.Chart;
		var human_chart;
		var vehicle_chart;
		var mask_chart1, mask_chart2;
		var hourly_chart;
		var event_ratio_chart;
		
		var human_radial_bar_chart;
		var car_pie_chart;
		var bCheckHuman = false;
		var bCheckCar = false;

		function showPersonChart() {			

			var el = document.getElementById('mainPerson');
			var data = {
				categories: ['노년', '중장년', '청년', '미성년'],
				series: [
					{
						name: '남자',
						data: [maleSenior, maleMiddle, maleAdult, maleYoung],
					},
					{
						name: '여자',
						data: [femaleSenior, femaleMiddle, femaleAdult, femaleYoung],
					},
				],
			};

			var options = {
				chart: { 
					title: '', 
					width: 800, // 49.5% 변경
					height: 370 
				},
				legend: {
					align: 'bottom',
					showCheckbox: false,
				},
				theme: {
					chart : {
						backgroundColor:'rgba(30,30,30,1)',  // 그래프 배경색 
					},
					xAxis: {                    
						title: {
							fontFamily: 'vedana',
							fontSize: 14,             
							color: 'darkgray'
						},
						label: {
							fontFamily: 'vedana',
							fontSize: 14,             
							color: 'darkgray'
						},
						width: 1,
						color: 'gray'
					},
					yAxis: {                     
						title: {
							fontFamily: 'vedana',
							fontSize: 14,              
							color: 'darkgray'
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
							fontSize: 14,
							color: 'white'
						}
					},
					plot: {                   // 그래프 내부 라인처리
						vertical: {
							lineColor: 'rgba(45, 45, 45, 1)',
							lineWidth: 1,           
						},
						horizontal: {
							lineColor: 'rgba(45, 45, 45, 1)',
							lineWidth: 1, 
						},        
					},
					series: {
						colors: ['rgba(15,159,175,1)', 'rgba(232,83,76,1)'],
						barWidth: 25,
					},
				},
				exportMenu: {
					visible: false,
				}, 	
				series: {
					stack: true, 
				},
			};

			human_chart = chart.barChart({ el, data, options });
		}
		
		function showVehicleChart() {	
			var el = document.getElementById('mainVehicle');
			var data = {
				series :[
					{
						name: '자동차',
						data: vehicleCar,
					},
					{
						name: '버스',
						data: vehicleBus,
					},
					{
						name: '트럭',
						data: vehicleTruck,
					},
					{
						name: '오토바이',
						data: vehicleMotorcycle,
					},
					{
						name: '자전거',
						data: vehicleBicycle,
					}
				],
			};

			var options = {
				chart: {
					title: '', 
					width: 490, // 49.5% 변경
					height: 365 
				},
				exportMenu: {
					visible: false,
				},
				legend: {
					align: 'bottom',
					showCheckbox: false,
				},
				series: {
					vertical: true,
					eventDetectType: 'point'
				},
				theme: {
					chart : {
						backgroundColor:'rgba(30,30,30,1)',
					},
					series : {
						colors: ['#F0785F', '#566DF5', '#A5F53C', '#49F5AA', '#F5CA40'],
						barWidth: 100,
					},
					xAxis: {                    
						title: {
							fontFamily: 'vedana',
							fontSize: 14,             
							color: 'darkgray'
						},
						label: {
							fontFamily: 'vedana',
							fontSize: 14,             
							color: 'darkgray'
						},
						width: 1,
						color: 'gray'
					},
					yAxis: {                     
						title: {
							fontFamily: 'vedana',
							fontSize: 14,              
							color: 'darkgray'
						},
						label: {
							fontFamily: 'vedana',
							fontSize: 14,
							color: 'darkgray'
						},
						width: 1,
						color: 'gray'
					},
					legend: {                  
						label: {
							fontFamily: 'vedana',
							fontSize: 14,
							color: 'white'
						}
					},
					plot: {                   
						vertical: {
							lineColor: 'rgba(45, 45, 45, 1)',
							lineWidth: 1,           
						},
						horizontal: {
							lineColor: 'rgba(45, 45, 45, 1)',
							lineWidth: 1, 
						},        
					},
				},
			};

			vehicle_chart = chart.bulletChart({ el, data, options }); 
		}

		function showFaceChart1() {

			var el = document.getElementById('mainFace1');
			var data = {
				categories: ['남자', '여자'],
				series: [
					{
						name: '미성년',
						data: 1233 ,
					},
					{
						name: '청년',
						data: 2332 ,
					},
					{
						name: '중장년',
						data: 2421 ,
					},
					{
						name: '노년',
						data: 1232 ,
					}
				]
			};
			var options = {
				chart: {
					title: '', 
					width: 380, // 49.5% 변경
					height: 380,
					format: '1,000'
				},
				exportMenu: {
					visible: false,
				},
				legend: {
					align: 'bottom',
					showCheckbox: false,
				},
				series: {
					radiusRange: {
						inner: '40%',
						outer: '100%',
					},
					selectable : true,
					dataLabels: {               // 데이터 출력 라벨
						visible: true,
						pieSeriesName: { 
							visible: false 
						},
						formatter : (value) => value, // 표출방식
					},
				},
				theme: {
					chart: {
						fontFamily: 'vedana',   
						backgroundColor:'rgba(30,30,30,1)', 
						fontSize: 9,
					}, 
					legend: {                  
						label: {
							fontFamily: 'vedana',
							fontSize: 14,
							color: 'white'
						}
					},
					series : {
						lineWidth: 2,
						strokeStyle: 'rgba(40, 40, 40, 1)',
						colors: ['#D3F1F9', '#3FD5E3', '#00A0DE', '#0174CF'],
						dataLabels: {
							fontFamily: 'vedana',
							fontSize: 11,
						},
						lineWidth: 2,
      					strokeStyle: 'rgba(40,40,40,1)',
					},					
				},
				tooltip: {						// 출력 툴팁이 옆에 그래프와 겹치면 툴팁이 잘린다. 이점 처리
					offsetX: -50,
					offsetY: 0,
				},
			};

			mask_chart1 = chart.pieChart({ el, data, options }); 
		}

		function showFaceChart2() {
			var el = document.getElementById('mainFace2');
			var data = {
				categories: ['남자', '여자'],
				series: [
					{
						name: '미성년',
						data: 234,
					},
					{
						name: '청년',
						data: 34,
					},
					{
						name: '중장년',
						data: 345,
					},
					{
						name: '노년',
						data: 34,
					}
				]
			};
			var options = {
				chart: {
					title: '', 
					width: 380, // 49.5% 변경
					height: 380 
				},
				exportMenu: {
					visible: false,
				},
				legend: {
					align: 'bottom',
					showCheckbox: false,
				},
				series: {
					radiusRange: {
						inner: '40%',
						outer: '100%',
					},
					selectable : true,
					dataLabels: {               // 데이터 출력 라벨
						visible: true,
						pieSeriesName: { 
							visible: false 
						},
						formatter : (name) => name, // 표출방식
					},
				},
				theme: {
					chart: {
						fontFamily: 'vedana',   
						backgroundColor:'rgba(30,30,30,1)', 
						fontSize: 9,
					}, 
					legend: {                  
						label: {
							fontFamily: 'vedana',
							fontSize: 14,
							color: 'white'
						}
					},
					series : {
						lineWidth: 2,
						strokeStyle: 'rgba(40, 40, 40, 1)',
						colors: ['#D3F1F9', '#3FD5E3', '#00A0DE', '#0174CF'],
						dataLabels: {
							fontFamily: 'vedana',
							fontSize: 11,
						},
						lineWidth: 2,
      					strokeStyle: 'rgba(40,40,40,1)',
					},
				},
				tooltip: {						// 출력 툴팁이 옆에 그래프와 겹치면 툴팁이 잘린다. 이점 처리
					offsetX: -100,
					offsetY: 0,
				},
			};

			mask_chart2 = chart.pieChart({ el, data, options }); 
		}





		let myChart = echarts.init(document.getElementById('mainHourly'), 
		null, {
		renderer: 'canvas',
		useDirtyRect: false
		});
		var app = {};
		
		var option;

		option = {
			title: {
				text: 'showHourlyChart'
			},
			tooltip: {
				trigger: 'axis'
			},
			legend: {
				data: ['사람', '차량', '얼굴', '번호판', '침입', '배회', '카운팅', '쓰러짐']
			},
			grid: {
				left: '3%',
				right: '4%',
				bottom: '3%',
				containLabel: true
			},
			toolbox: {
				feature: {
				saveAsImage: {}
				}
			},
			// x좌표
			xAxis: {
				type: '시간',
				boundaryGap: false,
				data: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
								'10', '11', '12', '13', '14', '15', '16', '17', '18', '19',
								'20', '21', '22', '23']
			},

			//y좌표
			yAxis: {
				type: 'value'
			},


			series: [
				{
				name: '사람',
				type: 'line',
				stack: 'Total',
				data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
				},
				// {
				//   name: '차량',
				//   type: 'line',
				//   stack: 'Total',
				//   data: [1, 32, 32, 21, 43, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
				// },
				{
					name: '얼굴',
					type: 'line',
					stack: 'Total',
					data: [5, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
				},
				// {
				//   name: '번호판',
				//   type: 'line',
				//   stack: 'Total',
				//   data: [10, 7, 32, 21, 42, 42, 63, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
				// },
				// {
				//   name: '침입',
				//   type: 'line',
				//   stack: 'Total',
				//   data: [10, 32, 32, 21, 42, 42, 3, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
				// }
				// {
				//   name: '배회',
				//   type: 'line',
				//   stack: 'Total',
				//   data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
				// }
				// {
				//   name: '카운팅',
				//   type: 'line',
				//   stack: 'Total',
				//   data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 23, 113, 232, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
				// }
				// {
				//   name: '쓰러짐',
				//   type: 'line',
				//   stack: 'Total',
				//   data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 343, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
				// }
			]
		};

		 if (option && typeof option === 'object') {
		 myChart.setOption(option);
		 }

    	 //window.addEventListener('resize', myChart.resize);



		/*
		function showHourlyChart() {
			var el = document.getElementById('mainHourly');
			var data = {
				categories: [
					'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'10', '11', '12', '13', '14', '15', '16', '17', '18', '19',
					'20', '21', '22', '23'
				],
				series: [
					{
						name: '사람',
						data: [ 10, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42 ],
					},
					// {
					// 	name: '차량',
					// 	data: [ 1, 32, 32, 21, 43, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42 ],
					// },
					{
						name: '얼굴',
						data: [ 5, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42 ],
					},
					// {
					// 	name: '번호판',
					// 	data: [ 10, 7, 32, 21, 42, 42, 63, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42 ],
					// },
					// {
					// 	name: '침입',
					// 	data: [ 10, 32, 32, 21, 42, 42, 3, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42 ],
					// },
					// {
					// 	name: '배회',
					// 	data: [ 10, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42 ],
					// },
					// {
					// 	name: '카운팅',
					// 	data: [ 10, 32, 32, 21, 42, 42, 43, 34, 24, 23, 113, 232, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42 ],
					// },
					// {
					// 	name: '쓰러짐',
					// 	data: [ 10, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 343, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42 ],
					// },
				],
			};

			var options = {
				chart: {
					title: '', 
					width: 800, //510.  49.5% 변경
					height: 355  // 390
				},
				exportMenu: {
					visible: false,
				},
				legend: {
					align: 'bottom',
					
					item:{
						width: 80,								
					}	
				},
				xAxis: {
					label: {                
						interval: 2     
					},      
				},
				series: {
            		showDot: true,
            	},
				theme: {
					chart: {
						fontFamily: 'vedana',   
						backgroundColor:'rgba(30,30,30,1)', 
					}, 
					xAxis: {                    
						title: {
							fontFamily: 'vedana',
							fontSize: 14,             
							color: 'darkgray'
						},
						label: {
							fontFamily: 'vedana',
							fontSize: 14,             
							color: 'darkgray'
						},
						width: 1,
						color: 'gray'
					},
					yAxis: {                     
						title: {
							fontFamily: 'vedana',
							fontSize: 14,              
							color: 'darkgray'
						},
						label: {
							fontFamily: 'vedana',
							fontSize: 14,
							color: 'darkgray'
						},
						width: 1,
						color: 'gray'
					},
					legend: {                  
						label: {
							fontFamily: 'vedana',
							fontSize: 14,
							color: 'white',							
						},											
					},
					series : {
						//colors: ['#94e9ec', '#d4e079', '#b4a1d8', '#81d19c', '#43e4bb', '#ff9595', '#ffcc45', '#f5b9d3'],
						colors: ['#94e9ec', '#b4a1d8'],
						lineWidth: 1,
					},
					plot: {                   
						vertical: {
							lineColor: 'rgba(45, 45, 45, 1)',
							lineWidth: 1,           
						},
						horizontal: {
							lineColor: 'rgba(45, 45, 45, 1)',
							lineWidth: 1, 
						},        
					},
				},
			};

			hourly_chart = chart.lineChart({ el, data, options });
		}
		*/

		function showEventRatio()
		{
			var el = document.getElementById('subEventRatio');
			var data = {
				categories: [''],
				series: [
					{
						name: '칩입',
						data: 1634,
					},
					{
						name: '배회',
						data: 2047,
					},
					{
						name: '카운팅',
						data: 1771,
					},
					{
						name: '쓰러짐',
						data: 545,
					}
				]
			};

			var options = {
				chart: {
					title: '', 
					width: 490, // 49.5% 변경
					height: 370 
				},
				exportMenu: {
					visible: false
				},
				series: {
					dataLabels: {               // 데이터 출력 라벨
						visible: true,
						pieSeriesName: { 
							visible: false 
						}
					},
					selectable: true            // SELECT = TRUE를 지정해야만 정상적으로 Select 처리가 된다. 
				},
				legend: {
					align: 'bottom',          // legend 출력 위치
					showCheckbox: false,					
				},
				theme: {
					chart: {
						fontFamily: 'vedana',   
						backgroundColor:'rgba(30,30,30,1)', 
					}, 
					legend: {                   // Legend 폰트 관련          
						label: {            
							fontFamily: 'vedana',
							fontSize: 14,
							color: 'white'
						}
					},  
					series : {
						colors: ['rgba(65,118,223,1)', 'rgba(254,192,112,1)', 'rgba(255,121,120,1)', 'rgba(82,195,247,1)'],       //  색상 지정 <색상을 해당 theme series>에서만 변경 가능
						lineWidth: 2,
      					strokeStyle: 'rgba(40,40,40,1)',					},
				}
			};

			event_ratio_chart = chart.pieChart({ el, data, options }); 
		}

		function showCarPieChart() {
			const el = document.getElementById('mainVehicle');
			const data = {
				categories:['차량'],
				series :[
					{
						name: '자동차',
						data: 1120,
					},
					{
						name: '버스',
						data: 2147,
					},
					{
						name: '트럭',
						data: 4145,
					},
					{
						name: '오토바이',
						data: 3116,
					},
					{
						name: '자전거',
						data: 1711,
					}
				],
			};
			const options = {
				chart: {
					title: '', 
					width: 450, // 49.5% 변경
					height: 380 
				},
				exportMenu: {
					visible: false,
				},
				legend: {
					align: 'bottom',
					showCheckbox: false,
				},
				series: {
					radiusRange: {
						inner: '40%',
						outer: '100%',
					},
					selectable : true,
					dataLabels: {               // 데이터 출력 라벨
						visible: true,
						pieSeriesName: { 
							visible: false 
						},
						formatter : (name) => name, // 표출방식
					},
				},
				theme: {
					chart: {
						fontFamily: 'vedana',   
						backgroundColor:'rgba(30,30,30,1)', 
						fontSize: 9,
					}, 
					legend: {                  
						label: {
							fontFamily: 'vedana',
							fontSize: 14,
							color: 'white'
						}
					},
					series : {
						colors: ['#F0785F', '#566DF5', '#A5F53C', '#49F5AA', '#F5CA40'],
						dataLabels: {
							fontFamily: 'vedana',
							fontSize: 11,
						},
						lineWidth: 2,
      					strokeStyle: 'rgba(40,40,40,1)',
					},
				},
				tooltip: {						// 출력 툴팁이 옆에 그래프와 겹치면 툴팁이 잘린다. 이점 처리
					offsetX: -100,
					offsetY: 0,
				},
			};

			car_pie_chart = chart.pieChart({ el, data, options }); 
		}
		
		function LoadRadialBarChart() {
			const el = document.getElementById('mainPerson');
			const data = {
				categories: ['남자', '여자'],
				series: [
					{
						name: '미성년',
						data: [105, 92]
					},
					{
						name: '청년',
						data: [125, 110]
					},
					{
						name: '중장년',
						data: [200, 150]
					},
					{
						name: '노년',
						data: [80, 70]
					},
				],
			};
			const options = {
				chart: {
					title: '',
					width: 400,        // 출력 그래프 크기 Width   size.width
					height: 380,      // 출력 그래프 크기 Height size.height
				},
				exportMenu: {
					visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
				},
				legend: {
					align: 'bottom',          // legend 출력 위치
					showCheckbox: false,
				},
				series: {
					radiusRange: {
						inner: 30,
						outer: 140,
					},
					selectable: true,
				},
				theme: {
					chart: {
						backgroundColor: 'rgba(30,30,30,1)',  // 그래프 배경색   
					},
					legend: {                  // Legend 폰트 관련
						label: {
							fontFamily: 'vedana',
							fontSize: 12,
							color: 'white'
						},
					},
					series: {
						colors: ['#D3F1F9', '#3FD5E3', '#00A0DE', '#0174CF'],
						lineWidth: 2,
      					strokeStyle: 'rgba(40,40,40,1)',
					},

					circularAxis: {
						label: {
							fontSize: 0,
						},
					},
					verticalAxis: {        // 세로로 내려오는 값 (Y Axis)
						label: {
							fontFamily: 'vedana',
							fontSize: 12,
							color: 'white',
						},
					},

				},
			};
			human_radial_bar_chart = chart.radialBarChart({ el, data, options });
		}

		function OnHumanGraphChange(){

			if (bCheckHuman == false){
				human_chart.destroy();
				LoadRadialBarChart();
				bCheckHuman = true;
			}else{
				human_radial_bar_chart.destroy();
				showPersonChart();
				bCheckHuman = false;
			}
		}

		function OnCarGraphChange(){
			if (bCheckCar == false){
				vehicle_chart.destroy();
				showCarPieChart();
				bCheckCar = true;
			}else{
				car_pie_chart.destroy();
				showVehicleChart();
				bCheckCar = false;
			}
		}


		function hourlyArraySort(a, b) {
			return a.hour - b.hour;
		}

		function hourlyDataCheck(array) {
			array.sort(hourlyArraySort);

			// 시각이 25개 이상 들어올 일은 없다고 판단
			// 24개보다 모자르면 데이터가 비어있음
			if( array.length < 24 )
			{
				// 24시간
				for( var i=0; i<24; i++ )
				{
					var isExistData = false;
					for( var j=0; j<array.length; j++ )
					{
						if( array[j].hour == i )
						{
							isExistData = true;	
							break;
						}
					}

					if( !isExistData )
					{
						array.push({
							hour: i,
							cnt: 0
						});
					}
				}

				// 재정렬
				array.sort(hourlyArraySort);
			}

			return array;
		}
		// CSV 대화상자 
		function OnCSV_Click(){			
			document.getElementById("csv_dialog").open = true;  
			document.getElementById('csv_dialog').style.display='block';			
			document.getElementById("bmp_dialog").open = false;  
			document.getElementById('bmp_dialog').style.display='none';			
			document.getElementById("print_dialog").open = false;  
			document.getElementById('print_dialog').style.display='none';
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
		


		// CSV 대화상자 
		function OnBMP_Click(){			
			document.getElementById("csv_dialog").open = false;  
			document.getElementById('csv_dialog').style.display='none';	
			document.getElementById("bmp_dialog").open = true;  
			document.getElementById('bmp_dialog').style.display='block';	
			document.getElementById("print_dialog").open = false;  
			document.getElementById('print_dialog').style.display='none';	
        }

		

		function saveAsFile(uri, filename) {
			var link = document.createElement('a');
			if (typeof link.download === 'string') {
				link.href = uri;
				link.download = filename;
				document.body.appendChild(link);
				link.click();
				document.body.removeChild(link);
			} else {
				window.open(uri);
			}
		}

		function OnBMP_Output_Select(id, fileTitle)
		{
			html2canvas($(id)[0]).then(function(canvas) {				
				saveAsFile(canvas.toDataURL(), fileTitle);
			});
		}

		function OnBMP_OK(){
			var fileTitle; 
			document.getElementById("bmp_dialog").open = false; 
			document.getElementById('bmp_dialog').style.display='none';	
			var chk_val = document.getElementById("chk_bmp_human").checked; 
			if(chk_val == true){
				fileTitle= '사람_이미지_' + getDateStr() + '.png';
				OnBMP_Output_Select('#human_rect', fileTitle);
			}

			chk_val = document.getElementById("chk_bmp_vehicle").checked; 
			if(chk_val == true) {
				fileTitle= '차량_이미지_' + getDateStr() + '.png';
				OnBMP_Output_Select('#vehicle_rect', fileTitle);
			}
			
			chk_val = document.getElementById("chk_bmp_event_acc").checked; 
			if(chk_val == true) {
				fileTitle= '이벤트발생_이미지_' + getDateStr() + '.png';
				OnBMP_Output_Select('#event_acc_rect', fileTitle);
			}

			chk_val = document.getElementById("chk_bmp_unmask_sex").checked; 
			if(chk_val == true) {
				fileTitle= '마스크미착용자_이미지_' + getDateStr() + '.png';
				OnBMP_Output_Select('#nomask_rect', fileTitle);
			}

			chk_val = document.getElementById("chk_bmp_time_chk").checked; 
			if(chk_val == true) {
				fileTitle= '시간대별_이미지_' + getDateStr() + '.png';
				OnBMP_Output_Select('#time_rect', fileTitle);
			}

			chk_val = document.getElementById("chk_bmp_camera_10ch_human").checked; 
			if(chk_val == true){
				setMainEventTop10();				
				fileTitle= '카메라_사람_이미지_' + getDateStr() + '.png';
				setTimeout(() => OnBMP_Output_Select('#top10_rect', fileTitle), 1500);
			}
			
			chk_val = document.getElementById("chk_bmp_camera_10ch_vehicle").checked; 
			if(chk_val == true){
				setMainVehicleTop10();				
				fileTitle= '카메라_차량_이미지_' + getDateStr() + '.png';
				setTimeout(() => OnBMP_Output_Select('#top10_rect', fileTitle), 1500);					
			}
		}

		function OnBMP_Cancel(){
			document.getElementById("bmp_dialog").open = false;    
			document.getElementById('bmp_dialog').style.display='none';   
		}
		
		function chkHumanVehicleClick(element){
		  	const checkboxes = document.getElementsByName("10ch");
		
			checkboxes.forEach((cb) => {
				cb.checked = false;
			})		
			element.checked = true;
		}	

		function OnPrint_Click(){
			document.getElementById("csv_dialog").open = false;  
			document.getElementById('csv_dialog').style.display='none';			
			document.getElementById("bmp_dialog").open = false;  
			document.getElementById('bmp_dialog').style.display='none';			
			document.getElementById("print_dialog").open = true;  
			document.getElementById('print_dialog').style.display='block';			
		}

		function OnBMP_Output_Select(id, fileTitle)
		{
			html2canvas($(id)[0]).then(function(canvas) {				
				saveAsFile(canvas.toDataURL(), fileTitle);
			});
		}

		function OnPRINT_OK(){
			var fileTitle = 'Graph_Temp.png';
			document.getElementById("print_dialog").open = false; 
			document.getElementById('print_dialog').style.display='none';	
			var chk_val = document.getElementById("chk_print_human").checked; 
			if(chk_val == true){				
				OnPRT_Output_Select('#human_rect', fileTitle);				
			}

			chk_val = document.getElementById("chk_print_vehicle").checked; 
			if(chk_val == true) {
				OnPRT_Output_Select('#vehicle_rect', fileTitle);					
			}
			
			chk_val = document.getElementById("chk_print_event_acc").checked; 
			if(chk_val == true) {
				OnPRT_Output_Select('#event_acc_rect', fileTitle);				
			}

			chk_val = document.getElementById("chk_print_unmask_sex").checked; 
			if(chk_val == true) {
				OnPRT_Output_Select('#nomask_rect', fileTitle);				
			}

			chk_val = document.getElementById("chk_print_time_chk").checked; 
			if(chk_val == true) {
				OnPRT_Output_Select('#time_rect', fileTitle);				
			}

			chk_val = document.getElementById("chk_print_camera_10ch_human").checked; 
			if(chk_val == true){
				setMainEventTop10();				
				setTimeout(() => OnPRT_Output_Select('#top10_rect', fileTitle), 1500);
			}
			
			chk_val = document.getElementById("chk_print_camera_10ch_vehicle").checked; 
			if(chk_val == true){
				setMainVehicleTop10();				
				setTimeout(() => OnPRT_Output_Select('#top10_rect', fileTitle), 1500);					
			}	
			readFile();
		}
		
		function saveToFile_Chrome(fileName, content) {
			var blob = new Blob([content], { type: 'text/plain' });
			objURL = window.URL.createObjectURL(blob);
					
			// 이전에 생성된 메모리 해제
			if (window.__Xr_objURL_forCreatingFile__) {
				window.URL.revokeObjectURL(window.__Xr_objURL_forCreatingFile__);
			}
			window.__Xr_objURL_forCreatingFile__ = objURL;
			var a = document.createElement('a');
			a.download = fileName;
			a.href = objURL;
			a.click();
		}

		// 소스보기 버튼 클릭
		function readFile() {
			event.preventDefault(); //submit 할때 새로고침 되는것을 방지
			let fileObject = document.getElementById("input_file_yes");
			let fileName = fileObject.files[0];

			let fr = new FileReader();
			fr.readAsText(fileName, "utf-8");

			fr.onload = () => {
				parseText(fr.result);
			}
		}

		function parseText(text) {
			
			// 여기서 파일 데이터 가공
			//
			var manage_num = document.getElementById("manage_num").value;
			var manage_agency = document.getElementById("manage_agency").value;
			var manage_department = document.getElementById("manage_department").value;
			var report_title = document.getElementById("report_title").value;
			var report_name = document.getElementById("report_name").value;
			var report_purpose = document.getElementById("report_purpose").value;
						
			var replaced_str = text.replace('manage_number', manage_num);
			replaced_str = replaced_str.replace('manage_agency', manage_agency);
			replaced_str = replaced_str.replace('manage_department', manage_department);
			replaced_str = replaced_str.replace('report_title', report_title);
			replaced_str = replaced_str.replace('report_name', report_name);
			replaced_str = replaced_str.replace('report_purpose', report_purpose);
			console.log(replaced_str);
			
			var temp_path = "보고서양식.html";
			saveToFile_Chrome(temp_path, replaced_str);			
		}

		function OnPRT_Output_Select(id, fileTitle)
		{	
			console.log( window.location + fileTitle);									
			html2canvas($(id)[0]).then(function(canvas) {				
				saveAs(canvas.toDataURL(), fileTitle);
			});			
		}
		
		function chkPrintClick(element){
		  	const checkboxes = document.getElementsByName("round");
		
			checkboxes.forEach((cb) => {
				cb.checked = false;
			})		
			element.checked = true;
		}	

		function chkPaymentClick(element){
		  	const checkboxes = document.getElementsByName("type");
		
			checkboxes.forEach((cb) => {
				cb.checked = false;
			})		
			element.checked = true;
		}	

		function OnPRINT_Cancel(){
			document.getElementById("print_dialog").open = false;   
			document.getElementById('print_dialog').style.display='none';			    
		}

		

		function OnPrevDate()
		{
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

			dailyCountFileName = "./data/dailyCount.json";
			dailyCountByEveryHourFileName = "./data/dailyCountByEveryHour.json";
			dailyCountByCameraFileName = "./data/dailyCountByCamera.json";		
	
			jsonHandler();
		}

		function OnNextDate()
		{	
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
						if( startfullDate == today_str)
						{
							sessionStorage.setItem('isToday', true);
							dailyCountFileName = "/data/dailyCount.json";
							dailyCountByEveryHourFileName = "/data/dailyCountByEveryHour.json";
							dailyCountByCameraFileName = "/data/dailyCountByCamera.json";	
						}
						else
						{
							sessionStorage.setItem('isToday', false);
							dailyCountFileName = "/data/dailyCountBack.json";
							dailyCountByEveryHourFileName = "/data/dailyCountByEveryHourBack.json";
							dailyCountByCameraFileName = "/data/dailyCountByCameraBack.json";
						}

						jsonHandler();
					}
				}				
			}	
			xhttp.open('GET', param, true);
			xhttp.send();	
		}
	   </script>
</body>
</html>
