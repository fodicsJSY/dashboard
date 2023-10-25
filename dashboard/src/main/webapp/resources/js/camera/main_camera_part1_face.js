





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
        data: [1980, 1800, 0, 0],
        type: 'line',
        areaStyle: {},
        itemStyle:{color: 'rgba(70,115,200,1)'}
      },
          {
        name: '여성',
        data: [0, 0, 2100, 2300],
        type: 'line',
        areaStyle: {},
        itemStyle:{color: 'rgba(255,106,107,1)'}
      }
    ],
  };

ageLineChart.setOption(option)