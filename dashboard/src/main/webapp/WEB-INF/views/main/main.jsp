<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ai VinUS DASHBOARD</title>


    <%-- toust UI 시작 --%>
    <%--
		<link rel="stylesheet" href="/resources/node_modules/tui-chart/dist/toastui-chart.css">
		<script src="/resources/node_modules/tui-chart/dist/toastui-chart.js"></script>
		<link rel="stylesheet" href="/resources/node_modules/tui-grid/dist/tui-grid.css" />
		<script src="/resources/node_modules/tui-grid/dist/tui-grid.js"></script>      	
		<link rel="stylesheet" href="/resources/node_modules/tui-date-picker/dist/tui-date-picker.css">
		<script src="/resources/node_modules/tui-date-picker/dist/tui-date-picker.js"></script>
	--%>
    <%-- toust UI 끝 --%>

    <%--jquery--%>
    <script src="/resources/node_modules/jquery/3.6.0/jquery.min.js"></script>
    <script>
		var toDay = new Date();
		console.log(toDay);

		// 년, 월, 일을 가져옵니다.
		var year = toDay.getFullYear();
		var month = String(toDay.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 두 자리로 만듭니다.
		var day = String(toDay.getDate()).padStart(2, '0'); // 일도 두 자리로 만듭니다.


		var occuDate = year + month + day;
		console.log(occuDate);

		/* 전역변수 보내기 시작 */
		function sendToServer() {
			// 형식을 YYYYMMDD로 변경
			occuDate = formatToYYYYMMDD(forDate);
			console.log('Sending occuDate to server:', occuDate); // 콘솔에 occuDate 값 로그 출력
        // 서버로 데이터 전송
        $.ajax({
            url: '/main',
            type: 'GET',
            data: { occuDate: occuDate },
            success: function(response) {
                console.log('Data sent successfully to server!');
            },
            error: function(error) {
                console.error('Error sending data to server:', error);
            }
        });
    

		

		/* 날짜 형식화 함수 */
		/* YYYYMMDD 형식으로 변환하는 함수 */
		function formatToYYYYMMDD(dateString) {
			var year = dateString.substring(0, 4);
			var month = dateString.substring(5, 7);
			var day = dateString.substring(8, 10);
			return year + month + day;
		}
		}

		/* 전역변수 보내기 끝 */
	</script>
	


    <%-- css --%>

    <link rel="stylesheet" href="/resources/css/main/main.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/object.css">
    <link rel="stylesheet" href="/resources/css/popup.css">
    <link rel="stylesheet" href="/resources/css/style_scrollBar.css"> 
    <link rel="stylesheet" href="/resources/font/nanumsquare.css">
    <link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/style_grid.css">

    <%-- bootstrap --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    
	<%-- fontawesome --%>
	<script src="https://kit.fontawesome.com/e75afc7597.js" crossorigin="anonymous"></script>

	<style>

	/* 그리드로 차트 위치 변경 시작 */
		.contents{
			display: grid;
			grid-template-columns: 1fr 1fr;
			grid-gap: 10px;
		}


		.innerBox:nth-child(1){
			order:4;
		}

		.innerBox:nth-child(2){
			order:2;
		}

		.innerBox:nth-child(3){
			order:3;
		}

		.innerBox:nth-child(4){
			order:1;
		}
	/* 그리드로 차트 위치 변경 끝 */

	</style>
</head>
<body>

	<c:set var="summaryList" value="${DC_summaryList}"/>
	<c:set var="dailyCount" value="${dailyCount}"/>
	<c:set var="DailyCount_summary" value="${DailyCount_summary}"/>

	<c:set var="vehicleDailyCount_CNT_changeList" value="${map.vehicleDailyCount_CNT_changeList}"/>
	<c:set var="DC_summaryChangeList" value="${DC_summaryChangeList}"/>



    <%-- 전체 wrap.S --%>
	<div class="wrap" id="indexWrap">  
		<div file="Setting">
    </div>
		
		<%-- 헤더.S --%>
		<header id="header"> 
			<jsp:include page="/WEB-INF/views/common/dropdown.jsp"/>
			<jsp:include page="/WEB-INF/views/common/inc_header.jsp"/>
		</header>
		<%-- 헤더.E --%>
    
		<%-- 내용.S --%>		
		<div class="container">

		<%-- side 영역.S --%>
			<div id="side">
        
        <%-- 좌측 네비.S --%>
				<div class="btn-navi" >
					<a href="/main"><button type="button" class="btn_object_on">M A I N</button></a>
					<%-- <a href="/main"><button type="button" class="btn_evnet">E V E N T</button></a> --%>
					<a href="/mainCamera"><button type="button" class="btn_camera">C A M E R A</button></a>
				</div>
				<%-- 좌측 네비.E --%>
        
				<%-- 실시간 채널.S --%>
				<div file="inc_side">
					<jsp:include page="/WEB-INF/views/main/inc_side.jsp"/>
				</div>
				<%-- 실시간 채널.E --%>
			</div>
			<%-- side 영역.E --%>


			<%-- 우측 메인.S --%>
			<div id="contentsWrap">
				<%-- 상단 날짜,버튼 영역.S --%>
				<form action="/main" method="get" >
				<div class="mainTop">
					<div class=" dateArea" style="display: flex; flex-direction: row; align-items: center;">


						<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
							<input type="date" id="tui-date-picker-target" aria-label="Date-Time">
							<span class="tui-ico-date"></span>
							<div id="tui-date-picker-container"></div>
						</div>

						<div>
							<button type="button" class="btn-date" id="minusBtn" ><i class="fa-solid fa-caret-left fa-xl" style="color: #ffffff;"></i></button>
							<button type="button" class="btn" id="todayBtn" >오늘</button>
							<button type="button" class="btn-date" id="plusBtn"><i class="fa-solid fa-caret-right fa-xl" style="color: #ffffff;"></i></button>
						</div>
					</div>
					<div class="btnArea">						
						<%-- <a class="rollover" alt="csv파일" OnClick="OnCSV_Click()"><img src="img/btn-downCSV.png"> <img src="img/btn-downCSV_hover.png" class="over"></a> --%>
						<a class="rollover" alt="csv파일" OnClick="OnCSV_Click()"><img src="../../resources/img/btn-downCSV.png"> <img src="../../resources/img/btn-downCSV_hover.png" class="over"></a>
						<a class="rollover" alt="bmp파일" OnClick="OnBMP_Click()"><img src="../../resources/img/btn-downBMP.png"> <img src="../../resources/img/btn-downBMP_hover.png" class="over"></a>
						<a class="rollover" alt="csv파일" OnClick="OnPrint_Click()"><img src="../../resources/img/btn-downPrint.png"> <img src="../../resources/img/btn-downPrint_hover.png" class="over"></a>
					</div>
				</div>
				</form>
				<%-- 상단 날짜,버튼 영역.E --%>

				<%-- 메인컨텐츠.S --%>
				<div class="contents">

					<%-- 섹션 좌측.S --%>
					<%--<div class="sectionBox">--%>
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
						<a href="/sub_object">
							<div class="data" id="mainPerson" style="width: 830px; height: 350px; margin-top : 5px;">
								<div id="mainPerson_chart" style="width: 100%; height: 100%;">
									<%-- 사람 막대그래프 영역 --%>
								</div>
							</div>
						</a>
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
				<%--</div>--%>
					<div class="innerBox divAge" id="nomask_rect">
						<div class="contentsTitle">
							<div class="title">
								<h4>마스크 미착용자 성별/연령 비교</h4>
							</div>
						</div>
						<section class="chart">
							<div class="data" id="mainFace1" style="margin-top: 7px; margin-left: 30px">
								<div class="manChart">
									<a href="/sub_object">
										<div id="mainFace1_chart" style="width: 400px; height: 400px">
											<%-- 남성 마스크 미착용자 도넛그래프 영역 --%>
										</div>
									</a>					
									<img class="image-thumbnail-mask_man" id="manImg" src ="/resources/img/icon_male75px.png">
								</div>
							</div>
							<div class="data" id="mainFace2" style="margin-top: 7px" >		
								<div class="womanChart">					
									<a href="/sub_object">
										<div id="mainFace2_chart" style="width: 400px; height: 400px">
											<%-- 여성 마스크 미착용자 도넛그래프 영역 --%>
												
										</div>
									</a>				
									<img class="image-thumbnail-mask_woman" id="womanImg" src ="/resources/img/icon_female75px.png">
								</div>
							</div>
						</section>
					</div>						
					<%-- 섹션 좌측.E --%>

					<%-- 섹션 우측.S --%>
					<%--<div class="sectionBox">--%>
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
                            <%--
                            <div>
                                <canvas id="myChart"></canvas>
                            </div>
                            --%>
                            <div class="data"  id="mainHourly" style="margin-top: 0px;">
                                <%--  테이블 영역 샘플.s --%>							
                                <div id="main" style="width: 800px; height: 400px"></div>
                            </div>
						</div>

						<div class="innerBox divTop10" id="top10_rect" >
							<div class="contentsTitle">
								<div class="title">
									<h4>최다검지 카메라 TOP10 CH</h4>
								</div>
								<div class="partBTN">
									<a class="changeGraph" id="humanBtn" onclick="setMainEventTop10()"; style="margin-top:3px;"><img id="changeEvent_btn" src="/resources/img/btn_human.png"><img id="changeEvent_btn" src="/resources/img/btn_human_on.png" class="over"></a> 
									<a class="changeGraph" id="vehicleBtn" onclick="setMainVehicleTop10()"; style="margin-top:3px;"><img id="changeVehicle_btn" src="/resources/img/btn_car.png"> <img src="/resources/img/btn_car_on.png" class="over"></a>									
								</div>
							</div>
							<div class="data" id="subTop10Cameras" style="">
								<table class="cameraTable">
									<thead>
										<tr>
											<th scope="col">카메라명</th>
											<th scope="col">사람</th>
											<th scope="col">얼굴</th>
											<th scope="col">침입</th>
											<th scope="col">배회</th>
											<th scope="col">쓰러짐</th>
											<th scope="col">카운팅</th>
										</tr>
									</thead>
									<tbody class="table-group-divider" id="humanTable">
										<c:forEach items="${dailyCount_CNT}" var="dailyCount_CNT">
											<tr>
												<th scope="row" class="loadName">${dailyCount_CNT.cameraName}</th>
												<td>${dailyCount_CNT.personCount}</td>
												<td>${dailyCount_CNT.faceCount}</td>
												<td>${dailyCount_CNT.invCntCount}</td>
												<td>${dailyCount_CNT.lotCntCount}</td>
												<td>${dailyCount_CNT.cntCntCount}</td>
												<td>${dailyCount_CNT.falCntCont}</td>
											</tr>
										</c:forEach>
										
									</tbody>
								</table>
							</div>		
							<div class="data" id="subTop10CamerasCar" style=" display: none;">
								<table class="cameraTable">
									<thead>
										<tr>
											<th scope="col">카메라명</th>
											<th scope="col">자동차</th>
											<th scope="col">버스</th>
											<th scope="col">트럭</th>
											<th scope="col">오토바이</th>
											<th scope="col">자전거</th>
										</tr>
									</thead>
									<tbody class="table-group-divider">
										<c:forEach items="${vehicleDailyCount_CNT}" var="vehicleDailyCount_CNT">
											<tr>
												<th scope="row" class="loadName">${vehicleDailyCount_CNT.carCount}</th>
												<td>${vehicleDailyCount_CNT.busCount}</td>
												<td>${vehicleDailyCount_CNT.faceCount}</td>
												<td>${vehicleDailyCount_CNT.truckCount}</td>
												<td>${vehicleDailyCount_CNT.motocycleCount}</td>
												<td>${vehicleDailyCount_CNT.bicycleCount}</td>
											</tr>
										</c:forEach>
										
									</tbody>
								</table>
							</div>
						</div>
					<%--</div>	--%>
					<%-- 섹션 우측.E --%>
				</div>

				<%-- 로딩 --%>
				<div id="loading"><img id="loading-image" src="../../resources/img/loading_animated.png" alt="Loading..." /></div>

				<%-- 메인컨텐츠.E --%>
				<div id="bottom">
					<p class="Notice">※ 화면에 표시되는 모든 실시간 데이터는 1분마다 자동으로 업데이트 합니다. 다만 “시간대별 현황” 그래프의 실시간 데이터는 정시에 한 번씩 업데이트 합니다.</p>
					<div class="madeFodics" style="margin: 0 40px 0 0;">포딕스시스템</div>
				</div>
				${dailyCount_CNT}
				${vehicleDailyCount_CNT_changeList}
				${DC_summaryChangeList}

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

    <%-- echarts --%>
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
    


   
    <script src="../../../resources/js/main/loading.js"></script>
    <script src="../../../resources/js/main/mainDateChange.js"></script>


    <script>

		/*
      // 어제
      function OnPrevDate(){
        move_day = move_day - 1;				
        var yesterday = new Date();
        yesterday.setDate(yesterday.getDate() + move_day);

        // 날짜 양식 - 화면 출력
        var year = yesterday.getFullYear();
        var month = yesterday.getMonth() + 1;
        var day = yesterday.getDate();	  			
          datePicker1.setDate(yesterday); 			
		  }


      // 오늘
      function OnTodayDate(){	
        move_day = 0;		
        calendarPickerToday();

        dailyCountFileName = "./data/dailyCount.json";
        dailyCountByEveryHourFileName = "./data/dailyCountByEveryHour.json";
        dailyCountByCameraFileName = "./data/dailyCountByCamera.json";		
    
        jsonHandler();
      }

      // 내일
      function OnNextDate(){	
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

	  */

      /* CSV 대화상자 시작 */
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

		/* CSV 대화상자 끝 */

		 


		





</script>

	

	<%-- 메인페이지 사람 막대차트 전역변수(페이지 로딩 시 오늘날짜) --%>

	<%-- 사람 막대차트 script --%>
	<script>
		/* 사람 막대차트 전역변수 */
		var youngMale = ${summaryList[0] != null ? summaryList[0].face_youngMale : 0};
		var youngFemale = ${summaryList[0] != null ? summaryList[0].face_youngFemale : 0};
		var adultMale = ${summaryList[0] != null ? summaryList[0].face_adultMale : 0};
		var adultFemale = ${summaryList[0] != null ? summaryList[0].face_adultFemale : 0};
		var middleMale = ${summaryList[0] != null ? summaryList[0].face_middleMale : 0};
		var middleFemale = ${summaryList[0] != null ? summaryList[0].face_middleFemale : 0};
		var seniorMale = ${summaryList[0] != null ? summaryList[0].face_seniorMale : 0};
		var seniorFemale = ${summaryList[0] != null ? summaryList[0].face_seniorFemale : 0};
	


		/* 사람 막대차트 */
		//  준비한 DOM 컨테이너에서 echarts 초기화하기
			var human_chart = echarts.init(document.getElementById('mainPerson_chart'))

		// 차트 옵션 작성하기
			option = {
				color: ["#006699", "#e5323e"],
				tooltip: {
					trigger: 'axis',
					axisPointer: {
				// Use axis to trigger tooltip
				type: 'shadow' // 'shadow' as default; can also be 'line' or 'shadow'
					}
				},
				legend: {
					bottom: 0,
					data: ['남자', '여자'],
					textStyle:{
					color: "#fff"
				},
				padding: [50, 0, 0, 0], // 범례 위 아래에 마진을 추가

				},
				grid: {
					left: '3%',
					right: '4%',
					bottom: '10%',
					containLabel: true
				},
				xAxis: {
					type: 'value',
				},
				yAxis: {
					type: 'category',
					data: ['노년', '중장년', '청년', '미성년']
				},
				series: [
					{
						name: '남자',
						type: 'bar',
						stack: 'total',
						label: {
							show: true
						},
						emphasis: {
							focus: 'series'
						},
						itemStyle: { color: '#0f9faf' },
						data: [seniorMale, middleMale, adultMale, youngMale]
					},
					{
						name: '여자',
						type: 'bar',
						stack: 'total',
						label: {
							show: true
						},
						emphasis: {
							focus: 'series'
						},
						itemStyle: { color: '#e8534c' },
						data: [seniorFemale, middleFemale, adultFemale, youngFemale]
					}
				
				]
			};

		//  차트 옵션 설정하기
		human_chart.setOption(option)
	</script>


	<%-- 전역변수 시작--%>
	<script>


		/* 시간대별 라인그래프 전역변수 초기화 시작*/
		var time1 = ${dailyCount[0] != null ? dailyCount[0].time : 0};
		var time2 = ${dailyCount[1] != null ? dailyCount[1].time : 0};
		var time3 = ${dailyCount[2] != null ? dailyCount[2].time : 0};
		var time4 = ${dailyCount[3] != null ? dailyCount[3].time : 0};
		var time5 = ${dailyCount[4] != null ? dailyCount[4].time : 0};
		var time6 = ${dailyCount[5] != null ? dailyCount[5].time : 0};
		var time7 = ${dailyCount[6] != null ? dailyCount[6].time : 0};
		var time8 = ${dailyCount[7] != null ? dailyCount[7].time : 0};
		var time9 = ${dailyCount[8] != null ? dailyCount[8].time : 0};
		var time10 = ${dailyCount[9] != null ? dailyCount[9].time : 0};
		var time11 = ${dailyCount[10] != null ? dailyCount[10].time : 0};
		var time12 = ${dailyCount[11] != null ? dailyCount[11].time : 0};
		var time13 = ${dailyCount[12] != null ? dailyCount[12].time : 0};
		var time14 = ${dailyCount[13] != null ? dailyCount[13].time : 0};
		var time15 = ${dailyCount[14] != null ? dailyCount[14].time : 0};
		var time16 = ${dailyCount[15] != null ? dailyCount[15].time : 0};
		var time17 = ${dailyCount[16] != null ? dailyCount[16].time : 0};
		var time18 = ${dailyCount[17] != null ? dailyCount[17].time : 0};
		var time19 = ${dailyCount[18] != null ? dailyCount[18].time : 0};
		var time20 = ${dailyCount[19] != null ? dailyCount[19].time : 0};
		var time21 = ${dailyCount[20] != null ? dailyCount[20].time : 0};
		var time22 = ${dailyCount[21] != null ? dailyCount[21].time : 0};
		var time23 = ${dailyCount[22] != null ? dailyCount[22].time : 0};
		var time24 = ${dailyCount[23] != null ? dailyCount[23].time : 0};



		var person1 = ${dailyCount[0] != null ? dailyCount[0].person : 0};
		var person2 = ${dailyCount[1] != null ? dailyCount[1].person : 0};
		var person3 = ${dailyCount[2] != null ? dailyCount[2].person : 0};
		var person4 = ${dailyCount[3] != null ? dailyCount[3].person : 0};
		var person5 = ${dailyCount[4] != null ? dailyCount[4].person : 0};
		var person6 = ${dailyCount[5] != null ? dailyCount[5].person : 0};
		var person7 = ${dailyCount[6] != null ? dailyCount[6].person : 0};
		var person8 = ${dailyCount[7] != null ? dailyCount[7].person : 0};
		var person9 = ${dailyCount[8] != null ? dailyCount[8].person : 0};
		var person10 = ${dailyCount[9] != null ? dailyCount[9].person : 0};
		var person11 = ${dailyCount[10] != null ? dailyCount[10].person : 0};
		var person12 = ${dailyCount[11] != null ? dailyCount[11].person : 0};
		var person13 = ${dailyCount[12] != null ? dailyCount[12].person : 0};
		var person14 = ${dailyCount[13] != null ? dailyCount[13].person : 0};
		var person15 = ${dailyCount[14] != null ? dailyCount[14].person : 0};
		var person16 = ${dailyCount[15] != null ? dailyCount[15].person : 0};
		var person17 = ${dailyCount[16] != null ? dailyCount[16].person : 0};
		var person18 = ${dailyCount[17] != null ? dailyCount[17].person : 0};
		var person19 = ${dailyCount[18] != null ? dailyCount[18].person : 0};
		var person20 = ${dailyCount[19] != null ? dailyCount[19].person : 0};
		var person21 = ${dailyCount[20] != null ? dailyCount[20].person : 0};
		var person22 = ${dailyCount[21] != null ? dailyCount[21].person : 0};
		var person23 = ${dailyCount[22] != null ? dailyCount[22].person : 0};
		var person24 = ${dailyCount[23] != null ? dailyCount[23].person : 0};


		var vehicle1 = ${dailyCount[0] != null ? dailyCount[0].vehicle : 0};
		var vehicle2 = ${dailyCount[1] != null ? dailyCount[1].vehicle : 0};
		var vehicle3 = ${dailyCount[2] != null ? dailyCount[2].vehicle : 0};
		var vehicle4 = ${dailyCount[3] != null ? dailyCount[3].vehicle : 0};
		var vehicle5 = ${dailyCount[4] != null ? dailyCount[4].vehicle : 0};
		var vehicle6 = ${dailyCount[5] != null ? dailyCount[5].vehicle : 0};
		var vehicle7 = ${dailyCount[6] != null ? dailyCount[6].vehicle : 0};
		var vehicle8 = ${dailyCount[7] != null ? dailyCount[7].vehicle : 0};
		var vehicle9 = ${dailyCount[8] != null ? dailyCount[8].vehicle : 0};
		var vehicle10 = ${dailyCount[9] != null ? dailyCount[9].vehicle : 0};
		var vehicle11 = ${dailyCount[10] != null ? dailyCount[10].vehicle : 0};
		var vehicle12 = ${dailyCount[11] != null ? dailyCount[11].vehicle : 0};
		var vehicle13 = ${dailyCount[12] != null ? dailyCount[12].vehicle : 0};
		var vehicle14 = ${dailyCount[13] != null ? dailyCount[13].vehicle : 0};
		var vehicle15 = ${dailyCount[14] != null ? dailyCount[14].vehicle : 0};
		var vehicle16 = ${dailyCount[15] != null ? dailyCount[15].vehicle : 0};
		var vehicle17 = ${dailyCount[16] != null ? dailyCount[16].vehicle : 0};
		var vehicle18 = ${dailyCount[17] != null ? dailyCount[17].vehicle : 0};
		var vehicle19 = ${dailyCount[18] != null ? dailyCount[18].vehicle : 0};
		var vehicle20 = ${dailyCount[19] != null ? dailyCount[19].vehicle : 0};
		var vehicle21 = ${dailyCount[20] != null ? dailyCount[20].vehicle : 0};
		var vehicle22 = ${dailyCount[21] != null ? dailyCount[21].vehicle : 0};
		var vehicle23 = ${dailyCount[22] != null ? dailyCount[22].vehicle : 0};
		var vehicle24 = ${dailyCount[23] != null ? dailyCount[23].vehicle : 0};


		var face1 = ${dailyCount[0] != null ? dailyCount[0].face : 0};
		var face2 = ${dailyCount[1] != null ? dailyCount[1].face : 0};
		var face3 = ${dailyCount[2] != null ? dailyCount[2].face : 0};
		var face4 = ${dailyCount[3] != null ? dailyCount[3].face : 0};
		var face5 = ${dailyCount[4] != null ? dailyCount[4].face : 0};
		var face6 = ${dailyCount[5] != null ? dailyCount[5].face : 0};
		var face7 = ${dailyCount[6] != null ? dailyCount[6].face : 0};
		var face8 = ${dailyCount[7] != null ? dailyCount[7].face : 0};
		var face9 = ${dailyCount[8] != null ? dailyCount[8].face : 0};
		var face10 = ${dailyCount[9] != null ? dailyCount[9].face : 0};
		var face11 = ${dailyCount[10] != null ? dailyCount[10].face : 0};
		var face12 = ${dailyCount[11] != null ? dailyCount[11].face : 0};
		var face13 = ${dailyCount[12] != null ? dailyCount[12].face : 0};
		var face14 = ${dailyCount[13] != null ? dailyCount[13].face : 0};
		var face15 = ${dailyCount[14] != null ? dailyCount[14].face : 0};
		var face16 = ${dailyCount[15] != null ? dailyCount[15].face : 0};
		var face17 = ${dailyCount[16] != null ? dailyCount[16].face : 0};
		var face18 = ${dailyCount[17] != null ? dailyCount[17].face : 0};
		var face19 = ${dailyCount[18] != null ? dailyCount[18].face : 0};
		var face20 = ${dailyCount[19] != null ? dailyCount[19].face : 0};
		var face21 = ${dailyCount[20] != null ? dailyCount[20].face : 0};
		var face22 = ${dailyCount[21] != null ? dailyCount[21].face : 0};
		var face23 = ${dailyCount[22] != null ? dailyCount[22].face : 0};
		var face24 = ${dailyCount[23] != null ? dailyCount[23].face : 0};


		var lpr1 = ${dailyCount[0] != null ? dailyCount[0].lpr : 0};
		var lpr2 = ${dailyCount[1] != null ? dailyCount[1].lpr : 0};
		var lpr3 = ${dailyCount[2] != null ? dailyCount[2].lpr : 0};
		var lpr4 = ${dailyCount[3] != null ? dailyCount[3].lpr : 0};
		var lpr5 = ${dailyCount[4] != null ? dailyCount[4].lpr : 0};
		var lpr6 = ${dailyCount[5] != null ? dailyCount[5].lpr : 0};
		var lpr7 = ${dailyCount[6] != null ? dailyCount[6].lpr : 0};
		var lpr8 = ${dailyCount[7] != null ? dailyCount[7].lpr : 0};
		var lpr9 = ${dailyCount[8] != null ? dailyCount[8].lpr : 0};
		var lpr10 = ${dailyCount[9] != null ? dailyCount[9].lpr : 0};
		var lpr11 = ${dailyCount[10] != null ? dailyCount[10].lpr : 0};
		var lpr12 = ${dailyCount[11] != null ? dailyCount[11].lpr : 0};
		var lpr13 = ${dailyCount[12] != null ? dailyCount[12].lpr : 0};
		var lpr14 = ${dailyCount[13] != null ? dailyCount[13].lpr : 0};
		var lpr15 = ${dailyCount[14] != null ? dailyCount[14].lpr : 0};
		var lpr16 = ${dailyCount[15] != null ? dailyCount[15].lpr : 0};
		var lpr17 = ${dailyCount[16] != null ? dailyCount[16].lpr : 0};
		var lpr18 = ${dailyCount[17] != null ? dailyCount[17].lpr : 0};
		var lpr19 = ${dailyCount[18] != null ? dailyCount[18].lpr : 0};
		var lpr20 = ${dailyCount[19] != null ? dailyCount[19].lpr : 0};
		var lpr21 = ${dailyCount[20] != null ? dailyCount[20].lpr : 0};
		var lpr22 = ${dailyCount[21] != null ? dailyCount[21].lpr : 0};
		var lpr23 = ${dailyCount[22] != null ? dailyCount[22].lpr : 0};
		var lpr24 = ${dailyCount[23] != null ? dailyCount[3].lpr : 0};



		var invCnt1 = ${dailyCount[0] != null ? dailyCount[0].invCnt : 0};
		var invCnt2 = ${dailyCount[1] != null ? dailyCount[1].invCnt : 0};
		var invCnt3 = ${dailyCount[2] != null ? dailyCount[2].invCnt : 0};
		var invCnt4 = ${dailyCount[3] != null ? dailyCount[3].invCnt : 0};
		var invCnt5 = ${dailyCount[4] != null ? dailyCount[4].invCnt : 0};
		var invCnt6 = ${dailyCount[5] != null ? dailyCount[5].invCnt : 0};
		var invCnt7 = ${dailyCount[6] != null ? dailyCount[6].invCnt : 0};
		var invCnt8 = ${dailyCount[7] != null ? dailyCount[7].invCnt : 0};
		var invCnt9 = ${dailyCount[8] != null ? dailyCount[8].invCnt : 0};
		var invCnt10 = ${dailyCount[9] != null ? dailyCount[9].invCnt : 0};
		var invCnt11 = ${dailyCount[10] != null ? dailyCount[10].invCnt : 0};
		var invCnt12 = ${dailyCount[11] != null ? dailyCount[11].invCnt : 0};
		var invCnt13 = ${dailyCount[12] != null ? dailyCount[12].invCnt : 0};
		var invCnt14 = ${dailyCount[13] != null ? dailyCount[13].invCnt : 0};
		var invCnt15 = ${dailyCount[14] != null ? dailyCount[14].invCnt : 0};
		var invCnt16 = ${dailyCount[15] != null ? dailyCount[15].invCnt : 0};
		var invCnt17 = ${dailyCount[16] != null ? dailyCount[16].invCnt : 0};
		var invCnt18 = ${dailyCount[17] != null ? dailyCount[17].invCnt : 0};
		var invCnt19 = ${dailyCount[18] != null ? dailyCount[18].invCnt : 0};
		var invCnt20 = ${dailyCount[19] != null ? dailyCount[19].invCnt : 0};
		var invCnt21 = ${dailyCount[20] != null ? dailyCount[20].invCnt : 0};
		var invCnt22 = ${dailyCount[21] != null ? dailyCount[21].invCnt : 0};
		var invCnt23 = ${dailyCount[22] != null ? dailyCount[22].invCnt : 0};
		var invCnt24 = ${dailyCount[23] != null ? dailyCount[23].invCnt : 0};


		var lotCnt1 = ${dailyCount[0] != null ? dailyCount[0].lotCnt : 0};
		var lotCnt2 = ${dailyCount[1] != null ? dailyCount[1].lotCnt : 0};
		var lotCnt3 = ${dailyCount[2] != null ? dailyCount[2].lotCnt : 0};
		var lotCnt4 = ${dailyCount[3] != null ? dailyCount[3].lotCnt : 0};
		var lotCnt5 = ${dailyCount[4] != null ? dailyCount[4].lotCnt : 0};
		var lotCnt6 = ${dailyCount[5] != null ? dailyCount[5].lotCnt : 0};
		var lotCnt7 = ${dailyCount[6] != null ? dailyCount[6].lotCnt : 0};
		var lotCnt8 = ${dailyCount[7] != null ? dailyCount[7].lotCnt : 0};
		var lotCnt9 = ${dailyCount[8] != null ? dailyCount[8].lotCnt : 0};
		var lotCnt10 = ${dailyCount[9] != null ? dailyCount[9].lotCnt : 0};
		var lotCnt11 = ${dailyCount[10] != null ? dailyCount[10].lotCnt : 0};
		var lotCnt12 = ${dailyCount[11] != null ? dailyCount[11].lotCnt : 0};
		var lotCnt13 = ${dailyCount[12] != null ? dailyCount[12].lotCnt : 0};
		var lotCnt14 = ${dailyCount[13] != null ? dailyCount[13].lotCnt : 0};
		var lotCnt15 = ${dailyCount[14] != null ? dailyCount[14].lotCnt : 0};
		var lotCnt16 = ${dailyCount[15] != null ? dailyCount[15].lotCnt : 0};
		var lotCnt17 = ${dailyCount[16] != null ? dailyCount[16].lotCnt : 0};
		var lotCnt18 = ${dailyCount[17] != null ? dailyCount[17].lotCnt : 0};
		var lotCnt19 = ${dailyCount[18] != null ? dailyCount[18].lotCnt : 0};
		var lotCnt20 = ${dailyCount[19] != null ? dailyCount[19].lotCnt : 0};
		var lotCnt21 = ${dailyCount[20] != null ? dailyCount[20].lotCnt : 0};
		var lotCnt22 = ${dailyCount[21] != null ? dailyCount[21].lotCnt : 0};
		var lotCnt23 = ${dailyCount[22] != null ? dailyCount[22].lotCnt : 0};
		var lotCnt24 = ${dailyCount[23] != null ? dailyCount[23].lotCnt : 0};

		
		var cntCnt1 = ${dailyCount[0] != null ? dailyCount[0].cntCnt : 0};
		var cntCnt2 = ${dailyCount[1] != null ? dailyCount[1].cntCnt : 0};
		var cntCnt3 = ${dailyCount[2] != null ? dailyCount[2].cntCnt : 0};
		var cntCnt4 = ${dailyCount[3] != null ? dailyCount[3].cntCnt : 0};
		var cntCnt5 = ${dailyCount[4] != null ? dailyCount[4].cntCnt : 0};
		var cntCnt6 = ${dailyCount[5] != null ? dailyCount[5].cntCnt : 0};
		var cntCnt7 = ${dailyCount[6] != null ? dailyCount[6].cntCnt : 0};
		var cntCnt8 = ${dailyCount[7] != null ? dailyCount[7].cntCnt : 0};
		var cntCnt9 = ${dailyCount[8] != null ? dailyCount[8].cntCnt : 0};
		var cntCnt10 = ${dailyCount[9] != null ? dailyCount[9].cntCnt : 0};
		var cntCnt11 = ${dailyCount[10] != null ? dailyCount[10].cntCnt : 0};
		var cntCnt12 = ${dailyCount[11] != null ? dailyCount[11].cntCnt : 0};
		var cntCnt13 = ${dailyCount[12] != null ? dailyCount[12].cntCnt : 0};
		var cntCnt14 = ${dailyCount[13] != null ? dailyCount[13].cntCnt : 0};
		var cntCnt15 = ${dailyCount[14] != null ? dailyCount[14].cntCnt : 0};
		var cntCnt16 = ${dailyCount[15] != null ? dailyCount[15].cntCnt : 0};
		var cntCnt17 = ${dailyCount[16] != null ? dailyCount[16].cntCnt : 0};
		var cntCnt18 = ${dailyCount[17] != null ? dailyCount[17].cntCnt : 0};
		var cntCnt19 = ${dailyCount[18] != null ? dailyCount[18].cntCnt : 0};
		var cntCnt20 = ${dailyCount[19] != null ? dailyCount[19].cntCnt : 0};
		var cntCnt21 = ${dailyCount[20] != null ? dailyCount[20].cntCnt : 0};
		var cntCnt22 = ${dailyCount[21] != null ? dailyCount[21].cntCnt : 0};
		var cntCnt23 = ${dailyCount[22] != null ? dailyCount[22].cntCnt : 0};
		var cntCnt24 = ${dailyCount[23] != null ? dailyCount[23].cntCnt : 0};


		var fatCnt1 = ${dailyCount[0] != null ? dailyCount[0].fatCnt : 0};
		var fatCnt2 = ${dailyCount[1] != null ? dailyCount[1].fatCnt : 0};
		var fatCnt3 = ${dailyCount[2] != null ? dailyCount[2].fatCnt : 0};
		var fatCnt4 = ${dailyCount[3] != null ? dailyCount[3].fatCnt : 0};
		var fatCnt5 = ${dailyCount[4] != null ? dailyCount[4].fatCnt : 0};
		var fatCnt6 = ${dailyCount[5] != null ? dailyCount[5].fatCnt : 0};
		var fatCnt7 = ${dailyCount[6] != null ? dailyCount[6].fatCnt : 0};
		var fatCnt8 = ${dailyCount[7] != null ? dailyCount[7].fatCnt : 0};
		var fatCnt9 = ${dailyCount[8] != null ? dailyCount[8].fatCnt : 0};
		var fatCnt10 = ${dailyCount[9] != null ? dailyCount[9].fatCnt : 0};
		var fatCnt11 = ${dailyCount[10] != null ? dailyCount[10].fatCnt : 0};
		var fatCnt12 = ${dailyCount[11] != null ? dailyCount[11].fatCnt : 0};
		var fatCnt13 = ${dailyCount[12] != null ? dailyCount[12].fatCnt : 0};
		var fatCnt14 = ${dailyCount[13] != null ? dailyCount[13].fatCnt : 0};
		var fatCnt15 = ${dailyCount[14] != null ? dailyCount[14].fatCnt : 0};
		var fatCnt16 = ${dailyCount[15] != null ? dailyCount[15].fatCnt : 0};
		var fatCnt17 = ${dailyCount[16] != null ? dailyCount[16].fatCnt : 0};
		var fatCnt18 = ${dailyCount[17] != null ? dailyCount[17].fatCnt : 0};
		var fatCnt19 = ${dailyCount[18] != null ? dailyCount[18].fatCnt : 0};
		var fatCnt20 = ${dailyCount[19] != null ? dailyCount[19].fatCnt : 0};
		var fatCnt21 = ${dailyCount[20] != null ? dailyCount[20].fatCnt : 0};
		var fatCnt22 = ${dailyCount[21] != null ? dailyCount[21].fatCnt : 0};
		var fatCnt23 = ${dailyCount[22] != null ? dailyCount[22].fatCnt : 0};
		var fatCnt24 = ${dailyCount[23] != null ? dailyCount[23].fatCnt : 0};
		/* 시간대별 라인그래프 전역변수 초기화 끝*/
		
		
		/* 마스크 미착용자 성별/연령 비교 차트 전역변수 초기화 시작*/
		var noMaskMaleYoung = ${DailyCount_summary[0] != null ? DailyCount_summary[0].faceNoMaskMaleYoung : 0};
		var noMaskMaleAdlut = ${DailyCount_summary[1] != null ? DailyCount_summary[1].faceNoMaskMaleAdlut : 0};
		var noMaskMaleMiddle = ${DailyCount_summary[2] != null ? DailyCount_summary[2].faceNoMaskMaleMiddle : 0};
		var noMaskMaleSenior = ${DailyCount_summary[3] != null ? DailyCount_summary[3].faceNoMaskMaleSenior : 0};


		var noMaskFemaleYoung = ${DailyCount_summary[4] != null ? DailyCount_summary[4].faceNoMaskFemaleYoung : 0};
		var noMaskFemaleAdult = ${DailyCount_summary[5] != null ? DailyCount_summary[5].faceNoMaskFemaleAdult : 0};
		var noMaskFemaleMiddle = ${DailyCount_summary[6] != null ? DailyCount_summary[6].faceNoMaskFemaleMiddle : 0};
		var noMaskFemaleSenior = ${DailyCount_summary[7] != null ? DailyCount_summary[7].faceNoMaskFemaleSenior : 0};
		/* 마스크 미착용자 성별/연령 비교 차트 전역변수 초기화 끝*/



	</script>


    <%-- 전역변수 끝--%>


	<%-- main chart --%>
    <script src="../../../resources/js/main/main.js"></script>
    
</body>
</html>