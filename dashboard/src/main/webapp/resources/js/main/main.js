/* 정각이 되면 페이지 리프레쉬 시작 */
function refreshAtMidnight() {
    var now = new Date();
    var millisTillMidnight = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 24, 0, 0, 0) - now;
    if (millisTillMidnight < 0) {
        millisTillMidnight += 86400000; // 다음날 정각까지의 시간 (24시간 = 86400000 밀리초)
    }
    
    setTimeout(function () {
        location.reload(true); // true 파라미터는 캐시를 무시하고 새로고침
    }, millisTillMidnight);
}

// 페이지 로드 시 실행
document.addEventListener("DOMContentLoaded", function () {
    refreshAtMidnight();
});
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


    var currentChart = 'bar'; // 초기에는 막대형 차트를 표시

    // 초기 차트 설정
    renderBarChart();



    /* 남자 도넛 그래프 */
    //  준비한 DOM 컨테이너에서 echarts 초기화하기
    var myChart = echarts.init(document.getElementById('mainFace1_chart'))

    // 차트 옵션 작성하기
    option = {
        tooltip: {
            trigger: 'item'
        },
        legend: {
            bottom: '5%',
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
                { value: noMaskMaleYoung, name: '미성년', itemStyle: { color: '#d3f1f9' }},
                { value: noMaskMaleAdlut, name: '청년', itemStyle: { color: '#3fd5e3' }},
                { value: noMaskMaleMiddle, name: '중장년', itemStyle: { color: '#00a0de' }},
                { value: noMaskMaleSenior, name: '노년', itemStyle: { color: '#0174cf' }}
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
            bottom: '5%',
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
    myChart.setOption(option)





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
        data: ['사람', '차량', '얼굴', '번호판','침입', '배회', '카운팅', '쓰러짐'],
        bottom: '3%',
        textStyle:{
            color: "rgba(255, 255, 255, 1)"
        }
        },
        // x축 라벨
        xAxis: {
        data: [time1, time2, time3, time4, time5, time6, time7, time8, time9, time10,
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
            data: [person1, person2, person3, person4, person5, person6, person7, person8, person9, person10, person11, person12, person13, person14, person15, person16, person17, person18, person19, person20, person21, person22, person23 ],
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
                textStyle:{
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
                textStyle:{
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
                    { value: youngFemale, name: '미성년',  itemStyle: { color: '#d3f1f9' }},
                    { value: adultFemale, name: '청년',  itemStyle: { color: '#3fd5e3' }},
                    { value: middleFemale, name: '중장년',  itemStyle: { color: '#00a0de' } },
                    { value: seniorFemale, name: '노년',  itemStyle: { color: '#0174cf' } }
                    
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
                    { value: youngMale, name: '미성년',  itemStyle: { color: '#d3f1f9' }},
                    { value: adultMale, name: '청년',  itemStyle: { color: '#3fd5e3' }},
                    { value: middleMale, name: '중장년',  itemStyle: { color: '#00a0de' }},
                    { value: seniorMale, name: '노년',  itemStyle: { color: '#0174cf' }}
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


    function OnCarGraphChange(){
        if (bCheckCar == false){
            vehicle_chart.dispose();
            showCarPieChart();
            bCheckCar = true;
        }else{
            car_pie_chart.dispose();
            showVehicleChart();
            bCheckCar = false;
        }
    }
/* 차트 변경 js 끝 */ 



    /* 사람 막대 <-> 도넛 차트 변경 끝*/