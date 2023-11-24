
// 페이지 로드 후 함수 호출
refreshAtTopOfHour();
/* 정각이 되면 페이지 리프레쉬 끝 */



// 최다검지 카메라 TOP10 CH 사람으로 변경
function setMainEventTop10() {
    document.getElementById('subTop10Cameras').style.display = 'block';
    document.getElementById('subTop10CamerasCar').style.display = 'none';
}


// 최다검지 카메라 TOP10 CH 차량으로 변경
function setMainVehicleTop10() {
    document.getElementById('subTop10Cameras').style.display = 'none';
    document.getElementById('subTop10CamerasCar').style.display = 'block';
}


// 차트 크기를 조절하는 함수
function resizeChart() {
    human_chart.resize(); // 차트 리사이즈 메서드 호출
    manDountChart.resize(); // 차트 리사이즈 메서드 호출
    womanDountChart.resize(); // 차트 리사이즈 메서드 호출
    myChart.resize(); // 차트 리사이즈 메서드 호출
    human_radial_bar_chart.resize(); // 차트 리사이즈 메서드 호출
}

// 창 크기가 변경될 때마다 차트 크기 조절
window.addEventListener('resize', resizeChart);



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


var currentChart = 'bar'; // 초기에는 막대형 차트를 표시

// 초기 차트 설정
renderBarChart();


// 차량 막대차트
var mainVehicle = echarts.init(document.getElementById('mainVehicle'))
option = {
    xAxis: {
        type: 'category',
        data: ['자동차', '버스', '트럭', '오토바이', '자전거']
    },
    yAxis: {
        type: 'value'
    },
    legend: {

        top: '90%',
        data: ['자동차', '버스', '트럭', '오토바이', '자전거'],
        textStyle: {
            color: '#fff'
        }
    },
    series: [
        {
            type: 'bar',
            data: [
                { value: 120, name: '자동차', itemStyle: { color: 'rgba(240,120,95,1)' } },
                { value: 200, name: '버스', itemStyle: { color: 'rgba(86,109,245,1)' } },
                { value: 150, name: '트럭', itemStyle: { color: 'rgba(165,245,60,1)' } },
                { value: 135, name: '오토바이', itemStyle: { color: 'rgba(73,245,170,1)' } },
                { value: 140, name: '자전거', itemStyle: { color: 'rgba(255,204,69,1)' } }
            ],
            barWidth: 50 // 바의 넓이를 조절합니다.
        },

    ]
};

//  차트 옵션 설정하기
mainVehicle.setOption(option)




/* 남자 도넛 그래프 */
//  준비한 DOM 컨테이너에서 echarts 초기화하기
var manDountChart = echarts.init(document.getElementById('mainFace1_chart'))

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
                { value: noMaskMaleYoung, name: '미성년', itemStyle: { color: '#d3f1f9' } },
                { value: noMaskMaleAdlut, name: '청년', itemStyle: { color: '#3fd5e3' } },
                { value: noMaskMaleMiddle, name: '중장년', itemStyle: { color: '#00a0de' } },
                { value: noMaskMaleSenior, name: '노년', itemStyle: { color: '#0174cf' } }
            ]
        }
    ]
};

//  차트 옵션 설정하기
manDountChart.setOption(option)



/* 여자도넛그래프 */
//  준비한 DOM 컨테이너에서 echarts 초기화하기
var womanDountChart = echarts.init(document.getElementById('mainFace2_chart'))

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
                { value: noMaskFemaleYoung, name: '미성년', itemStyle: { color: '#d3f1f9' } },
                { value: noMaskFemaleAdult, name: '청년', itemStyle: { color: '#3fd5e3' } },
                { value: noMaskFemaleMiddle, name: '중장년', itemStyle: { color: '#00a0de' } },
                { value: noMaskFemaleSenior, name: '노년', itemStyle: { color: '#0174cf' } },
            ]
        }
    ]
};

//  차트 옵션 설정하기
womanDountChart.setOption(option)


// 이벤트 발생 비율 도넛차트
var eventChart = echarts.init(document.getElementById('event_acc_wnd'))

var option = {
    tooltip: {
        trigger: 'item'
    },
    legend: {
        top: '90%',
        data: ['침입', '배회', '카운트', '쓰러짐'],
        textStyle: {
            color: '#fff'
        }
    },
    series: [
        {
            name: '여성',
            type: 'pie',
            radius: ['23%', '76%'], // 첫 번째 도넛의 반지름 범위
            avoidLabelOverlap: false,
            itemStyle: {
                borderColor: 'black',
                borderWidth: 2,


            },
            label: {
                show: true,
                position: 'inside',
                formatter: '{c}',
                fontSize: 20,
                fontWeight: 'bold',
                fontColor: '#fff'


            },
            emphasis: {

            },
            labelLine: {
                show: false
            },
            data: [
                { value: 1048, name: '침입', itemStyle: { color: '#4176df' } },
                { value: 735, name: '배회', itemStyle: { color: '#fec070' } },
                { value: 580, name: '카운트', itemStyle: { color: '#ff7978' } },
                { value: 580, name: '쓰러짐', itemStyle: { color: '#52c3f7' } }
            ]
        }
    ]
}
//  차트 옵션 설정하기
eventChart.setOption(option)





/* 시간대별 라인그래프 */
//  준비한 DOM 컨테이너에서 echarts 초기화하기
var myChart = echarts.init(document.getElementById('main'))

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
        data:
            [time1, time2, time3, time4, time5, time6, time7, time8, time9, time10,
                time11, time12, time13, time14, time15, time16, time17, time18, time19, time20,
                time21, time22, time23, time24],
    },
    yAxis: {
        //data: ['0', '500', '1000', '1500', '2000'],
    },
    series: [
        {
            name: '사람',
            type: 'line',
            data: [person1, person2, person3, person4, person5, person6, person7, person8, person9, person10, person11, person12, person13, person14, person15, person16, person17, person18, person19, person20, person21, person22, person23],
            itemStyle: { color: '#94e9ec' }
        },
        {
            name: '차량',
            type: 'line',
            data: [vehicle1, vehicle2, vehicle3, vehicle4, vehicle5, vehicle6, vehicle7, vehicle8, vehicle9, vehicle10, vehicle11, vehicle12, vehicle13, vehicle14, vehicle15, vehicle16, vehicle17, vehicle18, vehicle19, vehicle20, vehicle21, vehicle22, vehicle23],
            itemStyle: { color: '#d4e079' }
        },
        {
            name: '얼굴',
            type: 'line',
            data: [face1, face2, face3, face4, face5, face6, face7, face8, face9, face10, face11, face12, face13, face14, face15, face16, face17, face18, face19, face20, face21, face22, face23],
            itemStyle: { color: '#b4a1d8' }
        },
        {
            name: '번호판',
            type: 'line',
            data: [lpr1, lpr2, lpr3, lpr4, lpr5, lpr6, lpr7, lpr8, lpr9, lpr10, lpr11, lpr12, lpr13, lpr14, lpr15, lpr16, lpr17, lpr18, lpr19, lpr20, lpr21, lpr22, lpr23],
            itemStyle: { color: '#f19ec2' }
        },
        {
            name: '침입',
            type: 'line',
            data: [invCnt1, invCnt2, invCnt3, invCnt4, invCnt5, invCnt5, invCnt6, invCnt7, invCnt8, invCnt9, invCnt10, invCnt11, invCnt12, invCnt13, invCnt14, invCnt15, invCnt16, invCnt17, invCnt18, invCnt19, invCnt20, invCnt21, invCnt22, invCnt23],
            itemStyle: { color: '#4176df' }
        },
        {
            name: '배회',
            type: 'line',
            data: [lotCnt1, lotCnt2, lotCnt3, lotCnt4, lotCnt5, lotCnt6, lotCnt7, lotCnt8, lotCnt9, lotCnt10, lotCnt11, lotCnt12, lotCnt13, lotCnt14, lotCnt15, lotCnt16, lotCnt17, lotCnt18, lotCnt19, lotCnt20, lotCnt21, lotCnt22, lotCnt23],
            itemStyle: { color: '#fec070' }
        },
        {
            name: '카운팅',
            type: 'line',
            stack: 'Total',
            data: [cntCnt1, cntCnt2, cntCnt3, cntCnt4],
            itemStyle: { color: '#ff7978' }
        },
        {
            name: '쓰러짐',
            type: 'line',
            stack: 'Total',
            data: [fatCnt1, fatCnt2, fatCnt3, fatCnt4],
            itemStyle: { color: '#52c3f7' }
        }
    ],
}

//  차트 옵션 설정하기
myChart.setOption(option)






/* 사람 막대 <-> 도넛 차트 변경 시작*/
var human_chart = echarts.init(document.getElementById('mainPerson_chart'));
var human_radial_bar_chart = echarts.init(document.getElementById('mainPerson_chart'));

function renderBarChart() {
    human_chart.clear();
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
    human_chart.setOption(option);
}



// 연령별 출입자 현황 더블 도넛차트
function renderRadialBarChart() {
    human_radial_bar_chart.clear();
    human_radial_bar_chart = echarts.init(document.getElementById('mainPerson_chart'));

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
                    { value: youngFemale, name: '미성년', itemStyle: { color: '#d3f1f9' } },
                    { value: adultFemale, name: '청년', itemStyle: { color: '#3fd5e3' } },
                    { value: middleFemale, name: '중장년', itemStyle: { color: '#00a0de' } },
                    { value: seniorFemale, name: '노년', itemStyle: { color: '#0174cf' } }

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
                    { value: youngMale, name: '미성년', itemStyle: { color: '#d3f1f9' } },
                    { value: adultMale, name: '청년', itemStyle: { color: '#3fd5e3' } },
                    { value: middleMale, name: '중장년', itemStyle: { color: '#00a0de' } },
                    { value: seniorMale, name: '노년', itemStyle: { color: '#0174cf' } }
                ]
            }
        ]
    };

    // 차트에 옵션 설정하기
    human_radial_bar_chart.setOption(option);
}




/* 차트 변경 js 시작 */

/* 사람 차트  */
function OnHumanGraphChange() {
    if (currentChart === 'bar') {
        currentChart = 'radial';
        renderRadialBarChart();
    } else {
        currentChart = 'bar';
        renderBarChart();
    }
}


function OnCarGraphChange() {
    if (bCheckCar == false) {
        vehicle_chart.dispose();
        showCarPieChart();
        bCheckCar = true;
    } else {
        car_pie_chart.dispose();
        showVehicleChart();
        bCheckCar = false;
    }
}
/* 차트 변경 js 끝 */



/* 사람 막대 <-> 도넛 차트 변경 끝*/






/* 차량 도넛차트(변수초기화&차트할당 전) */
option = {
    tooltip: {
        trigger: 'item'
    },
    legend: {
        bottom: '5%',
        left: 'center',
        textStyle: {
            color: '#fff'
        }
    },
    series: [
        {
            type: 'pie',
            radius: ['28%', '70%'],
            avoidLabelOverlap: false,
            itemStyle: {

                borderColor: '#fff',
                borderWidth: 2
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
                label: {
                    show: true,
                    fontSize: 40,
                    fontWeight: 'bold'
                }
            },
            labelLine: {
                show: false
            },
            data: [
                { value: 1048, name: '자동차', itemStyle: { color: 'rgba(240,120,95,1)' } },
                { value: 735, name: '버스', itemStyle: { color: 'rgba(86,109,245,1)' } },
                { value: 580, name: '트럭', itemStyle: { color: 'rgba(165,245,60,1)' } },
                { value: 484, name: '오토바이', itemStyle: { color: 'rgba(73,245,170,1)' } },
                { value: 300, name: '자전거', itemStyle: { color: 'rgba(255,204,69,1)' } }
            ]
        }
    ]
};