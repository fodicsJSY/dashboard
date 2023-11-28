<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ai VinUS DASHBOARD</title>


	<%-- toust UI 시작--%>
	<%-- <link rel="stylesheet" href="./node_modules/tui-chart/dist/toastui-chart.css">
	<script src="./node_modules/tui-chart/dist/toastui-chart.js"></script>
	<link rel="stylesheet" href="./node_modules/tui-grid/dist/tui-grid.css" />
	<script src="./node_modules/tui-grid/dist/tui-grid.js"></script>    
	<link rel="stylesheet" href="./node_modules/tui-date-picker/dist/tui-date-picker.css">
	<script src="./node_modules/tui-date-picker/dist/tui-date-picker.js"></script>  --%>
	<%-- toust UI 끝--%>


	<script src="/resources/node_modules/jquery/3.6.0/jquery.min.js"></script>


    <%-- css --%>
	<link rel="stylesheet" href="/resources/css/camera/mainCamera/mainCameraStyle.css">
	<link rel="stylesheet" href="/resources/css/camera/mainCamera/mainCamera_camera.css"/>  
	
	<link rel="stylesheet" href="/resources/css/popup.css">
	<link rel="stylesheet" href="/resources/css/style_scrollBar.css"/>  
	<link rel="stylesheet" href="/resources/css/style_grid.css">
	<link rel="stylesheet" href="/resources/css/style_graph.css" />  
	<%-- <link rel="stylesheet" href="font/nanumsquare.css"> --%>
	<link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon" />

	<style>
		.data {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr)); /* 2개씩 설정 */
            gap: 15px;
        }
        
        .today-part8 {
            width: 500px; 
            /* min-height: 170px;
            max-width: 500px;
            height: 170px;
			*/
        }

        .contentsTitle {
            /* margin: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #f9f9f9; */
        }

        .title h4 {
            margin: 0;
        }

        @media (max-width: 600px) {
            .data .today-part8 {
                display: none;
            }

            .data.fourColumns .today-part8:nth-child(-n+4) {
                display: block;
            }

            .data.sixColumns .today-part8 {
                display: block;
                max-width: none;
            }
        } 

        @media (min-width: 601px) {
            .data .today-part8 {
				/* width: 500px;  */
            }

            /* 2개 */
            .data.twoColumns .today-part8:nth-child(n+3) {
                display: none;
            }

            .data.twoColumns .today-part8 {
                width: 100%;
                height: 832px;
				display: flex;
				flex-direction: column;
				justify-content: start;
            }

			.data.twoColumns .todayTXT{
                width: 100%;
				height: 100px;
				display: flex;
				flex-direction: row;
				justify-content: space-between;
				align-items: center;
			}

			.data.twoColumns .titleBox{
				display: flex;
				flex-direction: row;
				justify-content: start;
				align-items: center;
			}

			.data.twoColumns .contentsBox{
				display: flex;
				flex-direction: column;
				justify-content: center;
				margin: 0 10px 0 0;
			}

			.data.twoColumns .todayIMG{
				margin: 0 10px 0 0;
			}



            /* 4개 */
            .data.fourColumns .today-part8:nth-child(n+5) {
                display: none;
            }

            .data.fourColumns .today-part8 {
                display: block;
                min-width: 510px;
                height: 400px;
            }

			.data.fourColumns .todayTXT{
                width: 100%;
				height: 100px;
				display: flex;
				flex-direction: row;
				justify-content: space-between;
				align-items: center;
				
			}

			.data.fourColumns .titleBox{
				display: flex;
				flex-direction: row;
				justify-content: start;
				align-items: center;
			}

			.data.fourColumns .contentsBox{
				display: flex;
				flex-direction: column;
				justify-content: center;
				margin: 0 10px 0 0;
			}

			.data.fourColumns .todayIMG{
				margin: 0 10px 0 0;
			}


            /* 6개 */
            .data.sixColumns .today-part8 {
                width: 100%;
                height: 260px;
            }
            
            .data.sixColumns .today-part8:nth-child(n+7) {
                display: none;
            }
			
			.data.sixColumns .todayTXT{
                width: 100%;
				height: 100px;
				display: flex;
				flex-direction: row;
				justify-content: space-between;
				align-items: center;
				
			}

			.data.sixColumns .titleBox{
				display: flex;
				flex-direction: row;
				justify-content: start;
				align-items: center;
			}

			.data.sixColumns .contentsBox{
				display: flex;
				flex-direction: column;
				justify-content: center;
				margin: 0 10px 0 0;
			}

			.data.sixColumns .todayIMG{
				margin: 0 10px 0 0;
			}


            /* 8개 */
            .data.eightColumns {
                display: grid;
                grid-template-columns: repeat(2, minmax(0, 1fr)); /* 2개씩 4줄설정 */
                gap: 10px;
            }
            
            .data.eightColumns .today-part8 {
                width: 100%;
                height: 193px;

				
            }

			.data.eightColumns .today-part8 .todayTXT {
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: start;
			}

			.data.eightColumns .titleBox{
				display: flex;
				flex-direction: column;
				justify-content: start;
				align-items: start;
				text-align:left;
				margin-left: 20px;
			}

			.data.eightColumns .titleBox *{
				margin-bottom: 10px;
			}

			.data.eightColumns .contentsBox{
				display: flex;
				flex-direction: column;
				justify-content: center;
				margin-left: 20px;
			}
			.data.eightColumns .contentsBox *{
				margin-top: 5px;

			}

        }

	</style>
</head>
<body>
	<c:set var="todayList" value="${todayList}"/>
	<c:set var="netChangeList" value="${netChangeList}"/>
    
    <%-- 전체 wrap.S --%>
	<div class="wrap" id="indexWrap">  
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
					<%-- <div class="btnArea">						
						<a class="rollover" alt="csv파일" ><img src="img/btn-downCSV.png"> <img src="img/btn-downCSV_hover.png" class="over"></a>
						<a class="rollover" alt="csv파일" ><img src="img/btn-downBMP.png"> <img src="img/btn-downBMP_hover.png" class="over"></a>
						<a class="rollover" alt="csv파일" ><img src="img/btn-downPrint.png"> <img src="img/btn-downPrint_hover.png" class="over"></a>
					</div> --%>
				</div>
				<%-- 상단 날짜,버튼 영역.E --%>

				<%-- 메인컨텐츠.S --%>
				<div class="contents">

					<%-- 섹션 좌측.S --%>
					<div class="sectionBox1">
						<div id="innerBox1" class="innerBox divCameraToday">
							<div class="contentsTitle">
								<div class="title">
									<h4>TODAY</h4>								
									
								</div>
								<div style="position: relative; left: 700px; float: left;">
									<button type="button" style="margin-top: 3px" class ="btn" id="twoInnerBox" >2분할</button>
									<button type="button" style="margin-top: 3px" class="btn" id="fourInnerBox" >4분할</button>
									<button type="button" style="margin-top: 3px" class="btn" id="sixInnerBox" >6분할</button>
									<button type="button" style="margin-top: 3px" class="btn" id="eightInnerBox" >8분할</button> 
								</div>
							</div>
							<div class="data">
								<div class="today-part8" >
									<a href="/mainCamera/mainCameraPart1Human">
										<div class="todayTXT todayHuman" >
											<div class="titleBox">
												<img src="/resources/img/icon_titleHuman.png">
												<div class="todayTitle color-Human">사람</div>
											</div>
											<div class="contentsBox">
												<div class="amount" id="total_person_cnt">0</div>
												<div class="contrast">전일대비 <span class="lower"  id="compare_person_cnt">0</span></div>
											</div>
										</div>
									</a>
									<a href="/mainCamera/subCamera">
										<div id="Human_grid_area" style="width: 60%; float: left;">	
										</div>								
									</a>
								</div>
								<div class="today-part8" >
									<a href="/mainCamera/mainCameraPart1Vehicle">
										<div class="todayTXT todayCar"  >
											<div class="titleBox">
												<img src="/resources/img/icon_titleCar.png">
												<div class="todayTitle color-Car">차량</div>
											</div>
											<div class="contentsBox">
												<div class="amount" id="total_vehicle_cnt">
															${todayList[1].vehicleCount}
												</div>
												<div class="contrast">전일대비 <span class="upper" id="compare_vehicle_cnt">0</span></div>
											</div>
										</div>
									</a>
									<a href="/mainCamera/subCamera">
										<div id="Car_grid_area" style="width: 60%; float: left;">
										</div>
									</a>
								</div>
								<div class="today-part8" >
									<a href="/mainCamera/mainCameraPart1Face">
										<div class="todayTXT todayFace"  >
											<div class="titleBox">
												<img src="/resources/img/icon_titleFace.png">
												<div class="todayTitle color-Face">얼굴</div>
											</div>
											<div class="contentsBox">
												<div class="amount" id="total_face_cnt">0</div>
												<div class="contrast">전일대비 <span class="upper"  id="compare_face_cnt">0</span></div>
											</div>
										</div>
									</a>
									<a href="/mainCamera/subCamera">
										<div id="Face_grid_area" style="width: 60%; float: left;">	
										</div>
									</a>
								</div>
								<div class="today-part8" >
									<a href="/mainCamera/mainCameraPart1Counting">
										<div class="todayTXT todayCounting"  >
											<div class="titleBox">
												<img src="/resources/img/icon_titleCounting.png">
												<div class="todayTitle color-Counting">카운팅</div>
											</div>
											<div class="contentsBox">
												<div class="amount" id="total_count_cnt">0</div>
												<div class="contrast">전일대비 <span class="upper" id="compare_count_cnt">0</span></div>
											</div>
										</div>
									</a>
									<a href="/mainCamera/subCamera">
										<div id="Counting_grid_area" style="width: 60%; float: left;">	
										</div>
									</a>
								</div>
								<div class="today-part8" >
									<a href="/mainCamera/mainCameraPart1Loitering">
										<div class="todayTXT todayIntrusion"  >
											<div class="titleBox">
												<img src="/resources/img/icon_titleIntrusion.png">
												<div class="todayTitle color-Intrusion">침입</div>
											</div>
											<div class="contentsBox">
												<div class="amount" id="total_inv_cnt">0</div>
												<div class="contrast">전일대비 <span class="lower" id="compare_inv_cnt">0</span></div>
											</div>
										</div>
									</a>
									<a href="/mainCamera/subCamera">
										<div id="Invasion_grid_area" style="width: 60%; float: left;">		
										</div>										
									</a>
								</div>									
								<div class="today-part8" >
									<a href="/mainCamera/mainCameraPart1Loitering">
										<div class="todayTXT todayLoitering" >
											<div class="titleBox">
												<img src="/resources/img/icon_titleLoitering.png">
												<div class="todayTitle color-Loitering">배회</div>
											</div>
											<div class="contentsBox">
												<div class="amount" id="total_lot_cnt">0</div>
												<div class="contrast" >전일대비 <span class="lower" id="compare_lot_cnt">0</span></div>
											</div>
										</div>
									</a>
									<a href="/mainCamera/subCamera">
										<div id="Loitering_grid_area" style="width: 60%; float: left;">		
										</div>
									</a>
								</div>
								<div class="today-part8">
									<div class="todayTXT todayLPR"  >
										<div class="titleBox">
											<img src="/resources/img/icon_titleLPR.png">
											<div class="todayTitle color-LPR">차량 번호 인식</div>
										</div>
										<div class="contentsBox">
											<div class="amount">0</div>
											<div class="contrast">전일대비 <span class="lower">0</span></div>
										</div>
									</div>
									<a href="/mainCamera/subCamera">
										<div id="LPR_grid_area" style="width: 60%; float: left;">	
										</div>
									</a>
								</div>
								<div class="today-part8">
									<div class="todayTXT todayParking" >
										<div class="titleBox">
											<img src="/resources/img/icon_titleNoParking.png">
											<div class="todayTitle color-Parking">불법 주·정차</div>
										</div>
										<div class="contentsBox">
											<div class="amount">0</div>
											<div class="contrast">전일대비 <span class="lower">0</span></div>
										</div>
									</div>
									<a href="/mainCamera/subCamera">
										<div id="Parking_grid_area" style="width: 60%; float: left'">	
										</div>
									</a>
								</div>
							</div>
						</div>

					</div>
					<%-- 섹션 좌측.E --%>

					<%-- 섹션 우측.S --%>
					<div class="sectionBox22">
						<div class="innerBox1 divEventAge">
							<div class="contentsTitle mainCameraContentsTitle" >
								<div class="title">
									<h4>연령별 출입자 현황</h4>
								</div>
								<div class="title">
									<h4>마스크 착용 비율</h4>
								</div>
							</div>
                            <div class="totalData mainCameraTotalData">
                                <div class="data01" >
									<%-- 연령별 출입자 현황 도넛그래프 영역 --%>
                                    <div class="chart" style="width: 250px; height: 350px; margin: 0 0 0 5%; padding: 0 0 5% 0;">
										<div id="chart_radial_age" style="width: 100%; height: 100%;" ></div>
									</div>   
                                </div>
                                
                                <div class="data02">	
                                    <div class="chart" style="width: 250px; height: 180px; ">
										<%-- 남성 마스크 착용 비율 게이지 차트 --%>
										<div id="chart_pie_donut" style="width: 100%; height: 100%;"></div>
									</div>   								
									<div class="chart"  style="width: 250px; height: 180px;">
										<%-- 여성 마스크 착용 비율 게이지 차트 --%>
										<div id="chart_pie_donut2" style="width: 100%; height: 100%;"></div>
									</div> 
                                    <div class="corlorGuide alignL" >
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
						<div class="innerBox divEvent" >
							<div class="contentsTitle">
								<div class="title">
									<h4>이벤트 발생 비율</h4>
								</div>
							</div>
							<div class="data1">
								<div id = "event_acc_wnd" style="margin-top: 30px; width:100%; height:350px; ">
									<%-- 이벤트 발생 비율 도넛 차트 --%>
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



    <%-- js --%>
	<script>
        document.getElementById('twoInnerBox').addEventListener('click', function () {
            document.querySelector('.data').classList.add('twoColumns');
            document.querySelector('.data').classList.remove('sixColumns');
            document.querySelector('.data').classList.remove('fourColumns');
            document.querySelector('.data').classList.remove('eightColumns');
        });

        document.getElementById('fourInnerBox').addEventListener('click', function () {
            document.querySelector('.data').classList.remove('twoColumns');
            document.querySelector('.data').classList.remove('sixColumns');
            document.querySelector('.data').classList.add('fourColumns');
            document.querySelector('.data').classList.remove('eightColumns');
    
            
        });

        document.getElementById('sixInnerBox').addEventListener('click', function () {
            document.querySelector('.data').classList.remove('twoColumns');
            document.querySelector('.data').classList.remove('fourColumns');
            document.querySelector('.data').classList.add('sixColumns');
            document.querySelector('.data').classList.remove('eightColumns');
            
        });
        


        document.getElementById('eightInnerBox').addEventListener('click', function () {
            document.querySelector('.data').classList.remove('twoColumns');
            document.querySelector('.data').classList.remove('sixColumns');
            document.querySelector('.data').classList.remove('fourColumns');
            document.querySelector('.data').classList.add('eightColumns');
        });

        </script>

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
		var invCntCount = ${selectMainEventList[0] != null ? selectMainEventList[0].invCntCount : 0};
		var lotCntCount = ${selectMainEventList[1] != null ? selectMainEventList[1].lotCntCount : 0};
		var cntCntCount = ${selectMainEventList[2] != null ? selectMainEventList[2].cntCntCount : 0};
		var falCntCount = ${selectMainEventList[3] != null ? selectMainEventList[3].falCntCount : 0};
	/* 이벤트 발생 비율 차트(금일) 전역변수 초기화 끝*/

	/* 금일누적 합계 전역변수 초기화 시작*/
		var todayPersonCount = ${todayList[0] != null ? todayList[0].personCount : 0};
		var todayVehicleCount = ${todayList[1] != null ? todayList[1].vehicleCount : 0};
		var todayFaceCount = ${todayList[2] != null ? todayList[2].faceCount : 0};
		var todayLprCount = ${todayList[3] != null ? todayList[3].lprCount : 0};
		var todayInvCntCount = ${todayList[4] != null ? todayList[4].invCntCount : 0};
		var todayLotCntCount = ${todayList[5] != null ? todayList[5].lotCntCount : 0};
		var todayCntCntCount = ${todayList[6] != null ? todayList[6].cntCntCount : 0};
		var todayFalCntCount = ${todayList[7] != null ? todayList[7].falCntCount : 0};
		
	/* 금일누적 합계 전역변수 초기화 끝*/



	</script>
	<%-- 전역변수 끝--%>



	<%-- mainCamera js--%>
	<script src="/resources/js/camera/mainCamera.js"></script>




</body>
</html>