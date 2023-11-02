<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
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

  <!-- jquery -->
  <script src="./node_modules/jquery/3.6.0/jquery.min.js"></script>
  
  
  <link rel="stylesheet" href="/resources/css/popup.css">
  <link rel="stylesheet" href="/resources/css/object_sub/object_sub.css">
  <link rel="stylesheet" href="/resources/font/nanumsquare.css">
  <link rel="stylesheet" href="/resources/css/style_scrollBar.css"/>  
  <link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon" />

  
  
  

</head>

<body>
  <!-- 전체 wrap.S -->
  <div class="wrap" id="indexWrap">

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
        <div class="btn-navi">
          <a href="/main">
						<button type="button" class="btn_object">M A I N</button>
					</a>
					<!-- <button type="button" class="btn_evnet_on" onClick="OnClickEvent();">E V E N T</button> -->
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
          <!-- <div class=" dateArea">
            <a class="rollover" alt="달력"><img src="img/btn-calendar.png"> <img src="img/btn-calendar_hover.png"
                class="over"></a>
            <p class="date">2021년 07월 21일</p>
            <button type="button" class="btn-date" href="#">◀
            </button>
            <button type="button" class="btn-date" href="#">▶
            </button>
            <button type="button" class="btn" href="#">오늘</button>
          </div> -->

        </div>
        <!-- 상단 날짜,버튼 영역.E -->


        <div class="contentsArea">
          <!-- 
					<div class="subTabs">
						<div class="tabsTitle"><img src="img/navi_object.png"></div>
						<ul class="tabs" data-persist="true">
							<li class="tabsON"><a href="sub_object.html" >사람 카메라 정보 상세</a></li>
							<li><a href="sub_object_car.html" >차량 카메라 정보 상세</a></li>
						</ul>
					</div> -->

          <div class="subTabs">
            <div class="tabsTitle"><img src="/resources/img/navi_object.png"></div>
            <ul class="tabs" data-persist="true">
              <li><a href="/sub_object" OnClick = "HumanPageShow()">사람 카메라 정보 상세</a></li>
              <li><a href="/sub_object_camera"  style="background-color: #1e1e1e; color: white;" OnClick = "VehiclePageShow()">차량 카메라 정보 상세</a></li>
            </ul>

            <div class="sub-btnArea">
              <a class="rollover" alt="csv파일" OnClick="OnCSV_OK()"><img src="/resources/img/btn-downCSV.png"> <img src="/resources/img/btn-downCSV_hover.png" class="over"></a>
							<a href="/main"  class="rollover" alt="HOME"><img src="/resources/img/btn-goMain.png"> <img src="/resources/img/btn-goMain_hover.png" class="over"></a>
            </div>
          </div>

          <!-- 메인컨텐츠.S -->
          <div class="contentsGridDataArea">

            <!-- 탭 view1.S -->
            <div id="view1">
              <div class="sectionDate">
                <span>기간</span>
                <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                  <span class="tui-ico-date"> </span>
                  <input id="startpicker-input" type="date" aria-label="Date">
                  <div id="startpicker-container"></div>
                </div>
                <span>~</span>
                <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                  <span class="tui-ico-date"> </span>
                  <input id="endpicker-input" type="date" aria-label="Date">
                  <div id="endpicker-container"></div>
                </div>

                <input id="text_cam_name" class="text_cam_name" style="color:white;" ; type="text" name="name" required
                  minlength="4" maxlength="8" size="25" placeholder="카메라 명을 입력하세요." onkeydown="KeyDownSearch(this.id)";>

                <button id="btn_cam_Psearch" type="button" onClick="FindCamData('text_cam_name')" class="btn" style="margin-top: -5px; margin-left: 10px;">검색</button>
              </div>

              <div class="sectionBox1type">
                <!--사람 카메라 정보 상세-->
                <div class="gridTitle">
                  <table class="grid_object_person_title">
                    <tr>
                      <th scope="col" class="loadName">카메라명</th>
                      <th scope="col">자동차</th>
                      <th scope="col">버스</th>
                      <th scope="col">트럭</th>
                      <th scope="col">오토바이</th>
                      <th scope="col">자전거</th>
                      <th scope="col">TOTAL</th>
                      <th scope="col" style="width: 10px;"></th>
                    </tr>
                  </table>
                </div>
                <div id="grid_object">
                  <table class="humanCameraTable2">
                    <tbody class="table-group-divider">
                      <tr>
                        <th scope="row" class="loadName">먼우금사거리</th>
                        <td>164</td>
                        <td>125</td>
                        <td>25</td>
                        <td>124</td>
                        <td>18</td>
                        <td>251</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">원당사거리</th>
                        <td>151</td>
                        <td>126</td>
                        <td>23</td>
                        <td>277</td>      
                        <td>19</td>
                        <td>226</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">길병원사거리</th>
                        <td>151</td>
                        <td>133</td>
                        <td>22</td>
                        <td>220</td>
                        <td>26</td>
                        <td>218</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">동인천역</th>
                        <td>147</td>
                        <td>133</td>
                        <td>24</td>
                        <td>219</td>
                        <td>15</td>
                        <td>218</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">신복사거리</th>
                        <td>145</td>
                        <td>130</td>
                        <td>19</td>
                        <td>210</td>
                        <td>21</td>
                        <td>228</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">임학사거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">만수사거리</th>
                        <td>151</td>
                        <td>133</td>
                        <td>22</td>
                        <td>220</td>
                        <td>26</td>
                        <td>218</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">송림오거리</th>
                        <td>147</td>
                        <td>133</td>
                        <td>24</td>
                        <td>219</td>
                        <td>15</td>
                        <td>218</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">가정사거리</th>
                        <td>145</td>
                        <td>130</td>
                        <td>19</td>
                        <td>210</td>
                        <td>21</td>
                        <td>228</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">도화초교사거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">선학역사거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">가정오거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">석바위사거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">수산물검사원사거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">간석오거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">간석오거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">간석오거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">간석오거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">간석오거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                      <tr>
                        <th scope="row" class="loadName">간석오거리</th>
                        <td>143</td>
                        <td>111</td>
                        <td>16</td>
                        <td>214</td>
                        <td>58</td>
                        <td>125</td>
                      </tr>
                    </tbody>
                </table>
              </div>
              <!--사람 카메라 정보 상세-->
              <div class="gridTotal">
                <table class="grid_object_person_total">
                  <th scope="row" class="loadName">전체 카메라 총계</th>
                  <td>143</td>
                  <td>111</td>
                  <td>16</td>
                  <td>214</td>
                  <td>58</td>
                  <td>125</td>
                  <td style="width: 10px; margin: 0;"></td>
                </table>
                <!--
                  <div id="grid_object_person_total"></div>
                -->
              </div>
              <!-- <div class="Loading">   </div> -->



            </div>
            <!-- 탭 view1.E -->


            <!-- 탭 view2.S -->
            <!-- <div id="view2">
              <div class="sectionDate2">
                <span>기간</span>
                <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                  <span class="tui-ico-date"> </span>
                  <input id="startpicker-input2" type="text" aria-label="Date">
                  <div id="startpicker-container2"></div>
                </div>
                <span>~</span>
                <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                  <span class="tui-ico-date"> </span>
                  <input id="endpicker-input2" type="text" aria-label="Date">
                  <div id="endpicker-container2"></div>
                </div>

                <input id="text_cam_name2" class="text_cam_name2" style="color:white" ; type="text" name="name2"
                  required minlength="4" maxlength="8" size="25" placeholder="카메라 명을 입력하세요."
                  onkeydown="KeyDownSearch(this.id)" ;>

                <button id="btn_cam_Vsearch" type="button" onClick="FindCamData('text_cam_name2')" ; class="btn"
                  style="margin-top: -5px; margin-left: 10px;">검색</button>

              </div>
              <div class="sectionBox2type">
                
                <div id="grid_object_view2"></div>
              </div>
              <div class="gridTotal">
                
                <div id="grid_object_vehicle_total"></div>
              </div>
            </div> -->




            <!-- 탭 view2.E -->
            <div id="loading"><img id="loading-image" src="/resources/img/loading_animated.png" alt="Loading..." /></div>
          </div>
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

  	
  <script src="./data/data_sample.js"></script>
  <!-- 탭버튼 스크립트.S-->
  <script src="/resources/js/tabcontent.js"></script>
  <!-- 탭버튼 스크립트.E-->
  <script src="/resources/js/popupSetting.js"></script>
  <script src="/resources/js/commonFunctions.js"></script>
  <script src="/resources/js/CsvMakeFile.js"></script>
  <script src="dashboard_config.json"></script> 
 
  <script>

    var grid, grid_view2;
    var gridData = [];

    var picker;
    var picker2;

    var grid_object_person_total;
    var grid_object_vehicle_total;

    var gridPersonTotalData = new Array;
    var gridVehicleTotalData = new Array;
    var personTotal = 0;

    var oldStartDate = '';
    var oldEndDate = '';
    var show_object_page = 1;

    function KeyDownSearch(e) {
      if (event.keyCode == 13) {

        FindCamData(e);
      }
    }

    function requestDuration(startDate, EndDate, days, e) {

      if (oldStartDate != startDate || oldEndDate != EndDate) {
        var xhttp = new XMLHttpRequest();
        var param = 'getDurationValue?';
        param += ('startDate=' + startDate + '&' + 'endDate=' + EndDate);
        xhttp.onreadystatechange = function () {

          if (this.readyState == 4 && this.status == 200) {
            if (this.responseURL.includes('getDurationValue')) {
              //var gridDataVal = JSON.parse();
              loadDataFile(this.responseText, days);
              
              
              $('#loading').hide();
              
              const el = document.getElementById(e);
              const camera_name = el.value;
              if (!camera_name)
                return;

              var list_str;
              for (var i = 0; i < gridData.length; i++) {
                list_str = gridData[i].CAMERA_NAME;
                if (list_str.indexOf(camera_name) != -1) {
                  if (e == "text_cam_name")
                    grid.focusAt(i, 0, true);
                  else
                    grid_view2.focusAt(i, 0, true);
                }
              }
            }
          }
        }
        xhttp.open('GET', param, true);
        xhttp.send();

        //같은 날짜면 다시 REQ하지 않으려고함.
        oldStartDate = startDate;
        oldEndDate = EndDate;
      }
      else {

        $('#loading').hide();

        const el = document.getElementById(e);
        const camera_name = el.value;
        if (!camera_name)
          return;

        var list_str;
        for (var i = 0; i < gridData.length; i++) {
          list_str = gridData[i].CAMERA_NAME;
          if (list_str.indexOf(camera_name) != -1) {
            if (e == "text_cam_name")
              grid.focusAt(i, 0, true);
            else
              grid_view2.focusAt(i, 0, true);
          }
        }
      }
    }

    function FindCamData(e) {
      $('#loading').show();

      var startdate;
      var enddate;

      if (e == "text_cam_name") {
        startdate = picker.getStartDate();
        enddate = picker.getEndDate();

        //picker2.setStartDate(startdate);
        //picker2.setEndDate(enddate);
      }
      else {
        startdate = picker2.getStartDate();
        enddate = picker2.getEndDate();

        picker.setStartDate(startdate);
        picker.setEndDate(enddate);
      }
      var year = startdate.getFullYear();
      var month = startdate.getMonth() + 1;
      var day = startdate.getDate();

      if (Number(month) < 10)
        month = '0' + month;
      if (Number(day) < 10)
        day = '0' + day;

      var startfullDate = String(year) + String(month) + String(day);

      year = enddate.getFullYear();
      month = enddate.getMonth() + 1;
      day = enddate.getDate();

      if (Number(month) < 10)
        month = '0' + month;
      if (Number(day) < 10)
        day = '0' + day;

      var endfullDate = String(year) + String(month) + String(day);
      var btMs = enddate.getTime() - startdate.getTime();
      var btDay = parseInt(btMs / (1000 * 60 * 60 * 24)) + 1;
      var btDays = btMs / (1000 * 60 * 60 * 24) + 1;

      requestDuration(startfullDate, endfullDate, btDay, e);
    }

    function conv(text, days) {
      var num = Number(text);

      return num * days;
    }

    function loadDataFile(text, days) {

      gridPersonTotalData = [];
      gridVehicleTotalData = [];

      if (days == null)
        days = 1;

      gridData = JSON.parse(text);
      gridData.vehicle_total = "";

      if (gridData.length == 0) {

        var ObjGrid = new_O_Object();
        var Obj = new_OT_Object();
        var vObj = new_VT_Object();

        gridData.push(ObjGrid);

        //gridData.push(ObjGrid);

        gridPersonTotalData.push(Obj);
        gridVehicleTotalData.push(vObj);
      }
      else {
        var t_male = 0;
        var t_female = 0;
        var t_young = 0;
        var t_adult = 0;
        var t_middle = 0;
        var t_senior = 0;
        var t_total = 0;
        var t_mask = 0;

        var t_car = 0;
        var t_bus = 0;
        var t_truck = 0;
        var t_motorcycle = 0;
        var t_bucycle = 0;
        var t_v_total = 0;

        for (var i = 0; i < gridData.length; i++) {
          var num = 0;
          var vNum = 0;

          gridData[i].PERSON_MALE = gridData[i].PERSON_MALE * days;
          gridData[i].PERSON_FEMALE = gridData[i].PERSON_FEMALE * days;
          gridData[i].FACE_YOUNG = gridData[i].FACE_YOUNG * days;
          gridData[i].FACE_ADULT = gridData[i].FACE_ADULT * days;
          gridData[i].FACE_MIDDLE = gridData[i].FACE_MIDDLE * days;
          gridData[i].FACE_SENIOR = gridData[i].FACE_SENIOR * days;
          gridData[i].VEHICLE_CAR = gridData[i].VEHICLE_CAR * days;
          gridData[i].VEHICLE_BUS = gridData[i].VEHICLE_BUS * days;
          gridData[i].VEHICLE_TRUCK = gridData[i].VEHICLE_TRUCK * days;
          gridData[i].VEHICLE_MOTORCYCLE = gridData[i].VEHICLE_MOTORCYCLE * days;
          gridData[i].VEHICLE_BICYCLE = gridData[i].VEHICLE_BICYCLE * days;


          num += Number(gridData[i].PERSON_MALE);
          num += Number(gridData[i].PERSON_FEMALE);
          num += Number(gridData[i].FACE_YOUNG);
          num += Number(gridData[i].FACE_ADULT);
          num += Number(gridData[i].FACE_MIDDLE);
          num += Number(gridData[i].FACE_SENIOR);


          vNum += Number(gridData[i].VEHICLE_CAR);
          vNum += Number(gridData[i].VEHICLE_BUS);
          vNum += Number(gridData[i].VEHICLE_TRUCK);
          vNum += Number(gridData[i].VEHICLE_MOTORCYCLE);
          vNum += Number(gridData[i].VEHICLE_BICYCLE);


          t_male += Number(gridData[i].PERSON_MALE);
          t_female += Number(gridData[i].PERSON_FEMALE);
          t_young += Number(gridData[i].FACE_YOUNG);
          t_adult += Number(gridData[i].FACE_ADULT);
          t_middle += Number(gridData[i].FACE_MIDDLE);
          t_senior += Number(gridData[i].FACE_SENIOR);
          t_mask += Number(gridData[i].FACE_MASK);


          t_car += Number(gridData[i].VEHICLE_CAR)
          t_bus += Number(gridData[i].VEHICLE_BUS)
          t_truck += Number(gridData[i].VEHICLE_TRUCK)
          t_motorcycle += Number(gridData[i].VEHICLE_MOTORCYCLE)
          t_bucycle += Number(gridData[i].VEHICLE_BICYCLE)

          gridData[i].TOTAL = String(num);
          gridData[i].VEHICLE_TOTAL = String(vNum);

          t_total += num;
          t_v_total += vNum;
        }



        var Obj = new_OT_Object();
        Obj.total_male = String(t_male);
        Obj.total_female = String(t_female);
        Obj.total_young = String(t_young);
        Obj.total_adult = String(t_adult);
        Obj.total_middle = String(t_middle);
        Obj.total_senior = String(t_senior);
        Obj.total_total = String(t_total);
        Obj.total_mask = String(t_mask);

        var vObj = new_VT_Object();
        vObj.total_car = String(t_car);
        vObj.total_bus = String(t_bus);
        vObj.total_truck = String(t_truck);
        vObj.total_motorcycle = String(t_motorcycle);
        vObj.total_bicycle = String(t_bucycle);
        vObj.total_total = String(t_v_total);

        gridPersonTotalData.push(Obj);
        gridVehicleTotalData.push(vObj);
      }



      setObjectPerson();
      //setObjectVehile();

      setObjectPersonTotal();
      //setObjectVehicleTotal();
    }

    function setObjectPersonTotal() {

      if (grid_object_person_total != null) grid_object_person_total.destroy();
      grid_object_person_total = null;


      grid_object_person_total = new tui.Grid({
        el: document.getElementById('grid_object_person_total'),

        data: gridPersonTotalData,
        scrollX: false,
        scrollY: false,

        rowHeight: 47,
        width: 1630,
        bodyHeight: 47,
        minBodyHeight: 40,
        header: {
          height: '0px',
        },
        columns: [
          {
            align: 'left',
            name: 'total_title',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            width: 280
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_male',
            width: 167
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_female',
            width: 167
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_young',
            width: 167
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_adult',
            width: 167
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_middle',
            width: 167
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_senior',
            width: 167
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_total',
            width: 167
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_mask',
            width: 163
          }
          // ,
          // {
          //   align: 'right',
          //   renderer: {
          //     styles: {
          //       color: '#349fc0',
          //     },
          //   },
          //   name: 'total_attention',
          //   width: 148
          // }
        ],
      });
    }

    function setObjectVehicleTotal() {


      if (grid_object_vehicle_total != null) grid_object_vehicle_total.destroy();
      grid_object_vehicle_total = null;

      grid_object_vehicle_total = new tui.Grid({
        el: document.getElementById('grid_object_vehicle_total'),
        data: gridVehicleTotalData,
        scrollX: false,
        scrollY: false,

        rowHeight: 47,
        width: 1630,
        bodyHeight: 47,
        minBodyHeight: 40,
        header: {
          height: '0px',
        },
        columns: [
          {
            align: 'left',
            name: 'total_title',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            width: 280
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_car',
            width: 222
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_bus',
            width: 222
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_truck',
            width: 222
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_motorcycle',
            width: 222
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_bicycle',
            width: 222
          },
          {
            align: 'right',
            renderer: {
              styles: {
                color: '#349fc0',
              },
            },
            name: 'total_total',
            width: 222
          },
        ],

      });

    }

    function setObjectPerson() {

      if (grid != null) grid.destroy();
      grid = null;


      var bScroll = false;
      if (Object.keys(gridData).length > 15)
        bScroll = true;

      grid = new tui.Grid({
        el: document.getElementById('grid_object'),
        data: gridData,
        scrollX: false,
        scrollY: bScroll,

        //rowHeaders: ["rowNum"],
        rowHeight: 47,
        width: 1630,
        bodyHeight: 705,

        columns: [
          {
            align: 'left',
            header: '카메라명',
            name: 'CAMERA_NAME',
            sortingType: 'desc',
            sortable: true,
            default: '-',
            width: 280
          },
          {
            align: 'right',
            header: '남자',
            name: 'PERSON_MALE',
            default: '-',
            sortingType: 'desc',
            sortable: true,
          },
          {
            align: 'right',
            header: '여자',
            name: 'PERSON_FEMALE',
            sortable: true,
            sortingType: 'desc',
          },
          {
            align: 'right',
            header: '미성년',
            name: 'FACE_YOUNG',
            sortingType: 'desc',
            sortable: true,
            default: '-',
          },
          {
            align: 'right',
            header: '청년',
            name: 'FACE_ADULT',
            sortingType: 'desc',
            sortable: true,
          },
          {
            align: 'right',
            header: '중·장년',
            name: 'FACE_MIDDLE',
            sortingType: 'desc',
            sortable: true,
          },
          {
            align: 'right',
            header: '노년',
            name: 'FACE_SENIOR',
            sortingType: 'desc',
            sortable: true,
          },
          {
            align: 'right',
            header: 'TOTAL',
            name: 'TOTAL',
            sortingType: 'desc',
            sortable: true,
            renderer: {
              styles: {
                color: '#349fc0',
              },
            }
          },
          {
            align: 'right',
            header: '마스크착용',
            name: 'FACE_MASK',
            sortingType: 'desc',
            sortable: true,
          }
          // ,
          // {
          //   align: 'center',
          //   header: '주의인물',
          //   name: 'attention',
          //   sortingType: 'desc',
          // }
        ],

      });

    }

    function setObjectVehile() {

      if (grid_view2 != null) grid_view2.destroy();
      grid_view2 = null;

      var bScroll_subObj = false;
      if (Object.keys(gridData).length > 15)
        bScroll_subObj = true;

      grid_view2 = new tui.Grid({
        el: document.getElementById('grid_object_view2'),
        data: gridData,
        scrollX: false,
        scrollY: bScroll_subObj,

        //rowHeaders: ["rowNum"],
        rowHeight: 47,
        width: 1630,
        bodyHeight: 705,

        columns: [
          {
            align: 'left',
            header: '카메라명',
            name: 'CAMERA_NAME',
            sortingType: 'desc',
            sortable: true,

            width: 280
          },
          {
            align: 'right',
            header: '자동차',
            name: 'VEHICLE_CAR',
            sortingType: 'desc',
            sortable: true,
          },
          {
            align: 'right',
            header: '버스',
            name: 'VEHICLE_BUS',
            sortingType: 'desc',
            sortable: true,
          },
          {
            align: 'right',
            header: '트럭',
            name: 'VEHICLE_TRUCK',
            sortingType: 'desc',
            sortable: true,
          },
          {
            align: 'right',
            header: '오토바이',
            name: 'VEHICLE_MOTORCYCLE',
            sortingType: 'desc',
            sortable: true,
          },
          {
            align: 'right',
            header: '자전거',
            name: 'VEHICLE_BICYCLE',
            sortingType: 'desc',
            sortable: true,
          },
          {
            align: 'right',
            header: 'TOTAL',
            name: 'VEHICLE_TOTAL',
            sortingType: 'desc',
            sortable: true,
            renderer: {
              styles: {
                color: '#349fc0',
              },
            }
          },
        ],

      });

    }


    window.onload = function () {

      $('#loading').hide();

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
            background: "#252525",
            border: '#2d2d2d',
            text: '#c5c5c5',
            showHorizontalBorder: true,
            showVerticalBorder: true,
          },
          header: {
            background: "#1a1a1a",
            border: "#2d2d2d",
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
          thumb: "#838383",
          active: "#aaa",
        },
      });


      readTextFile("./data/dailyCountByCamera.json", loadDataFile);


      var today = new Date();
      picker = tui.DatePicker.createRangePicker({
        language: 'ko',


        startpicker: {
          date: today,
          input: '#startpicker-input',
          container: '#startpicker-container',
        },
        endpicker: {
          date: today,
          input: '#endpicker-input',
          container: '#endpicker-container'
        },
        format: 'yyyy년 MM월 dd일',
        selectableRanges: [
          [new Date(2000, 1, 1), new Date(today.getFullYear() + 1, today.getMonth(), today.getDate())]
        ]
      });



      var today2 = new Date();
      picker2 = tui.DatePicker.createRangePicker({
        language: 'ko',


        startpicker: {
          date: today2,
          input: '#startpicker-input2',
          container: '#startpicker-container2',
        },
        endpicker: {
          date: today2,
          input: '#endpicker-input2',
          container: '#endpicker-container2'
        },
        format: 'yyyy년 MM월 dd일',
        selectableRanges: [
          [new Date(2000, 1, 1), new Date(today2.getFullYear() + 1, today2.getMonth(), today2.getDate())]
        ]
      });
      
		
    }
    window.addEventListener('load', function () {
      var allElements = document.getElementsByTagName('*');
      Array.prototype.forEach.call(allElements, function (el) {
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

    function OnCSV_OK()
		{
			if( show_object_page == 1 ){

        var start_pick = document.getElementById('startpicker-input').value;
        var start_txt = 'From : ' + start_pick;
        var end_pick = document.getElementById('endpicker-input').value;
        var end_txt = 'To : ' + end_pick;

        var header_from = {
          CAMERA_NAME: start_txt
        }
				var header_to = {	
          CAMERA_NAME: end_txt
				};

				var itemsFormatted = [];
				var itemsNotFormatted = [];        

				var headers = {						
					CAMERA_NAME: '카메라명'.replace(/,/g, ''), // remove commas to avoid errors
					PERSON_MALE: '남성',
					PERSON_FEMALE: '여성',
					FACE_YOUNG: '미성년',
					FACE_ADULT: '청년',
					FACE_MIDDLE: '중장년',
					FACE_SENIOR: '노년',
					TOTAL: '합계',
					FACE_MASK: '마스크착용',					
				};

				itemsNotFormatted = gridData;

				// format the data
				itemsNotFormatted.forEach((item) => {
					itemsFormatted.push({
						CAMERA_NAME: item.CAMERA_NAME.replace(/,/g, ''), // remove commas to avoid errors,
						PERSON_MALE: item.PERSON_MALE,
						PERSON_FEMALE: item.PERSON_FEMALE,
						FACE_YOUNG: item.FACE_YOUNG,
						FACE_ADULT: item.FACE_ADULT,
						FACE_MIDDLE: item.FACE_MIDDLE,
						FACE_SENIOR: item.FACE_SENIOR,
						TOTAL: item.TOTAL,
						FACE_MASK: item.FACE_MASK					
					});
				});

				var fileTitle = '사람_카메라정보_' + getDateStr();
				exportCSVFilePeriod(header_from, header_to, headers, itemsFormatted, fileTitle);	
			}else{			// show_page == 2
        var start_pick = document.getElementById('startpicker-input2').value;
        var start_txt = 'From : ' + start_pick;
        var end_pick = document.getElementById('endpicker-input2').value;
        var end_txt = 'To : ' + end_pick;

        var header_from = {
          CAMERA_NAME: start_txt
        }
				var header_to = {	
          CAMERA_NAME: end_txt
				};
        

			  var itemsFormatted = [];
				var itemsNotFormatted = [];

				var headers = {						
					CAMERA_NAME: '카메라명'.replace(/,/g, ''), // remove commas to avoid errors
					VEHICLE_CAR: '자동차',
					VEHICLE_BUS: '버스',
					VEHICLE_TRUCK: '트럭',
					VEHICLE_MOTORCYCLE: '오토바이',
					VEHICLE_BICYCLE: '자전거',
					VEHICLE_TOTAL: '합계',					
				};

				itemsNotFormatted = gridData;

				// format the data
				itemsNotFormatted.forEach((item) => {
					itemsFormatted.push({
						CAMERA_NAME: item.CAMERA_NAME.replace(/,/g, ''), // remove commas to avoid errors,
						VEHICLE_CAR: item.VEHICLE_CAR,
						VEHICLE_BUS: item.VEHICLE_BUS,
						VEHICLE_TRUCK: item.VEHICLE_TRUCK,
						VEHICLE_MOTORCYCLE: item.VEHICLE_MOTORCYCLE,
						VEHICLE_BICYCLE: item.VEHICLE_BICYCLE,
						VEHICLE_TOTAL: item.VEHICLE_TOTAL,								
					});
				});

				var fileTitle = '차량_카메라정보_' + getDateStr();
				exportCSVFilePeriod(header_from, header_to, headers, itemsFormatted, fileTitle);	
			}
    }

    function HumanPageShow()
    {
      show_object_page = 1;
    }

    function VehiclePageShow()
    {
      show_object_page = 2
    }


      // input date태그 기본값 변경
      document.getElementById('startpicker-input').value = new Date().toISOString().substring(0, 10);	
      document.getElementById('endpicker-input').value = new Date().toISOString().substring(0, 10);	
  </script>
</body>

</html>