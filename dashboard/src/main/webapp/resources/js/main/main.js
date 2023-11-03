 /* 오늘 날짜로 변경 시작*/
 
 // 버튼 클릭 시 오늘 날짜를 입력 필드에 넣는 함수
 function insertTodaysDate() {
   var today = new Date();
   var year = today.getFullYear();
   var month = String(today.getMonth() + 1).padStart(2, '0');
   var day = String(today.getDate()).padStart(2, '0');
   var formattedDate = year + '-' + month + '-' + day;
   document.getElementById('tui-date-picker-target').value = formattedDate;
  }
  
  // 버튼 클릭 이벤트에 함수 연결
  document.getElementById('todayBtn').addEventListener('click', insertTodaysDate);
  
/* 오늘 날짜로 변경 끝 */
 

  /* 하루 전 날짜로 변경 시작*/

 // 버튼 클릭 시 입력된 날짜에서 하루 전 날짜를 계산하여 표시하는 함수
 function showPreviousDay() {
  var inputDate = new Date(document.getElementById('tui-date-picker-target').value);
  inputDate.setDate(inputDate.getDate() - 1);
  var year = inputDate.getFullYear();
  var month = String(inputDate.getMonth() + 1).padStart(2, '0');
  var day = String(inputDate.getDate()).padStart(2, '0');
  var formattedDate = year + '-' + month + '-' + day;
  document.getElementById('tui-date-picker-target').value = formattedDate;
}

// 버튼 클릭 이벤트에 함수 연결
document.getElementById('minusBtn').addEventListener('click', showPreviousDay);

/* 하루 전 날짜로 변경 끝*/


/* 하루 지난 날짜로 변경 시작*/

 // 버튼 클릭 시 입력된 날짜에서 하루 지난 날짜를 계산하여 표시하는 함수
 function showNextDay() {
  var inputDate = new Date(document.getElementById('tui-date-picker-target').value);
  inputDate.setDate(inputDate.getDate() + 1);
  var year = inputDate.getFullYear();
  var month = String(inputDate.getMonth() + 1).padStart(2, '0');
  var day = String(inputDate.getDate()).padStart(2, '0');
  var formattedDate = year + '-' + month + '-' + day;
  document.getElementById('tui-date-picker-target').value = formattedDate;
}

// 버튼 클릭 이벤트에 함수 연결
document.getElementById('plusBtn').addEventListener('click', showNextDay);

/* 하루 지난 날짜로 변경 끝*/


 
 /* 사람 막대차트 */
  //  준비한 DOM 컨테이너에서 echarts 초기화하기
  var myChart = echarts.init(document.getElementById('mainPerson_chart'))

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
          itemStyle: { color: '#e8534c' },
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
              { value: 1048, name: '미성년', itemStyle: { color: '#d3f1f9' }},
              { value: 735, name: '청년', itemStyle: { color: '#3fd5e3' }},
              { value: 580, name: '중장년', itemStyle: { color: '#00a0de' }},
              { value: 484, name: '노년', itemStyle: { color: '#0174cf' }}
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
              { value: 1048, name: '미성년', itemStyle: { color: '#d3f1f9' } },
              { value: 735, name: '청년', itemStyle: { color: '#3fd5e3' } },
              { value: 580, name: '중장년', itemStyle: { color: '#00a0de' } },
              { value: 484, name: '노년', itemStyle: { color: '#0174cf' } },
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
        itemStyle: { color: '#94e9ec' }
      },
      {
        name: '차량',
        type: 'line', 
        data: [1, 32, 32, 21, 43, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
        itemStyle: { color: '#d4e079' }
      },
      {
        name: '얼굴',
        type: 'line', 
        data: [5, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
        itemStyle: { color: '#b4a1d8' }
      },
      {
        name: '번호판',
        type: 'line', 
        data: [10, 7, 32, 21, 42, 42, 63, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
        itemStyle: { color: '#f19ec2' }
      },
      {
        name: '침입',
        type: 'line', 
        data: [10, 32, 32, 21, 42, 42, 3, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
        itemStyle: { color: '#4176df' }
      },
      {
        name: '배회',
        type: 'line', 
        data: [1, 32, 32, 21, 43, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
        itemStyle: { color: '#fec070' }
      },
      {
          name: '카운팅',
          type: 'line',
          stack: 'Total',
          data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 23, 113, 232, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
          itemStyle: { color: '#ff7978' }
      },
      {
          name: '쓰러짐',
          type: 'line',
          stack: 'Total',
          data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 343, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42],
          itemStyle: { color: '#52c3f7' }
      }
    ],
  }

  //  차트 옵션 설정하기
  myChart.setOption(option)