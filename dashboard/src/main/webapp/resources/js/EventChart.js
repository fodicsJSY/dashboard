

function setReadyLegendCheck() {
    $("input:checkbox[name='check_button5']").prop("checked", true);
    $("input:checkbox[name='check_button6']").prop("checked", true);
    $("input:checkbox[name='check_button7']").prop("checked", true);
    $("input:checkbox[name='check_button8']").prop("checked", true);
}

function setSelectAll() {
    window.location.href = "sub_event_both.html";
}

function setSelectSelect() {
    window.location.href = "sub_event_event.html";
}

function CheckboxOff(event) {
    let result = '';
    result = event.target.value;

    if (result == "event") {
        window.location.href = "sub_event_object.html";
    }
    else if (result == "object") {
        window.location.href = "sub_event_event.html";
    }
}

function getCheckboxValue(event) {
    let result = '';
    if (event.target.checked) {
        result = event.target.value;
    } else {
        result = '';
    }

    if (result == "event") {
        window.location.href = "sub_event_event.html";
    }
    else if (result == "object") {
        window.location.href = "sub_event_object.html";
    }

    //main event check box
    else if (result == "intru") {
        const el = document.getElementById('chart_multi_line');

        const data = {
            categories: [
                '01/01/2020',
                '02/01/2020',
                '03/01/2020',
                '04/01/2020',
                '05/01/2020',
                '06/01/2020',
                '07/01/2020',
                '08/01/2020',
                '09/01/2020',
                '10/01/2020',
                '11/01/2020',
                '12/01/2020',
                '01/01/2019',
                '02/01/2019',
                '03/01/2019',
                '04/01/2019',
                '05/01/2019',
                '06/01/2019',
                '07/01/2019',
                '08/01/2019',
                '09/01/2019',
                '10/01/2019',
                '11/01/2019',
                '12/01/2019',
            ],
            series: [
                {
                    name: '배회',
                    data: [3.8, 5.6, 7.0, 9.1, 12.4, 15.3, 17.5, 17.8, 15.0, 10.6, 6.6, 3.7, 3.8, 5.6, 7.0, 9.1, 12.4, 15.3, 17.5, 17.8, 15.0, 10.6, 6.6, 3.7],
                },
                {
                    name: '카운팅',
                    data: [3, 5, 7, 9, 10, 15, 17, 17, 15, 10, 6, 2, 2, 5, 7.0, 9, 12, 15, 14, 17, 15.0, 10, 6, 3],
                },
                {
                    name: '쓰러짐',
                    data: [13, 15, 17, 19, 20, 25, 27, 27, 15, 20, 16, 12, 12, 15, 17, 19, 22, 25, 24, 27, 10.0, 20, 16, 13],
                },
            ],
        }
        const options = el.options;

        chart.lineChart({ el, data, options });


    }
    else if (result == "loit") {
    }
    else if (result == "cnt") {
    }
    else if (result == "fallen") {
    }
}


class CustomRenderer {
    constructor(props) {
        const el = document.createElement('img');
        el.src = 'some-image-link';

        this.el = el;
        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        const { imgType } = props.columnInfo.renderer.options;
        if (imgType == 'graph01') {
            this.el.src = String('../../img/grid_temp/graph_temp01.PNG');
        }
        else if (imgType == 'graph02') {
            this.el.src = String('../../img/grid_temp/graph_temp02.PNG');
        }
        else if (imgType == 'graph03') {
            this.el.src = String('../../img/grid_temp/graph_temp03.PNG');
        }

    }
}


function LoadRadialBarChart() {

    var rawFile = new XMLHttpRequest();
    rawFile.overrideMimeType("application/json");
    rawFile.open("GET", "./data/dailyCount.json", true);
    rawFile.onreadystatechange = function () {
        if (rawFile.readyState === 4 && rawFile.status == "200") {

            var gridData = JSON.parse(rawFile.responseText);


            var maley = Number(gridData[0].FACE_YOUNGMALE);
            var malea = Number(gridData[0].FACE_ADULTMALE);
            var malem = Number(gridData[0].FACE_MIDDLEMALE);
            var males = Number(gridData[0].FACE_SENIORMALE);

            var femaley = Number(gridData[0].FACE_YOUNGFEMALE);
            var femalea = Number(gridData[0].FACE_ADULTFEMALE);
            var femalem = Number(gridData[0].FACE_MIDDLEFEMALE);
            var females = Number(gridData[0].FACE_SENIORFEMALE);


            //var faceNoMask = Number(gridData[0].FACE_NOMASKMALE)
            //var ratio = parseInt((faceMask / (faceMask + faceNoMask)) * 100);


            const el = document.getElementById('chart_radial_age');
            const data = {
                categories: ['남자', '여자'],
                series: [
                    {
                        name: '미성년',
                        data: [maley, femaley]
                    },
                    {
                        name: '청년',
                        data: [malea, femalea]
                    },
                    {
                        name: '중장년',
                        data: [malem, femalem]
                    },
                    {
                        name: '노년',
                        data: [males, females]
                    },
                ],
            };
            const options = {
                chart: {
                    title: '',
                    width: 500,        // 출력 그래프 크기 Width   size.width
                    height: 406,      // 출력 그래프 크기 Height size.height
                },
                exportMenu: {
                    visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
                },
                legend: {
                    align: 'bottom',          // legend 출력 위치
                },
                series: {
                    radiusRange: {
                        inner: 30,
                        outer: 140,
                    },
                    selectable: true,
                },
                theme: {
                    chart: {
                        backgroundColor: 'rgba(30,30,30,1)',  // 그래프 배경색   
                    },
                    legend: {                  // Legend 폰트 관련
                        label: {
                            fontFamily: 'vedana',
                            fontSize: 12,
                            color: 'white'
                        },
                    },
                    series: {
                        colors: ['#D3F1F9', '#3FD5E3', '#00A0DE', '#0174CF'],
                        lineWidth: 2,
                        strokeStyle: 'rgba(40,40,40,1)',
                    },

                    circularAxis: {
                        label: {
                            fontSize: 0,
                        },
                    },
                    verticalAxis: {        // 세로로 내려오는 값 (Y Axis)
                        label: {
                            fontFamily: 'vedana',
                            fontSize: 12,
                            color: 'white',
                        },
                    },

                },
            };
            chart.radialBarChart({ el, data, options });
        }
    }
    rawFile.send(null);
}



function LoadMultiLineChart() {
    const el = document.getElementById('chart_multi_line');

    const data = {
        categories: [
            '01/01/2020',
            '02/01/2020',
            '03/01/2020',
            '04/01/2020',
            '05/01/2020',
            '06/01/2020',
            '07/01/2020',
            '08/01/2020',
            '09/01/2020',
            '10/01/2020',
            '11/01/2020',
            '12/01/2020',
            '01/01/2019',
            '02/01/2019',
            '03/01/2019',
            '04/01/2019',
            '05/01/2019',
            '06/01/2019',
            '07/01/2019',
            '08/01/2019',
            '09/01/2019',
            '10/01/2019',
            '11/01/2019',
            '12/01/2019',
        ],
        series: [
            {
                name: '침입',
                data: [1, 1, 4.0, 11.3, 17.5, 21.5, 25.9, 27.2, 24.4, 13.9, 6.6, 0.6, 3.5, 1.1, 4.0, 11.3, 17.5, 21.5, 25.9, 27.2, 24.4, 13.9, 6.6, 0.6],
            },
            {
                name: '배회',
                data: [3.8, 5.6, 7.0, 9.1, 12.4, 15.3, 17.5, 17.8, 15.0, 10.6, 6.6, 3.7, 3.8, 5.6, 7.0, 9.1, 12.4, 15.3, 17.5, 17.8, 15.0, 10.6, 6.6, 3.7],
            },
            {
                name: '카운팅',
                data: [3, 5, 7, 9, 10, 15, 17, 17, 15, 10, 6, 2, 2, 5, 7.0, 9, 12, 15, 14, 17, 15.0, 10, 6, 3],
            },
            {
                name: '쓰러짐',
                data: [13, 15, 17, 19, 20, 25, 27, 27, 15, 20, 16, 12, 12, 15, 17, 19, 22, 25, 24, 27, 10.0, 20, 16, 13],
            },
        ],
    }

    const options = {
        chart: {
            width: 1000,        // 출력 그래프 크기 Width
            height: size.height * 1.2,      // 출력 그래프 크기 Height
            animation: false          // 출력시 애니매이션 효과 비활성 : 기본 
        },
        exportMenu: {
            visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
        },
        xAxis: {
            title: 'value',           // X축 명칭 출력                              
            date: { format: 'YYYY-MM-DD' }, // or true    // DATE 출력 포맷
            //label: {                // 라벨 조정시
            //interval: 10          // 몇칸에 한번씩 X라벨을 출력할 것인가?
            //},      
        },
        yAxis: {
            title: 'date',            // Y축 명칭 출력 
            color: 'green',
        },
        legend: {
            visible: true,
            align: 'top',          // legend 출력 위치
            showCheckbox: true
        },
        series: {
            showDot: true
        },
        theme: {
            chart: {
                fontFamily: 'vedana',     // 그래프 폰트             
                backgroundColor: 'rgba(30,30,30,1)',  // 그래프 배경색 
            },
            xAxis: {                    // X 축 테마 처리 (색상,폰트,폰트두께,크기)
                title: {
                    fontFamily: 'vedana',
                    fontSize: 12,
                    //fontWeight: 400,
                    color: 'lightgray'
                },
                label: {
                    fontFamily: 'vedana',
                    fontSize: 10,
                    //fontWeight: 700,
                    color: 'darkgray'
                },
                width: 1,
                color: 'gray'
            },
            yAxis: {                     // Y 축 테마 처리 (색상,폰트,폰트두께,크기)
                title: {
                    fontFamily: 'vedana',
                    fontSize: 12,
                    //fontWeight: 400,
                    color: 'lightgray'
                },
                label: {
                    fontFamily: 'vedana',
                    fontSize: 10,
                    //fontWeight: 700,
                    color: 'darkgray'
                },
                width: 1,
                color: 'gray'
            },
            legend: {                  // Legend 폰트 관련
                label: {
                    fontFamily: 'vedana',
                    fontSize: 10,
                    //fontWeight: 700,
                    color: 'darkgray'
                }
            },
            plot: {                   // 그래프 내부 라인처리
                vertical: {
                    lineColor: 'rgba(60, 80, 180, 0.3)',
                    lineWidth: 1,
                },
                horizontal: {
                    lineColor: 'rgba(60, 80, 180, 0.3)',
                    lineWidth: 1,
                },
            }
        },
    };
    chart.lineChart({ el, data, options });
}

function LoadPieDonutChartMale() {

    var rawFile = new XMLHttpRequest();
    rawFile.overrideMimeType("application/json");
    rawFile.open("GET", "./data/dailyCount.json", true);
    rawFile.onreadystatechange = function () {
        if (rawFile.readyState === 4 && rawFile.status == "200") {

             var gridData = JSON.parse(rawFile.responseText);

             
             var faceMask = Number(gridData[0].FACE_MASKMALE)
             var faceNoMask = Number(gridData[0].FACE_NOMASKMALE)
             var ratio = parseInt((faceMask /(faceMask+faceNoMask))*100);

            const el = document.getElementById('chart_pie_donut');
            const data = {
                categories: [''],
                series: [
                    {
                        name: '착용',
                        data: faceMask,
                    },
                    {
                        name: '미착용',
                        data: faceNoMask,
                    },
                ]
            }

            const options = {
                chart: {
                    width: 200,
                    height: 200,
                    title: {
                        text: String(ratio)+'%',    // 출력 텍스트 & 가운데 출력
                        offsetX: 4,
                        offsetY: 80,
                        align: 'center'
                    },
                    animation: false
                },        // 출력 그래프 크기
                exportMenu: {
                    visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
                },
                legend: {
                    visible: false
                },
                tooltip: {						// 출력 툴팁이 옆에 그래프와 겹치면 툴팁이 잘린다. 이점 처리					
                    offsetX: -80,
                    offsetY: 0,				
                },  
                theme: {
                    title: {
                        fontFamily: 'Verdana',     // 출력 텍스트 색상, 폰트 페밀리, 크기 굵기
                        fontSize: 25,
                        fontWeight: 100,
                        color: '#ededed'
                    },
                    chart: {
                        fontFamily: 'vedana',     // 그래프 폰트             
                        backgroundColor: 'rgba(30,30,30,1)',  // 그래프 배경색 
                    },
                    legend: {                   // Legend 폰트 관련          
                        label: {
                            fontFamily: 'vedana',
                            fontSize: 10,
                            color: 'darkgray'
                        }

                    },
                    series: {
                        colors: ['rgba(15,159,175,1)', '#333333'],
                    },
                },
                series: {
                    dataLabels: {               // 데이터 출력 라벨
                        visible: false,
                        pieSeriesName: { visible: false }
                    },
                    radiusRange: {              // 도우넛 설정 INNER / OUTER
                        inner: '105%',
                        outer: '130%',
                    },
                }
            };
            chart.pieChart({ el, data, options });
        }
    }
    rawFile.send(null);

}

function LoadPieDonutChartFemale() {


    var rawFile = new XMLHttpRequest();
    rawFile.overrideMimeType("application/json");
    rawFile.open("GET", "./data/dailyCount.json", true);
    rawFile.onreadystatechange = function () {
        if (rawFile.readyState === 4 && rawFile.status == "200") {

            var gridData = JSON.parse(rawFile.responseText);

             
            var faceMask = Number(gridData[0].FACE_MASKFEMALE)
            var faceNoMask = Number(gridData[0].FACE_NOMASKFEMALE)
            var ratio = parseInt((faceMask /(faceMask+faceNoMask))*100);

            const el = document.getElementById('chart_pie_donut2');
            const data = {
                categories: [''],
                series: [
                    {
                        name: '착용',
                        data: faceMask,
                    },
                    {
                        name: '미착용',
                        data: faceNoMask,
                    },
                ]
            }
        
            const options = {
                chart: {
                    width: 200,
                    height: 200,
                    title: {
                        text: String(ratio)+'%',    // 출력 텍스트 & 가운데 출력
                        offsetX: 4,
                        offsetY: 80,
                        align: 'center'
                    },
                    animation: false
                },        // 출력 그래프 크기
                exportMenu: {
                    visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
                },
                legend: {
                    visible: false
                },
                tooltip: {						// 출력 툴팁이 옆에 그래프와 겹치면 툴팁이 잘린다. 이점 처리					
                    offsetX: -80,
                    offsetY: 0,				
                },  
                theme: {
                    title: {
                        fontFamily: 'Verdana',     // 출력 텍스트 색상, 폰트 페밀리, 크기 굵기
                        fontSize: 25,
                        fontWeight: 100,
                        color: '#ededed'
                    },
                    chart: {
                        fontFamily: 'vedana',     // 그래프 폰트             
                        backgroundColor: 'rgba(30,30,30,1)',  // 그래프 배경색 
                    },
                    legend: {                   // Legend 폰트 관련          
                        label: {
                            fontFamily: 'vedana',
                            fontSize: 10,
                            color: 'darkgray'
                        }
        
                    },
                    series: {
                        colors: ['#e8534c', '#333333'],
                    },
                },
                series: {
                    dataLabels: {               // 데이터 출력 라벨
                        visible: false,
                        pieSeriesName: { visible: false }
                    },
                    radiusRange: {              // 도우넛 설정 INNER / OUTER
                        inner: '105%',
                        outer: '130%',
                    },
                }
            };
            chart.pieChart({ el, data, options });
        }
    }
    rawFile.send(null);
}

function KeyDownSearch(e) {
    if (event.keyCode == 13) {
        FindEvtCamData(e);
    }
}


var oldStartDate = '';
var oldEndDate = '';

function searchAll(picker, callback) {
    


    $('#loading').show();

    //선택된 날짜 계산.
    var startdate;
    var enddate;

    startdate = picker.getStartDate();
    enddate = picker.getEndDate();

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
    //var btDay = btMs / (1000 * 60 * 60 * 24) + 1;

    if (oldStartDate == startfullDate && oldEndDate == endfullDate) {
        $('#loading').hide();
        callback(1, btDay);
        return;
    }

    //기간 검색
    searchEvtDuration(startfullDate,endfullDate, btDay, callback);
    

}

function searchEvtDuration( startfullDate,endfullDate, btDay, callback) {

    var xhttp = new XMLHttpRequest();
    var param = 'getDurationValue?';
    param += ('startDate=' + startfullDate + '&' + 'endDate=' + endfullDate);
    xhttp.onreadystatechange = function () {

        if (this.readyState == 4 && this.status == 200) {
            if (this.responseURL.includes('getDurationValue')) {
                //var gridData = JSON.parse(this.responseText);
                $('#loading').hide();
                callback(1, btDay);

                oldStartDate = startfullDate;
                oldEndDate = endfullDate;
            }
        }
    }
    xhttp.open('GET', param, true);
    xhttp.send();
}


function searchCamName(gridData, grid, camName)
{
    if (!camName)
    return;

    for (var i = 0; i < gridData.length; i++) {
        list_str = gridData[i].CAMERA_NAME;
        if (list_str.indexOf(camName) != -1) {
            grid.focusAt(i, 0, true);
            return;
        }
    }
}



