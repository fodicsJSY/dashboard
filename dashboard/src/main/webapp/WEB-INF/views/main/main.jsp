<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ai VinUS DASHBOARD</title>


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
    <script src="/resources/js/main/main.js"></script> <!-- 차트 script를 js파일에 옮겼으나 실행이 안됨.. -->

    <!-- echarts -->
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>


    <!-- Echart예시(막대)-->
    <!--    <script type="text/javascript">
        //  준비한 DOM 컨테이너에서 echarts 초기화하기
        let myChart = echarts.init(document.getElementById('main'))
  
        // 차트 옵션 작성하기
        let option = {
          // 차트 제목
          title: {
            text: 'ECharts 기본 예제: HTML',
          },
          // 범례명
          legend: {
            data: ['개수'],
            top: 20,
          },
          // x축 라벨
          xAxis: {
            data: ['제품A', '제품B', '제품C'],
          },
          yAxis: {},
          series: [
            {
              name: '개수',
              type: 'bar', // 막대 그래프
              data: [5, 3, 4],
            },
          ],
        }
  
        //  차트 옵션 설정하기
        myChart.setOption(option)
      </script>

    -->

    

<script> 

  /* 사람 막대차트 */
  //  준비한 DOM 컨테이너에서 echarts 초기화하기
  var myChart = echarts.init(document.getElementById('mainPerson_chart'))

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
        textStyle:{
        color: "rgba(255, 255, 255, 1)"
        },
        top: 'bottom', // 범례를 그래프 하단에 배치
        padding: [50, 0, 0, 0], // 범례 위 아래에 마진을 추가

      },
      grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
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
          data: [320, 302, 301, 334]
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
          data: [120, 132, 101, 134]
          }
        
      ]
  };

  //  차트 옵션 설정하기
  myChart.setOption(option)




  /* 남자 도넛 그래프 */
  //  준비한 DOM 컨테이너에서 echarts 초기화하기
  var myChart = echarts.init(document.getElementById('mainFace1_chart'))

  // 차트 옵션 작성하기
  option = {
      tooltip: {
          trigger: 'item'
      },
      legend: {
          top: '5%',
          left: 'center',
          textStyle:{
            color: "rgba(255, 255, 255, 1)"
           },
          //top: 'bottom', // 범례를 그래프 하단에 배치
          //padding: [50, 0, 0, 0], // 범례 위 아래에 마진을 추가
      },
      series: [
          {
          name: '남성 마스크 미착용자 연령 비교',
          type: 'pie',
          radius: ['40%', '70%'],
          avoidLabelOverlap: false,
          itemStyle: {
              borderColor: '#fff',
              borderWidth: 2
          },
          label: {
              show: false,
              position: 'center'
          },
          emphasis: {
              // label: {
              // show: true,
              // fontSize: 40,
              // fontWeight: 'bold'
              // }
          },
          labelLine: {
              show: false
          },
          data: [
              { value: 1048, name: '미성년', itemStyle: { color: '#d3f1f9' }},
              { value: 735, name: '청년', itemStyle: { color: '#3fd5e3' }},
              { value: 580, name: '중장년', itemStyle: { color: '#00a0de' }},
              { value: 484, name: '노년', itemStyle: { color: '#0174cf' }}
          ]
          }
      ]
  };

  //  차트 옵션 설정하기
  myChart.setOption(option)



  /* 여자도넛그래프 */
  //  준비한 DOM 컨테이너에서 echarts 초기화하기
  var myChart = echarts.init(document.getElementById('mainFace2_chart'))

  // 차트 옵션 작성하기
  option = {
      tooltip: {
          trigger: 'item'
      },
      legend: {
          top: '5%',
          left: 'center',
          textStyle:{
            color: "rgba(255, 255, 255, 1)"
          },
          //top: 'bottom', // 범례를 그래프 하단에 배치
        // padding: [50, 0, 0, 0], // 범례 위 아래에 마진을 추가
      },
      series: [
          {
          name: '여성 마스크 미착용자 연령 비교',
          type: 'pie',
          radius: ['40%', '70%'],
          avoidLabelOverlap: false,
          itemStyle: {
              borderColor: '#fff',
              borderWidth: 2
          },
          label: {
              show: false,
              position: 'center'
          },
          emphasis: {
              // label: {
              // show: true,
              // fontSize: 40,
              // fontWeight: 'bold'
              // }
          },
          labelLine: {
              show: false
          },
          data: [
              { value: 1048, name: '미성년', itemStyle: { color: '#d3f1f9' } },
              { value: 735, name: '청년', itemStyle: { color: '#3fd5e3' } },
              { value: 580, name: '중장년', itemStyle: { color: '#00a0de' } },
              { value: 484, name: '노년', itemStyle: { color: '#0174cf' } },
          ]
          }
      ]
  };

  //  차트 옵션 설정하기
  myChart.setOption(option)





  /* 시간대별 라인그래프 */
  //  준비한 DOM 컨테이너에서 echarts 초기화하기
  var myChart = echarts.init(document.getElementById('main'))

  // 차트 옵션 작성하기
  var option = {
    // 차트 제목
    title: {
      text: 'showHourlyChart',
    },
    // 범례명
    legend: {
      data: ['사람', '차량', '얼굴', '번호판','침입', '배회', '카운팅', '쓰러짐'],
      top: 20,
      textStyle:{
        color: "rgba(255, 255, 255, 1)"
      }
    },
    // x축 라벨
    xAxis: {
      data: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
              '10', '11', '12', '13', '14', '15', '16', '17', '18', '19',
              '20', '21', '22', '23'],
    },
    yAxis: {
      //data: ['0', '500', '1000', '1500', '2000'],
    },
    series: [
      {
        name: '사람',
        type: 'line', 
        data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
        itemStyle: { color: '#94e9ec' }
      },
      {
        name: '차량',
        type: 'line', 
        data: [1, 32, 32, 21, 43, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
        itemStyle: { color: '#d4e079' }
      },
      {
        name: '얼굴',
        type: 'line', 
        data: [5, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
        itemStyle: { color: '#b4a1d8' }
      },
      {
        name: '번호판',
        type: 'line', 
        data: [10, 7, 32, 21, 42, 42, 63, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
        itemStyle: { color: '#f19ec2' }
      },
      {
        name: '침입',
        type: 'line', 
        data: [10, 32, 32, 21, 42, 42, 3, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
        itemStyle: { color: '#4176df' }
      },
      {
        name: '배회',
        type: 'line', 
        data: [1, 32, 32, 21, 43, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
        itemStyle: { color: '#fec070' }
      },
      {
          name: '카운팅',
          type: 'line',
          stack: 'Total',
          data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 23, 113, 232, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
          itemStyle: { color: '#ff7978' }
      },
      {
          name: '쓰러짐',
          type: 'line',
          stack: 'Total',
          data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 343, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
          itemStyle: { color: '#52c3f7' }
      }
    ],
  }

  //  차트 옵션 설정하기
  myChart.setOption(option)



</script>



    
</body>
</html>