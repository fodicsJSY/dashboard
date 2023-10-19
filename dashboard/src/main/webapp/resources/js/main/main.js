
/* 사람 막대차트 */ 
//  준비한 DOM 컨테이너에서 echarts 초기화하기
var myChart = echarts.init(document.getElementById('mainPerson_chart'))

// 차트 옵션 작성하기
option = {
    tooltip: {
        trigger: 'axis',
        axisPointer: {
        // Use axis to trigger tooltip
        type: 'shadow' // 'shadow' as default; can also be 'line' or 'shadow'
        }
    },
    legend: {},
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: {
        type: 'value'
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
        left: 'center'
    },
    series: [
        {
        name: 'Access From',
        type: 'pie',
        radius: ['40%', '70%'],
        avoidLabelOverlap: false,
        itemStyle: {
            borderRadius: 10,
            borderColor: '#fff',
            borderWidth: 2
        },
        label: {
            show: false,
            position: 'center'
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
            { value: 1048, name: '미성년' },
            { value: 735, name: '청년' },
            { value: 580, name: '중장년' },
            { value: 484, name: '노년' }
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
        left: 'center'
    },
    series: [
        {
        name: 'Access From',
        type: 'pie',
        radius: ['40%', '70%'],
        avoidLabelOverlap: false,
        itemStyle: {
            borderRadius: 10,
            borderColor: '#fff',
            borderWidth: 2
        },
        label: {
            show: false,
            position: 'center'
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
            { value: 1048, name: '미성년' },
            { value: 735, name: '청년' },
            { value: 580, name: '중장년' },
            { value: 484, name: '노년' },
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
    },
    {
      name: '차량',
      type: 'line', 
      data: [1, 32, 32, 21, 43, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
    },
    {
      name: '얼굴',
      type: 'line', 
      data: [5, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
    },
    {
      name: '번호판',
      type: 'line', 
      data: [10, 7, 32, 21, 42, 42, 63, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
    },
    {
      name: '침입',
      type: 'line', 
      data: [10, 32, 32, 21, 42, 42, 3, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
    },
    {
      name: '배회',
      type: 'line', 
      data: [1, 32, 32, 21, 43, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
    },
    {
        name: '카운팅',
        type: 'line',
        stack: 'Total',
        data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 23, 113, 232, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
    },
    {
        name: '쓰러짐',
        type: 'line',
        stack: 'Total',
        data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 343, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
    }
  ],
}

//  차트 옵션 설정하기
myChart.setOption(option)