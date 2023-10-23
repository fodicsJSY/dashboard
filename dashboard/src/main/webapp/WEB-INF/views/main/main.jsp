<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ai VinUS DASHBOARD</title>


    <!-- toust UI 시작 -->
    <!--
      <link rel="stylesheet" href="/resources/node_modules/tui-chart/dist/toastui-chart.css">
      <script src="/resources/node_modules/tui-chart/dist/toastui-chart.js"></script>
      <link rel="stylesheet" href="/resources/node_modules/tui-grid/dist/tui-grid.css" />
      <script src="/resources/node_modules/tui-grid/dist/tui-grid.js"></script>      	
      <link rel="stylesheet" href="/resources/node_modules/tui-date-picker/dist/tui-date-picker.css">
      <script src="/resources/node_modules/tui-date-picker/dist/tui-date-picker.js"></script>
      -->
    <!-- toust UI 끝 -->

    <!--jquery-->
    <script src="/resources/node_modules/jquery/3.6.0/jquery.min.js"></script>
	

    <!-- css -->

    <link rel="stylesheet" href="/resources/css/main/main.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/object.css">
    <link rel="stylesheet" href="/resources/css/popup.css">
    <link rel="stylesheet" href="/resources/css/style_scrollBar.css"> 
    <link rel="stylesheet" href="/resources/font/nanumsquare.css">
    <link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/style_grid.css">

    <!-- bootstrap -->
    <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    
</head>
<body>
    <!-- 전체 wrap.S -->
	<div class="wrap" id="indexWrap">  
		<div file="Setting">
      <jsp:include page="/WEB-INF/views/main/Setting.jsp"/>
    </div>
		
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
          <a href="/main"><button type="button" class="btn_object_on">M A I N</button></a>
					<!-- <a href="/main"><button type="button" class="btn_evnet">E V E N T</button></a> -->
					<a href="/mainCamera"><button type="button" class="btn_camera">C A M E R A</button></a>
				</div>
				<!-- 좌측 네비.E -->
        
				<!-- 실시간 채널.S -->
				<div file="inc_side"></div>
        <jsp:include page="/WEB-INF/views/main/inc_side.jsp"/>
				<!-- 실시간 채널.E -->
			</div>
			<!-- side 영역.E -->


			<!-- 우측 메인.S -->
			<div id="contentsWrap">
				<!-- 상단 날짜,버튼 영역.S -->
				<div class="mainTop">
					<div class=" dateArea">


						<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
							<input type="text" id="tui-date-picker-target"
								aria-label="Date-Time">
							<span class="tui-ico-date"></span>
							<div id="tui-date-picker-container"></div>
						</div>

						<!-- 달력						
						<div id="tui-date-picker-container"></div>
						<a class="rollover" alt="달력" id="tui-date-picker-main">
							<img src="img/btn-calendar.png"> 
							<img src="img/btn-calendar_hover.png" class="over">
						</a>

						<p class="date" id='mainDate'>2021년 07월 21일</p>
						-->
						<button type="button" class="btn-date" onclick="OnPrevDate();" >◀<!-- <img src="img/btn-calendarLeft.png">--></button>
						<button type="button" class="btn" onclick="OnTodayDate();" >오늘</button>
						<button type="button" class="btn-date" onclick="OnNextDate();">▶<!-- <img src="img/btn-calendarRight.png">--></button>
					</div>
					<div class="btnArea">						
						<!-- <a class="rollover" alt="csv파일" OnClick="OnCSV_Click()"><img src="img/btn-downCSV.png"> <img src="img/btn-downCSV_hover.png" class="over"></a> -->
						<a class="rollover" alt="csv파일" OnClick="OnCSV_Click()"><img src="../../resources/img/btn-downCSV.png"> <img src="../../resources/img/btn-downCSV_hover.png" class="over"></a>
						<a class="rollover" alt="bmp파일" OnClick="OnBMP_Click()"><img src="../../resources/img/btn-downBMP.png"> <img src="../../resources/img/btn-downBMP_hover.png" class="over"></a>
						<a class="rollover" alt="csv파일" OnClick="OnPrint_Click()"><img src="../../resources/img/btn-downPrint.png"> <img src="../../resources/img/btn-downPrint_hover.png" class="over"></a>
					</div>
				</div>
				<!-- 상단 날짜,버튼 영역.E -->

				<!-- 메인컨텐츠.S -->
				<div class="contents">

					<!-- 섹션 좌측.S -->
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
							<a href="/sub_object">
                <div class="data" id="mainPerson" style="margin-top : 5px;">
                  <div id="mainPerson_chart" style="width: 800px; height: 350px;">
                    <!-- 사람 막대그래프 영역 -->
                  </div>
							  </div>
              </a>
						</div>
						<!-- <div class="innerBox divCar" id="vehicle_rect" >
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
						</div> -->
						<div class="innerBox divAge" id="nomask_rect">
							<div class="contentsTitle">
								<div class="title">
									<h4>마스크 미착용자 성별/연령 비교</h4>
								</div>
							</div>
              <section class="chart">
							<div class="data" id="mainFace1" style="margin-top: 20px; margin-left: 30px">
                <div class="manChart">
                  <a href="/sub_object">
                    <div id="mainFace1_chart" style="width: 400px; height: 400px">
                        <!-- 남성 마스크 미착용자 도넛그래프 영역 -->
                      </div>
                    </a>					
                    <img class="image-thumbnail-mask_man" id="manImg" src ="/resources/img/icon_male75px.png"></img>
                  </div>
                </div>
                <div class="data" id="mainFace2" style="margin-top: 20px" >		
                  <div class="womanChart">					
                    <a href="/sub_object">
                      <div id="mainFace2_chart" style="width: 400px; height: 400px">
                        <!-- 여성 마스크 미착용자 도넛그래프 영역 -->
                    </div>
                  </a>				
                  <img class="image-thumbnail-mask_woman" id="womanImg" src ="/resources/img/icon_female75px.png"></img> 
                </div>
							</div>
              </section>
						</div>						
					</div>
					<!-- 섹션 좌측.E -->

					<!-- 섹션 우측.S -->
					<div class="sectionBox">
						<!-- <div class="innerBox divEvent" id="event_acc_rect">
							<div class="contentsTitle">
								<div class="title">
									<h4>이벤트 발생 비율</h4>
								</div>
							</div>
							<div class="data" id="subEventRatio" style="margin-top: 20px;">								
							</div>
						</div>	 -->	
						
						<div class="innerBox divTime" id="time_rect">
							<div class="contentsTitle">
								<div class="title">
									<h4>시간대별 현황</h4>
								</div>
							</div>
                            <!--
                            <div>
                                <canvas id="myChart"></canvas>
                            </div>
                            -->
                            <div class="data"  id="mainHourly" style="margin-top: 0px;">
                                <!--  테이블 영역 샘플.s -->							
                                <div id="main" style="width: 800px; height: 400px"></div>
                            </div>
						</div>

						<div class="innerBox divTop10" id="top10_rect" style="margin-top: 15px;">
							<div class="contentsTitle">
								<div class="title">
									<h4>최다검지 카메라 TOP10 CH</h4>
								</div>
								<div class="partBTN">
									<!-- <a class="changeGraph" onclick="setMainEventTop10()"; style="margin-top:3px;"><img id="changeEvent_btn" src="img/btn_human.png"><img id="changeEvent_btn" src="img/btn_human_on.png" class="over"></a> -->
									<!-- <a class="changeGraph" onclick="setMainVehicleTop10()"; style="margin-top:3px;"><img id="changeVehicle_btn" src="img/btn_car.png"> <img src="img/btn_car_on.png" class="over"></a>									 -->
								</div>
							</div>
              <div>
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
                    <tbody class="table-group-divider">
                      <tr>
                        <th scope="row" class="loadName">신촌사거리</th>
                        <td>164</td>
                        <td>125</td>
                        <td>25</td>
                        <td>124</td>
                        <td>18</td>
                        <td>251</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">장수사거리</th>
                        <td>151</td>
                        <td>126</td>
                        <td>23</td>
                        <td>277</td>      
                        <td>19</td>
                        <td>226</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">가정오거리</th>
                        <td>151</td>
                        <td>133</td>
                        <td>22</td>
                        <td>220</td>
                        <td>26</td>
                        <td>218</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">연수사거리</th>
                        <td>147</td>
                        <td>133</td>
                        <td>24</td>
                        <td>219</td>
                        <td>15</td>
                        <td>218</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">남동IC</th>
                        <td>145</td>
                        <td>130</td>
                        <td>19</td>
                        <td>210</td>
                        <td>21</td>
                        <td>228</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">간석사거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">학익사거리</th>
                        <td>151</td>
                        <td>133</td>
                        <td>22</td>
                        <td>220</td>
                        <td>26</td>
                        <td>218</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">숭의로터리</th>
                        <td>147</td>
                        <td>133</td>
                        <td>24</td>
                        <td>219</td>
                        <td>15</td>
                        <td>218</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">원당사거리</th>
                        <td>145</td>
                        <td>130</td>
                        <td>19</td>
                        <td>210</td>
                        <td>21</td>
                        <td>228</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">남동공단입구사거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                    </tbody>
                  </table>
              </table>
              </div>
							<div class="data" id="subTop10Cameras" style="margin: 10px"></div>						
							<div class="data" id="subTop10CamerasCar" style="margin: 10px"></div>
						</div>
					</div>	
					<!-- 섹션 우측.E -->
				</div>

				<!-- 로딩 -->
				<div id="loading"><img id="loading-image" src="../../resources/img/loading_animated.png" alt="Loading..." /></div>

				<!-- 메인컨텐츠.E -->
				<div id="bottom">
					<p class="Notice">※ 화면에 표시되는 모든 실시간 데이터는 1분마다 자동으로 업데이트 합니다. 다만 “시간대별 현황” 그래프의 실시간 데이터는 정시에 한 번씩 업데이트 합니다.</p>
					<div class="madeFodics">포딕스시스템</div>
				</div>
				<!-- CSV 대화상자 -->
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
<!-- BMP 대화상자 -->
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
<!-- 출력 대화상자 -->
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
						<!-- <div style = "margin : 15px;">&emsp;&emsp;&emsp;결재란 유/무<input type="checkbox" name="type" onclick="chkPaymentClick(this)" id="report_payment_block" style = "margin-left : 25px;">  유<input type="checkbox"  name="type" onclick="chkPaymentClick(this)" id="report_payment_none" style = "margin-left : 25px;">  무</div> -->
						<div style = "margin-top : 15px; ">&emsp;&emsp;&emsp;결재란 유/무<input type="file" id="input_file_yes" style = "width: 180px; margin-left : 25px;"></div>
						
					</div>
					<div style = "margin : 10px; float: right;">
						<a class="rollover" alt="확인" OnClick="OnPRINT_OK()"><img  src="/resources/img/btn_popConfirm.png"> <img src="../../resources/img/btn_popConfirm_hover.png" class="over "></a>
						<a class="rollover" alt="취소" OnClick="OnPRINT_Cancel()"><img src="/resources/img/btn_popCancel.png"> <img src="../../resources/img/btn_popCancel_hover.png" class="over "></a>
					</div>
				</dialog>
			</div>
			<!-- 우측 메인.E -->

		</div>
		<!--  내용.E -->
	</div>
    <!-- 전체 wrap.E -->




    <!-- js -->

    <!-- echarts -->
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
    
    <!-- 전역변수 시작-->
    <script>

    </script>
    <!-- 전역변수 끝-->

    <!-- main chart -->
    <script src="../../../resources/js/main/main.js"></script>


    <script>


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


    /* 차트 변경 js 시작 */
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
  /* 차트 변경 js 끝 */


  

  </script>




    
</body>
</html>