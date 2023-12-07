
  setTimeout(setInterval( getTime, 10), 100);

	function getTime() {
		var d = new Date();	// 현재 날짜와 시간
		var year = d.getFullYear();		// 시
		var month = d.getMonth()+1;		// 시
		var day = d.getDate();		// 시

		var hur = d.getHours();		// 시
		var min = d.getMinutes();	//분
		var sec = d.getSeconds();	//초

		
		var timeBoard = document.getElementById("time_title"); // 값이 입력될 공간

		if(timeBoard == null)
		{
			return;
		}

		if (Number(month) < 10)
			month = '0' + month;

		if (Number(day) < 10)
			day = '0' + day;

		if (Number(hur) < 10)
			hur = '0' + hur;

		if (Number(min) < 10)
			min = '0' + min;

		if (Number(sec) < 10)
			sec = '0' + sec;

		//var startfullDate = String(year) + String(month) + String(day);
		var time = year + "-" + month + "-" + day + " "+ hur + ":" + min + ":" + sec // 형식 지정
		timeBoard.innerText = time;	// 출력
	}



function readTextFile(file, callback) {
    var rawFile = new XMLHttpRequest();
    rawFile.overrideMimeType("application/json");
    rawFile.open("GET", file, true);
    rawFile.onreadystatechange = function () {
      if (rawFile.readyState === 4 && rawFile.status == "200") {
        callback(rawFile.responseText);
      }
    }
    rawFile.send(null);
  }


  
  function struct_Object() {
    var value, data;//new 이후에 넣어주어야 한다.
  }

  function new_OT_Object() {
    var a = new struct_Object();
    a.total_title = "전체 카메라 총계"
    a.total_male = 0;
    a.total_female = 0;
    a.total_young = 0;
    a.total_adult = 0;
    a.total_middle = 0;
    a.total_senior = 0;
    a.total_total = 0;
    return a;
  }

  function new_O_Object() {
    var a = new struct_Object();
    a.CAMERA_NAME = "-"
    a.PERSON_MALE = "-";
    a.PERSON_FEMALE = "-";
    a.FACE_YOUNG = "-";
    a.FACE_ADULT = "-";
    a.FACE_MIDDLE = "-";
    a.FACE_SENIOR = "-";
    a.TOTAL = "-";
    a.FACE_MASK = "-";
    a.VEHICLE_CAR = "-";
    a.VEHICLE_BUS = "-";
    a.VEHICLE_TRUCK = "-";
    a.VEHICLE_MOTORCYCLE = "-";
    a.VEHICLE_BICYCLE = "-";
    a.VEHICLE_TOTAL = "-";
    return a;
  }

  function new_VT_Object() {
    var a = new struct_Object();
    a.total_title = "전체 카메라 총계"
    a.total_car = 0;
    a.total_bus = 0;
    a.total_truck = 0;
    a.total_motorcycle = 0;
    a.total_bicycle = 0;
    a.total_total = 0;
    return a;
  }


  function new_SubEvtTotal() {
    var a = new struct_Object();
    a.total_title = "전체 카메라 총계"
    a.total_intru =0;
    a.total_loit =0;
    a.total_cnt =0;
    a.total_fallen =0;
    a.total_person = 0;
    a.total_face =0;
    a.total_vehicle =0;
    return a;
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
        var bFind = false;
        for(var j=0; j<array.length; j++)
        {
          if( array[j].hour == i)
          {
            bFind = true;
            // arrtemp.push({
            //   hour: i,
            //   cnt: array[j].cnt });
            // break;
          }
        }
        if(bFind==false)
        {
          array.push({
            hour: i,
            cnt: 0 });
        }
        
      }

      // 재정렬
      array.sort(hourlyArraySort);
    }
  }


  
  var select_type;
  var top10_camera_grid = null;
  var top10_camera_grid_car = null;

  

  function showTop10Cameras()
  {			
    if( top10_camera_grid != null){
      top10_camera_grid.destroy();
      top10_camera_grid = null;
    }
    
    const el = document.getElementById('subTop10Cameras');
    var data = jsonTop10CtrlCamera;
    const columns = [
      {
        align: 'left',
        header: '카메라명',
        name: 'CAMERA_NAME',
        sortingType: 'desc',
        width: 400,
      },
      {
        align: 'center',
        header: '사람',
        name: 'PERSON',
        sortingType: 'desc',
        defaultValue: '-',
      },
      {
        align: 'center',
        header: '얼굴',
        name: 'FACE',
        sortingType: 'desc',
        defaultValue: '-',
      },
     /* {
        align: 'right',
        header: '침입',
        name: 'INV_CNT',
        sortingType: 'desc',
        defaultValue: '-',
      },
      {
        align: 'right',
        header: '배회',
        name: 'LOT_CNT',
        sortingType: 'desc',
        defaultValue: '-',
      },
      {
        align: 'right',
        header: '쓰러짐',
        name: 'FAL_CNT',
        sortingType: 'desc',
        defaultValue: '-',
      },
      {
        align: 'right',
        header: '카운팅',
        name: 'CNT_CNT',
        sortingType: 'desc',
        defaultValue: '-',
      },*/
    ];
    
    top10_camera_grid = new tui.Grid({
      el,
      data, 
      scrollX: false,
      scrollY: false,
      //rowHeight: 18,
      //minRowHeight: 34,
      rowHeight: 25,
      minRowHeight: 34,
      width: 805,
      bodyHeight: 340,
      columns
    });
  }

  function showTop10CamerasCar()	
		{
			if( top10_camera_grid_car != null){
				top10_camera_grid_car.destroy();
				top10_camera_grid_car = null;
			}
			
			const el = document.getElementById('subTop10CamerasCar');
			var data = jsonTop10VehicleCamera;

			const columns = [
				{
					align: 'left',
					header: '카메라명',
					name: 'CAMERA_NAME',
					sortingType: 'desc',
					width: 180,
				},
				{
					align: 'right',
					header: '자동차',
					name: 'VEHICLE_CAR',
					sortingType: 'desc',
					defaultValue: '-',
				},
				{
					align: 'right',
					header: '버스',
					name: 'VEHICLE_BUS',
					sortingType: 'desc',
					defaultValue: '-',
				},
				{
					align: 'right',
					header: '트럭',
					name: 'VEHICLE_TRUCK',
					sortingType: 'desc',
					defaultValue: '-',
				},
				{
					align: 'right',
					header: '오토바이',
					name: 'VEHICLE_MOTORCYCLE',
					sortingType: 'desc',
					defaultValue: '-',
				},
				{
					align: 'right',
					header: '자전거',
					name: 'VEHICLE_BICYCLE',
					sortingType: 'desc',
					defaultValue: '-',
				},				
			];
			
			top10_camera_grid_car = new tui.Grid({
				el,
				data, 
				scrollX: false,
				scrollY: false,
				//rowHeight: 18,
				//minRowHeight: 34,
				rowHeight: 25,
				minRowHeight: 34,
				width: 805,
				bodyHeight: 340,
				columns
			});
		}

    function saveCameraData(text) {
			grid_data = JSON.parse(text); 
			
			var temp = grid_data;			
			// 카메라 정렬	
			if( select_type == 1){
				jsonTop10CtrlCamera  = [];
				temp.sort(function (a, b) {
					return parseFloat(a.PERSON_RANK) - parseFloat(b.PERSON_RANK);
				});	
				for (var i = 0; i < temp.length; i++) {
					if (i == 10) break;
					jsonTop10CtrlCamera.push(temp[i]);
				}					
				showTop10Cameras();
			}else{
				jsonTop10VehicleCamera = [];
				temp.sort(function (a, b) {
					return parseFloat(a.VEHICLE_RANK) - parseFloat(b.VEHICLE_RANK);
				});	
				for (var i = 0; i < temp.length; i++) {
					if (i == 10) break;
					jsonTop10VehicleCamera.push(temp[i]);
				}					 
				showTop10CamerasCar();
			}	
		}


    function setMainEventTop10()
		{
			select_type = 1;
			subTop10CamerasCar.style.display = "none";
			subTop10Cameras.style.display = "block";

			/*var btnEvt = document.getElementById('changeEvent_btn');
			btnEvt.src = "./img/btn_human_on.png";
			var btnCar = document.getElementById('changeVehicle_btn');
			btnCar.src = "./img/btn_car.png";	*/
			// 초기화			
			readTextFile("/data/dailyCountByCamera.json", saveCameraData);	
		}

		function setMainVehicleTop10()
		{
			select_type = 2;
			subTop10Cameras.style.display = "none";
			subTop10CamerasCar.style.display = "block";

			var btnEvt = document.getElementById('changeEvent_btn');
			btnEvt.src = "./img/btn_human.png";
			var btnCar = document.getElementById('changeVehicle_btn');
			btnCar.src = "./img/btn_car_on.png";
			
			// 초기화			
			readTextFile("/data/dailyCountByCamera.json", saveCameraData);	
		}
      
    function closeMainWindow()      // 페이지 종료 함수
    {			
      window.close();
      self.close();
      window.opener = window.location.herf; self.close();
      window.open('about:blank', '_self').close();
    }



    		// 객체
var objectPerson = 0, objectVehicle = 0, objectFace = 0, objectLPR = 0;
		// 이벤트 발생 비율
var eventIntrusion = 0, eventLoitering = 0, eventCounting = 0, eventFalldown = 0;


//Listener에서 inc_side.html 로드 후 실행됨
function saveDailyData(text) {
  jsonDailyCount = JSON.parse(text); 
  //console.log(jsonDailyCount);

  // 초기화
  maleYoung = 0, femaleYoung = 0;
  maleAdult = 0, femaleAdult = 0;
  maleMiddle = 0, femaleMiddle = 0;
  maleSenior = 0, femaleSenior = 0;

  vehicleCar = 0, vehicleBus = 0, vehicleTruck = 0, vehicleMotorcycle = 0, vehicleBicycle = 0;

  noMaskMaleYoung = 0, noMaskFemaleYoung = 0;
  noMaskMaleAdult = 0, noMaskFemaleAdult = 0;
  noMaskMaleMiddle = 0, noMaskFemaleMiddle = 0;
  noMaskMaleSenior = 0, noMaskFemaleSenior = 0;

  objectPerson = 0, objectVehicle = 0, objectFace = 0, objectLPR = 0;
  eventIntrusion = 0, eventLoitering = 0, eventCounting = 0, eventFalldown = 0;

  jsonDailyCount.forEach(function(value, index, array) {

    // 사람(얼굴)
    maleYoung += parseInt(jsonDailyCount[index].FACE_YOUNGMALE);
    maleAdult += parseInt(jsonDailyCount[index].FACE_ADULTMALE);
    maleMiddle += parseInt(jsonDailyCount[index].FACE_MIDDLEMALE);
    maleSenior += parseInt(jsonDailyCount[index].FACE_SENIORMALE);
    femaleYoung += parseInt(jsonDailyCount[index].FACE_YOUNGFEMALE);
    femaleAdult += parseInt(jsonDailyCount[index].FACE_ADULTFEMALE);
    femaleMiddle += parseInt(jsonDailyCount[index].FACE_MIDDLEFEMALE);
    femaleSenior += parseInt(jsonDailyCount[index].FACE_SENIORFEMALE);

    // 차량
    vehicleCar += parseInt(jsonDailyCount[index].VEHICLE_CAR);
    vehicleBus += parseInt(jsonDailyCount[index].VEHICLE_BUS);
    vehicleTruck += parseInt(jsonDailyCount[index].VEHICLE_TRUCK);
    vehicleMotorcycle += parseInt(jsonDailyCount[index].VEHICLE_MOTORCYCLE);
    vehicleBicycle += parseInt(jsonDailyCount[index].VEHICLE_BICYCLE);

    // 마스크 미착용자
    noMaskMaleYoung += parseInt(jsonDailyCount[index].FACE_NOMASKMALEYOUNG);
    noMaskMaleAdult += parseInt(jsonDailyCount[index].FACE_NOMASKMALEADULT);
    noMaskMaleMiddle += parseInt(jsonDailyCount[index].FACE_NOMASKMALEMIDDLE);
    noMaskMaleSenior += parseInt(jsonDailyCount[index].FACE_NOMASKMALESENIOR);
    noMaskFemaleYoung += parseInt(jsonDailyCount[index].FACE_NOMASKFEMALEYOUNG);
    noMaskFemaleAdult += parseInt(jsonDailyCount[index].FACE_NOMASKFEMALEADULT);
    noMaskFemaleMiddle += parseInt(jsonDailyCount[index].FACE_NOMASKFEMALEMIDDLE);
    noMaskFemaleSenior += parseInt(jsonDailyCount[index].FACE_NOMASKFEMALESENIOR);
    

    // 전체
    objectPerson += parseInt(jsonDailyCount[index].PERSON);
    objectVehicle += parseInt(jsonDailyCount[index].VEHICLE);
    objectFace += parseInt(jsonDailyCount[index].FACE);
    objectLPR += parseInt(jsonDailyCount[index].LPR);

    eventIntrusion += parseInt(jsonDailyCount[index].INV_CNT);
    eventLoitering += parseInt(jsonDailyCount[index].LOT_CNT);
    eventCounting += parseInt(jsonDailyCount[index].CNT_CNT);
    eventFalldown += parseInt(jsonDailyCount[index].FAL_CNT);
  });


  var file = location.pathname.substring(1);

  var bMain = false;
  if (file == "main.html")
    bMain = true;

  if (bMain) {
    // 사람 누적
    var innerBoxDivHuman = document.getElementsByClassName('innerBox divHuman')[0];
    var spanPersonData = innerBoxDivHuman.querySelector('span');
    spanPersonData.innerText = addComma(objectPerson);

    human_chart.setData({
      categories: ['노년', '중장년', '청년', '미성년'],
      series: [
        {
          name: '남자',
          data: [maleSenior, maleMiddle, maleAdult, maleYoung]
        },
        {
          name: '여자',
          data: [femaleSenior, femaleMiddle, femaleAdult, femaleYoung]
        }
      ]
    });


    // 차량 누적
    /*var innerBoxDivCar = document.getElementsByClassName('innerBox divCar')[0];
    var spanVehicleData = innerBoxDivCar.querySelector('span');
    spanVehicleData.innerText = addComma(objectVehicle);
    
    vehicle_chart.setData({
      series: [
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
      ]
    });*/

    mask_chart1.setData({
      series: [
        {
          name: '미성년',
          data: noMaskMaleYoung,
        },
        {
          name: '청년',
          data: noMaskMaleAdult,
        },
        {
          name: '중장년',
          data: noMaskMaleMiddle,
        },
        {
          name: '노년',
          data: noMaskMaleSenior,
        }
      ]
    });

    mask_chart2.setData({
      series: [
        {
          name: '미성년',
          data: noMaskFemaleYoung,
        },
        {
          name: '청년',
          data: noMaskFemaleAdult,
        },
        {
          name: '중장년',
          data: noMaskFemaleMiddle,
        },
        {
          name: '노년',
          data: noMaskFemaleSenior,
        }
      ]
    });

    /*event_ratio_chart.setData({
      series: [
        {
          name: '칩입',
          data: eventIntrusion,
        },
        {
          name: '배회',
          data: eventLoitering,
        },
        {
          name: '카운팅',
          data: eventCounting,
        },
        {
          name: '쓰러짐',
          data: eventFalldown,
        }
      ]
    });*/
  }

  setTotalData(objectPerson, objectVehicle, objectFace, objectLPR, eventIntrusion, eventLoitering, eventCounting, eventFalldown);
}


function setTotalData(objectPerson, objectVehicle, objectFace, objectLPR, eventIntrusion, eventLoitering, eventCounting, eventFalldown) {
  var detectDetail = document.getElementsByClassName('DetectDetail');

  if( detectDetail.length == 0 )
    return;

  var arrTotalCnt = detectDetail[0].getElementsByTagName('dd');
  arrTotalCnt[0].innerText = (objectPerson + ' 건');

  //var arrTotalCnt = detectDetail[1].getElementsByTagName('dd');
  //arrTotalCnt[0].innerText = (objectVehicle + ' 건');

  var arrTotalCnt = detectDetail[1].getElementsByTagName('dd');
  arrTotalCnt[0].innerText = (objectFace + ' 건');

  /*
  var arrTotalCnt = detectDetail[3].getElementsByTagName('dd');
  arrTotalCnt[0].innerText = (objectLPR + ' 건');

  var arrTotalCnt = detectDetail[4].getElementsByTagName('dd');
  arrTotalCnt[0].innerText = (eventIntrusion + ' 건');

  var arrTotalCnt = detectDetail[5].getElementsByTagName('dd');
  arrTotalCnt[0].innerText = (eventLoitering + ' 건');

  var arrTotalCnt = detectDetail[6].getElementsByTagName('dd');
  arrTotalCnt[0].innerText = (eventCounting + ' 건');

  var arrTotalCnt = detectDetail[7].getElementsByTagName('dd');
  arrTotalCnt[0].innerText = (eventFalldown + ' 건');*/
}

function addComma(num)
{
  var numToStr = String(num);
  for( var i=numToStr.length-3; i > 0; i -= 3 )
  {
    if( i <= 0 )
      break;

    numToStr = [numToStr.slice(0, i), ',', numToStr.slice(i)].join('');
  }

  return numToStr;
}	

//1분 주기로 당일 데이터 리로드 
//setInterval(jsonReloadDailyData, 60 * 1000);

//당일 데이터 로드
function jsonReloadDailyData() {
  readTextFile("/data/dailyCount.json", saveDailyData);
}

function calendarToday() {
  // 날짜
  var today = new Date();
  var year = today.getFullYear();
  var month = today.getMonth() + 1;
  var day = today.getDate();
  // 날짜 및 캘린더
  var mainDate = document.getElementById('mainDate');
  mainDate.innerText = year + '년 ' + month + '월 ' + day + '일';
}




function setCameraGroupData(textGroup, textCameras)
{
  GroupDataObj = JSON.parse(textGroup);
  CamDataObj = JSON.parse(textCameras);

  var ch_LiveCam = document.getElementById('LiveCamera');

  //전체 카메라 수
  var nTotalNumOfel = 0;

  for( var groupData of GroupDataObj )
  {
    var newDiv = document.createElement('div');       //element 만들기
    newDiv.className = 'ch-Group';                    //class name
    var newText = document.createTextNode(groupData.ai_group_name);   //<div>에 들어갈 text node 만들기
    newDiv.appendChild(newText);                      //<div>에 text node 붙이기
    ch_LiveCam.appendChild(newDiv);

    var numOfel = 0;
    for( var camData of CamDataObj )
    {
      if( groupData.ai_group_code == camData.ai_group_code )
      {
        numOfel++;
      }
    }

    newDiv = document.createElement('dl');       
    newDiv.className = 'ch-Live';                

    newSig = document.createElement('dt');       
    newSig.className = 'signalOK';        
    newText = document.createTextNode(addComma(numOfel) + " CH");
    newSig.appendChild(newText);

    newDiv.appendChild(newSig);

    ch_LiveCam.appendChild(newDiv);

    nTotalNumOfel += numOfel;
  }

  var ch_total = document.getElementsByClassName('ch-Total');
  ch_total[0].innerText = ('Total' + " " + addComma(nTotalNumOfel)+ " "+"CH");

  /*
  var ch_LiveCam = document.getElementsByClassName('LiveCamera');

  GroupDataObj.forEach(function(value, index, array) {
    var newDiv = document.createElement('div');       //element 만들기
    newDiv.className = 'ch-Group';                    //class name
    var newText = document.createTextNode('그룹명'+index);   //<div>에 들어갈 text node 만들기
    newDiv.appendChild(newText);                      //<div>에 text node 붙이기
    document.getElementById('LiveCamera').appendChild(newDiv);

    newDiv = document.createElement('dl');       
    newDiv.className = 'ch-Live';         
    newDiv.id = 'ch-Live'+index           
    document.getElementById('LiveCamera').appendChild(newDiv);

    newSig = document.createElement('dt');       
    newSig.className = 'signalOK';        
    newText = document.createTextNode('1,000');
    newSig.appendChild(newText);

    document.getElementById( 'ch-Live'+index ).appendChild(newSig);

  });

  var ch_grup = document.getElementsByClassName('ch-Group');
  var ch_grup_cam = document.getElementsByClassName('signalOK');

  //전체 카메라 수
  var nTotalNumOfel = 0;

  //그룹별
  GroupDataObj.forEach(function(value, index, array) {
    ch_grup[index].innerText = ( GroupDataObj[index].ai_group_name);


    //그룹 코드
    var GroupCode = GroupDataObj[index].ai_group_code;

    //각 그룹 코드별 카메라 수
    var numOfel = 0;

    //등록된 모든 카메라 순회
    CamDataObj.forEach(function(value, index, array) {

      //현재 순휘 카메라 그룹 코드
      var CamCroupCode = CamDataObj[index].ai_group_code;

      if(GroupCode == CamCroupCode)
      {
        numOfel++;
      }
    });

    //그룹 별 카메라 수 반영
    ch_grup_cam[index].innerText = (addComma(numOfel) +" " + 'CH');
    nTotalNumOfel += numOfel;
  });

  //전체 카메라 수 반영
  var ch_total = document.getElementsByClassName('ch-Total');
  ch_total[0].innerText = ('Total' + " " + addComma(nTotalNumOfel)+ " "+"CH");
    */
 
}



//카메라 그룹, 카메라 GET
function loadCameraGroupData() {
  var rawFile = new XMLHttpRequest();
  rawFile.overrideMimeType("application/json");
  rawFile.open("GET", "./data/selectCameraDef.json", true);
  rawFile.onreadystatechange = function () {
    if (rawFile.readyState === 4 && rawFile.status == "200") {

      var rawFile2 = new XMLHttpRequest();
      rawFile2.overrideMimeType("application/json");
      rawFile2.open("GET", "./data/selectCameraReg.json", true);
      rawFile2.onreadystatechange = function () {
        if (rawFile2.readyState === 4 && rawFile2.status == "200") {
          if(rawFile.responseText != "" &&  rawFile2.responseText != "")
          {
            setCameraGroupData(rawFile.responseText, rawFile2.responseText);
          }
        }
      }
      rawFile2.send(null);

    }
  }
  rawFile.send(null);
}

function ReqCameraGroupData(callback) {
  var xhttp = new XMLHttpRequest();
  var param = 'selectCameraDef?';

  var userid = sessionStorage.getItem('userId');

  param += ('userId=' + userid);
  xhttp.onreadystatechange = function () {

    console.log('userId = ' + userid);

    if (this.readyState == 4 && this.status == 200) {
      if (this.responseURL.includes('selectCameraDef')) {

        var rawFile = new XMLHttpRequest();
        rawFile.overrideMimeType("application/json");
        rawFile.open("GET", "./data/selectCameraDef.json", true);
        rawFile.onreadystatechange = function () {
          if (rawFile.readyState === 4 && rawFile.status == "200") {
            
            var xhttp2 = new XMLHttpRequest();
            var param2 = 'selectCameraReg?';
            param2 += ('userId=' + userid);
            xhttp2.onreadystatechange = function () {

              if (this.readyState == 4 && this.status == 200) {
                if (this.responseURL.includes('selectCameraReg')) {

                  var rawFile2 = new XMLHttpRequest();
                  rawFile2.overrideMimeType("application/json");
                  rawFile2.open("GET", "./data/selectCameraReg.json", true);
                  rawFile2.onreadystatechange = function () {
                    if (rawFile2.readyState === 4 && rawFile2.status == "200") {
                      //로그인 진행..
                      callback();
                    }
                  }
                  rawFile2.send(null);
                }
              }
            }
            xhttp2.open('GET', param2, true);
            xhttp2.send();
          }
        }
        rawFile.send(null);
      }
    }
  }
  xhttp.open('GET', param, true);
  xhttp.send();
}


// function OnClickCtrl() {
//   location.href = 'main.html';
// }

// function OnClickEvent() {
//   location.href = 'main_event.html';
// }

function OnClickDivide() {
  /*if (config_data[0].divide_page == "2") {
    location.href = 'main_camera_part2.html';
  } else if (config_data[0].divide_page == "4") {
    location.href = 'main_camera_part4.html';
  } else if (config_data[0].divide_page == "6") {
    location.href = 'main_camera_part6.html';
  } else if (config_data[0].divide_page == "8") {
    location.href = 'main_camera.html';
  }
  else {
    location.href = 'main_camera_part6.html';
  }*/
  location.href = 'main_camera_part2.html';
}


function GetTodayStr()
{
  var today = new Date();
  var today_year = today.getFullYear();
  var today_month = today.getMonth() + 1;
  var today_day = today.getDate();	

  if (Number(today_month) < 10)
    today_month = '0' + today_month;
  if (Number(today_day) < 10)
    today_day = '0' + today_day;
  var today_day_str = String(today_year) + String(today_month) + String(today_day);
  return today_day_str;
}
  



// input date태그 기본값 변경
document.getElementById('tui-date-picker-target').value = new Date().toISOString().substring(0, 10);