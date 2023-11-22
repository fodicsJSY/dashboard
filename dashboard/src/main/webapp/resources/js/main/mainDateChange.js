
/* 전역변수 시작 */
var forDate = document.getElementById('tui-date-picker-target').value
/* 전역변수 끝 */

/* 오늘 날짜로 초기화*/
// 페이지 로드 시 오늘 날짜로 초기화
document.addEventListener("DOMContentLoaded", function () {
    var today = new Date();
    var formattedDate = today.toISOString().substring(0, 10);
    document.getElementById('tui-date-picker-target').value = formattedDate;
    forDate = formattedDate; // forDate 초기화
});


//var formattedDate = year + '-' + month + '-' + day;


// 버튼 클릭 시 오늘 날짜를 입력 필드에 넣는 함수
function insertTodaysDate() {
    var today = new Date();
    var formattedDate = today.toISOString().substring(0, 10);
    document.getElementById('tui-date-picker-target').value = formattedDate;
    forDate = formattedDate; // forDate 업데이트
    console.log(forDate);
}

// 버튼 클릭 이벤트에 함수 연결
document.getElementById('todayBtn').addEventListener('click', function () {
    insertTodaysDate();
    sendToServer();
});

/* 오늘 날짜로 변경 끝 */


/* 하루 전 날짜로 변경 시작*/

// 버튼 클릭 시 입력된 날짜에서 하루 전 날짜를 계산하여 표시하는 함수
function showPreviousDay() {
    var inputDate = new Date(document.getElementById('tui-date-picker-target').value);
    inputDate.setDate(inputDate.getDate() - 1);
    var formattedDate = inputDate.toISOString().substring(0, 10);
    document.getElementById('tui-date-picker-target').value = formattedDate;
    forDate = formattedDate; // forDate 업데이트
    console.log(forDate);
}

// 버튼 클릭 이벤트에 함수 연결
document.getElementById('minusBtn').addEventListener('click', function () {
    showPreviousDay();
    sendToServer();
});

/* 하루 전 날짜로 변경 끝*/


/* 하루 지난 날짜로 변경 시작*/

// 버튼 클릭 시 입력된 날짜에서 하루 지난 날짜를 계산하여 표시하는 함수
function showNextDay() {
    var inputDate = new Date(document.getElementById('tui-date-picker-target').value);
    inputDate.setDate(inputDate.getDate() + 1);
    var formattedDate = inputDate.toISOString().substring(0, 10);
    document.getElementById('tui-date-picker-target').value = formattedDate;
    forDate = formattedDate; // forDate 업데이트
    console.log(forDate);
}

// 버튼 클릭 이벤트에 함수 연결
document.getElementById('plusBtn').addEventListener('click', function () {
    showNextDay();
    sendToServer();
});

/* 하루 지난 날짜로 변경 끝*/


/* 날짜 input값 바뀔때마다 서버로 보내기 */
document.getElementById('tui-date-picker-target').addEventListener('change', function () {
    sendToServer(this.value);
});

/* 전역변수 보내기 시작???? */
function sendToServer(value) {
    // 형식을 YYYYMMDD로 변경
    occuDate = formatToYYYYMMDD(value || forDate);
    console.log('Sending occuDate to server:', occuDate); // 콘솔에 occuDate 값 로그 출력
    // 서버로 데이터 전송
    $.ajax({
        url: '/dateChange',
        type: 'GET',
        data: { occuDate: occuDate },
        success: function (response) {
            console.log('Data sent successfully to server!');
            console.log(response);


            // 사람 막대 <-> 도넛 차트 숨기기
            human_chart.dispose();
            human_radial_bar_chart.dispose();


            // 라인 차트 숨기기
            myChart.dispose();
            // 남자도넛 그래프 숨기기
            manDountChart.dispose();
            //여자 도넛 그래프 숨기기
            womanDountChart.dispose();



            // 서버에서 받은 JSON 데이터를 사용
            // --------------------------------------------------------

            //메인페이지 사람 막대 차트(날짜 바꾸면~~)
            var DC_summaryChangeList = response.DC_summaryChangeList;
            let manList = [];
            let femaleList = [];
            //console.log(DC_summaryChangeList);
            //for문 사용해서 요소 꺼내기
            for (var i = 0; i < DC_summaryChangeList.length; i++) {
                var currentItem = DC_summaryChangeList[i];
                //console.log(currentItem);

                manList.push(
                    currentItem.face_youngMale
                    , currentItem.face_adultMale
                    , currentItem.face_middleMale
                    , currentItem.face_seniorMale
                );
                femaleList.push(
                    currentItem.face_youngFemale
                    , currentItem.face_adultFemale
                    , currentItem.face_middleFemale
                    , currentItem.face_seniorFemale
                );

                var face_youngMale = currentItem.face_youngMale || 0;
                var face_youngFemale = currentItem.face_youngFemale || 0;
                var face_adultMale = currentItem.face_adultMale || 0;
                var face_adultFemale = currentItem.face_adultFemale || 0;
                var face_middleMale = currentItem.face_middleMale || 0;
                var face_middleFemale = currentItem.face_middleFemale || 0;
                var face_seniorMale = currentItem.face_seniorMale || 0;
                var face_seniorFemale = currentItem.face_seniorFemale || 0;
                
                
                // currentItem의 속성에 접근 확인
                // console.log(currentItem.face_youngMale);
                // console.log(currentItem.face_youngFemale);
                // console.log(currentItem.face_adultMale);
                // console.log(currentItem.face_adultFemale);
                // console.log(currentItem.face_middleMale);
                // console.log(currentItem.face_middleFemale);
                // console.log(currentItem.face_seniorMale);
                // console.log(currentItem.face_seniorFemale);
            }
            // 콘솔확인
            // console.log("femaleList : " +femaleList);
            // console.log("manList : "+manList);
            

            /* 사람 막대차트 */
            //  준비한 DOM 컨테이너에서 echarts 초기화하기
            var human_chartChange = echarts.init(document.getElementById('mainPerson_chart'))

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
                    textStyle: {
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
                        data: manList
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
                        data: femaleList
                    }

                ]
            };

            //  차트 옵션 설정하기
            human_chartChange.setOption(option)


            var currentChart = 'bar'; // 초기에는 막대형 차트를 표시

            // 초기 차트 설정
            // renderBarChart();

            document.getElementById("graphChange").addEventListener("click", ()=>{
                if (currentChart === 'bar') {
                    currentChart = 'radial';
                    renderRadialBarChartChange();
                } else {
                    currentChart = 'bar';
                    renderBarChartChange();
                }

            });

            var human_chartChange = echarts.init(document.getElementById('mainPerson_chart'));
            var human_radial_bar_chartChange = echarts.init(document.getElementById('mainPerson_chart'));

            function renderBarChartChange() {
                human_chartChange.clear();
                var option = {
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
                        textStyle: {
                            color: "rgba(255, 255, 255, 1)"
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
                            data: manList
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
                            data: femaleList
                        }

                    ]

                };
                human_chartChange.setOption(option);
            }

            // 연령별 출입자 현황 더블 도넛차트
            // 전역 변수로 선언
            var human_chartChange = echarts.init(document.getElementById('mainPerson_chart'));
            var human_radial_bar_chartChange = echarts.init(document.getElementById('mainPerson_chart'));

            function renderRadialBarChartChange() {

                human_chartChange.clear();
                human_radial_bar_chartChange.clear();

                // 차트 옵션 설정
                var option = {
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        bottom: 0,
                        data: ['미성년', '노년', '청년', '중장년'],
                        textStyle: {
                            color: '#fff'
                        },
                    },
                    grid: {
                        //bottom: '50%', // 그래프 영역의 하단 마진
                        containLabel: true // 라벨이 차트 밖으로 나가지 않도록 함
                    },
                    series: [
                        {
                            name: '여성',
                            type: 'pie',
                            radius: ['20%', '45%'], // 첫 번째 도넛의 반지름 범위
                            avoidLabelOverlap: false,
                            itemStyle: {
                                borderColor: 'black',
                                borderWidth: 2,

                            },
                            label: {
                                show: false,
                                position: 'center',

                            },
                            emphasis: {

                            },
                            labelLine: {
                                show: false
                            },
                            data: [
                                { value: face_youngFemale, name: '미성년', itemStyle: { color: '#d3f1f9' } },
                                { value: face_adultFemale, name: '청년', itemStyle: { color: '#3fd5e3' } },
                                { value: face_middleFemale, name: '중장년', itemStyle: { color: '#00a0de' } },
                                { value: face_seniorFemale, name: '노년', itemStyle: { color: '#0174cf' } }

                            ]
                        },
                        {
                            name: '남성',
                            type: 'pie',
                            radius: ['50%', '75%'], // 두 번째 도넛의 반지름 범위
                            avoidLabelOverlap: false,
                            itemStyle: {
                                borderColor: 'black',
                                borderWidth: 2
                            },
                            label: {
                                show: false,
                                position: 'center'
                            },
                            emphasis: {

                            },
                            labelLine: {
                                show: false
                            },
                            data: [
                                { value: face_youngMale, name: '미성년', itemStyle: { color: '#d3f1f9' } },
                                { value: face_adultMale, name: '청년', itemStyle: { color: '#3fd5e3' } },
                                { value: face_middleMale, name: '중장년', itemStyle: { color: '#00a0de' } },
                                { value: face_seniorMale, name: '노년', itemStyle: { color: '#0174cf' } }
                            ]
                        }
                    ]
                };

                // 차트에 옵션 설정하기
                human_radial_bar_chartChange.setOption(option);
            }




            // --------------------------------------------------------



            // 메인페이지 시간대별라인차트(날짜 바꾸면~~)
            var dailyCountChangeList = response.dailyCountChangeList;

            let timeList = [];
            let personList = [];
            let vehicleList = [];
            let faceList = [];
            let lprList = [];
            let invCntList = [];
            let lotCntList = [];
            let cntCntList = [];
            let fatCntList = [];
            //console.log(dailyCountChangeList);

            //for문 사용해서 요소 꺼내기
            for (var i = 0; i < dailyCountChangeList.length; i++) {
                var currentItem = dailyCountChangeList[i];
                //console.log(currentItem);
                // console.log(currentItem.time);

                timeList.push(currentItem.time);
                personList.push(currentItem.person);
                vehicleList.push(currentItem.vehicle);
                faceList.push(currentItem.face);
                lprList.push(currentItem.lpr);
                invCntList.push(currentItem.invCnt);
                lotCntList.push(currentItem.lotCnt);
                cntCntList.push(currentItem.cntCnt);
                fatCntList.push(currentItem.fatCnt);
            }
            console.log("timeList : " + timeList);
            // currentItem의 속성에 접근 확인
            // console.log(currentItem.time);
            // console.log(currentItem.person);
            // console.log(currentItem.vehicle);
            // console.log(currentItem.face);
            // console.log(currentItem.lpr);
            // console.log(currentItem.invCnt);
            // console.log(currentItem.lotCnt);
            // console.log(currentItem.cntCnt);
            // console.log(currentItem.fatCnt);

            /* 시간대별 라인그래프 */
            //  준비한 DOM 컨테이너에서 echarts 초기화하기
            var lineChart = echarts.init(document.getElementById('main'))

            // 차트 옵션 작성하기
            var option = {
                // 차트 제목
                title: {

                },
                // 범례명
                legend: {
                    data: ['사람', '차량', '얼굴', '번호판', '침입', '배회', '카운팅', '쓰러짐'],
                    bottom: '3%',
                    textStyle: {
                        color: "rgba(255, 255, 255, 1)"
                    }
                },
                // x축 라벨
                xAxis: {
                    data: timeList,
                },
                yAxis: {
                    //data: ['0', '500', '1000', '1500', '2000'],
                },
                series: [
                    {
                        name: '사람',
                        type: 'line',
                        data: personList,
                        itemStyle: { color: '#94e9ec' }
                    },
                    {
                        name: '차량',
                        type: 'line',
                        data: vehicleList,
                        itemStyle: { color: '#d4e079' }
                    },
                    {
                        name: '얼굴',
                        type: 'line',
                        data: faceList,
                        itemStyle: { color: '#b4a1d8' }
                    },
                    {
                        name: '번호판',
                        type: 'line',
                        data: lprList,
                        itemStyle: { color: '#f19ec2' }
                    },
                    {
                        name: '침입',
                        type: 'line',
                        data: invCntList,
                        itemStyle: { color: '#4176df' }
                    },
                    {
                        name: '배회',
                        type: 'line',
                        data: lotCntList,
                        itemStyle: { color: '#fec070' }
                    },
                    {
                        name: '카운팅',
                        type: 'line',
                        stack: 'Total',
                        data: cntCntList,
                        itemStyle: { color: '#ff7978' }
                    },
                    {
                        name: '쓰러짐',
                        type: 'line',
                        stack: 'Total',
                        data: fatCntList,
                        itemStyle: { color: '#52c3f7' }
                    }
                ],
            }

            //  차트 옵션 설정하기
            lineChart.setOption(option)




            //----------------------------------------------------------------------


            // 마스크 미착용자 성별/연령 비교 (날짜 바꾸면~~)
            var DailyCount_summaryChangeList = response.DailyCount_summaryChangeList;
            //console.log(DailyCount_summaryChangeList);
            //for문 사용해서 요소 꺼내기
            for (var i = 0; i < DailyCount_summaryChangeList.length; i++) {
                var currentItem = DailyCount_summaryChangeList[i];
                //console.log(currentItem);

                // currentItem의 속성에 접근 확인
                // console.log(currentItem.faceNoMaskMaleYoung);
                // console.log(currentItem.faceNoMaskMaleAdlut);
                // console.log(currentItem.faceNoMaskMaleMiddle);
                // console.log(currentItem.faceNoMaskMaleSenior);
                // console.log(currentItem.faceNoMaskFemaleYoung);
                // console.log(currentItem.faceNoMaskFemaleAdult);
                // console.log(currentItem.faceNoMaskFemaleMiddle);
                // console.log(currentItem.faceNoMaskFemaleSenior);

                if (currentItem) {
                    // Access properties only if they are defined
                    var faceNoMaskFemaleYoung = currentItem.faceNoMaskFemaleYoung || 0;
                    var faceNoMaskFemaleAdult = currentItem.faceNoMaskFemaleAdult || 0;
                    var faceNoMaskFemaleMiddle = currentItem.faceNoMaskFemaleMiddle || 0;
                    var faceNoMaskFemaleSenior = currentItem.faceNoMaskFemaleSenior || 0;
                    var faceNoMaskMaleYoung = currentItem.faceNoMaskMaleYoung || 0;
                    var faceNoMaskMaleAdlut = currentItem.faceNoMaskMaleAdlut || 0;
                    var faceNoMaskMaleMiddle = currentItem.faceNoMaskMaleMiddle || 0;
                    var faceNoMaskMaleSenior = currentItem.faceNoMaskMaleSenior || 0;




                      /* 여자도넛그래프 */
                    //  준비한 DOM 컨테이너에서 echarts 초기화하기
                    var womanDountChangeChart = echarts.init(document.getElementById('mainFace2_chart'))

                    // 차트 옵션 작성하기
                    option = {
                        tooltip: {
                            trigger: 'item'
                        },
                        legend: {
                            bottom: '5%',
                            left: 'center',
                            textStyle: {
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
                                    borderColor: 'rgba(30, 30, 30, 1)',
                                    borderWidth: 5
                                },

                                label: {
                                    show: true,
                                    position: 'inside',
                                    formatter: '{c}',
                                    fontSize: 12,
                                    fontWeight: 'bold',
                                    fontColor: '#fff'
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
                                    { value: faceNoMaskFemaleYoung, name: '미성년', itemStyle: { color: '#d3f1f9' } },
                                    { value: faceNoMaskFemaleAdult, name: '청년', itemStyle: { color: '#3fd5e3' } },
                                    { value: faceNoMaskFemaleMiddle, name: '중장년', itemStyle: { color: '#00a0de' } },
                                    { value: faceNoMaskFemaleSenior, name: '노년', itemStyle: { color: '#0174cf' } },
                                ]
                            }
                        ]
                    };

                    //  차트 옵션 설정하기
                    womanDountChangeChart.setOption(option)



                         /* 남자 도넛 그래프 */
                    //  준비한 DOM 컨테이너에서 echarts 초기화하기
                    var manDountChangeChart = echarts.init(document.getElementById('mainFace1_chart'))

                    // 차트 옵션 작성하기
                    option = {
                        tooltip: {
                            trigger: 'item'
                        },
                        legend: {
                            bottom: '5%',
                            left: 'center',
                            textStyle: {
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
                                    borderColor: 'rgba(30, 30, 30, 1)',
                                    borderWidth: 5
                                },
                                label: {
                                    show: true,
                                    position: 'inside',
                                    formatter: '{c}',
                                    fontSize: 12,
                                    fontWeight: 'bold',
                                    fontColor: '#fff'
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
                                    { value: faceNoMaskMaleYoung, name: '미성년', itemStyle: { color: '#d3f1f9' } },
                                    { value: faceNoMaskMaleAdlut, name: '청년', itemStyle: { color: '#3fd5e3' } },
                                    { value: faceNoMaskMaleMiddle, name: '중장년', itemStyle: { color: '#00a0de' } },
                                    { value: faceNoMaskMaleSenior, name: '노년', itemStyle: { color: '#0174cf' } }
                                ]
                            }
                        ]
                    };

                    //  차트 옵션 설정하기
                    manDountChangeChart.setOption(option)
            

                }
            }
            


            //----------------------------------------------------------------------


            // 최다검지카메라 사람 테이블(날짜 바꾸면~~)
            var dailyCount_CNT_changeList = response.dailyCount_CNT_changeList;
            //console.log(dailyCount_CNT_changeList);
            //for문 사용해서 요소 꺼내기
            for (var i = 0; i < dailyCount_CNT_changeList.length; i++) {
                var currentItem = dailyCount_CNT_changeList[i];
                //console.log(currentItem);


                const subTop10Cameras = document.getElementById("subTop10Cameras");

                const personCount = currentItem.personCount || 0;
                const vehicleCount = currentItem.vehicleCount || 0;
                const faceCount = currentItem.faceCount || 0;
                const invCntCount = currentItem.invCntCount || 0;
                const lotCntCount = currentItem.lotCntCount || 0;
                const cntCntCount = currentItem.cntCntCount || 0;
                const falCntCount = currentItem.falCntCount || 0;


                // 기존 테이블 내용 삭제
                if (subTop10Cameras) {
                    subTop10Cameras.innerHTML = "";
                }


                var table = document.createElement("table");
                table.classList.add("cameraTable");
                
                var thead = document.createElement("thead");
                table.appendChild(thead);
                

                var row = document.createElement("tr");
                thead.appendChild(row);

                var cameraNameCell = document.createElement("th");
                cameraNameCell.setAttribute("scope", "col");
                cameraNameCell.textContent = "카메라명";
                row.appendChild(cameraNameCell);

                var personCountCell = document.createElement("th");
                personCountCell.setAttribute("scope", "col");
                personCountCell.textContent = "사람";
                row.appendChild(personCountCell);

                var faceCountCell = document.createElement("th");
                faceCountCell.setAttribute("scope", "col");
                faceCountCell.textContent = "얼굴";
                row.appendChild(faceCountCell);

                var invCntCountCell = document.createElement("th");
                invCntCountCell.setAttribute("scope", "col");
                invCntCountCell.textContent = "침입";
                row.appendChild(invCntCountCell);

                var lotCntCountCell = document.createElement("th");
                lotCntCountCell.setAttribute("scope", "col");
                lotCntCountCell.textContent = "배회";
                row.appendChild(lotCntCountCell);

                var cntCntCountCell = document.createElement("th");
                cntCntCountCell.setAttribute("scope", "col");
                cntCntCountCell.textContent = "쓰러짐";
                row.appendChild(cntCntCountCell);

                var falCntCountCell = document.createElement("th");
                falCntCountCell.setAttribute("scope", "col");
                falCntCountCell.textContent = "카운팅";
                row.appendChild(falCntCountCell);


                if(dailyCount_CNT_changeList != null){
                    tbody = document.createElement("tbody");
                    tbody.classList.add("table-group-divider");
                    table.appendChild(tbody);
    
                    var row1 = document.createElement("tr");
                    tbody.appendChild(row1);
    
    
                    var cameraNameDataCell = document.createElement("th");
                    cameraNameDataCell.setAttribute("scope", "row");
                    cameraNameDataCell.classList.add("loadName");
                    cameraNameDataCell.textContent = currentItem.cameraName;
                    row1.appendChild(cameraNameDataCell);
    
                    var personCountDataCell = document.createElement("td");
                    personCountDataCell.textContent = personCount;
                    row1.appendChild(personCountDataCell);
    
                    var faceCountDataCell = document.createElement("td");
                    faceCountDataCell.textContent = faceCount;
                    row1.appendChild(faceCountDataCell);
    
                    var invCntCountDataCell = document.createElement("td");
                    invCntCountDataCell.textContent = invCntCount;
                    row1.appendChild(invCntCountDataCell);
    
                    var lotCntCountDataCell = document.createElement("td");
                    lotCntCountDataCell.textContent = lotCntCount;
                    row1.appendChild(lotCntCountDataCell);
    
                    var cntCntCountDataCell = document.createElement("td");
                    cntCntCountDataCell.textContent = cntCntCount;
                    row1.appendChild(cntCntCountDataCell);
    
                    var falCntCountDataCell = document.createElement("td");
                    falCntCountDataCell.textContent = falCntCount;
                    row1.appendChild(falCntCountDataCell);
    
                    subTop10Cameras.appendChild(table);  
                }else{
                    if(tbody){
                        tbody.innerHTML = "";
                    }
                }
                

                // currentItem의 속성에 접근 확인
                // console.log(currentItem.cameraName);
                // console.log(currentItem.personCount);
                // console.log(currentItem.vehicleCount);
                // console.log(currentItem.faceCount);
                // console.log(currentItem.lprCount);
                // console.log(currentItem.invCntCount);
                // console.log(currentItem.lotCntCount);
                // console.log(currentItem.cntCntCount);
                // console.log(currentItem.falCntCount);


                 // 사람버튼 클릭하면 데이터 변경
                document.getElementById("humanBtn").addEventListener("click", () => {

                    console.log(forDate);
                
                
                    // 사람버튼 클릭

                    //for문 사용해서 요소 꺼내기
                    for (var i = 0; i < dailyCount_CNT_changeList.length; i++) {
                        var currentItem = dailyCount_CNT_changeList[i];

                        const subTop10Cameras = document.getElementById("subTop10Cameras");


                        // 기존 테이블 내용 삭제
                        if (subTop10Cameras) {
                            subTop10Cameras.innerHTML = "";
                        }

                        var table = document.createElement("table");
                        table.classList.add("cameraTable");
                        
                        var thead = document.createElement("thead");
                        table.appendChild(thead);
                        

                        var row = document.createElement("tr");
                        thead.appendChild(row);

                        var cameraNameCell = document.createElement("th");
                        cameraNameCell.setAttribute("scope", "col");
                        cameraNameCell.textContent = "카메라명";
                        row.appendChild(cameraNameCell);

                        var personCountCell = document.createElement("th");
                        personCountCell.setAttribute("scope", "col");
                        personCountCell.textContent = "사람";
                        row.appendChild(personCountCell);

                        var faceCountCell = document.createElement("th");
                        faceCountCell.setAttribute("scope", "col");
                        faceCountCell.textContent = "얼굴";
                        row.appendChild(faceCountCell);

                        var invCntCountCell = document.createElement("th");
                        invCntCountCell.setAttribute("scope", "col");
                        invCntCountCell.textContent = "침입";
                        row.appendChild(invCntCountCell);

                        var lotCntCountCell = document.createElement("th");
                        lotCntCountCell.setAttribute("scope", "col");
                        lotCntCountCell.textContent = "배회";
                        row.appendChild(lotCntCountCell);

                        var cntCntCountCell = document.createElement("th");
                        cntCntCountCell.setAttribute("scope", "col");
                        cntCntCountCell.textContent = "쓰러짐";
                        row.appendChild(cntCntCountCell);

                        var falCntCountCell = document.createElement("th");
                        falCntCountCell.setAttribute("scope", "col");
                        falCntCountCell.textContent = "카운팅";
                        row.appendChild(falCntCountCell);

                        
                        var tbody = document.createElement("tbody");
                        tbody.classList.add("table-group-divider");
                        table.appendChild(tbody);

                        var row1 = document.createElement("tr");
                        tbody.appendChild(row1);


                        var cameraNameDataCell = document.createElement("th");
                        cameraNameDataCell.setAttribute("scope", "row");
                        cameraNameDataCell.classList.add("loadName");
                        cameraNameDataCell.textContent = currentItem.cameraName;
                        row1.appendChild(cameraNameDataCell);

                        var personCountDataCell = document.createElement("td");
                        personCountDataCell.textContent = personCount;
                        row1.appendChild(personCountDataCell);

                        var faceCountDataCell = document.createElement("td");
                        faceCountDataCell.textContent = faceCount;
                        row1.appendChild(faceCountDataCell);

                        var invCntCountDataCell = document.createElement("td");
                        invCntCountDataCell.textContent = invCntCount;
                        row1.appendChild(invCntCountDataCell);

                        var lotCntCountDataCell = document.createElement("td");
                        lotCntCountDataCell.textContent = lotCntCount;
                        row1.appendChild(lotCntCountDataCell);

                        var cntCntCountDataCell = document.createElement("td");
                        cntCntCountDataCell.textContent = cntCntCount;
                        row1.appendChild(cntCntCountDataCell);

                        var falCntCountDataCell = document.createElement("td");
                        falCntCountDataCell.textContent = falCntCount;
                        row1.appendChild(falCntCountDataCell);

                        subTop10Cameras.appendChild(table);    
                        
                    }        

                });


            }





            //----------------------------------------------------------------------
            // 최다검지카메라 차량 테이블(날짜 바꾸면~~)
            document.getElementById("vehicleBtn").addEventListener("click", () => {

                console.log(forDate);
            
            
                // 최다검지카메라 차량 테이블(날짜 바꾸면~~)

                var vehicleDailyCount_CNT_changeList = response.vehicleDailyCount_CNT_changeList;
                //console.log(vehicleDailyCount_CNT_changeList);
                //for문 사용해서 요소 꺼내기
                for (var i = 0; i < vehicleDailyCount_CNT_changeList.length; i++) {
                    var currentItem = vehicleDailyCount_CNT_changeList[i];
                    //console.log(currentItem);

                    // currentItem의 속성에 접근 확인
                    // console.log(currentItem.cameraName);
                    // console.log(currentItem.carCount);
                    // console.log(currentItem.busCount);
                    // console.log(currentItem.truckCount);
                    // console.log(currentItem.motocycleCount);
                    // console.log(currentItem.bicycleCount);

                    const subTop10Cameras = document.getElementById("subTop10Cameras");


                    // 기존 테이블 내용 삭제
                    if (subTop10Cameras) {
                        subTop10Cameras.innerHTML = "";
                    }

                    var table = document.createElement("table");
                    table.classList.add("cameraTable");
                    
                    var thead = document.createElement("thead");
                    table.appendChild(thead);
                    

                    var row = document.createElement("tr");
                    thead.appendChild(row);

                    var cameraNameCell = document.createElement("th");
                    cameraNameCell.setAttribute("scope", "col");
                    cameraNameCell.textContent = "카메라명";
                    row.appendChild(cameraNameCell);

                    var carCountCell = document.createElement("th");
                    carCountCell.setAttribute("scope", "col");
                    carCountCell.textContent = "자동차";
                    row.appendChild(carCountCell);

                    var busCountCell = document.createElement("th");
                    busCountCell.setAttribute("scope", "col");
                    busCountCell.textContent = "버스";
                    row.appendChild(busCountCell);

                    var truckCountCell = document.createElement("th");
                    truckCountCell.setAttribute("scope", "col");
                    truckCountCell.textContent = "트럭";
                    row.appendChild(truckCountCell);

                    var motocycleCountCell = document.createElement("th");
                    motocycleCountCell.setAttribute("scope", "col");
                    motocycleCountCell.textContent = "오토바이";
                    row.appendChild(motocycleCountCell);

                    var bicycleCountCell = document.createElement("th");
                    bicycleCountCell.setAttribute("scope", "col");
                    bicycleCountCell.textContent = "자전거";
                    row.appendChild(bicycleCountCell);

                    
                    var tbody = document.createElement("tbody");
                    tbody.classList.add("table-group-divider");
                    table.appendChild(tbody);

                    var row1 = document.createElement("tr");
                    tbody.appendChild(row1);


                    var cameraNameDataCell = document.createElement("th");
                    cameraNameDataCell.setAttribute("scope", "row");
                    cameraNameDataCell.classList.add("loadName");
                    cameraNameDataCell.textContent = currentItem.cameraName;
                    row1.appendChild(cameraNameDataCell);

                    var carCountDataCell = document.createElement("td");
                    carCountDataCell.textContent = currentItem.carCount;
                    row1.appendChild(carCountDataCell);

                    var busCountDataCell = document.createElement("td");
                    busCountDataCell.textContent = currentItem.busCount;
                    row1.appendChild(busCountDataCell);

                    var truckCountDataCell = document.createElement("td");
                    truckCountDataCell.textContent = currentItem.truckCount;
                    row1.appendChild(truckCountDataCell);

                    var motocycleCountDataCell = document.createElement("td");
                    motocycleCountDataCell.textContent = currentItem.motocycleCount;
                    row1.appendChild(motocycleCountDataCell);

                    var bicycleCountDataCell = document.createElement("td");
                    bicycleCountDataCell.textContent = currentItem.bicycleCount;
                    row1.appendChild(bicycleCountDataCell);

                    subTop10Cameras.appendChild(table);    
                    
                }               
                    
            
            
            });
            //----------------------------------------------------------------------



        },
        error: function (xhr, status, error) {
            console.error('Error sending data to server:', error);
            console.log('Status:', xhr.status);
        }
    });


    var humanTable = $('#humanTable');


    /* 날짜 형식화 함수 */
    /* YYYYMMDD 형식으로 변환하는 함수 */
    function formatToYYYYMMDD(dateString) {
        var year = dateString.substring(0, 4);
        var month = dateString.substring(5, 7);
        var day = dateString.substring(8, 10);
        return year + month + day;
    }
}




function sendToServer2() {
    // 형식을 YYYYMMDD로 변경
    occuDate = formatToYYYYMMDD(forDate);
    console.log('Sending occuDate to server:', occuDate); // 콘솔에 occuDate 값 로그 출력
    // 서버로 데이터 전송
    $.ajax({
        url: '/vehicleTable',
        type: 'GET',
        data: { occuDate: occuDate },
        success: function (response) {
            console.log('Data sent successfully to server!');
            console.log(response);

             // 최다검지카메라 차량 테이블(날짜 바꾸면~~)

            var vehicleDailyCount_CNT_changeList = response.vehicleDailyCount_CNT_changeList;
            //console.log(vehicleDailyCount_CNT_changeList);
            //for문 사용해서 요소 꺼내기
            for (var i = 0; i < vehicleDailyCount_CNT_changeList.length; i++) {
            var currentItem = vehicleDailyCount_CNT_changeList[i];
            //console.log(currentItem);

            // currentItem의 속성에 접근 확인
            // console.log(currentItem.cameraName);
            // console.log(currentItem.carCount);
            // console.log(currentItem.busCount);
            // console.log(currentItem.truckCount);
            // console.log(currentItem.motocycleCount);
            // console.log(currentItem.bicycleCount);

            const subTop10Cameras = document.getElementById("subTop10Cameras");


            // 기존 테이블 내용 삭제
            if (subTop10Cameras) {
                subTop10Cameras.innerHTML = "";
            }

            var table = document.createElement("table");

            var row = document.createElement("tr");
            table.appendChild(row);

            var cameraNameCell = document.createElement("th");
            cameraNameCell.setAttribute("scope", "col");
            cameraNameCell.textContent = "카메라명";
            row.appendChild(cameraNameCell);

            var carCountCell = document.createElement("th");
            carCountCell.setAttribute("scope", "col");
            carCountCell.textContent = "자동차";
            row.appendChild(carCountCell);

            var busCountCell = document.createElement("th");
            busCountCell.setAttribute("scope", "col");
            busCountCell.textContent = "버스";
            row.appendChild(busCountCell);

            var truckCountCell = document.createElement("th");
            truckCountCell.setAttribute("scope", "col");
            truckCountCell.textContent = "트럭";
            row.appendChild(truckCountCell);

            var motocycleCountCell = document.createElement("th");
            motocycleCountCell.setAttribute("scope", "col");
            motocycleCountCell.textContent = "오토바이";
            row.appendChild(motocycleCountCell);

            var bicycleCountCell = document.createElement("th");
            bicycleCountCell.setAttribute("scope", "col");
            bicycleCountCell.textContent = "자전거";
            row.appendChild(bicycleCountCell);

            
            var row1 = document.createElement("tr");
            table.appendChild(row1);

            var cameraNameDataCell = document.createElement("th");
            cameraNameDataCell.setAttribute("scope", "row");
            cameraNameDataCell.classList.add("loadName");
            cameraNameDataCell.textContent = currentItem.cameraName;
            row1.appendChild(cameraNameDataCell);

            var carCountDataCell = document.createElement("td");
            carCountDataCell.textContent = currentItem.carCount;
            row1.appendChild(carCountDataCell);

            var busCountDataCell = document.createElement("td");
            busCountDataCell.textContent = currentItem.busCount;
            row1.appendChild(busCountDataCell);

            var truckCountDataCell = document.createElement("td");
            truckCountDataCell.textContent = currentItem.truckCount;
            row1.appendChild(truckCountDataCell);

            var motocycleCountDataCell = document.createElement("td");
            motocycleCountDataCell.textContent = currentItem.motocycleCount;
            row1.appendChild(motocycleCountDataCell);

            var bicycleCountDataCell = document.createElement("td");
            bicycleCountDataCell.textContent = currentItem.bicycleCount;
            row1.appendChild(bicycleCountDataCell);

            subTop10Cameras.appendChild(table);



        }

        },
        error: function (xhr, status, error) {
            console.error('Error sending data to server:', error);
            console.log('Status:', xhr.status);
        }
    })
}    