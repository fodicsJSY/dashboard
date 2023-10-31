<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ai VinUS DASHBOARD</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/resources/css/popup.css">
	<link rel="stylesheet" href="/resources/css/common/setting.css">

</head>
<body>
	<div class="TopLeft">
		<a class="logo"> <img src="../../resources/img/fodics_bi.png"></a>
		<h1 id="main_title" >Ai VinUS DASHBOARD</h1>
	</div>
	<div class="TopRight">
		<p id="time_title" class="time">2021-00-00 10:00:00</p>
		<!--<a href="/setting" class="rollover" alt="셋팅팝업" ><img src="../../resources/img/btn_setting.png"> <img src="../../resources/img/btn_setting_hover.png" class="over"></a>-->
		<button type="button" id="reportBtn" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal2" data-bs-whatever="@mdo"><img id="btmImg" src="../../resources/img/btn_setting.png"></button>



		<!-- 사용자 정보 조회 모달창1 시작 -->
		<!--<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
			<div class="modal-dialog" style="position: absolute; top: 300px; left: 800px;">
				<div class="modal-content" style="background-color: black; width: 900px;">
					<div class="modal-header">
						<div class="pu-tabTitle">
							<img src="/resources/img/admin/icon_setting.png">
						</div>
						<ul class="pop-tabs" data-persist="true">
							<li onclick="openUserInfoView();"><a>사용자 정보 조회</a></li>
							<li onclick="openAddUserView();"><a>사용자 정보 등록</a></li>
							<li onclick="openUserEnvironmentView();"><a>사용자 환경 설정</a></li>
							<li onclick="openUserGroupView();"><a>카메라 그룹 설정</a></li>
						</ul>

						<a class="rollover" alt="창닫기" data-bs-dismiss="modal" aria-label="Close">
							<img src="/resources/img/admin/btn_POPwinClose.png"> 
							<img src="/resources/img/admin/btn_POPwinClose_hover.png" class="over">
						</a>
					</div>
					<div class="modal-body" style="display: flex; justify-content: center;">
						<div class="popupTable" id="testPopupGrid">
							<table class="userList">
								<colgroup>
									<col width="8%">
									<col width="15%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="*">
								</colgroup>
								<tr>
									<th><input type="checkbox" name=""></th>
									<th>이름</th>
									<th>아이디</th>
									<th>비밀번호</th>
									<th>개인정보 백업</th>
									<th>계정상태</th>
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td>정송이</td>
									<td>song</td>
									<td>아무튼그거다</td>
									<td>?</td>
									<td>n</td>
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td>정송이</td>
									<td>song</td>
									<td>아무튼그거다</td>
									<td>?</td>
									<td>n</td>
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td>정송이</td>
									<td>song</td>
									<td>아무튼그거다</td>
									<td>?</td>
									<td>n</td>
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td>정송이</td>
									<td>song</td>
									<td>아무튼그거다</td>
									<td>?</td>
									<td>n</td>
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td>정송이</td>
									<td>song</td>
									<td>아무튼그거다</td>
									<td>?</td>
									<td>n</td>
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td>정송이</td>
									<td>song</td>
									<td>아무튼그거다</td>
									<td>?</td>
									<td>n</td>
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td>정송이</td>
									<td>song</td>
									<td>아무튼그거다</td>
									<td>?</td>
									<td>n</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer" style="display: flex; justify-content: center;">
						<div class="pop-btnBox">
							<a class="rollover" alt="사용자 추가" onclick="openAddUserView();">
								<img src="/resources/img/admin/btn_user.png"> 
								<img src="/resources/img/admin/btn_user_hover.png" class="over">
							</a>
							<a class="rollover" alt="수정" onclick="editUserInfo();">
								<img src="/resources/img/admin/btn_popEdit.png"> 
								<img src="/resources/img/admin/btn_popEdit_hover.png" class="over">
							</a>
							<a class="rollover" alt="사용자 삭제" onclick="deleteUser();">
								<img src="/resources/img/admin/btn_userDel.png"> 
								<img src="/resources/img/admin/btn_userDel_hover.png" class="over">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>-->
		<!-- 사용자 정보 조회 모달창1 끝 -->

		

		<!-- 사용자 정보 조회 모달창2 시작 -->
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
			<div class="modal-dialog" style="position: absolute; top: 300px; left: 800px;">
				<div class="modal-content" style="background-color: black; width: 900px;">
					<div class="modal-header">
						<div class="pu-tabTitle">
							<img src="/resources/img/admin/icon_setting.png">
						</div>
						<ul class="pop-tabs" data-persist="true">
							<li onclick="openUserInfoView();"><a>사용자 정보 조회</a></li>
							<li onclick="openAddUserView();"><a>사용자 정보 등록</a></li>
							<li onclick="openUserEnvironmentView();"><a>사용자 환경 설정</a></li>
							<li onclick="openUserGroupView();"><a>카메라 그룹 설정</a></li>
						</ul>

						<a class="rollover" alt="창닫기" data-bs-dismiss="modal" aria-label="Close">
							<img src="/resources/img/admin/btn_POPwinClose.png"> 
							<img src="/resources/img/admin/btn_POPwinClose_hover.png" class="over">
						</a>
					</div>
					<div class="modal-body" style="display: flex; justify-content: center;">
						<div class="userInfo">
							<dl>
								<dt>이름<span class="required">*</span></dt>
								<dd><input type="text" class="txt-field" placeholder="사용자 명을 입력 해 주세요." id="AddUserView_Name"> </dd>
								<dt>아이디<span class="required">*</span></dt>
								<dd><input type="text" class="txt-field" placeholder="아이디를 입력 해 주세요." id="AddUserView_Id"> </dd>
								<dt>비밀번호<span class="required">*</span></dt>
								<dd><input type="password" class="txt-field" placeholder="비밀번호를 입력 해 주세요." id="AddUserView_Pw"> </dd>
								<dt>개인정보 백업<span class="required">*</span></dt>
								<dd>
									<input name="backup" id="radio" type="radio" class="btnRadio" checked="true">
									<label>가능</label> 
									<input name="backup" id="radio" type="radio" class="btnRadio">
									<label>불가능</label>
								</dd>
								<dt>계정 상태</dt>
								<dd>
									<input name="used" id="radio" type="radio" class="btnRadio" checked="true">
									<label>사용</label> 
									<input name="used" id="radio" type="radio" class="btnRadio">
									<label>미사용</label>
								</dd>
							</dl>
						</div>
					</div>
					<div class="modal-footer" style="display: flex; justify-content: center;">
						<div class="pop-btnBox">
							<a class="rollover" alt="저장" id="addUserInfo" onclick="addUserInfo();">
								<img src="/resources/img/admin/btn_save.png"> 
								<img src="/resources/img/admin/btn_save_hover.png" class="over">
							</a>
							<a class="rollover" alt="취소" onclick="closePopup();">
								<img src="/resources/img/admin/btn_cancel.png"> 
								<img src="/resources/img/admin/btn_cancel_hover.png" class="over">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 사용자 정보 조회 모달창2 끝 -->




		<!-- <a class="rollover" alt="최소화"><img src="img/btn_winMini.png"> <img src="img/btn_winMini_hover.png" class="over"></a>
		<a class="rollover" alt="창크기"><img src="img/btn_winTile.png"> <img src="img/btn_winTile_hover.png" class="over"></a> -->
		<a href="/logout" class="rollover" ><img src="../../resources/img/btn_winClose.png"><img src="../../resources/img/btn_winClose_hover.png" class="over"></a>
	</div>



	<script>
		// 현재시간
		setTimeout(setInterval( getTime, 10), 100);

		function getTime() {
			var d = new Date();	// 현재 날짜와 시간
			var year = d.getFullYear();		// 시
			var month = d.getMonth()+1;		// 시
			var day = d.getDate();		// 시

			var hur = d.getHours();		// 시
			var min = d.getMinutes();	//분
			var sec = d.getSeconds();	//초

			
			var timeBoard = document.getElementById("time_title"); // 값이 입력될 공간

			if(timeBoard == null)
			{
				return;
			}

			if (Number(month) < 10)
				month = '0' + month;

			if (Number(day) < 10)
				day = '0' + day;

			if (Number(hur) < 10)
				hur = '0' + hur;

			if (Number(min) < 10)
				min = '0' + min;

			if (Number(sec) < 10)
				sec = '0' + sec;

			//var startfullDate = String(year) + String(month) + String(day);
			var time = year + "-" + month + "-" + day + " "+ hur + ":" + min + ":" + sec // 형식 지정
			timeBoard.innerText = time;	// 출력
		}



		// setting버튼 클릭 시 이미지 변경
		// 버튼 엘리먼트와 이미지 엘리먼트 가져오기
		const button = document.getElementById('reportBtn');
		const buttonImage = document.getElementById('btmImg');

		// 마우스 호버 이벤트 리스너 추가
		button.addEventListener('mouseenter', function () {
		// 이미지 변경
		buttonImage.src = '../../resources/img/btn_setting_hover.png';
		});

		// 마우스 아웃 이벤트 리스너 추가 (원래 이미지로 복원)
		button.addEventListener('mouseleave', function () {
		// 이미지 원래대로 복원
		buttonImage.src = '../../resources/img/btn_setting.png';
		});

	</script>
</body>
</html>
