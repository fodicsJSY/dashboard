
//이벤트 기간별 추이 비교성별/연령 비교 차트
var camera_evt_graph = echarts.init(document.getElementById('camera_evt_graph'))

option = {
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'cross',
      crossStyle: {
        color: '#999'
      }
    }
  },
  toolbox: {
    feature: {
      dataView: { show: true, readOnly: false },
      magicType: { show: true, type: ['line', 'bar'] },
      restore: { show: true },
      saveAsImage: { show: true }
    }
  },
  legend: {
    data: ['오늘', '어제', '1주전'],
    bottom: 0,
    textStyle:{
      color:'#fff'

    }
  },
  xAxis: [
    {
      type: 'category',
      data: ['카운팅', '침입', '배회', '마스크 미착용'],
      axisPointer: {
        type: 'shadow'
      },

    }
  ],
  yAxis: [
    {
      type: 'value',
      min: 0,
      max: 15000,
      interval: 5000,
    },
    
  ],
  series: [
    {
      name: '오늘',
      type: 'bar',
      tooltip: {
      },
      data: [500, 0, 800, 200],
      itemStyle: { color: 'rgba(126,206,244,1)' }
    },
    {
      name: '1주전',
      type: 'line',
      tooltip: {
        
      },
      data: [14566, 1000, 14000, 4500],
      itemStyle: { color: 'rgba(0,255,0,1)' }
    },
    {
      name: '어제',
      type: 'line',
      tooltip: {
      },
      data: [10, 10, 10, ],
      itemStyle: { color: 'rgba(229,144,2,1)' }
    }
  ]
};

//  차트 옵션 설정하기
camera_evt_graph.setOption(option)






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

