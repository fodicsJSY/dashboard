<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ai VinUS DASHBOARD</title>

    <%-- toust UI 시작 --%>
	<%-- <link rel="stylesheet" href="./node_modules/tui-chart/dist/toastui-chart.css">
	<script src="./node_modules/tui-chart/dist/toastui-chart.js"></script>
	<link rel="stylesheet" href="./node_modules/tui-grid/dist/tui-grid.css" />
	<script src="./node_modules/tui-grid/dist/tui-grid.js"></script>    
	<link rel="stylesheet" href="./node_modules/tui-date-picker/dist/tui-date-picker.css">
	<script src="./node_modules/tui-date-picker/dist/tui-date-picker.js"></script>
	<script src=  "./node_modules/tui-etc/Fabric/fabric.min.js"></script> --%>
	<%-- toust UI 끝 --%>
  
<script src="/resources/node_modules/jquery/3.6.0/jquery.min.js"></script>


  <%-- css --%>
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
	<c:set var="genderTotalList" value="${genderTotalList}"/>
	<c:set var="genderAccList" value="${genderAccList}"/>
	<c:set var="longTopWearMan" value="${longTopWearMan}"/>
	<c:set var="shortTopWearMan" value="${shortTopWearMan}"/>
	<c:set var="longBottomWearMan" value="${longBottomWearMan}"/>
	<c:set var="shortBottomWearMan" value="${shortBottomWearMan}"/>
	<c:set var="shortTopWearWoman" value="${shortTopWearWoman}"/>
	<c:set var="longBottomWearWoman" value="${longBottomWearWoman}"/>
	<c:set var="shortBottomWearWoman" value="${shortBottomWearWoman}"/>
	<c:set var="wearColorList" value="${wearColorList}" />
	<c:set var="dailyPersonCount" value="${dailyPersonCount}" />

	
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
				</div>
				<%-- 상단 날짜,버튼 영역.E --%>

				<%-- 메인컨텐츠.S --%>
				<div class="contents">

					<%-- 섹션 좌측.S --%>
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
										<p class="contrast">전일대비 
											<span class="lower" id="compare_cnt">
												<c:choose>
													<c:when test="${empty netChangeList[0].personCount_DIFF}">
														<!-- 리스트가 null이거나 비어 있을 경우 0 출력 -->
														<span>0</span>
													</c:when>
													<c:otherwise>
														<!-- 리스트의 요소 개수를 출력 -->
														<span>${netChangeList[0].personCount_DIFF}</span>
													</c:otherwise>
												</c:choose>	
											</span>
										</p>
										<p class="amount" id="total_person_cnt">
											<c:choose>
												<c:when test="${empty todayList[0].person}">
													<!-- 리스트가 null이거나 비어 있을 경우 0 출력 -->
													<span>0</span>
												</c:when>
												<c:otherwise>
													<!-- 리스트의 요소 개수를 출력 -->
													<span>${todayList[0].person}</span>
												</c:otherwise>
											</c:choose>	
										</p>

									</div>
									<div>
										<div style = "width:100%;"  id = "count_human_display_wnd">
											<c:choose>
												<c:when test="${empty dailyPersonCount[0]}">
													<!-- 리스트가 null이거나 비어 있을 경우 0 출력 -->
													<div>카메라 없음</div>
													<div class="humanCountRow">0</div>
												</c:when>
												<c:otherwise>
													<!-- 리스트의 요소 개수를 출력 -->
													<div>${dailyPersonCount[0].cameraName}</div>
													<c:choose>
														<c:when test="${empty dailyPersonCount[0].personCount}">
															<div class="humanCountRow">0</div>
														</c:when>
														<c:otherwise>
															<div class="humanCountRow">${dailyPersonCount[0].personCount}</div>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>	
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
													<%--<div id = "sex_pie_wnd" style="width: 200px; height: 333px;"> --%>
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
															<td>
																<c:choose>
																	<c:when test="${longTopWearMan > shortTopWearMan}">
																		긴팔 우의(${longTopWearMan}%)
																	</c:when>
																	<c:otherwise>
																		반팔 우의(${shortTopWearMan}%)
																	</c:otherwise>
																</c:choose>
															</td>
															<td>
																<c:choose>
																	<c:when test="${longTopWearWoman > shortTopWearWoman}">
																		긴팔 우의(${longTopWearWoman}%)
																	</c:when>
																	<c:otherwise>
																		반팔 우의(${shortTopWearWoman}%)
																	</c:otherwise>
																</c:choose>
															</td>
														</tr>
														<tr>
															<th>상의 색 비중</th>
															<td>
																<div id = "man_top_color_rate" style="width: 178.32px; height: 50px;">
																</div>
															</td>
															<td>
																<div id = "woman_top_color_rate" style="width: 178.32px; height: 50px;">
																</div>	
															</td>
														</tr>
														<tr>
															<th>하의 길이</th>
															<td>
																<c:choose>
																	<c:when test="${longBottomWearMan > shortBottomWearMan}">
																		긴바지 우의(${longBottomWearMan}%)
																	</c:when>
																	<c:otherwise>
																		반바지 우의(${shortBottomWearMan}%)
																	</c:otherwise>
																</c:choose>
															</td>
															<td>
																<c:choose>
																	<c:when test="${longBottomWearWoman > shortBottomWearWoman}">
																		긴바지 우의(${longBottomWearWoman}%)
																	</c:when>
																	<c:otherwise>
																		반바지 우의(${shortBottomWearWoman}%)
																	</c:otherwise>
																</c:choose>
															</td>
														</tr>
														<tr>
															<th>하의 색 비중</th>
															<td>
																<div id = "man_down_color_rate" style="width: 178.32px; height: 50px;">
																</div>
															</td>
															<td>
																<div id = "woman_down_color_rate" style="width: 178.32px; height: 50px;">
																</div>
															</td>
														</tr>
		
													</table>
												</div>
											</div>
										<%-- 토스트 Grid 테마 중복으로 인해 CSS Grid 사용 --%>
										<%--
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
										--%>
									</div>  
								</div>
							</div>
						</div>
					</div>
					<%-- 섹션 좌측.E --%>


					<%-- 섹션 우측.S --%>
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
									<%-- 연령별 출입자 현황 도넛그래프 영역 --%>
									<div class="chart" style="width: 250px; height: 350px; margin: 0 0 0 5%; padding: 0 0 10% 0; ">
										<div id="chart_radial_age" style="width: 100%; height: 100%;" ></div>
									</div>   
								</div>
								<div class="genderMaskChart" style="margin: 15px 0 0 0;">
									<div class="chart" style="width: 250px; height: 160px; ">
										<%-- 남성 마스크 착용 비율 게이지 차트 --%>
										<div id="chart_pie_donut" style="width: 100%; height: 100%;"></div>
									</div>   								
									<div class="chart"  style="width: 250px; height: 160px;">
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
	
						<div class="innerBox divSide" style="height:25vh; height:450px;">
							
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
					<div class="madeFodics" style="margin: 0 50px 0 0;">포딕스시스템</div>
				</div>
			</div>
			<%-- 우측 메인.E --%>
			<%-- ${wearColorList} --%>
			<%-- ${wearColorList[0]} --%>
		</div>
		<%--  내용.E --%>
	</div>
	<%-- 전체 wrap.E --%>


	
	

	<%-- echarts --%>
	<script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>

	<%-- 전역변수 시작--%>
	<script>
	
	/* 휴먼페이지 성별 도넛 차트 전역변수 초기화 시작*/
		var maleSum = ${genderTotalList[9] != null ? genderTotalList[9].personMale : 0};
		var femaleSum = ${genderTotalList[10] != null ? genderTotalList[10].personFemale : 0};
	/* 휴먼페이지 성별 도넛 차트 전역변수 초기화 끝*/
	
	/* 휴먼페이지 성별 악세사리 막대&라인 혼합 차트 전역변수 초기화 시작*/
		var hatMale = ${genderAccList[22] != null ? genderAccList[23].hatMale : 0};
		var bagMale = ${genderAccList[23] != null ? genderAccList[24].bagMale : 0};
		var hatFemale = ${genderAccList[24] != null ? genderAccList[25].hatFemale : 0};
		var bagFemale = ${genderAccList[25] != null ? genderAccList[26].bagFemale : 0};
	/* 휴먼페이지 성별 악세사리 막대&라인 혼합 차트 전역변수 초기화 끝*/





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



	/* 의류선호도 컬러비중 전역변수 초기화 시작*/
		var monoTopWearMan = ${wearColorList[0] != null ? wearColorList[0] : 0};
		var polyTopWearMan = ${wearColorList[1] != null ? wearColorList[1] : 0};
		var huesTopWearMan = ${wearColorList[2] != null ? wearColorList[2] : 0};
		var monoBottomWearMan = ${wearColorList[3] != null ? wearColorList[3] : 0};
		var polyBottomWearMan = ${wearColorList[4] != null ? wearColorList[4] : 0};
		var huesBottomWearMan = ${wearColorList[5] != null ? wearColorList[5] : 0};
		var monoTopWearWoman = ${wearColorList[6] != null ? wearColorList[6] : 0};
		var polyTopWearWoman = ${wearColorList[7] != null ? wearColorList[7] : 0};
		var huesTopWearWoman = ${wearColorList[8] != null ? wearColorList[8] : 0};
		var monoBottomWearWoman = ${wearColorList[9] != null ? wearColorList[9] : 0};
		var polyBottomWearWoman = ${wearColorList[10] != null ? wearColorList[10] : 0};
		var huesBottomWearWoman = ${wearColorList[11] != null ? wearColorList[11] : 0};
	/* 의류선호도 컬러비중 전역변수 초기화 끝*/


	

	</script>
	<%-- 전역변수 끝--%>
		
	<%-- js --%>
	<script src="/resources/js/camera/main_camera_part1_human.js"></script> 
	<%-- <script src="/resources/js/commonFunctions.js"></script>  --%>
	<script type="text/javascript" src="/resources/js/tabcontent.js"></script>

	
	</body>
</html>
