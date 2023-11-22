

document.getElementById("humanBtn").addEventListener("click", () => {

    const subTop10Cameras = document.getElementById("subTop10Cameras");


    // 기존 테이블 내용 삭제
    if (subTop10Cameras) {
        subTop10Cameras.innerHTML = "";
    }

    var table = document.createElement("table");
    table.classList.add("cameraTable");
    
    var thead = document.createElement("thead");
    table.appendChild(thead);
    

    var row = document.createElement("tr");
    thead.appendChild(row);

    var cameraNameCell = document.createElement("th");
    cameraNameCell.setAttribute("scope", "col");
    cameraNameCell.textContent = "카메라명";
    row.appendChild(cameraNameCell);

    var personCountCell = document.createElement("th");
    personCountCell.setAttribute("scope", "col");
    personCountCell.textContent = "사람";
    row.appendChild(personCountCell);

    var faceCountCell = document.createElement("th");
    faceCountCell.setAttribute("scope", "col");
    faceCountCell.textContent = "얼굴";
    row.appendChild(faceCountCell);

    var invCntCountCell = document.createElement("th");
    invCntCountCell.setAttribute("scope", "col");
    invCntCountCell.textContent = "침입";
    row.appendChild(invCntCountCell);

    var lotCntCountCell = document.createElement("th");
    lotCntCountCell.setAttribute("scope", "col");
    lotCntCountCell.textContent = "배회";
    row.appendChild(lotCntCountCell);

    var cntCntCountCell = document.createElement("th");
    cntCntCountCell.setAttribute("scope", "col");
    cntCntCountCell.textContent = "쓰러짐";
    row.appendChild(cntCntCountCell);

    var falCntCountCell = document.createElement("th");
    falCntCountCell.setAttribute("scope", "col");
    falCntCountCell.textContent = "카운팅";
    row.appendChild(falCntCountCell);

    
    var tbody = document.createElement("tbody");
    tbody.classList.add("table-group-divider");
    table.appendChild(tbody);

    var row1 = document.createElement("tr");
    tbody.appendChild(row1);


    var cameraNameDataCell = document.createElement("th");
    cameraNameDataCell.setAttribute("scope", "row");
    cameraNameDataCell.classList.add("loadName");
    row1.appendChild(cameraNameDataCell);

    var personCountDataCell = document.createElement("td");
    row1.appendChild(personCountDataCell);

    var faceCountDataCell = document.createElement("td");
    row1.appendChild(faceCountDataCell);

    var invCntCountDataCell = document.createElement("td");
    row1.appendChild(invCntCountDataCell);

    var lotCntCountDataCell = document.createElement("td");
    row1.appendChild(lotCntCountDataCell);

    var cntCntCountDataCell = document.createElement("td");
    row1.appendChild(cntCntCountDataCell);

    var falCntCountDataCell = document.createElement("td");
    row1.appendChild(falCntCountDataCell);

    subTop10Cameras.appendChild(table);


    personTableChange()

});


function personTableChange() {
    // 서버로 데이터 전송
    $.ajax({
        url: '/humanTable',
        type: 'GET',
        success: function (response) {
            console.log('success!');
            console.log(response);

             // 최다검지카메라 차량 테이블(날짜 바꾸면~~)
            var dailyCount_CNT = response.dailyCount_CNT;

            //for문 사용해서 요소 꺼내기
            for (var i = 0; i < dailyCount_CNT.length; i++) {
            var currentItem = dailyCount_CNT[i];
            //console.log(currentItem);

            // currentItem의 속성에 접근 확인
            console.log(currentItem.cameraName);
            console.log(currentItem.carCount);
            console.log(currentItem.busCount);
            console.log(currentItem.truckCount);
            console.log(currentItem.motocycleCount);
            console.log(currentItem.bicycleCount);


            cameraNameDataCell.textContent = cameraName;
            personCountDataCell.textContent = personCount;
            faceCountDataCell.textContent = faceCount;
            invCntCountDataCell.textContent = invCntCount;
            lotCntCountDataCell.textContent = lotCntCount;
            cntCntCountDataCell.textContent = cntCntCount;
            falCntCountDataCell.textContent = falCntCount;


        }

        },
        error: function (xhr, error) {
            console.error('Error sending data to server:', error);
            console.log('Status:', xhr.status);
        }
    })
}    





document.getElementById("vehicleBtn").addEventListener("click", () => {

    const subTop10Cameras = document.getElementById("subTop10Cameras");


    // 기존 테이블 내용 삭제
    if (subTop10Cameras) {
        subTop10Cameras.innerHTML = "";
    }

    var table = document.createElement("table");
    table.classList.add("cameraTable");
                
    var thead = document.createElement("thead");
    table.appendChild(thead);


    var row = document.createElement("tr");
    thead.appendChild(row);

    var cameraNameCell = document.createElement("th");
    cameraNameCell.setAttribute("scope", "col");
    cameraNameCell.textContent = "카메라명";
    row.appendChild(cameraNameCell);

    var carCountCell = document.createElement("th");
    carCountCell.setAttribute("scope", "col");
    carCountCell.textContent = "자동차";
    row.appendChild(carCountCell);

    var busCountCell = document.createElement("th");
    busCountCell.setAttribute("scope", "col");
    busCountCell.textContent = "버스";
    row.appendChild(busCountCell);

    var truckCountCell = document.createElement("th");
    truckCountCell.setAttribute("scope", "col");
    truckCountCell.textContent = "트럭";
    row.appendChild(truckCountCell);

    var motocycleCountCell = document.createElement("th");
    motocycleCountCell.setAttribute("scope", "col");
    motocycleCountCell.textContent = "오토바이";
    row.appendChild(motocycleCountCell);

    var bicycleCountCell = document.createElement("th");
    bicycleCountCell.setAttribute("scope", "col");
    bicycleCountCell.textContent = "자전거";
    row.appendChild(bicycleCountCell);



    var tbody = document.createElement("tbody");
    table.appendChild(tbody);

    var row1 = document.createElement("tr");
    tbody.appendChild(row1);

    var cameraNameDataCell = document.createElement("th");
    cameraNameDataCell.setAttribute("scope", "row");
    cameraNameDataCell.classList.add("loadName");

    row1.appendChild(cameraNameDataCell);
    var carCountDataCell = document.createElement("td");
    
    row1.appendChild(carCountDataCell);
    var busCountDataCell = document.createElement("td");
    
    row1.appendChild(busCountDataCell);
    var truckCountDataCell = document.createElement("td");
    
    row1.appendChild(truckCountDataCell);

    var motocycleCountDataCell = document.createElement("td");
    row1.appendChild(motocycleCountDataCell);

    var bicycleCountDataCell = document.createElement("td");
    row1.appendChild(bicycleCountDataCell);

    subTop10Cameras.appendChild(table);

    vehicleTableChange()

});



function vehicleTableChange() {
    // 서버로 데이터 전송
    $.ajax({
        url: '/vehicleTable',
        type: 'GET',
        success: function (response) {
            console.log('success!');
            console.log(response);

             // 최다검지카메라 차량 테이블(날짜 바꾸면~~)

            

            
            var vehicleDailyCount_CNT = response.vehicleDailyCount_CNT;

            //for문 사용해서 요소 꺼내기
            for (var i = 0; i < vehicleDailyCount_CNT.length; i++) {
            var currentItem = vehicleDailyCount_CNT[i];
            //console.log(currentItem);

            // currentItem의 속성에 접근 확인
            // console.log(currentItem.cameraName);
            // console.log(currentItem.carCount);
            // console.log(currentItem.busCount);
            // console.log(currentItem.truckCount);
            // console.log(currentItem.motocycleCount);
            // console.log(currentItem.bicycleCount);


            cameraNameDataCell.textContent = currentItem.cameraName;
            carCountDataCell.textContent = currentItem.carCount;
            busCountDataCell.textContent = currentItem.busCount;
            truckCountDataCell.textContent = currentItem.truckCount;
            motocycleCountDataCell.textContent = currentItem.motocycleCount;
            bicycleCountDataCell.textContent = currentItem.bicycleCount;

        }

        },
        error: function (xhr, error) {
            console.error('Error sending data to server:', error);
            console.log('Status:', xhr.status);
        }
    })
}    


