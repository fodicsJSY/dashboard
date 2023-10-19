<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!--
	THIS EXAMPLE WAS DOWNLOADED FROM https://echarts.apache.org/examples/en/editor.html?c=line-stack
-->
<!DOCTYPE html>
<html lang="en" style="height: 100%">
<head>
  <meta charset="utf-8">
</head>
<body style="height: 100%; margin: 0">
  <div id="mainHourly" style="height: 100%"></div>

  
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
  <!-- Uncomment this line if you want to dataTool extension
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/extension/dataTool.min.js"></script>
  -->
  <!-- Uncomment this line if you want to use gl extension
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts-gl@2/dist/echarts-gl.min.js"></script>
  -->
  <!-- Uncomment this line if you want to echarts-stat extension
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts-stat@latest/dist/ecStat.min.js"></script>
  -->
  <!-- Uncomment this line if you want to use map
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@4.9.0/map/js/china.js"></script>
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@4.9.0/map/js/world.js"></script>
  -->
  <!-- Uncomment these two lines if you want to use bmap extension
  <script type="text/javascript" src="https://api.map.baidu.com/api?v=3.0&ak=YOUR_API_KEY"></script>
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/extension/bmap.min.js"></script>
  -->

  <script type="text/javascript">
    var dom = document.getElementById('mainHourly');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    
    var option;

    option = {
  title: {
    text: 'showHourlyChart'
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    data: ['사람', '차량', '얼굴', '번호판', '침입', '배회', '카운팅', '쓰러짐']
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  toolbox: {
    feature: {
      saveAsImage: {}
    }
  },
  xAxis: {
    type: 'category',
    boundaryGap: false,
    data: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'10', '11', '12', '13', '14', '15', '16', '17', '18', '19',
					'20', '21', '22', '23']
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: '사람',
      type: 'line',
      stack: 'Total',
      data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
    },
    // {
      //   name: '차량',
      //   type: 'line',
      //   stack: 'Total',
      //   data: [1, 32, 32, 21, 43, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
      // },
      {
        name: '얼굴',
        type: 'line',
        stack: 'Total',
        data: [5, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
      },
    // {
    //   name: '번호판',
    //   type: 'line',
    //   stack: 'Total',
    //   data: [10, 7, 32, 21, 42, 42, 63, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
    // },
    // {
    //   name: '침입',
    //   type: 'line',
    //   stack: 'Total',
    //   data: [10, 32, 32, 21, 42, 42, 3, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
    // }
    // {
    //   name: '배회',
    //   type: 'line',
    //   stack: 'Total',
    //   data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 543, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
    // }
    // {
    //   name: '카운팅',
    //   type: 'line',
    //   stack: 'Total',
    //   data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 23, 113, 232, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
    // }
    // {
    //   name: '쓰러짐',
    //   type: 'line',
    //   stack: 'Total',
    //   data: [10, 32, 32, 21, 42, 42, 43, 34, 24, 123, 113, 343, 434, 433, 132, 42, 32, 43, 32, 32, 23, 32, 32, 42]
    // }
  ]
};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
</body>
</html>