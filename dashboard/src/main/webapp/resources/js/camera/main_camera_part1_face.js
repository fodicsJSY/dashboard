
// 성별 도넛차트
var genderChart = echarts.init(document.getElementById('sex_pie_wnd'));

option = {
    tooltip: {
      trigger: 'item'
    },
    legend: {
      bottom: '5%',
      textStyle:{
        color:'white'
      }
    },
    series: [
      {
        name: '성별',
        type: 'pie',
        radius: ['30%', '90%'],
        avoidLabelOverlap: false,
        itemStyle: {
              borderColor: '#282828',
              borderWidth: 3,
          },
        label: {
          show: true,
          position: 'inside',
          fontSize: 15,
          fontWeight: 'bold',
          formatter: '{c}'
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
          { value: 4414, name: '남성', itemStyle:{color:'#0f9faf'}},
          { value: 3756, name: '여성', itemStyle:{color:'#e8534c'}}
        ]
      }
    ]
  };

  genderChart.setOption(option)







// 악세사리 막대&라인 차트
var acceChart = echarts.init(document.getElementById('etc_line_bar_wnd'));

option = {
    grid:{
        left: 50
    },
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
      data: ['남성', '여성'],
      bottom: 0,
      textStyle:{
        color: '#fff'
      },
    },
    xAxis: [
      {
        type: 'category',
        data: ['모자', '안경', '마스크'],
        axisPointer: {
          type: 'shadow'
        }
      }
    ],
    yAxis: [
      {
        type: 'value',
        min: 0,
        max: 5000,
        interval: 1000,
        
      }
    ],
    series: [
      {
        name: '남성',
        type: 'bar',
        data: [200, 200, 200],
        barWidth: 25,
        itemStyle:{
          color: 'rgba(165,245,60,1)'
        }
      },
  
      {
        name: '여성',
        type: 'line',
        data: [4200, 4200, 4200],
        itemStyle:{
          color: 'rgba(236,190,66,1)'
        }
      }
    ]
  };

acceChart.setOption(option)



// 연령 분포 라인 차트
var ageLineChart = echarts.init(document.getElementById('age_line_bar_wnd'));
option = {
  
    xAxis: {
      type: 'category',
      boundaryGap: false,
      data: ['미성년', '청년', '중.장년', '노년']
    },
    yAxis: {
      type: 'value'
    },
    legend: { // 레전드 설정
      data: ['남성', '여성'],
      bottom: 0,
      textStyle:{
        color: '#fff'
      },
    },
    series: [
      {
        name: '남성',
        data: [1980, 1800, 50, 0],
        type: 'line',
        areaStyle: {},
        itemStyle:{color: 'rgba(70,115,200,1)'}
      },
          {
        name: '여성',
        data: [0, 50, 2100, 2300],
        type: 'line',
        areaStyle: {},
        itemStyle:{color: 'rgba(255,106,107,1)'}
      }
    ],
  };

ageLineChart.setOption(option)





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



// 이벤트 발생 비율 도넛차트
var eventChart = echarts.init(document.getElementById('event_acc_wnd'))

var option = {
    tooltip: {
        trigger: 'item'
    },
    legend: {
        top: '90%',
        data: ['침입', '배회', '카운트', '쓰러짐'],
        textStyle:{
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
            { value: 1048, name: '침입',  itemStyle: { color: '#4176df' }},
            { value: 735, name: '배회',  itemStyle: { color: '#fec070' }},
            { value: 580, name: '카운트',  itemStyle: { color: '#ff7978' } },
            { value: 580, name: '쓰러짐',  itemStyle: { color: '#52c3f7' } }
        ]
        }
    ]
}
//  차트 옵션 설정하기
eventChart.setOption(option)
