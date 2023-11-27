

/* CSV 대화상자 시작 */
function OnCSV_Click(){			
document.getElementById("csv_dialog").open = true;  
document.getElementById('csv_dialog').style.display='block';			
document.getElementById("bmp_dialog").open = false;  
document.getElementById('bmp_dialog').style.display='none';			
document.getElementById("print_dialog").open = false;  
document.getElementById('print_dialog').style.display='none';
}

function OnCSV_OK(){

document.getElementById("csv_dialog").open = false; 
document.getElementById('csv_dialog').style.display='none';	

var chk_val = document.getElementById("chk_csv_human").checked; 
if(chk_val == true) OnCSV_Human_Select();

chk_val = document.getElementById("chk_csv_vehicle").checked; 
if(chk_val == true) OnCSV_Vehicle_Select();

chk_val = document.getElementById("chk_csv_event_acc").checked; 
if(chk_val == true) OnCSV_Event_Acc_Select();

chk_val = document.getElementById("chk_csv_unmask_sex").checked; 
if(chk_val == true) OnCSV_UnMask_Select();

chk_val = document.getElementById("chk_csv_time_chk").checked; 
if(chk_val == true) OnCSV_Time_Select();

chk_val = document.getElementById("chk_csv_camera_10ch_human").checked; 
if(chk_val == true){
setMainEventTop10();
setTimeout(() => OnCSV_camera_10_human_Select(), 1000);	
}

chk_val = document.getElementById("chk_csv_camera_10ch_vehicle").checked; 
if(chk_val == true){
setMainVehicleTop10();
  // 인쇄시 '차량' 페이지 전환이 되지 않은 상태에서 값을읽고 동시에 출력하면 버퍼가 빈상태일때가 있다.
setTimeout(() => OnCSV_camera_10_vehicle_Select(), 1000);			
}

}

function OnCSV_Human_Select(){
    var itemsFormatted = [];
    var itemsNotFormatted = [];

    var headers_top = {						
        FACE_SENIORMALE: '남성'.replace(/,/g, ''), // remove commas to avoid errors
        FACE_MIDDLEMALE: '',
        FACE_ADULTMALE: '',
        FACE_YOUNGMALE: '',
        FACE_SENIORFEMALE: '여성',
        FACE_MIDDLEFEMALE: '',
        FACE_ADULTFEMALE: '',
        FACE_YOUNGFEMALE: '',
    };
    var headers = {						
        FACE_SENIORMALE: '노년'.replace(/,/g, ''), // remove commas to avoid errors
        FACE_MIDDLEMALE: '중년',
        FACE_ADULTMALE: "청년",
        FACE_YOUNGMALE: "미성년",
        FACE_SENIORFEMALE: '노년',
        FACE_MIDDLEFEMALE: '중년',
        FACE_ADULTFEMALE: "청년",
        FACE_YOUNGFEMALE: "미성년"
    };

    itemsNotFormatted = jsonDailyCount;			

    // format the data
    itemsNotFormatted.forEach((item) => {
        itemsFormatted.push({
            FACE_SENIORMALE: item.FACE_SENIORMALE.replace(/,/g, ''), // remove commas to avoid errors,
            FACE_MIDDLEMALE: item.FACE_MIDDLEMALE,
            FACE_ADULTMALE: item.FACE_ADULTMALE,
            FACE_YOUNGMALE: item.FACE_YOUNGMALE,
            FACE_SENIORFEMALE: item.FACE_SENIORFEMALE,
            FACE_MIDDLEFEMALE: item.FACE_MIDDLEFEMALE,
            FACE_ADULTFEMALE: item.FACE_ADULTFEMALE,
            FACE_YOUNGFEMALE: item.FACE_YOUNGFEMALE,
        });
    });

    var fileTitle = '사람_' + getDateStr();
    exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
}

function OnCSV_Vehicle_Select(){
    var itemsFormatted = [];
    var itemsNotFormatted = [];
    var headers_top = {};
    var headers = {						
        VEHICLE_CAR: '자동차'.replace(/,/g, ''), // remove commas to avoid errors
        VEHICLE_BUS: '버스',
        VEHICLE_TRUCK: "트럭",
        VEHICLE_MOTORCYCLE: "오토바이",
        VEHICLE_BICYCLE: '자전거',				
    };

    itemsNotFormatted = jsonDailyCount;			

    // format the data
    itemsNotFormatted.forEach((item) => {
        itemsFormatted.push({
            VEHICLE_CAR: item.VEHICLE_CAR.replace(/,/g, ''), // remove commas to avoid errors,
            VEHICLE_BUS: item.VEHICLE_BUS,
            VEHICLE_TRUCK: item.VEHICLE_TRUCK,
            VEHICLE_MOTORCYCLE: item.VEHICLE_MOTORCYCLE,
            VEHICLE_BICYCLE: item.VEHICLE_BICYCLE,
            
        });
    });

    var fileTitle = '차량_' + getDateStr();
    exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
}

function OnCSV_Event_Acc_Select(){
    var itemsFormatted = [];
    var itemsNotFormatted = [];
    var headers_top = {};
    var headers = {						
        INV_CNT: '침입'.replace(/,/g, ''), // remove commas to avoid errors
        LOT_CNT: '배회',
        CNT_CNT: "카운팅",
        FAL_CNT: "쓰러짐",				
    };

    itemsNotFormatted = jsonDailyCount;			

    // format the data
    itemsNotFormatted.forEach((item) => {
        itemsFormatted.push({
            INV_CNT: item.INV_CNT.replace(/,/g, ''), // remove commas to avoid errors,
            LOT_CNT: item.LOT_CNT,
            CNT_CNT: item.CNT_CNT,
            FAL_CNT: item.FAL_CNT,
        });
    });

    var fileTitle = '이벤트발생_' + getDateStr();
    exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
}

function OnCSV_UnMask_Select(){
    var itemsFormatted = [];
    var itemsNotFormatted = [];
    var headers_top = {						
        FACE_NOMASKMALESENIOR: '남성'.replace(/,/g, ''), // remove commas to avoid errors
        FACE_NOMASKMALEMIDDLE: '',
        FACE_NOMASKMALEADULT: '',
        FACE_NOMASKMALEYOUNG: '',
        FACE_NOMASKFEMALESENIOR: '여성',
        FACE_NOMASKFEMALEMIDDLE: '',
        FACE_NOMASKFEMALEADULT: '',
        FACE_NOMASKFEMALEYOUNG: '',
    };
    var headers = {						
        FACE_NOMASKMALESENIOR: '노년'.replace(/,/g, ''), // remove commas to avoid errors
        FACE_NOMASKMALEMIDDLE: '중년',
        FACE_NOMASKMALEADULT: "청년",
        FACE_NOMASKMALEYOUNG: "미성년",
        FACE_NOMASKFEMALESENIOR: '노년',
        FACE_NOMASKFEMALEMIDDLE: '중년',
        FACE_NOMASKFEMALEADULT: "청년",
        FACE_NOMASKFEMALEYOUNG: "미성년"
    };

    itemsNotFormatted = jsonDailyCount;			

    // format the data
    itemsNotFormatted.forEach((item) => {
        itemsFormatted.push({
            FACE_NOMASKMALESENIOR: item.FACE_NOMASKMALESENIOR.replace(/,/g, ''), // remove commas to avoid errors,
            FACE_NOMASKMALEMIDDLE: item.FACE_NOMASKMALEMIDDLE,
            FACE_NOMASKMALEADULT: item.FACE_NOMASKMALEADULT,
            FACE_NOMASKMALEYOUNG: item.FACE_NOMASKMALEYOUNG,
            FACE_NOMASKFEMALESENIOR: item.FACE_NOMASKFEMALESENIOR,
            FACE_NOMASKFEMALEMIDDLE: item.FACE_NOMASKFEMALEMIDDLE,
            FACE_NOMASKFEMALEADULT: item.FACE_NOMASKFEMALEADULT,
            FACE_NOMASKFEMALEYOUNG: item.FACE_NOMASKFEMALEYOUNG,
        });
    });
    var fileTitle = '마스크미착용자_' + getDateStr();
    exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
}

function OnCSV_Time_Select(){
    var itemsFormatted = [];
    var itemsNotFormatted = [];
    var headers_top = {};
    var headers = {						
        OCCU_TIME: '시간'.replace(/,/g, ''), // remove commas to avoid errors
        PERSON: '사람',
        VEHICLE: '차량',
        FACE: '얼굴',
        LPR: '번호판',				
        INV_CNT: '침입',
        LOT_CNT: '배회',
        CNT_CNT: '카운팅',
        FAL_CNT: '쓰러짐'
    };

    itemsNotFormatted = jsonHourlyCount;			

    // format the data
    itemsNotFormatted.forEach((item) => {
        itemsFormatted.push({
            OCCU_TIME: item.OCCU_TIME, // remove commas to avoid errors,
            PERSON: item.PERSON,
            VEHICLE: item.VEHICLE,
            FACE: item.FACE,
            LPR: item.LPR,
            INV_CNT: item.INV_CNT,
            LOT_CNT: item.LOT_CNT,
            CNT_CNT: item.CNT_CNT,
            FAL_CNT: item.FAL_CNT,					
        });
    });

    var fileTitle = '시간대별현황_' + getDateStr();
    exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
}

function OnCSV_camera_10_human_Select(){	
    var itemsFormatted = [];
    var itemsNotFormatted = [];
    var headers_top = {};
    var headers = {						
        CAMERA_NAME: '카메라명'.replace(/,/g, ''), // remove commas to avoid errors
        PERSON: '사람',
        FACE: "얼굴",
        INV_CNT: "침입",				
        LOT_CNT: "배회",
        FAL_CNT: "쓰러짐",
        CNT_CNT: "카운팅",				
    };

    itemsNotFormatted = jsonTop10CtrlCamera;			

    // format the data
    itemsNotFormatted.forEach((item) => {
        itemsFormatted.push({
            CAMERA_NAME: item.CAMERA_NAME.replace(/,/g, ''), // remove commas to avoid errors,
            PERSON: item.PERSON,
            FACE: item.FACE,
            INV_CNT: item.INV_CNT,
            LOT_CNT: item.LOT_CNT,
            FAL_CNT: item.FAL_CNT,
            CNT_CNT: item.CNT_CNT,
        });
    });

    var fileTitle = '검지카메라_TOP10_사람' + getDateStr();
    exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
    
}

function OnCSV_camera_10_vehicle_Select(){
    var itemsFormatted = [];
    var itemsNotFormatted = [];
    var headers_top = {};
    var headers = {						
        CAMERA_NAME: '카메라명'.replace(/,/g, ''), // remove commas to avoid errors
        VEHICLE_CAR: '자동차',
        VEHICLE_BUS: "버스",
        VEHICLE_TRUCK: "트럭",				
        VEHICLE_MOTORCYCLE: "오토바이",
        VEHICLE_BICYCLE: "자전거",				
    };

    itemsNotFormatted = jsonTop10VehicleCamera;			

    // format the data
    itemsNotFormatted.forEach((item) => {
        itemsFormatted.push({
            CAMERA_NAME: item.CAMERA_NAME.replace(/,/g, ''), // remove commas to avoid errors,
            VEHICLE_CAR: item.VEHICLE_CAR,
            VEHICLE_BUS: item.VEHICLE_BUS,
            VEHICLE_TRUCK: item.VEHICLE_TRUCK,
            VEHICLE_MOTORCYCLE: item.VEHICLE_MOTORCYCLE,
            VEHICLE_BICYCLE: item.VEHICLE_BICYCLE,					
        });
    });

    var fileTitle = '검지카메라_TOP10_차량_' + getDateStr();
    exportCSVFile(headers_top, headers, itemsFormatted, fileTitle);	
}

function OnCSV_Cancel(){			
    document.getElementById("csv_dialog").open = false;  
    document.getElementById('csv_dialog').style.display='none';     
}


// CSV 대화상자 
function OnBMP_Click(){			
    document.getElementById("csv_dialog").open = false;  
    document.getElementById('csv_dialog').style.display='none';	
    document.getElementById("bmp_dialog").open = true;  
    document.getElementById('bmp_dialog').style.display='block';	
    document.getElementById("print_dialog").open = false;  
    document.getElementById('print_dialog').style.display='none';	
}



function saveAsFile(uri, filename) {
    var link = document.createElement('a');
    if (typeof link.download === 'string') {
        link.href = uri;
        link.download = filename;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    } else {
        window.open(uri);
    }
}

function OnBMP_Output_Select(id, fileTitle)
{
    html2canvas($(id)[0]).then(function(canvas) {				
        saveAsFile(canvas.toDataURL(), fileTitle);
    });
}

function OnBMP_OK(){
    var fileTitle; 
    document.getElementById("bmp_dialog").open = false; 
    document.getElementById('bmp_dialog').style.display='none';	
    var chk_val = document.getElementById("chk_bmp_human").checked; 
    if(chk_val == true){
        fileTitle= '사람_이미지_' + getDateStr() + '.png';
        OnBMP_Output_Select('#human_rect', fileTitle);
    }

    chk_val = document.getElementById("chk_bmp_vehicle").checked; 
    if(chk_val == true) {
        fileTitle= '차량_이미지_' + getDateStr() + '.png';
        OnBMP_Output_Select('#vehicle_rect', fileTitle);
    }
    
    chk_val = document.getElementById("chk_bmp_event_acc").checked; 
    if(chk_val == true) {
        fileTitle= '이벤트발생_이미지_' + getDateStr() + '.png';
        OnBMP_Output_Select('#event_acc_rect', fileTitle);
    }

    chk_val = document.getElementById("chk_bmp_unmask_sex").checked; 
    if(chk_val == true) {
        fileTitle= '마스크미착용자_이미지_' + getDateStr() + '.png';
        OnBMP_Output_Select('#nomask_rect', fileTitle);
    }

    chk_val = document.getElementById("chk_bmp_time_chk").checked; 
    if(chk_val == true) {
        fileTitle= '시간대별_이미지_' + getDateStr() + '.png';
        OnBMP_Output_Select('#time_rect', fileTitle);
    }

    chk_val = document.getElementById("chk_bmp_camera_10ch_human").checked; 
    if(chk_val == true){
        setMainEventTop10();				
        fileTitle= '카메라_사람_이미지_' + getDateStr() + '.png';
        setTimeout(() => OnBMP_Output_Select('#top10_rect', fileTitle), 1500);
    }
    
    chk_val = document.getElementById("chk_bmp_camera_10ch_vehicle").checked; 
    if(chk_val == true){
        setMainVehicleTop10();				
        fileTitle= '카메라_차량_이미지_' + getDateStr() + '.png';
        setTimeout(() => OnBMP_Output_Select('#top10_rect', fileTitle), 1500);					
    }
}

function OnBMP_Cancel(){
    document.getElementById("bmp_dialog").open = false;    
    document.getElementById('bmp_dialog').style.display='none';   
}

function chkHumanVehicleClick(element){
    const checkboxes = document.getElementsByName("10ch");

    checkboxes.forEach((cb) => {
        cb.checked = false;
    })		
    element.checked = true;
}	

function OnPrint_Click(){
    document.getElementById("csv_dialog").open = false;  
    document.getElementById('csv_dialog').style.display='none';			
    document.getElementById("bmp_dialog").open = false;  
    document.getElementById('bmp_dialog').style.display='none';			
    document.getElementById("print_dialog").open = true;  
    document.getElementById('print_dialog').style.display='block';			
}

function OnBMP_Output_Select(id, fileTitle)
{
    html2canvas($(id)[0]).then(function(canvas) {				
        saveAsFile(canvas.toDataURL(), fileTitle);
    });
}

function OnPRINT_OK(){
    var fileTitle = 'Graph_Temp.png';
    document.getElementById("print_dialog").open = false; 
    document.getElementById('print_dialog').style.display='none';	
    var chk_val = document.getElementById("chk_print_human").checked; 
    if(chk_val == true){				
        OnPRT_Output_Select('#human_rect', fileTitle);				
    }

    chk_val = document.getElementById("chk_print_vehicle").checked; 
    if(chk_val == true) {
        OnPRT_Output_Select('#vehicle_rect', fileTitle);					
    }
    
    chk_val = document.getElementById("chk_print_event_acc").checked; 
    if(chk_val == true) {
        OnPRT_Output_Select('#event_acc_rect', fileTitle);				
    }

    chk_val = document.getElementById("chk_print_unmask_sex").checked; 
    if(chk_val == true) {
        OnPRT_Output_Select('#nomask_rect', fileTitle);				
    }

    chk_val = document.getElementById("chk_print_time_chk").checked; 
    if(chk_val == true) {
        OnPRT_Output_Select('#time_rect', fileTitle);				
    }

    chk_val = document.getElementById("chk_print_camera_10ch_human").checked; 
    if(chk_val == true){
        setMainEventTop10();				
        setTimeout(() => OnPRT_Output_Select('#top10_rect', fileTitle), 1500);
    }
    
    chk_val = document.getElementById("chk_print_camera_10ch_vehicle").checked; 
    if(chk_val == true){
        setMainVehicleTop10();				
        setTimeout(() => OnPRT_Output_Select('#top10_rect', fileTitle), 1500);					
    }	
    readFile();
}

function saveToFile_Chrome(fileName, content) {
    var blob = new Blob([content], { type: 'text/plain' });
    objURL = window.URL.createObjectURL(blob);
            
    // 이전에 생성된 메모리 해제
    if (window.__Xr_objURL_forCreatingFile__) {
        window.URL.revokeObjectURL(window.__Xr_objURL_forCreatingFile__);
    }
    window.__Xr_objURL_forCreatingFile__ = objURL;
    var a = document.createElement('a');
    a.download = fileName;
    a.href = objURL;
    a.click();
}

// 소스보기 버튼 클릭
function readFile() {
    event.preventDefault(); //submit 할때 새로고침 되는것을 방지
    let fileObject = document.getElementById("input_file_yes");
    let fileName = fileObject.files[0];

    let fr = new FileReader();
    fr.readAsText(fileName, "utf-8");

    fr.onload = () => {
        parseText(fr.result);
    }
}

function parseText(text) {
    
    // 여기서 파일 데이터 가공
    //
    var manage_num = document.getElementById("manage_num").value;
    var manage_agency = document.getElementById("manage_agency").value;
    var manage_department = document.getElementById("manage_department").value;
    var report_title = document.getElementById("report_title").value;
    var report_name = document.getElementById("report_name").value;
    var report_purpose = document.getElementById("report_purpose").value;
                
    var replaced_str = text.replace('manage_number', manage_num);
    replaced_str = replaced_str.replace('manage_agency', manage_agency);
    replaced_str = replaced_str.replace('manage_department', manage_department);
    replaced_str = replaced_str.replace('report_title', report_title);
    replaced_str = replaced_str.replace('report_name', report_name);
    replaced_str = replaced_str.replace('report_purpose', report_purpose);
    console.log(replaced_str);
    
    var temp_path = "보고서양식.html";
    saveToFile_Chrome(temp_path, replaced_str);			
}

function OnPRT_Output_Select(id, fileTitle)
{	
    console.log( window.location + fileTitle);									
    html2canvas($(id)[0]).then(function(canvas) {				
        saveAs(canvas.toDataURL(), fileTitle);
    });			
}

function chkPrintClick(element){
    const checkboxes = document.getElementsByName("round");

    checkboxes.forEach((cb) => {
        cb.checked = false;
    })		
    element.checked = true;
}	

function chkPaymentClick(element){
    const checkboxes = document.getElementsByName("type");

    checkboxes.forEach((cb) => {
        cb.checked = false;
    })		
    element.checked = true;
}	

function OnPRINT_Cancel(){
    document.getElementById("print_dialog").open = false;   
    document.getElementById('print_dialog').style.display='none';			    
}

/* CSV 대화상자 끝 */

 







