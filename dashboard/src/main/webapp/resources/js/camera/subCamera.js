

// 객체 도넛차트
var model_pie_wnd = echarts.init(document.getElementById('model_pie_wnd'))

option = {
    tooltip: {
      trigger: 'item'
    },
    title: {
      text: '객체',  // 차트 이름을 여기에 입력
      left: 'center',     // 가운데 정렬
      top: '45%',         // 세로 중앙 정렬
      textStyle: {
        fontSize: 15,     // 폰트 크기 조절
        fontWeight: 'bold', // 폰트 굵기 조절
        color: '#fff'
      }
    },
    legend: {
      show: false
    },
    series: [
      {
        type: 'pie',
        radius: ['35%', '80%'],
        itemStyle: {
          borderColor: 'rgba(30,30,30,1)',
          borderWidth: 2
        },
        avoidLabelOverlap: false,
        label: {
          show: true,
          position: 'inside',
          fontSize: 10,
          fontWeight: 'bold',
          formatter:'{c}'
        },
        emphasis: {
          label: {
            show: false,
          }
        },
        labelLine: {
          show: false
        },
        data: [
          { value: 3894, name: '남자', itemStyle: { color: '#0f9faf' }},
          { value: 4299, name: '여자', itemStyle: { color: '#e8534c' }},
          { value: 4418, name: '마스크', itemStyle: { color: '#00a9ff' }},
          { value: 9826, name: '차량', itemStyle: { color: '#d4e079' }},
          { value: 9717, name: '차량번호 인식', itemStyle: { color: '#f19ec2' }}
        ]
      }
    ]
  };

//  차트 옵션 설정하기
model_pie_wnd.setOption(option)


// 이벤트 도넛 차트
var event_pie_wnd = echarts.init(document.getElementById('event_pie_wnd'));

option = {
    tooltip: {
      trigger: 'item'
    },
    title: {
      text: '이벤트',  // 차트 이름을 여기에 입력
      left: 'center',     // 가운데 정렬
      top: '45%',         // 세로 중앙 정렬
      textStyle: {
        fontSize: 15,     // 폰트 크기 조절
        fontWeight: 'bold', // 폰트 굵기 조절
        color: '#fff'
      }
    },
    legend: {
      show: false
    },
    series: [
      {
        type: 'pie',
        radius: ['35%', '80%'],
        itemStyle: {
          borderColor: 'rgba(30,30,30,1)',
          borderWidth: 2
        },
        avoidLabelOverlap: false,
        label: {
          show: true,
          position: 'inside',
          fontSize: 10,
          fontWeight: 'bold',
          formatter:'{c}'
        },
        emphasis: {
          label: {
            show: false,
          }
        },
        labelLine: {
          show: false
        },
        data: [
          { value: 1185, name: '침입', itemStyle: { color: '#4176df' }},
          { value: 14921, name: '배회', itemStyle: { color: '#fec070' }},
          { value: 14684, name: '카운팅', itemStyle: { color: '#ff7978' }},
          { value: 0, name: '불법 주정차', itemStyle: { color: '#aecf61' }},
          { value: 0, name: '블랙리스트', itemStyle: { color: '#7be1da' }}
        ]
      }
    ]
  };



//  차트 옵션 설정하기
event_pie_wnd.setOption(option)













// 연령별 출입자 현황 더블 도넛차트
var myChart = echarts.init(document.getElementById('chart_radial_age'))

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
    width: 150
},
grid: {
    bottom: '50%', // 그래프 영역의 하단 마진
    containLabel: true // 라벨이 차트 밖으로 나가지 않도록 함
},
series: [
    {
    name: '여성',
    type: 'pie',
    radius: ['25%', '55%'], // 첫 번째 도넛의 반지름 범위
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
        { value: 1048, name: '미성년',  itemStyle: { color: '#d3f1f9' }},
        { value: 735, name: '청년',  itemStyle: { color: '#3fd5e3' }},
        { value: 580, name: '중장년',  itemStyle: { color: '#00a0de' } },
        { value: 580, name: '노년',  itemStyle: { color: '#0174cf' } }
        
    ]
    },
    {
    name: '남성',
    type: 'pie',
    radius: ['60%', '90%'], // 두 번째 도넛의 반지름 범위
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
        { value: 1048, name: '미성년',  itemStyle: { color: '#d3f1f9' }},
        { value: 735, name: '청년',  itemStyle: { color: '#3fd5e3' }},
        { value: 580, name: '중장년',  itemStyle: { color: '#00a0de' } },
        { value: 310, name: '노년',  itemStyle: { color: '#0174cf' } }
    ]
    }
]
};

//  차트 옵션 설정하기
myChart.setOption(option)


// 남성 마스크착용비율 도넛차트
var manMaskChart = echarts.init(document.getElementById('chart_pie_donut'))
const gaugeData1 = [
{
    value: 20,
    title: {
    offsetCenter: ['0%', '-30%']
    },
    detail: {
    valueAnimation: true,
    offsetCenter: ['0%', '-20%']
    }
}
];
option = {
series: [
    {
        type: 'gauge',
        startAngle: 90,
        endAngle: -270,
        pointer: {
            show: false
        },
        progress: {
            show: true,
            overlap: false,
            roundCap: false,
            clip: false,
            itemStyle: {
            // borderWidth: 1,
            // borderColor: '#464646'
            color: '#0f9faf'
            }
        },
        axisLine: {
            lineStyle: {
            width: 15
            }
        },
        splitLine: {
            show: false,
            distance: 0,
            length: 10
        },
        axisTick: {
            show: false
        },
        axisLabel: {
            show: false,
            distance: 50
        },
        data: gaugeData1,
        title: {
            fontSize: 20
        },
        detail: {
            width: 50,
            height: 14,
            fontSize: 20,
            color: '#fff',
            borderColor: 'inherit',
            formatter: '{value}%'
        }
    }
],
width: '50%',  // 너비 설정 (예: 80%)
height: '50%'
};
//  차트 옵션 설정하기
manMaskChart.setOption(option)


// 여성 마스크착용비율 도넛차트
var manMaskChart = echarts.init(document.getElementById('chart_pie_donut2'))
const gaugeData2 = [
{
    value: 80,
    title: {
    offsetCenter: ['0%', '-30%']
    },
    detail: {
    valueAnimation: true,
    offsetCenter: ['0%', '-20%']
    }
}
];
option = {
series: [
    {
        type: 'gauge',
        startAngle: 90,
        endAngle: -270,
        pointer: {
            show: false
        },
        progress: {
            show: true,
            overlap: false,
            roundCap: false,
            clip: false,
            itemStyle: {
            // borderWidth: 1,
            // borderColor: '#464646'
                color: '#e8534c'
            }
        },
        axisLine: {
            lineStyle: {
            width: 15
            }
        },
        splitLine: {
            show: false,
            distance: 0,
            length: 10
        },
        axisTick: {
            show: false
        },
        axisLabel: {
            show: false,
            distance: 50
        },
        data: gaugeData2,
        title: {
            fontSize: 20
        },
        detail: {
            width: 50,
            height: 14,
            fontSize: 20,
            color: '#fff',
            formatter: '{value}%'
        }
    }
]
};
//  차트 옵션 설정하기
manMaskChart.setOption(option)

