<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


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
        .contents {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 10px;
        }


        .innerBox {
            height: 450px;
            max-width: 580px;
            width: 100%;
            box-sizing: border-box;
        }

        /* 막대 */
		.innerBox:nth-child(1){
			order:1;
		}

		/* 차량 */
		.innerBox:nth-child(2){
			order:3;
		}

		/* 라인 */
		.innerBox:nth-child(3){
			order:2;
		}

		/* 테이블 */
		.innerBox:nth-child(4){
			order:6;
		}

		/* 도넛 */
		.innerBox:nth-child(5){
			order:5;
		}
		
		/* 이벤트 발생 비율 */
		.innerBox:nth-child(6){
			order:4;
		}

        @media (max-width: 600px) {
            .contents.fourColumns {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 10px;
            }

            .contents.fourColumns .innerBox {
                display: none;
            }

            .contents.fourColumns .innerBox:nth-child(-n+4) {
                display: block;
            }

            .contents.sixColumns .innerBox {
                display: block;
                max-width: none;
            }
        }

        @media (min-width: 601px) {
            .contents.fourColumns {
                grid-template-columns: repeat(2, minmax(0, 1fr)); /* 수정된 부분 */
                gap: 10px;
            }

            .contents.fourColumns .innerBox {
                display: block;
                max-width: 845px;
            }

            .contents.fourColumns .innerBox:nth-child(n+5) {
                display: none;
            }

            .contents.fourColumns #manImg{
                position: absolute; 
                top: 160px; 
                left: 155px; 
                z-index: 0;
            }

            .contents.fourColumns #womanImg{
                position: absolute; 
                top: 160px; 
                left: 155px; 
                z-index: 0;
            }

            .contents.sixColumns {
                grid-template-columns: repeat(3, minmax(0, 1fr));
                gap: 10px;
            }

            .contents.sixColumns .innerBox {
                display: block;
                max-width: 580px;
            }

            .contents.sixColumns .innerBox:nth-child(n+7) {
                display: none;
            }

            .contents.sixColumns #manImg{
                position: absolute; 
                top: 40%; 
                left: 36%;
                z-index: 0;
            } 

            .contents.sixColumns #womanImg{
                position: absolute; 
                top: 40%; 
                left: 36%;
                z-index: 0;
            }

        }
    </style>
</head>
<body>
    <c:set var="summaryList" value="${DC_summaryList}"/>
	<c:set var="humanCount" value="${humanCount}"/>
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
        

            <%-- 여기서 부터 그리드 연습장 --%>
                <button id="sixInnerBox">6개</button>
                <button id="fourInnerBox">4개</button>
                <br><br>
                <%-- 메인컨텐츠.S --%>
                <div class="contents">
                    <%-- 섹션 좌측.S --%>
                    <div class="innerBox" id="human_rect">
                        <div class="contentsTitle">
							<div class="title" id="tableTitle">
								<h4>사람</h4>
								<p class="summary">일 누적 
									<span id=humanCount_c>
										<c:choose>
											<c:when test="${empty humanCount}">
												<!-- 리스트가 null이거나 비어 있을 경우 0 출력 -->
												<span>0</span>
											</c:when>
											<c:otherwise>
												<!-- 리스트의 요소 개수를 출력 -->
												<span>${humanCount}</span>
											</c:otherwise>
										</c:choose>	
									</span>
								명</p>
							</div>
							<div class="partBTN">
								<a class="changeGraph" id="graphChange" onclick="OnHumanGraphChange()" ><img src="../../resources/img/btn_cangeDiagram.png"> <img src="../../resources/img/btn_cangeDiagram_hover.png" class="over"></a>									
							</div>
						</div>
						<a href="/sub_object">
							<div class="data" id="mainPerson" style="width: 100%; height: 350px; margin-top : 5px;">
								<div id="mainPerson_chart" style="width: 100%; height: 100%;">
									<%-- 사람 막대그래프 영역 --%>
								</div>
							</div>
						</a>
                    </div>
                    <div class="innerBox" id="vehicle_rect">
                        <div class="contentsTitle">
							<div class="title">
								<h4>차량</h4>
								<p class="summary">일 누적 <span>12,812</span>개</p>
							</div>
							<div class="partBTN">
								<a class="changeGraph" onclick="OnCarGraphChange()"><img src="../../resources/img/btn_cangeDiagram.png"> <img src="../../resources/img/btn_cangeDiagram_hover.png" class="over"></a>									
							</div>
						</div>
						<div class="data" style="width: 100%;" onclick="location.href='sub_object.html'">	
							<div id="mainVehicle" style="width: 100%; height: 350px;">
							</div>					
						</div>
                    </div>
                    <div class="innerBox" id="nomask_rect">
                        <div class="contentsTitle">
							<div class="title">
								<h4>마스크 미착용자 성별/연령 비교</h4>
							</div>
						</div>
						<section class="chart">
							<div class="data" id="mainFace1" style=" width: 100%;">
								<div class="manChart">
									<a href="/sub_object">
										<div id="mainFace1_chart" style="width: 100%; height: 390px">
											<%-- 남성 마스크 미착용자 도넛그래프 영역 --%>
										</div>
									</a>					
									<img class="image-thumbnail-mask_man" id="manImg" src ="/resources/img/icon_male75px.png">
								</div>
							</div>
							<div class="data" id="mainFace2" style=" width: 100%;">		
								<div class="womanChart">					
									<a href="/sub_object">
										<div id="mainFace2_chart" style="width: 100%; height: 390px">
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
                    <div class="innerBox" id="event_acc_rect">
                        <div class="contentsTitle">
								<div class="title">
									<h4>이벤트 발생 비율</h4>
								</div>
							</div>
							<div class="data" id="subEventRatio" style="margin-top: 20px; width: 100%;">
                            <div id = "event_acc_wnd" style="margin-top: 30px; width:100%; height:350px;">
                            </div>								
                        </div>
                    </div>
                    <div class="innerBox">
                        <div class="contentsTitle">
                            <div class="title">
                                <h4>시간대별 현황</h4>
                            </div>
                        </div>
                        <div class="data"  id="mainHourly" style="width: 100%; margin-top: 0px;">
                            <%--  테이블 영역 샘플.s --%>							
                            <div id="main" style="width: 100%; height: 400px"></div>
                        </div>
                    </div>
                    <div class="innerBox">
                        <div class="contentsTitle">
								<div class="title">
									<h4>최다검지 카메라 TOP10 CH</h4>
								</div>
								<div class="partBTN">
									<a class="changeGraph" id="humanBtn" style="margin-top:3px;"><img id="changeEvent_btn" src="/resources/img/btn_human.png"><img id="changeEvent_btn" src="/resources/img/btn_human_on.png" class="over"></a> 
									<a class="changeGraph" id="vehicleBtn" style="margin-top:3px;"><img id="changeVehicle_btn" src="/resources/img/btn_car.png"> <img src="/resources/img/btn_car_on.png" class="over"></a>									
								</div>
							</div>
							<div class="data" id="subTop10Cameras"  style="width: 100%;">
								<table class="cameraTable" id="humanCameraTable">
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
												<td>${dailyCount_CNT.falCntCount}</td>
											</tr>
										</c:forEach>
										
									</tbody>
								</table>
							</div>	
                        </div>	
                    </div>
                    <%-- 섹션 우측.E --%>
                </div>
            <%-- 여기까지 그리드 연습장 --%>
        </div>



    <script>
        document.getElementById('sixInnerBox').addEventListener('click', function () {
            document.querySelector('.contents').classList.remove('fourColumns');
            document.querySelector('.contents').classList.add('sixColumns');
            human_chart.resize();
            mainVehicle.resize();
            womanDountChart.resize();
            manDountChart.resize();
            eventChart.resize();
            myChart.resize();
        });

        document.getElementById('fourInnerBox').addEventListener('click', function () {
            document.querySelector('.contents').classList.remove('sixColumns');
            document.querySelector('.contents').classList.add('fourColumns');
            human_chart.resize();
            mainVehicle.resize();
            eventChart.resize();
            myChart.resize();
            womanDountChart.resize();
            manDountChart.resize();
        });
    </script>

    
	<%-- refresh --%>
	<script src="../../../resources/js/refresh.js"></script>

	

    <%-- echarts --%>
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
    


    <script src="../../../resources/js/main/loading.js"></script>
    <%-- <script src="../../../resources/js/main/vehicleTable.js"></script> --%>
    <script src="../../../resources/js/main/tableChange.js"></script>
    <script src="../../../resources/js/main/mainDateChange.js"></script>

    

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

		/* 시간대별 라인그래프 전역변수 초기화 시작(for문 돌려서 사용...? 확인 후 안되면 수정 or 삭제)*/
		var dailyCountList = ${dailyCount};


		var dailyCount_timeList = [];
		var dailyCount_personList = [];
		var dailyCount_vehicleList = [];
		var dailyCount_faceList = [];
		var dailyCount_lprList = [];
		var dailyCount_invCntList = [];
		var dailyCount_lotCntList = [];
		var dailyCount_cntCntList = [];
		var dailyCount_fatCntList = [];

		for (var i = 0; i < dailyCountList.length; i++) {
            
			var dailyCountItem = dailyCountList[i];

			dailyCount_timeList.push(dailyCountItem.time);
			dailyCount_personList.push(dailyCountItem.person);
			dailyCount_vehicleList.push(dailyCountItem.vehicle);
			dailyCount_faceList.push(dailyCountItem.face);
			dailyCount_lprList.push(dailyCountItem.lpr);
			dailyCount_invCntList.push(dailyCountItem.invCnt);
			dailyCount_lotCntList.push(dailyCountItem.lotCnt);
			dailyCount_cntCntList.push(dailyCountItem.cntCnt);
			dailyCount_fatCntList.push(dailyCountItem.fatCnt);
		}


		dailyCount_timeList = ${dailyCount_timeList[i] != null ? dailyCount_timeList[i].time : 0};
		dailyCount_personList = ${dailyCount_personList[i] != null ? dailyCount_personList[i].person : 0};
		dailyCount_vehicleList = dailyCount_vehicleList[i] != null ? dailyCount_vehicleList[i].vehicle : 0;
		dailyCount_faceList = dailyCount_faceList[i] != null ? dailyCount_faceList[i].face : 0;
		dailyCount_lprList = dailyCount_lprList[i] != null ? dailyCount_lprList[i].lpr : 0;
		dailyCount_invCntList = dailyCount_invCntList[i] != null ? dailyCount_invCntList[i].invCnt : 0;
		dailyCount_lotCntList = dailyCount_lotCntList[i] != null ? dailyCount_lotCntList[i].lotCnt : 0;
		dailyCount_cntCntList = dailyCount_cntCntList[i] != null ? dailyCount_cntCntList[i].cntCnt : 0;
		dailyCount_fatCntList = dailyCount_fatCntList[i] != null ? dailyCount_fatCntList[i].fatCnt : 0;
		/* 시간대별 라인그래프 전역변수 초기화 끝(for문 돌려서 사용)*/


		/* 시간대별 라인그래프 전역변수 초기화 시작(전역변수 하나하나 작성)*/
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
		var lpr24 = ${dailyCount[23] != null ? dailyCount[23].lpr : 0};



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
