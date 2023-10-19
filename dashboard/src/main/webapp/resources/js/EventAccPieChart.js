
function LoadEvemtAccPieChart(DataEvtObj)              // 성별
        {                      
            const el = document.getElementById('event_acc_wnd');
            
            // var data = event_acc_data;    // 읽은 내용을 data에 넣어주어야만 정상적으로 그래프가 그려짐.
			var category_data = new Array;
			var cjson = new Object();
			cjson = "이벤트";
			category_data.push(cjson);
		
			var object_data = new Array;
            var tot_value = 0;
			for( var i = 0; i < DataEvtObj.length ; i++){	
                var ajson;               
				
                if( parseInt(DataEvtObj[i].INV_CNT) > 0 ){
                    ajson = new Object();
                    ajson.name = "침입";
                    ajson.data = parseInt(DataEvtObj[i].INV_CNT);
                    object_data.push(ajson);
                    tot_value += ajson.data;
                }               
                if( parseInt(DataEvtObj[i].LOT_CNT) > 0 ){
                    ajson = new Object();
                    ajson.name  = "배회";
                    ajson.data = parseInt(DataEvtObj[i].LOT_CNT);
                    object_data.push(ajson);
                    tot_value += ajson.data;
                }	
                if( parseInt(DataEvtObj[i].CNT_CNT) > 0 ){
                    ajson = new Object();
                    ajson.name  = "카운트";
                    ajson.data = parseInt(DataEvtObj[i].CNT_CNT);
                    object_data.push(ajson);
                    tot_value += ajson.data;
                }
                if( parseInt(DataEvtObj[i].FAL_CNT) > 0 ){
                    ajson = new Object();
                    ajson.name  = "쓰러짐";
                    ajson.data = parseInt(DataEvtObj[i].FAL_CNT);
                    object_data.push(ajson);
                    tot_value += ajson.data;
                }					
			}

			var totalInfo = new Object();			
			totalInfo.categories = category_data;
			totalInfo.series = object_data;
			
			data = totalInfo;

            const options = {
                chart: { 
                    width: '100px',        // 출력 그래프 크기 Width
                    height: '100px',      // 출력 그래프 크기 Height
                    animation: false          // 출력시 애니매이션 효과 비활성 : 기본 
                },  
                exportMenu: {
                    visible: false            // 내보내기 버튼 화면에 출력하지 않는다.     
                },
                legend: {
                        align: 'bottom',				
                        showCheckbox: false,
                    },          
                theme:{
                    chart:{
                    fontFamily: 'vedana',     // 그래프 폰트             
                    backgroundColor:'rgba(30,30,30,1)',  // 그래프 배경색 
                    },         
                    legend: {                   // Legend 폰트 관련          
                    label: {            
                        fontFamily: 'vedana',
                        fontSize: 14,                    
                        color: 'white'
                    }
                    },  
                    series:{
                        colors: ['rgba(65,118,223,1)', 'rgba(254,192,112,1)', 'rgba(255,121,120,1)', 'rgba(82,195,247,1)'],       //  색상 지정 <색상을 해당 theme series>에서만 변경 가능
                        lineWidth: 2,
      					strokeStyle: 'rgba(40,40,40,1)',
                    },      
                }, 
                series: {                   
                    selectable: true,            // SELECT = TRUE를 지정해야만 정상적으로 Select 처리가 된다. 
                    radiusRange: {              // 도우넛 설정 INNER / OUTER
                        inner: '30%',
                        outer: '100%',
                    },
                    dataLabels: {
                        visible: true,
                        formatter: (value) => {                             
                            var result = value.replace("%", "");                      
                            var display_value = tot_value * Number(result);
                            return `${Math.round((display_value)/100)}`;
                          },
                    },
                }, 
                tooltip: {						// 출력 툴팁이 옆에 그래프와 겹치면 툴팁이 잘린다. 이점 처리
                    offsetX: -100,
                    offsetY: 0,
                }, 
                
            };
            const chart_pie = chart.pieChart({ el, data, options });
            //chart_pie.showSeriesDataLabel() ;			
        }