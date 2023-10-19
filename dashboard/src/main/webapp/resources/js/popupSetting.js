

// 현재 뷰
var nView = 0;

// Todo
var siteCode = "8fa782cf6dcbf955d29e";
var userId = "admin";
var userName = "관리자";

// 환경설정
var init_page = "0";
var divide_page = "4";
var exe_type = "1";
/*
    1. 사용자 정보조회
*/
// 그리드
var userTable = null;

// 더블클릭한 Row number
var iCheckedIndex = -1;
var config_set_data;

// 사용자 정보
var userDatas = [
    {
        name: '고승균',
        id: 'ksg',
        pw: '1234',
        backup: '가능',
        status: '미사용',
        _attributes: {
            disabled: true,
            className: {
                row: ['#282828']
            }
        }
    }
];

/*
    4. 사용자 그룹설정
*/
// 그리드
var userGroup = null;
var selectedGroup = null;
var camera = null;

var nRequest = 0;

// 그리드 선택 인덱스
var userGroupIndex = -1;

// 사용자 그룹
var userGroupDatas = [
    /*
    {
        groupCode: 'groupCode000'
        groupName: '카메라 그룹 1'
        camera: {
            cameraCode: 
            cameraName:
        },
    }
    */
];

// 선택한 그룹
var selectedGroupDatas = [
    /*
    {
        cameraCode: '',
        cameraName: ' 1',
    },
    */
];

// 카메라
var cameraDatas = [
    /*
    {
        cameraCode: '',
        cameraName: '',
    }
    */
];

function requestQuery(param)
{
    // DB에서 데이터 받아오기
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () 
    {
        if (this.readyState == 4 && this.status == 200) 
        {
            // TB_AI_NVR_DASH_BOARD_USER
            if( this.responseURL.includes('selectUserInfo') )
            {
                
                var jsonData = JSON.parse(this.responseText); 
                console.log('Response /selectUserInfo');

                /*
                // 배열 초기화
                userDatas = [];
                
                for( var i=0; i<jsonData.length; i++ )
                {
                    userDatas.push({
                        name: jsonData[i].user_name,
                        id: jsonData[i].user_id,
                        pw: jsonData[i].user_pw,
                        backup: jsonData[i].user_backup == "1" ? '가능' : '불가능',
                        status: jsonData[i].user_status == "1" ? '사용' : '미사용',
                        _attributes: {
                            disabled: jsonData[i].user_id == "admin" ? true : false
                        }
                    });
                }
                */

                userDatas = [];

                const tblUserInfo = document.getElementsByClassName("userList")[0];

                const userInfos = tblUserInfo.getElementsByTagName('tr');

                const rowLength = userInfos.length;

                for( var i=0; i<rowLength-1; i++ )
                    tblUserInfo.deleteRow(-1);

                for( var i=0; i<jsonData.length; i++ )
                {
                    const tr = document.createElement("tr");

                    if( jsonData[i].user_id == "admin" )
                    {
                        tr.classList.add("adminLine");
                        var td = document.createElement("td");
                        tr.appendChild(td);
                    }
                    else
                    {
                        var tdCheck = document.createElement("td");
                        tdCheck.innerHTML = "<input type='checkbox' name=''>";
                        tr.appendChild(tdCheck);
                    }

                    var tdName = document.createElement("td");
                    tdName.innerText = jsonData[i].user_name;
                    tr.appendChild(tdName);
                    var tdId = document.createElement("td");
                    tdId.innerText = jsonData[i].user_id;
                    tr.appendChild(tdId);
                    var tdPw = document.createElement("td");
                    tdPw.innerText = jsonData[i].user_pw;
                    tr.appendChild(tdPw);
                    var tdBackup = document.createElement("td");
                    tdBackup.innerText = jsonData[i].user_backup == "1" ? '가능' : '불가능';
                    tr.appendChild(tdBackup);
                    var tdStatus = document.createElement("td");
                    tdStatus.innerText = jsonData[i].user_status == "1" ? '사용' : '미사용';
                    tr.appendChild(tdStatus);

                    tblUserInfo.appendChild(tr);

                    userDatas.push({
                        name: jsonData[i].user_name,
                        id: jsonData[i].user_id,
                        pw: jsonData[i].user_pw,
                        backup: jsonData[i].user_backup == "1" ? '가능' : '불가능',
                        status: jsonData[i].user_status == "1" ? '사용' : '미사용',
                        _attributes: {
                            disabled: jsonData[i].user_id == "admin" ? true : false
                        }
                    });
                }

                var param = 'selectCameraDef?';
                var userId = sessionStorage.getItem('userId');

                param += ('userId=' + userId);

                requestQuery(param);
                
                /*
                // 팝업 모달
                var modal = document.getElementById("modal");
                modal.style.display = "block";

                // 사용자 정보 조회
                openUserInfoView();
                */
            }
            else if( this.responseURL.includes('updateUserInfo') )
            {
                console.log('Response /updateUserInfo');

                userDatas[iCheckedIndex-1].name = document.getElementById('AddUserView_Name').value;
                userDatas[iCheckedIndex-1].id = document.getElementById('AddUserView_Id').value;
                userDatas[iCheckedIndex-1].pw = document.getElementById('AddUserView_Pw').value;
                userDatas[iCheckedIndex-1].backup = document.getElementsByName("backup")[0].checked == 'true' ? '가능' : '불가능';
                userDatas[iCheckedIndex-1].status = document.getElementsByName("used")[0].checked == 'true' ? '사용' : '미사용';

                // 테이블 삭제후 데이터 변경
                const tblUserInfo = document.getElementsByClassName("userList")[0];

                const userInfos = tblUserInfo.getElementsByTagName('tr');

                const rowLength = userInfos.length;

                for( var i=0; i<rowLength-1; i++ )
                    tblUserInfo.deleteRow(-1);

                for( var i=0; i<jsonData.length; i++ )
                {
                    const tr = document.createElement("tr");

                    if( jsonData[i].user_id == "admin" )
                    {
                        tr.classList.add("adminLine");
                        var td = document.createElement("td");
                        tr.appendChild(td);
                    }
                    else
                    {
                        var tdCheck = document.createElement("td");
                        tdCheck.innerHTML = "<input type='checkbox' name=''>";
                        tr.appendChild(tdCheck);
                    }

                    var tdName = document.createElement("td");
                    tdName.innerText = jsonData[i].user_name;
                    tr.appendChild(tdName);
                    var tdId = document.createElement("td");
                    tdId.innerText = jsonData[i].user_id;
                    tr.appendChild(tdId);
                    var tdPw = document.createElement("td");
                    tdPw.innerText = jsonData[i].user_pw;
                    tr.appendChild(tdPw);
                    var tdBackup = document.createElement("td");
                    tdBackup.innerText = jsonData[i].user_backup == "1" ? '가능' : '불가능';
                    tr.appendChild(tdBackup);
                    var tdStatus = document.createElement("td");
                    tdStatus.innerText = jsonData[i].user_status == "1" ? '사용' : '미사용';
                    tr.appendChild(tdStatus);

                    tblUserInfo.appendChild(tr);
                }

                // 사용자 정보 조회로 이동
                openUserInfoView();
            }
            else if( this.responseURL.includes('insertUserInfo') )
            {
                console.log('Response /insertUserInfo');

                var name = document.getElementById('AddUserView_Name').value;
                var id = document.getElementById('AddUserView_Id').value;
                var pw = document.getElementById('AddUserView_Pw').value;
                var backup = document.getElementsByName("backup")[0].checked;
                var status = document.getElementsByName("used")[0].checked;

                userDatas.push({
                    name : name, 
                    id : id, 
                    pw : pw, 
                    backup : backup, 
                    status : status
                });
            
                /*
                // 사용자 정보 조회에 추가
                userTable.appendRow({
                    name : name, 
                    id : id, 
                    pw : pw, 
                    backup : backup == true ? "가능" : "불가능", 
                    status : status == true ? "사용" : "미사용"
                });
                */

                var tblUserInfo = document.getElementsByClassName("userList")[0];
                const tr = document.createElement("tr");

                var tdCheck = document.createElement("td");
                tdCheck.innerHTML = "<input type='checkbox' name=''>";
                tr.appendChild(tdCheck);
 
                var tdName = document.createElement("td");
                tdName.innerText = name;
                tr.appendChild(tdName);
                var tdId = document.createElement("td");
                tdId.innerText = id;
                tr.appendChild(tdId);
                var tdPw = document.createElement("td");
                tdPw.innerText = pw;
                tr.appendChild(tdPw);
                var tdBackup = document.createElement("td");
                tdBackup.innerText = backup == true ? '가능' : '불가능';
                tr.appendChild(tdBackup);
                var tdStatus = document.createElement("td");
                tdStatus.innerText = status == true ? '사용' : '미사용';
                tr.appendChild(tdStatus);

                tblUserInfo.appendChild(tr);
            
                // 사용자 정보 조회로 이동
                openUserInfoView();
            }
            else if( this.responseURL.includes('deleteUserInfo') )
            {
                console.log('Response /deleteUserInfo');

                const tblUserInfo = document.getElementsByClassName("userList")[0];
                const userInfos = tblUserInfo.getElementsByTagName('tr');

                var arrIndex = new Array();

                userInfos.forEach(function(value, index, array) {
                    var checkbox = userInfos[index].querySelector('input');

                    if( (checkbox != null) && (checkbox.checked) )
                    {
                        arrIndex.push(index);
                    }
                });

                for( var i=arrIndex.length-1; i>=0; i-- )
                {
                    tblUserInfo.deleteRow(arrIndex[i]);
                    userDatas.splice(arrIndex[i]-1, 1);
                }

                console.log(userDatas);

                /*
                var checkedRows = userTable.getCheckedRows();

                for(var i=0; i<checkedRows.length; i++)
                {
                    var checkedRow = checkedRows[i];
                }

                userTable.removeCheckedRows();
                */
            }
            // TB_AI_CAMERA_GROUP_DEF
            else if( this.responseURL.includes('selectCameraDef') )
            {
                console.log('Response /selectCameraDef');

                var jsonData = JSON.parse(this.responseText); 
                //console.log(jsonData);

                // 배열 초기화
                userGroupDatas = [];
                
                for( var i=0; i<jsonData.length; i++ )
                {
                    userGroupDatas.push({
                        groupCode: jsonData[i].ai_group_code,
                        groupName: jsonData[i].ai_group_name,
                        cameras: new Array()
                    });
                }

                var userId = sessionStorage.getItem('userId');
                var param = 'selectCameraReg?userId=' + userId;
                requestQuery(param);
            }
            else if( this.responseURL.includes('updateCameraDef') )
            {
                
            }
            else if( this.responseURL.includes('insertCameraDef') )
            {
                console.log('Response /insertCameraDef');

                var jsonData = JSON.parse(this.responseText); 

                var lstGroup = document.getElementById("lstGroup");
                const groupItems = lstGroup.getElementsByTagName('li');

                var insertedItem = groupItems[groupItems.length-1];

                // ex) 5
                var no = jsonData[0].no;
                // ex) 000005
                var filledZero = no.padStart(6, '0');

                var groupCode = "groupCode" + filledZero;
                insertedItem.groupCode = groupCode;

                /*
                var row = userGroup.getRow(userGroup.getRowCount()-1);

                var no = jsonData[0].no;
                var filledZero = no.padStart(6, '0');

                var groupCode = "groupCode" + filledZero;
                row.groupCode = groupCode;
                */
            }
            else if( this.responseURL.includes('deleteCameraDef') )
            {
                //userGroup.removeRow(userGroupIndex);

                var lstGroup = document.getElementById("lstGroup");

                const groupItems = lstGroup.getElementsByTagName('li');
            
                // 삭제
                groupItems.forEach(function(value, index, array) {
                    if( groupItems[index].classList.contains('groupON') )
                        lstGroup.removeChild(groupItems[index]);
                });
            
                var lstSelectedGroup = document.getElementById("lstSelectedGroup");
            
                // 선택 그룹 초기화
                while( lstSelectedGroup.hasChildNodes() )
                    lstSelectedGroup.removeChild(lstSelectedGroup.firstChild);

                const selectedGroupName = document.getElementById('selectedGroupName');
                selectedGroupName.innerText = '';

                const selectedGroupCh = document.getElementById('selectedGroupCh');
                selectedGroupCh.innerText = '0 CH';
            }
            // TB_AI_CAMERA_GROUP_REG
            else if( this.responseURL.includes('selectCameraReg') )
            {
                console.log('Response /selectCameraReg');

                var jsonData = JSON.parse(this.responseText); 
                //console.log(jsonData);

                for( var groupReg of jsonData )
                {
                    for( var groupDef of userGroupDatas )
                    {
                        if( groupReg.ai_group_code == groupDef.groupCode )
                        {
                            groupDef.cameras.push({
                                cameraCode: groupReg.camera_code,
                                cameraName: groupReg.camera_name
                            });
                            break;
                        }
                    }
                }
                
                if( config_data[0].exe_type == "0" )
                    requestQuery('selectCamera');
                else
                    requestQuery('selectCmsCamera');
            }
            else if( this.responseURL.includes('updateCameraReg') )
            {
                
            }
            else if( this.responseURL.includes('insertCameraReg') )
            {
                nRequest--;

                if( nRequest == 0 )
                {
                    

                    /*
                    // 선택한 그룹
                    var row = userGroup.getRowAt(userGroupIndex);

                    var checkedCameras = camera.getCheckedRows();

                    var arrCamera = new Array();
                    checkedCameras.forEach(function(value, index, array) {
                        var cameraCode = checkedCameras[index].cameraCode;
                        var cameraName = checkedCameras[index].cameraName;
                        arrCamera.push({
                            cameraCode: cameraCode,
                            cameraName: cameraName
                        });
                    });

                    // 카메라 해제
                    camera.uncheckAll();

                    // 중복제거 후 배열 넣기
                    if( (row.value != null) && (row.value != '') )
                    {
                        var mergeArray = row.value.concat(arrCamera);
                        var uniqueArray = mergeArray.filter((item, pos) => mergeArray.indexOf(item) === pos);
                        userGroup.setValue(row.rowKey, 'value', uniqueArray);
                    }
                    else
                        userGroup.setValue(row.rowKey, 'value', arrCamera);

                    // 선택그룹 삭제
                    selectedGroup.clear();

                    // 카메라 넣기
                    row = userGroup.getRowAt(userGroupIndex);
                    row.value.forEach(function(value, index, array) {
                        var cameraCode = row.value[index].cameraCode;
                        var cameraName = row.value[index].cameraName;

                        selectedGroup.appendRow({
                            cameraCode: cameraCode,
                            cameraName: cameraName
                        });
                    });

                    // 채널 수
                    const selectedGroupCh = document.getElementById('selectedGroupCh');
                    selectedGroupCh.innerText = selectedGroup.getRowCount() + ' CH';   

                    // 선택그룹 보이게 하기
                    var selectedGroupElement = document.getElementById('lstSelectedGroup');
                    selectedGroupElement.style.visibility = 'visible';
                    */
                }
            }
            else if( this.responseURL.includes('deleteCameraReg') )
            {
                nRequest--;

                if( nRequest == 0 )
                {
                    /*
                    var row = userGroup.getRowAt(userGroupIndex);

                    // 선택그룹의 카메라 삭제
                    selectedGroup.removeCheckedRows();

                    // 카메라 다시 저장
                    var arrCamera = new Array();

                    var rows = selectedGroup.getData();
                    rows.forEach(function(value, index, array) {
                        var cameraCode = rows[index].cameraCode;
                        var cameraName = rows[index].cameraName;
                        arrCamera.push({
                            cameraCode: cameraCode,
                            cameraName: cameraName
                        });
                    });

                    
                    userGroup.setValue(row.rowKey, 'value', arrCamera);

                    // 채널 수
                    const selectedGroupCh = document.getElementById('selectedGroupCh');
                    selectedGroupCh.innerText = selectedGroup.getRowCount() + ' CH';
                    */
                }
            }
            else if( this.responseURL.includes('executeTransaction'))
            {
                alert('사용자 그룹 설정을 저장하였습니다.');

                /*
                nRequest--;

                if( nRequest== 0 )
                    requestQuery('insertCameraReg');
                */
            }
            // TB_CAMERA
            else if( this.responseURL.includes('selectCamera') )
            {
                console.log('Response /selectCamera');

                var jsonData = JSON.parse(this.responseText); 
                //console.log(jsonData);

                // 배열 초기화
                cameraDatas = [];
                
                for( var i=0; i<jsonData.length; i++ )
                {
                    cameraDatas.push({
                        cameraCode: jsonData[i].camera_code,
                        cameraName: jsonData[i].camera_name
                    });
                }

                var totalCameraCh = document.getElementById('totalCameraCH');
                totalCameraCh.innerText = jsonData.length + " CH";

                // 사용자 그룹 설정
                //openUserGroupView();

                // 카메라 개수
                //createCameraTable();

                // 팝업 모달
                var modal = document.getElementById("modal");
                modal.style.display = "block";

                // 사용자 정보 조회
                openUserInfoView();
            }
            // TB_CMS_CAMERA
            else if( this.responseURL.includes('selectCmsCamera') )
            {
                console.log('Response /selectCmsCamera');

                var jsonData = JSON.parse(this.responseText); 
                //console.log(jsonData);

                // 배열 초기화
                cameraDatas = [];
                
                for( var i=0; i<jsonData.length; i++ )
                {
                    cameraDatas.push({
                        cameraCode: jsonData[i].camera_code,
                        cameraName: jsonData[i].camera_name
                    });
                }

                var totalCameraCh = document.getElementById('totalCameraCH');
                totalCameraCh.innerText = jsonData.length + " CH";

                // 사용자 그룹 설정
                //openUserGroupView();

                // 카메라 개수
                //createCameraTable();

                // 팝업 모달
                var modal = document.getElementById("modal");
                modal.style.display = "block";

                // 사용자 정보 조회
                openUserInfoView();
            }
        }
    };
    xhttp.open('GET', param, true);
    xhttp.send();
}

function openPopupSetting()
{
    // DB에서 데이터 받아오기
    requestQuery('selectUserInfo');

    /*
    var param = 'selectCameraDef?';
    var userId = sessionStorage.getItem('id');

    param += ('userId=' + userId);

    requestQuery(param);
    requestQuery('selectCamera');
    */
}

window.onclick = function(event) 
{
    var modal = document.getElementById("modal");
    if( event.target == modal ) {
        closePopup();
    }
};

function openUserInfoView()
{
    var view1 = document.getElementById("view1");
    var view2 = document.getElementById("view2");
    var view3 = document.getElementById("view3");
    var view4 = document.getElementById("view4");

    view1.style.display = "block";
    view2.style.display = "none";
    view3.style.display = "none";
    view4.style.display = "none";

    // 탭 글씨색
    nView = 0;
    changeTabColor(nView);
    
    document.getElementById('AddUserView_Name').value = "";
    document.getElementById('AddUserView_Id').value = "";
    document.getElementById('AddUserView_Pw').value = "";
    document.getElementsByName("backup")[0].checked = true;
    document.getElementsByName("used")[0].checked = true;

    //createUserTable();
}

function openAddUserView()
{
    //alert('사용자 정보 등록');
    //console.log('alert2');
    var view1 = document.getElementById("view1");
    var view2 = document.getElementById("view2");
    var view3 = document.getElementById("view3");
    var view4 = document.getElementById("view4");

    view1.style.display = "none";
    view2.style.display = "block";
    view3.style.display = "none";
    view4.style.display = "none";

    nView = 1;
    changeTabColor(nView);

    //resetData();
}

function openUserEnvironmentView()
{    
    //alert('사용자 환경 설정');
    //console.log('alert3');
    var view1 = document.getElementById("view1");
    var view2 = document.getElementById("view2");
    var view3 = document.getElementById("view3");
    var view4 = document.getElementById("view4");

    view1.style.display = "none";
    view2.style.display = "none";
    view3.style.display = "block";
    view4.style.display = "none";

    nView = 2;
    changeTabColor(nView);   
     
    //resetData();
    // 데이터 셋팅
    SetConfigData();
}

function openUserGroupView()
{
    //alert('사용자 그룹 설정');
    //console.log('alert4');
    var view1 = document.getElementById("view1");
    var view2 = document.getElementById("view2");
    var view3 = document.getElementById("view3");
    var view4 = document.getElementById("view4");

    view1.style.display = "none";
    view2.style.display = "none";
    view3.style.display = "none";
    view4.style.display = "block";

    nView = 3;
    changeTabColor(nView);

    //resetData();    

    createUserGroupTable();
    //createSelectedGroupTable();
    createCameraTable();

    const selectedGroupName = document.getElementById('selectedGroupName');
    selectedGroupName.style.color = "#666666";
}

function changeTabColor(tabIndex)
{
    // 클릭한 탭의 글씨색 변경
    var tabs = document.getElementsByClassName("pop-tabs");
    var items = tabs[0].getElementsByTagName('li');

    items.forEach(function(value, index, array) {
        var text = items[index].querySelector('a');
        text.style.color = "#ffffff";
        items[index].style.background = "#282828"
    });

    const selectedText = items[tabIndex].querySelector('a');
    selectedText.style.color = "#ffa800";

    items[tabIndex].style.background = "#333333";
}

function closePopup()
{
    console.log('closePopup');
    var modal = document.getElementById("modal");
    modal.style.display = "none";

    resetData();
}

function resetData()
{
    /* 
        1. 사용자 정보 조회
    */
    userDatas = [];

    /* 
        2. 사용자 정보 등록
    */
    document.getElementById('AddUserView_Name').value = "";
    document.getElementById('AddUserView_Id').value = "";
    document.getElementById('AddUserView_Pw').value = "";
    document.getElementsByName("backup")[0].checked = "true";
    document.getElementsByName("used")[0].checked = "true";

    document.getElementById('AddUserView_Name').removeAttribute('readonly');
    document.getElementById('AddUserView_Id').removeAttribute('readonly');

    /* 
        3. 사용자 환경 설정
    */

    /*
        4. 사용자 그룹 설정 
    */
    userGroupDatas = [];
    selectedGroupDatas = [];
    cameraDatas = [];

    // 사용자 그룹
    var lstGroup = document.getElementById("lstGroup");
    while( lstGroup.hasChildNodes() )
        lstGroup.removeChild(lstGroup.firstChild);

    // li 아이템들
    const groupItems = lstGroup.getElementsByTagName('li');

    /*
    // 기존의 선택 삭제
    groupItems.forEach(function(value, index, array) {
        groupItems[index].classList.remove('groupON');

        // 카메라 삭제
        var cameras =  groupItems[index].getAttribute('cameras');
        if( cameras != null )
            groupItems[index].setAttribute('cameras', '');
    });
    */

    // 선택그룹
    var lstSelectedGroup = document.getElementById("lstSelectedGroup");

    // 기존의 카메라 삭제
    while( lstSelectedGroup.hasChildNodes() )
        lstSelectedGroup.removeChild(lstSelectedGroup.firstChild);

    var lstCamera = document.getElementById("lstCamera");

    while( lstCamera.hasChildNodes() )
        lstCamera.removeChild(lstCamera.firstChild);

    /*
    // li 아이템들
    const cameraItems = lstCamera.getElementsByTagName('li');

    var arrCamera = new Array();
    cameraItems.forEach(function(value, index, array) {
        var checkbox = cameraItems[index].querySelector('input');

        if( checkbox.checked )
            checkbox.checked = false;
    });
    */

    const selectedGroupName = document.getElementById('selectedGroupName');
    selectedGroupName.innerText = '';

    const selectedGroupCh = document.getElementById('selectedGroupCh');
    selectedGroupCh.innerText = '0 CH';
}

function addUserInfo()
{
    if( nView == 0 )    // 사용자 정보 수정
    {
        var name = document.getElementById('AddUserView_Name').value;
        var id = document.getElementById('AddUserView_Id').value;
        var pw = document.getElementById('AddUserView_Pw').value;
    
        var bkup_check = document.getElementsByName("backup");
        var backup = bkup_check[0].checked == true ? 1 : 0;
    
        var account_check = document.getElementsByName("used");
        var status = account_check[0].checked == true ? 1 : 0;

        // 웹서버로 전송
        var param = 'updateUserInfo?name=' + name + '&id=' + id + '&pw=' + pw + '&backup=' + backup + '&status=' + status;
        requestQuery(param);
    }
    else if( nView == 1 )   // 사용자 정보 등록
    {
        var name = document.getElementById('AddUserView_Name').value;        
        var id = document.getElementById('AddUserView_Id').value;
        var pw = document.getElementById('AddUserView_Pw').value;
    
        var bkup_check = document.getElementsByName("backup");
        var backup = bkup_check[0].checked == true ? 1 : 0;
    
        var account_check = document.getElementsByName("used");
        var status = account_check[0].checked == true ? 1 : 0;

        // 웹서버로 전송
        var param = 'insertUserInfo?name=' + name + '&id=' + id + '&pw=' + pw + '&backup=' + backup + '&status=' + status;
        requestQuery(param);
    }
}

function editUserInfo()
{
    const tblUserInfo = document.getElementsByClassName("userList")[0];
    const userInfos = tblUserInfo.getElementsByTagName('tr');

    var iCheckNum = 0;

    userInfos.forEach(function(value, index, array) {
        var checkbox = userInfos[index].querySelector('input');

        if( (checkbox != null) && (checkbox.checked) )
        {
            iCheckNum++;
            iCheckedIndex = index;
        }
    });

    if( iCheckNum > 1 )
        return;

    var view1 = document.getElementById("view1");
    var view2 = document.getElementById("view2");
    var view3 = document.getElementById("view3");
    var view4 = document.getElementById("view4");

    view1.style.display = "none";
    view2.style.display = "block";
    view3.style.display = "none";
    view4.style.display = "none";

    const checkdRow = userInfos[iCheckedIndex].getElementsByTagName('td');

    document.getElementById('AddUserView_Name').value = checkdRow[1].firstChild.data;
    document.getElementById('AddUserView_Name').setAttribute('readonly', '');

    document.getElementById('AddUserView_Id').value = checkdRow[2].firstChild.data;
    document.getElementById('AddUserView_Id').setAttribute('readonly', '');

    document.getElementById('AddUserView_Pw').value = checkdRow[3].firstChild.data;

    if( checkdRow[4].firstChild.data == '가능' )
        document.getElementsByName("backup")[0].checked = 'true';
    else
        document.getElementsByName("backup")[1].checked = 'true';

    if( checkdRow[5].firstChild.data == '사용' )
        document.getElementsByName("used")[0].checked = 'true';
    else
        document.getElementsByName("used")[1].checked = 'true';
}

function cancelUserInfo()
{
    openUserInfoView();
}

function deleteUser()
{
    const tblUserInfo = document.getElementsByClassName("userList")[0];
    const userInfos = tblUserInfo.getElementsByTagName('tr');

    var param = 'deleteUserInfo?';
    var isCheckedRow = false;

    userInfos.forEach(function(value, index, array) {

        var checkbox = userInfos[index].querySelector('input');

        if( (checkbox != null) && (checkbox.checked) )
        {
            const columns = userInfos[index].getElementsByTagName('td');

            param += ('id='+columns[2].firstChild.data + '&');
            isCheckedRow = true;
        }
    });

    if( isCheckedRow )
    {
        param = param.slice(0, -1);
        requestQuery(param);
    }

    /*
    // Grid
    var checkedRows = userTable.getCheckedRows();
    var param = 'deleteUserInfo?';

    for( var i=0; i<checkedRows.length; i++ )
    {
        param += ('id='+checkedRows[i].id);
        if( i != (checkedRows.length-1) )
            param += '&';
    }

    requestQuery(param);
    */
}

/*
    사용자 그룹 설정
*/

function addGroup()
{
    //var param = "insertCameraDef?userId=" + userId + "&userName=" + userName;
    //requestQuery(param);

    /*
    var value = new Array();
    userGroup.appendRow({
        groupCode: 'empty',
        groupName: '사용자 그룹',
        value: value
    });

    userGroup.startEditingAt(userGroup.getRowCount()-1, 0, true);
    */
    
    var lstGroup = document.getElementById("lstGroup");

    const groupItems = lstGroup.getElementsByTagName('li');

    // 포커스 기능 해제
    groupItems.forEach(function(value, index, array) {
        groupItems[index].classList.remove('groupON');
    });

    const value = '';
    const id = 'empty';

    const li = document.createElement("li");

    li.setAttribute('id', id);

    const textNode = document.createTextNode(value);
    li.appendChild(textNode);

    li.setAttribute('contenteditable', "true");
    li.classList.add("groupON");

    lstGroup.appendChild(li);

    li.scrollIntoView();
    li.focus();

    li.addEventListener("keypress", function(event) {
        if( event.key == "Enter" )
        {
            if( li.textContent == "" || li.textContent == null || li.textContent == undefined )
                lstGroup.removeChild(li);
            else
            {
                li.dataset.default = li.textContent;
                li.setAttribute('contenteditable', "false");
                li.classList.remove("groupON");

                var param = '';

                var userId = sessionStorage.getItem("userId");
                var userName = sessionStorage.getItem("userName");

                param = "insertCameraDef?groupName=" + li.textContent + "&userId=" + userId + "&userName=" + userName;

                requestQuery(param);
            }
        }
    });

    li.addEventListener("focusout", function(event) {
        if( li.textContent == "" || li.textContent == null || li.textContent == undefined )
            lstGroup.removeChild(li);
        else
        {
            li.dataset.default = li.textContent;
            li.setAttribute('contenteditable', "false");
            li.classList.remove("groupON");
        }
    });
}

function deleteGroup()
{
    /*
    var row = userGroup.getRow(userGroupIndex);

    var param = "deleteCameraDef?groupCode=" + row.groupCode;
    requestQuery(param);
    */

    var lstGroup = document.getElementById("lstGroup");

    const groupItems = lstGroup.getElementsByTagName('li');

    groupItems.forEach(function(value, index, array) {
        if( groupItems[index].classList.contains('groupON') )
        {
            //lstGroup.removeChild(groupItems[index]);
            var groupItem = groupItems[index];
            var groupCode = groupItem.getAttribute("groupCode");

            var param = "deleteCameraDef?groupCode=" + groupCode;
            requestQuery(param);
        }
    });
}

function clickCameraGroup(event)
{
    console.log('click camera group');

    var lstGroup = document.getElementById("lstGroup");

    const groupItems = lstGroup.getElementsByTagName('li');

    groupItems.forEach(function(value, index, array) {
        groupItems[index].classList.remove('groupON');
    });

    const groupItem = event.target;
    groupItem.classList.add("groupON");
    
    var lstSelectedGroup = document.getElementById("lstSelectedGroup");

    while( lstSelectedGroup.hasChildNodes() )
        lstSelectedGroup.removeChild(lstSelectedGroup.firstChild);

    var strCameraCode = groupItem.getAttribute('arrCameraCode');
    var strCameraName = groupItem.getAttribute('arrCameraName');
    
    const selectedGroupName = document.getElementById('selectedGroupName');
    const selectedGroupCh = document.getElementById('selectedGroupCh');

    selectedGroupName.innerText = groupItem.innerText;
    selectedGroupName.style.color = "#edc681";

    if( strCameraCode == null || strCameraCode == '' )
    {
        selectedGroupCh.innerText = '0 CH';

        return;
    }

    if( strCameraName == null || strCameraName == '' )
    {
        selectedGroupCh.innerText = '0 CH';

        return;
    }

    var arrCameraCode = strCameraCode.split(',');
    var arrCameraName = strCameraName.split(',');

    if( arrCameraCode.length != arrCameraName.length )
        return;

    selectedGroupCh.innerText = arrCameraCode.length + ' CH';

    for( var i=0; i<arrCameraCode.length; i++ )
    {
        const cameraCode = arrCameraCode[i];
        const cameraName = arrCameraName[i];

        const li = document.createElement("li");
        li.innerHTML = "<input type='checkbox' cameraCode='" + cameraCode + "'>";

        const textNode = document.createTextNode(cameraName);
        li.appendChild(textNode);

        lstSelectedGroup.appendChild(li);
    }
}

function dbclickCameraGroup()
{
    console.log('dbclick camera group');
    //alert("dbclick CameraGroup");
}

function moveGroup()
{
    //console.log('moveGroup');

    /*
    // 선택한 사용자 그룹이 있는 지 체크
    if( userGroupIndex < 0 )
        return;

    // 선택한 그룹
    var row = userGroup.getRowAt(userGroupIndex);

    // 그룹에 추가할 카메라들
    var checkedCameras = camera.getCheckedRows();

    // 쿼리 갯수
    nRequest = checkedCameras.length;

    checkedCameras.forEach(function(value, index, array) {
        var cameraCode = checkedCameras[index].cameraCode;
        var cameraName = checkedCameras[index].cameraName;

        var param = "insertCameraReg?groupCode=" + row.groupCode + "&siteCode=" + siteCode + "&cameraCode=" + cameraCode + "&cameraName=" + cameraName + "&userId=" + userId;
        requestQuery(param);
    });
    */

    const lst = document.getElementById("lstGroup");

    const groupItems = lst.getElementsByTagName('li');

    var nSelectedGroupIndex = -1;

    groupItems.forEach(function(value, index, array) {
        if( groupItems[index].classList.contains('groupON') )
            nSelectedGroupIndex = index;
    });

    if( nSelectedGroupIndex < 0 )
        return;

    const groupCode = groupItems[nSelectedGroupIndex].getAttribute("groupCode");

    const lstCamera = document.getElementById("lstCamera");
    const cameraItems = lstCamera.getElementsByTagName('li');

    const lstSelectedGroup = document.getElementById("lstSelectedGroup");
    const selectedGroupItems = lstSelectedGroup.getElementsByTagName('li');

    var arrCameraCode;
    const strCameraCode = groupItems[nSelectedGroupIndex].getAttribute("arrCameraCode");
    if( strCameraCode == null )
        arrCameraCode = new Array();
    else
        arrCameraCode = strCameraCode.split(',');

    var arrCameraName;
    const strCameraName = groupItems[nSelectedGroupIndex].getAttribute("arrCameraName");

    if( strCameraName == null )
        arrCameraName = new Array();
    else
        arrCameraName = strCameraName.split(',');

    cameraItems.forEach(function(value, index, array) {

        var checkbox = cameraItems[index].querySelector('input');

        if( checkbox.checked )
        {
            const li = document.createElement("li");

            const cameraCode = checkbox.getAttribute('cameraCode');
            li.innerHTML = "<input type='checkbox' cameraCode='" + cameraCode + "'>";

            const cameraName = cameraItems[index].innerText;
            const textNode = document.createTextNode(cameraName);
            li.appendChild(textNode);
            lstSelectedGroup.appendChild(li);

            arrCameraCode.push(cameraCode);
            arrCameraName.push(cameraName);

            var param = "insertCameraReg?groupCode=" + groupCode + "&siteCode=" + siteCode + "&cameraCode=" + cameraCode + "&cameraName=" + cameraName + "&userId=" + userId;
            requestQuery(param);

            checkbox.checked = false;
        }
    });

    groupItems[nSelectedGroupIndex].setAttribute('arrCameraCode', arrCameraCode);
    groupItems[nSelectedGroupIndex].setAttribute('arrCameraName', arrCameraName);

    // 채널 수
    const selectedGroupCh = document.getElementById('selectedGroupCh');
    selectedGroupCh.innerText = selectedGroupItems.length + ' CH';  
}

function deleteCamera()
{
    /*
    // 선택한 사용자 그룹이 있는 지 체크
    if( userGroupIndex < 0 )
        return;

    // 선택한 그룹
    var row = userGroup.getRowAt(userGroupIndex);

    // 삭제하는 카메라들
    var checkedGroupCameras = selectedGroup.getCheckedRows();

    // 쿼리 개수
    nRequest = checkedGroupCameras.length;

    checkedGroupCameras.forEach(function(value, index, array) {
        var cameraCode = checkedGroupCameras[index].cameraCode;

        var param = "deleteCameraReg?groupCode=" + row.groupCode + "&cameraCode=" + cameraCode;
        requestQuery(param);
    });
    */

    const lst = document.getElementById("lstGroup");

    const groupItems = lst.getElementsByTagName('li');

    var nSelectedGroupIndex = -1;

    groupItems.forEach(function(value, index, array) {
        if( groupItems[index].classList.contains('groupON') )
            nSelectedGroupIndex = index;
    });

    if( nSelectedGroupIndex < 0 )
        return;

    const groupCode = groupItems[nSelectedGroupIndex].getAttribute("groupCode");

    const lstSelectedGroup = document.getElementById("lstSelectedGroup");

    const selectGroupItems = lstSelectedGroup.getElementsByTagName('li');

    var arrCheckedIndex = new Array();

    var arrCameraCode = new Array();
    var arrCameraName = new Array();

    selectGroupItems.forEach(function(value, index, array) {
        var checkbox = selectGroupItems[index].querySelector('input');

        const cameraCode = checkbox.getAttribute('cameraCode');
        const cameraName = selectGroupItems[index].innerText;

        if( checkbox.checked )
        {
            arrCheckedIndex.push(index);

            var param = "deleteCameraReg?groupCode=" + groupCode + "&cameraCode=" + cameraCode;
            requestQuery(param);
        }
        else
        {
            arrCameraCode.push(cameraCode);
            arrCameraName.push(cameraName);
        }
    });

    for( var i=arrCheckedIndex.length-1; i>=0; i-- )
    {
        var index = arrCheckedIndex[i];
        lstSelectedGroup.removeChild(selectGroupItems[index]);
    }

    groupItems[nSelectedGroupIndex].setAttribute('arrCameraCode', arrCameraCode);
    groupItems[nSelectedGroupIndex].setAttribute('arrCameraName', arrCameraName);

    // 채널 수
    const selectedGroupCh = document.getElementById('selectedGroupCh');
    const selectedGroupItems = lstSelectedGroup.getElementsByTagName('li');
    selectedGroupCh.innerText = selectedGroupItems.length + ' CH'; 
}

function saveGroupSetting()
{
    var param = "executeTransaction";
    requestQuery(param);
}

function clickUserTable(event)
{
    //console.log("clickUserTable : " + event.target);
}

function dblClickUserTable(event)
{
    console.log(event);

    /*
    var view1 = document.getElementById("view1");
    var view2 = document.getElementById("view2");
    var view3 = document.getElementById("view3");
    var view4 = document.getElementById("view4");

    view1.style.display = "none";
    view2.style.display = "block";
    view3.style.display = "none";
    view4.style.display = "none";

    var dblClickedRow = userTable.getRow(nDblClicked);

    document.getElementById('AddUserView_Name').value = dblClickedRow.name;
    document.getElementById('AddUserView_Name').setAttribute('readonly', '');

    document.getElementById('AddUserView_Id').value = dblClickedRow.id
    document.getElementById('AddUserView_Id').setAttribute('readonly', '');

    document.getElementById('AddUserView_Pw').value = dblClickedRow.pw;

    if( dblClickedRow.backup == '가능' )
        document.getElementsByName("backup")[0].checked = 'true';
    else
        document.getElementsByName("backup")[1].checked = 'true';

    if( dblClickedRow.status == '사용' )
        document.getElementsByName("used")[0].checked = 'true';
    else
        document.getElementsByName("used")[1].checked = 'true';
    */
}

function createUserTable()
{
    const gridElement = document.getElementById('testPopupGrid');

    var usableScrollY = false;
    if( userDatas.length > 7 )
        usableScrollY = true;

    if( userTable == null )
    {
        tui.Grid.applyTheme('default', {
            area: {
                header: {
                    border: '#2d2d2d',
                },
            },
            outline: {
                border: '#2d2d2d',
            },
            cell: {
                normal: {
                    background: '#252525',
                    border: '#2d2d2d',
                    text: '#c5c5c5',
                    showHorizontalBorder: true,
                    showVerticalBorder: true,
                },
                header: {
                    background: '#1a1a1a',
                    border: '#2d2d2d',
                    text: '#c5c5c5',
                    showHorizontalBorder: true,
                    showVerticalBorder: true,
                },
                rowHeader: {
                    border: '2d2d2d',
                    background: '#1a1a1a',
                },
                evenRow: {
                    background: '#252525',
                },
                oddRow: {
                    background: '#252525',
                }
            },
            scrollbar:
            {
                border: "#2d2d2d",
                background: "#2d2d2d",
                emptySpace: "#1a1a1a",
                thumb : "#838383",
                active: "#aaa",
            },
        });
        
        userTable = new tui.Grid({
            el : gridElement,
            data : userDatas,
            scrollX: false,
            scrollY: usableScrollY,
            rowHeaders: ['checkbox'],
            bodyHeight: 300,
            columns: [
                {
                    header: '이름',
                    name: 'name',
                },
                {
                    header: '아이디',
                    name: 'id'
                },
                {
                    header: '비밀번호',
                    name: 'pw'
                },
                {
                    header: '개인정보 백업',
                    name: 'backup'
                },
                {
                    header: '계정상태',
                    name: 'status'
                }
            ]
        });

        userTable.on('dblclick', ev => {
            //console.log(ev);
            nDblClicked = ev.rowKey;

            var view1 = document.getElementById("view1");
            var view2 = document.getElementById("view2");
            var view3 = document.getElementById("view3");
            var view4 = document.getElementById("view4");

            view1.style.display = "none";
            view2.style.display = "block";
            view3.style.display = "none";
            view4.style.display = "none";

            var dblClickedRow = userTable.getRow(nDblClicked);

            document.getElementById('AddUserView_Name').value = dblClickedRow.name;
            document.getElementById('AddUserView_Name').setAttribute('readonly', '');

            document.getElementById('AddUserView_Id').value = dblClickedRow.id
            document.getElementById('AddUserView_Id').setAttribute('readonly', '');

            document.getElementById('AddUserView_Pw').value = dblClickedRow.pw;

            if( dblClickedRow.backup == '가능' )
                document.getElementsByName("backup")[0].checked = 'true';
            else
                document.getElementsByName("backup")[1].checked = 'true';

            if( dblClickedRow.status == '사용' )
                document.getElementsByName("used")[0].checked = 'true';
            else
                document.getElementsByName("used")[1].checked = 'true';
        });
    }
}

function createUserGroupTable()
{
    var lstGroup = document.getElementById("lstGroup");

    while( lstGroup.hasChildNodes() )
        lstGroup.removeChild(lstGroup.firstChild);

    for( var userGroupData of userGroupDatas )
    {
        const li = document.createElement('li');
        li.setAttribute('groupCode', userGroupData.groupCode);

        const textNode = document.createTextNode(userGroupData.groupName);
        li.appendChild(textNode);

        if( userGroupData.cameras != null )
        {
            var arrCameraCode = new Array();
            var arrCameraName = new Array();
            for( var cameraValue of userGroupData.cameras )
            {
                arrCameraCode.push(cameraValue.cameraCode);
                arrCameraName.push(cameraValue.cameraName);
            }

            li.setAttribute('arrCameraCode', arrCameraCode);
            li.setAttribute('arrCameraName', arrCameraName);
        }

        lstGroup.appendChild(li);
    }

    /*
    const gridElement = document.getElementById('lstGroup');

    var usableScrollY = false;
    if( userGroupDatas.length > 3 )
        usableScrollY = true;

    usableScrollY = true;

    if( userGroup == null )
    {
        userGroup = new tui.Grid({
            el : gridElement,
            data : userGroupDatas,
            scrollX: false,
            scrollY: usableScrollY,
            minRowHeight: 33,
            rowHeight: 33,
            minBodyHeight: 100,
            bodyHeight: 100,
            header: {
                height: '0px',					
            },
            columns: [
                {
                    header: '그룹이름',
                    name: 'groupName',
                    editor: 'text'
                },
            ],
            showDummyRows: true
        });

        userGroup.on('click', ev => {
            //console.log('clicked cell', ev);
            userGroupIndex = ev.rowKey;

            // 선택한 행
            var row = userGroup.getRow(userGroupIndex);
            //console.log(row);

            // 기존 선택그룹의 카메라 삭제
            selectedGroup.clear();

            // 그룹명 표기
            const selectedGroupName = document.getElementById('selectedGroupName');

            // 채널 표기
            const selectedGroupCh = document.getElementById('selectedGroupCh');

            var selectedGroupElement = document.getElementById('lstSelectedGroup');

            if( (row == null) || (row == '') )
            {
                selectedGroupName.innerText = '';
                selectedGroupCh.innerText = '0 CH';
                selectedGroupElement.style.visibility = 'hidden';

                selectedGroupDatas = [];

                return;
            }

            if( (row.value == null) || (row.value == '') )
            {
                selectedGroupCh.innerText = '0 CH';
                selectedGroupElement.style.visibility = 'hidden';

                selectedGroupDatas = [];

                return;
            }
            
            selectedGroupName.innerText = row.groupName;

            selectedGroupElement.style.visibility = 'visible';
            selectedGroup.showColumn('cameraName');

            row.value.forEach(function(value, index, array) {

                var cameraCode = row.value[index].cameraCode;
                var cameraName = row.value[index].cameraName;

                //console.log(row.value[index]);

                selectedGroup.appendRow({
                    cameraCode: cameraCode,
                    cameraName: cameraName
                });

                selectedGroupDatas.push({
                    cameraCode: cameraName,
                    casmeraName: cameraName
                });
            });

            selectedGroupCh.innerText = row.value.length + ' CH';
        });

        userGroup.on('editingFinish', ev => {
            //console.log('editingFinish cell', ev);

            var row = userGroup.getRow(ev.rowKey);
            var param = '';

            if( row.groupCode == 'empty' )
            {
                var userId = 'admin';
                var userName = '관리자';

                param = "insertCameraDef?groupName=" + ev.value + "&userId=" + userId + "&userName=" + userName;
            }
            else
                param = "updateCameraDef?groupName=" + ev.value + "&groupCode=" + row.groupCode;

            requestQuery(param);
        });
    }

    userGroup.refreshLayout();
    */
}

function createSelectedGroupTable()
{
    const gridElement = document.getElementById('lstSelectedGroup');

    var usableScrollY = false;
    if( selectedGroupDatas.length > 4 )
        usableScrollY = true;

        usableScrollY = true;

    if( selectedGroup == null )
    {
        selectedGroup = new tui.Grid({
            el : gridElement,
            data : selectedGroupDatas,
            scrollX: false,
            scrollY: usableScrollY,
            rowHeaders: ['checkbox'],
            minRowHeight: 33,
            rowHeight: 33,
            minBodyHeight: 160,
            bodyHeight: 160,
            header: {
                height: '0px',					
            },
            columns: [
                {
                    header: '카메라 이름',
                    name: 'cameraName',
                },
            ],
            showDummyRows: true
        });
    }

    gridElement.style.visibility = 'hidden';
}

function createCameraTable()
{
    var lstCamera = document.getElementById("lstCamera");

    while( lstCamera.hasChildNodes() )
        lstCamera.removeChild(lstCamera.firstChild);

    for( var cameraData of cameraDatas )
    {
        const li = document.createElement("li");
        li.innerHTML = "<input type='checkbox' cameraCode='" + cameraData.cameraCode + "'>";

        const textNode = document.createTextNode(cameraData.cameraName);
        li.appendChild(textNode);
        lstCamera.appendChild(li);
    }

    /*
    const gridElement = document.getElementById('lstCamera');

    var usableScrollY = false;
    if( cameraData.length > 10 )
        usableScrollY = true;

    usableScrollY = true;

    if( camera == null )
    {
        camera = new tui.Grid({
            el : gridElement,
            data : cameraDatas,
            scrollX: false,
            scrollY: usableScrollY,
            rowHeaders: ['checkbox'],
            minRowHeight: 33,
            rowHeight: 33,
            bodyHeight: 310,
            header: {
                height: '0px',					
            },
            columns: [
                {
                    header: '카메라이름',
                    name: 'cameraName',
                },
            ]
        });
    }

    camera.refreshLayout();
    */
}

function handlePageOnChange(e) {
    // 선택된 데이터 가져오기
    const value = e.value;    
    // 데이터 출력
    init_page = value;
}

function handleDividePageOnChange(e) {
    // 선택된 데이터 가져오기
    const value = e.value;    
    // 데이터 출력
    divide_page = value;
}

function handleExeTypeOnChange(e){
    // 선택된 데이터 가져오기
    const value = e.value;    
    // 데이터 출력
    exe_type = value;
}

function SetConfigDataFunc(parm_data)
{
    //config_set_data = parm_data;
    //document.getElementById("default_page").value = config_data[0].init_page;
    //document.getElementById("divide_page").value = config_data[0].divide_page;
    //document.getElementById("exe_type").value = config_data[0].exe_type;
}
function SetConfigData()
{
    config_set_data = config_data;

    console.log(config_data[0].init_page);
    console.log(config_data[0].divide_page);
    console.log(config_data[0].exe_type);
    console.log("-----------------");

    init_page = config_data[0].init_page
    divide_page = config_data[0].divide_page
    exe_type = config_data[0].exe_type

    const startPage = document.getElementsByName("startPage");
    startPage[init_page].checked = "true";
    const splitWindow = document.getElementsByName("splitWindow");
    const idxSplit = (divide_page / 2 )-1;
    splitWindow[idxSplit].checked = "true";
    const mode = document.getElementsByName("mode");
    mode[exe_type].checked = "true";


    //document.getElementById("default_page").value = config_data[0].init_page;
    //document.getElementById("divide_page").value = config_data[0].divide_page;
    //document.getElementById("exe_type").value = config_data[0].exe_type;


    // // 콤보박스 셋팅    
    // if(config_set_data[0].init_page == "0"){  
    //     $('#default_page_id').val("0");              
    // }else if(config_set_data[0].init_page == "1"){        
    //     $('#default_page_id').val("1");              
    // }else if(config_set_data[0].init_page == "2"){        
    //     $('#default_page_id').val("2");              
    // }

    // if(config_set_data[0].exe_type == "0"){  
    //     $('#exe_type_id').val("0");              
    // }else if(config_set_data[0].exe_type == "1"){        
    //     $('#exe_type_id').val("1");              
    // }
    
    // if(config_set_data[0].divide_page == "2"){  
    //     $('#divide_page_id').val("2").attr("selected", "selected");              
    // }else if(config_set_data[0].divide_page == "4"){        
    //     $('#divide_page_id').val("4").attr("selected", "selected");                           
    // }else if(config_set_data[0].divide_page == "6"){        
    //     $('#divide_page_id').val("6").attr("selected", "selected");                        
    // }else if(config_set_data[0].divide_page == "8"){  
    //     $('#divide_page_id').val("8").attr("selected", "selected");              
    // }    
}

function GetConfingData()
{
    return config_data;
}

// 환경설정
function saveConfigInfo()
{  
    const startPage = document.getElementsByName("startPage");
    const splitWindow = document.getElementsByName("splitWindow");
    const mode = document.getElementsByName("mode");

    for(i=0; i<startPage.length; i++ )
    {
        if( startPage[i].checked == true )
        {
            init_page = i;
            break;
        }
    }

    for(i=0; i<splitWindow.length; i++ )
    {
        if( splitWindow[i].checked == true )
        {
            divide_page = (i+1)*2;
            break;
        }
    }

    for(i=0; i<mode.length; i++ )
    {
        if( mode[i].checked == true )
        {
            exe_type = i;
            break;
        }
    }

    var xhttp = new XMLHttpRequest();
    var param = 'saveConfigValue?';
    param += ('init_page=' + init_page + '&' + 'divide=' + divide_page  + '&' + 'exe_type=' + exe_type);

    xhttp.onreadystatechange = function () 
    {
        if (this.readyState == 4 && this.status == 200) 
        {
            // TB_AI_NVR_DASH_BOARD_USER
            if( this.responseURL.includes('saveConfigValue') )
            {
                alert("사용자 환경 설정을 저장하였습니다.");
            }
        }
    };
    console.log(init_page);
    console.log(divide_page);
    console.log(exe_type);
    console.log("-----------------");

    xhttp.open('GET', param, true);
    xhttp.send();

    config_data[0].init_page = init_page;
    config_data[0].divide_page = divide_page;
    config_data[0].exe_type = exe_type;
}

function cancelConfigInfo()
{

}