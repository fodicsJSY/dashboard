<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ai VinUS DASHBOARD</title>
	<%-- fontawesome --%>
	<script src="https://kit.fontawesome.com/e75afc7597.js" crossorigin="anonymous"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/resources/css/popup.css">
	<%--<link rel="stylesheet" href="/resources/css/common/setting.css"> --%>
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	

	<style>
		#settingBtn:hover{
			background-image: url('../../resources/img/btn_setting_hover.png');
		}

		
		#searchUserButton:hover, #addUserButton:hover, #settingUserButton:hover, #settingCameraButton:hover{
			color: #ffa800;
		}
		
		/*
		.dropdown-toggle{
			background-image: url('../../resources/img/btn_setting.png'); background-size: cover; width: 26px;
		}
		*/
		
		.show{
			background-color: #565e64;
		}

		.dropdown-item{
			color: white;
			font-size: 13px;
		}

		.dropdown-item:hover{
			background-color: #ccc;
			color: black;
			cursor: pointer;
		}

		</style>
</head>
<body>
	<div class="TopLeft">
		<a class="logo"> <img src="../../resources/img/fodics_bi.png"></a>
		<h1 id="main_title" >Ai VinUS DASHBOARD</h1>
	</div>
	<div class="TopRight">
		<p id="time_title" class="time">2021-00-00 10:00:00</p>
		
		<%--<a href="/setting" class="rollover" alt="셋팅팝업" ><img src="../../resources/img/btn_setting.png"> <img src="../../resources/img/btn_setting_hover.png" class="over"></a>--%>
		
		
			<button class="btn btn-secondary dropdown-toggle" type="button" id="settingBtn" data-bs-toggle="dropdown" aria-expanded="false">
				<i class="fa-solid fa-gear" style="color: #ffffff;"></i>
			</button>
			<ul class="dropdown-menu">
				<li><button class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal1" data-bs-whatever="@mdo">사용자 정보 조회</button></li>
				<li><button class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal2" data-bs-whatever="@mdo">사용자 정보 등록</button></li>
				<li><button class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal3" data-bs-whatever="@mdo">사용자 환경 설정</button></li>
				<li><button class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal4" data-bs-whatever="@mdo">카메라 그룹 설정</button></li>
			</ul>

		

		<%--<button type="button" id="settingBtn" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal2" data-bs-whatever="@mdo"></button>--%>
		
		<button id="moveRightButton" style="background-color: black; color: white; width: 15px; height: 40px; border-radius: 5px; margin-bottom: 10px; display: none;" >▶</button>
		<button id="moveLeftButton" style="background-color: black; color: white; width: 15px; height: 40px; border-radius: 5px; display: none;">◀</button>

		<%-- 사용자 정보 조회 모달창1 시작 --%>
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
			<div class="modal-dialog" style="position: absolute; top: 300px; left: 800px;">
				<div class="modal-content" style="background-color: black; width: 900px;">
					<div class="modal-body" id="modalBody" style="display: flex; flex-direction: column; justify-content: center;">
						<div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center; margin: 10px 0;">
							<div class="pu-tabTitle">
								<img src="/resources/img/admin/icon_setting.png">
							</div>
							<div>
								<div>사용자 정보 조회</div>
							</div>
							<div>
								<a class="rollover" alt="창닫기" id="x1" data-bs-dismiss="modal" aria-label="Close">
									<img src="/resources/img/admin/btn_POPwinClose.png"> 
									<img src="/resources/img/admin/btn_POPwinClose_hover.png" class="over">
								</a>
							</div>
						</div>
						<div style="display: flex; justify-content: center; margin: 10px 0;">
							<div class="popupTable" >
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
									<td>가능</td>
									<td>사용</td>
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td>정송이</td>
									<td>song</td>
									<td>아무튼그거다</td>
									<td>불가능</td>
									<td>미사용</td>
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td>정송이</td>
									<td>song</td>
									<td>아무튼그거다</td>
									<td>가능</td>
									<td>사용</td>
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td>정송이</td>
									<td>song</td>
									<td>아무튼그거다</td>
									<td>가능</td>
									<td>미사용</td>
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td>정송이</td>
									<td>song</td>
									<td>아무튼그거다</td>
									<td>불가능</td>
									<td>사용</td>
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td>정송이</td>
									<td>song</td>
									<td>아무튼그거다</td>
									<td>불가능</td>
									<td>미사용</td>
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td>정송이</td>
									<td>song</td>
									<td>아무튼그거다</td>
									<td>불가능</td>
									<td>사용</td>
								</tr>
							</table>
						</div>
					</div>
						<div class="pop-btnBox">
							<a class="rollover" id="addUser" alt="사용자 추가" onclick="openAddUserView();">
								<img src="/resources/img/admin/btn_user.png"> 
								<img src="/resources/img/admin/btn_user_hover.png" class="over">
							</a>
							<a class="rollover" id="updateUser" alt="수정" onclick="updateUserInfo();">
								<img src="/resources/img/admin/btn_popEdit.png"> 
								<img src="/resources/img/admin/btn_popEdit_hover.png" class="over">
							</a>
							<a class="rollover" id="deleteUser" alt="사용자 삭제" onclick="deleteUser();">
								<img src="/resources/img/admin/btn_userDel.png"> 
								<img src="/resources/img/admin/btn_userDel_hover.png" class="over">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%-- 사용자 정보 조회 모달창1 끝 --%>
		
		
		
		<%-- 사용자 정보 등록 모달창2 시작 --%>
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
			<div class="modal-dialog" style="position: absolute; top: 300px; left: 800px;">
				<div class="modal-content" style="background-color: black; width: 900px;">
					<div class="modal-body" style="display: flex; flex-direction: column; justify-content: center; margin: 10px 0;">
						<div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center; margin: 0 0 10px 0;">
							<div class="pu-tabTitle">
								<img src="/resources/img/admin/icon_setting.png">
							</div>
							<div>
								<div>사용자 정보 등록</div>
							</div>
							<div>
								<a class="rollover" alt="창닫기" id="x2" data-bs-dismiss="modal" aria-label="Close">
									<img src="/resources/img/admin/btn_POPwinClose.png"> 
									<img src="/resources/img/admin/btn_POPwinClose_hover.png" class="over">
								</a>
							</div>
						</div>
						<div style="display: flex; justify-content: center; align-items: center; margin: 20px 0;">
							<div class="userInfo">
								<dl>
									<dt>이름<span class="required">*</span></dt>
									<dd><input type="text" class="txt-field" placeholder="사용자 명을 입력 해 주세요." id="AddUserView_Name"> </dd>
								</dl>
								<dl>
									<dt>아이디<span class="required">*</span></dt>
									<dd><input type="text" class="txt-field" placeholder="아이디를 입력 해 주세요." id="AddUserView_Id"> </dd>
								</dl>
								<dl>
									<dt>비밀번호<span class="required">*</span></dt>
									<dd><input type="password" class="txt-field" placeholder="비밀번호를 입력 해 주세요." id="AddUserView_Pw"> </dd>
								</dl>
								<dl>
									<dt>개인정보 백업<span class="required">*</span></dt>
									<dd>
										<input name="backup" id="passibleRadio" type="radio" class="btnRadio" checked="true">
										<label for="passibleRadio">가능</label> 
										<input name="backup" id="impassibleRadio" type="radio" class="btnRadio">
										<label for="impassibleRadio">불가능</label>
									</dd>
								</dl>
								<dl>
									<dt>계정 상태</dt>
									<dd>
										<input name="used" id="usedRadio" type="Radio" class="btnRadio" checked="true">
										<label for="usedRadio">사용</label> 
										<input name="used" id="notUsedRadio" type="radio" class="btnRadio">
										<label for="notUsedRadio">미사용</label>
									</dd>
								</dl>
							</div>
						</div>
						<div class="pop-btnBox">
							<a class="rollover" alt="저장" id="addUserInfo" onclick="addUserInfo();">
								<img src="/resources/img/admin/btn_save.png"> 
								<img src="/resources/img/admin/btn_save_hover.png" class="over">
							</a>
							<a class="rollover" alt="취소" id="closeModalButton2" data-bs-dismiss="modal">
								<img src="/resources/img/admin/btn_cancel.png"> 
								<img src="/resources/img/admin/btn_cancel_hover.png" class="over">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%-- 사용자 정보 등록 모달창2 끝 --%>


		<%-- 사용자 환경 설정 모달창3 시작 --%>

		<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
			<div class="modal-dialog" style="position: absolute; top: 300px; left: 800px;">
				<div class="modal-content" style="background-color: black; width: 900px;">
					<div class="modal-body" style="display: flex; flex-direction: column; justify-content: center;" id="modalBody">
						<div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center; margin: 0 0 10px 0;">
							<div class="pu-tabTitle">
								<img src="/resources/img/admin/icon_setting.png">
							</div>
							<div>
								<div>사용자 환경 설정</div>
							</div>
							<div>
								<a class="rollover" alt="창닫기" id="x3" data-bs-dismiss="modal" aria-label="Close">
									<img src="/resources/img/admin/btn_POPwinClose.png"> 
									<img src="/resources/img/admin/btn_POPwinClose_hover.png" class="over">
								</a>
							</div>
						</div>
						<div class="userInfo" style=" height: 300px; margin: 70px 0 0 200px;"  >
							<div style="display: flex; flex-direction: row; justify-content: start; align-items: center;">
								<div style="margin: 0 10px 0 0;">
									<i class="fa-solid fa-caret-right fa-lg" style="color: #ffffff;"></i>
								</div>
								<div>처음 실행페이지</div>
								<div style="margin-left: 140px;">
									<select name="" id="firstPage">
										<option value="객체우선">객체우선</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
									</select>
								</div>
							</div>
							<div style="display: flex; flex-direction: row; justify-content: start; align-items: center; margin-top: 20px;">
								<div style="margin: 0 10px 0 0;">
									<i class="fa-solid fa-caret-right fa-lg" style="color: #ffffff;"></i>
								</div>
								<div>TODAY WINDOW 기본 분할 화면</div>
								<div style="margin-left: 20px;">
									<select name="" id="todayWindow">
										<option value="6분할">6분할</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
									</select>
								</div>
							</div>
						</div>
						<div class="pop-btnBox">
							<a class="rollover" alt="저장" id="addUserInfo" onclick="addUserInfo();">
								<img src="/resources/img/admin/btn_save.png"> 
								<img src="/resources/img/admin/btn_save_hover.png" class="over">
							</a>
							<a class="rollover" alt="취소" id="closeModalButton3" data-bs-dismiss="modal" >
								<img src="/resources/img/admin/btn_cancel.png"> 
								<img src="/resources/img/admin/btn_cancel_hover.png" class="over">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%-- 사용자 환경 설정 모달창3 끝 --%>



		<%-- 카메라 그룹 설정 모달창4 시작 --%>
		<div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
			<div class="modal-dialog" style="position: absolute; top: 300px; left: 800px;">
				<div class="modal-content" style="background-color: black; width: 900px;">
					<div class="modal-body" style="display: flex; flex-direction: column; justify-content: center;">
						<div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center; margin: 10px 0;">
							<div class="pu-tabTitle">
								<img src="/resources/img/admin/icon_setting.png">
							</div>
							<div>
								<div>카메라 그룹 설정</div>
							</div>
							<div>
								<a class="rollover" alt="창닫기" data-bs-dismiss="modal" aria-label="Close">
									<img src="/resources/img/admin/btn_POPwinClose.png"> 
									<img src="/resources/img/admin/btn_POPwinClose_hover.png" class="over">
								</a>
							</div>
						</div>
						<div class="userInfo" style="height: 500px; display: flex; justify-content: space-around; align-items: center; margin: 0  150px;">
							<div style="height: 80%; width: 210px;">
								<div class="userGroup_container" style="display: flex; flex-direction: column; justify-content: start;">
									<div style="margin: 10px 0;">사용자그룹</div>
									<div style="border: 1px solid #333333; background-color: #282828; width: 100%; height: 100px;">
										<table class="userGroup" style="display: flex; width: 100%; height: 100%; overflow-y: scroll; border: 1px solid #333333; font-family: NanumSquareEB; ">
											<tr >
												<td style="width: 207.03px; height: 30px; border: 1px solid #333333;">
													<a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#" >1</a>
												</td>
											</tr>
											<tr>
												<td style="width: 207.03px; height: 30px; border: 1px solid #333333;"><a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#">2</a></td>
											</tr>
											<tr>
												<td style="width: 207.03px; height: 30px; border: 1px solid #333333;"><a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#">3</a></td>
											</tr>
											<tr>
												<td style="width: 207.03px; height: 30px; border: 1px solid #333333;"><a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#">3</a></td>
											</tr>
											<tr>
												<td style="width: 207.03px; height: 30px; border: 1px solid #333333;"><a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#">3</a></td>
											</tr>
											<tr>
												<td style="width: 207.03px; height: 30px; border: 1px solid #333333;"><a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#">3</a></td>
											</tr>
											<tr>
												<td style="width: 207.03px; height: 30px; border: 1px solid #333333;"><a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#">3</a></td>
											</tr>
										</table>
									</div>
								</div>
								<div class="choiceGroup_container" style="margin-top: 15px; display: flex; flex-direction: column; justify-content: start;">
									<div style="margin: 10px 0;">선택그룹</div>
									<div style="background-color: #282828; width: 100%; height: 180px;">
										<table class="choiceGroup" style="display: block; width: 100%; height: 100%; overflow-y: scroll; border: 1px solid #333333; font-family: NanumSquareEB; ">
											<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
												<td><input type="checkbox" name="" id="o1"></td>
												<td style="width: 200px; height: 30px;" ><label for="o1">오리온</label></td>
											</tr>
											<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
												<td><input type="checkbox" name="" id="h1"></td>
												<td><label for="h1">후레쉬베리</label></td>
											</tr>
											<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
												<td><input type="checkbox" name="" id="s1"></td>
												<td><label for="s1">딸기맛</label></td>
											</tr>
											<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
												<td><input type="checkbox" name="" id="o2"></td>
												<td style="width: 200px; height: 30px;" ><label for="o2">오리온</label></td>
											</tr>
											<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
												<td><input type="checkbox" name="" id="h2"></td>
												<td><label for="h2">후레쉬베리</label></td>
											</tr>
											<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
												<td><input type="checkbox" name="" id="s2"></td>
												<td><label for="s2">딸기맛</label></td>
											</tr>
											<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
												<td><input type="checkbox" name="" id="o3"></td>
												<td style="width: 200px; height: 30px;" ><label for="o3">오리온</label></td>
											</tr>
											<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
												<td><input type="checkbox" name="" id="h3"></td>
												<td><label for="h3">후레쉬베리</label></td>
											</tr>
											<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
												<td><input type="checkbox" name="" id="s3"></td>
												<td><label for="s3">딸기맛</label></td>
											</tr>
										</table>
										
									</div>
								</div>
							</div>
							<div style="display: flex; flex-direction: column; margin: 180px 10px 0 10px;">
								<button id="rightBtn" style="background-color: black; color: white; width: 15px; height: 40px; border-radius: 5px; margin-bottom: 10px;" >
									<i class="fa-solid fa-caret-right fa-xl" style="color: #ffffff;"></i>
								</button>
								<button id="leftBtn" style="background-color: black; color: white; width: 15px; height: 40px; border-radius: 5px;">
									<i class="fa-solid fa-caret-left fa-xl" style="color: #ffffff;"></i>
								</button>
							</div>
							<div style="height: 302px; width: 350px; margin: 0 0 82px 0;">
								<div style="margin: 0 0 10px 0;">
									전체카메라리스트
								</div>
								<div style="  overflow-y: scroll; background-color: #282828; width: 350px; height: 335px;">
									<table class="allCameraList" style="width: 100%; height: 100%;border: 1px solid #333333; font-family: NanumSquareEB; ">
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="b1"></td>
											<td><label for="b1">베이비</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="sp1"></td>
											<td><label for="sp1">소피</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="hd1"></td>
											<td><label for="hd1">핸드크림</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="b2"></td>
											<td><label for="b2">베이비</label></td>
										</tr>
										
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="b3"></td>
											<td><label for="b3">베이비</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="sp2"></td>
											<td><label for="sp2">소피</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="hd2"></td>
											<td><label for="hd2">핸드크림</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="b4"></td>
											<td><label for="b4">베이비</label></td>
										</tr>
										
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="b5"></td>
											<td><label for="b5">베이비</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="sp3"></td>
											<td><label for="sp3">소피</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="hd3"></td>
											<td><label for="hd3">핸드크림</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="b6"></td>
											<td><label for="b6">베이비</label></td>
										</tr>
										
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="b7"></td>
											<td><label for="b7">베이비</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="sp4"></td>
											<td><label for="sp4">소피</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="hd4"></td>
											<td><label for="hd4">핸드크림</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="b8"></td>
											<td><label for="b8">베이비</label></td>
										</tr>
										
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="b9"></td>
											<td><label for="b9">베이비</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="sp5"></td>
											<td><label for="sp5">소피</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="hd5"></td>
											<td><label for="hd5">핸드크림</label></td>
										</tr>
										<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
											<td style="width: 15px;"><input type="checkbox" name="" id="b10"></td>
											<td><label for="b10">베이비</label></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="pop-btnBox">
							<a class="rollover" alt="저장" id="addUserInfo" onclick="addUserInfo();">
								<img src="/resources/img/admin/btn_save.png"> 
								<img src="/resources/img/admin/btn_save_hover.png" class="over">
							</a>
							<a class="rollover" id="listCencle" alt="취소" data-bs-dismiss="modal" >
								<img src="/resources/img/admin/btn_cancel.png"> 
								<img src="/resources/img/admin/btn_cancel_hover.png" class="over">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%-- 카메라 그룹 설정 모달창4 끝 --%>


		<%-- 사용자 정보 수정 모달창5 시작 --%>
		<div class="modal fade" id="exampleModal5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
			<div class="modal-dialog" style="position: absolute; top: 300px; left: 800px;">
				<div class="modal-content" style="background-color: black; width: 900px;">
					
				<div class="modal-body" style="display: flex; flex-direction: column; justify-content: center; margin: 10px 0;">
					<div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center; margin: 0 0 10px 0;">
						<div class="pu-tabTitle">
							<img src="/resources/img/admin/icon_setting.png">
						</div>
						<div>
							<div>사용자 정보 수정</div>
						</div>
						<div>
							<a class="rollover" alt="창닫기" id="x2" data-bs-dismiss="modal" aria-label="Close">
								<img src="/resources/img/admin/btn_POPwinClose.png"> 
								<img src="/resources/img/admin/btn_POPwinClose_hover.png" class="over">
							</a>
						</div>
					</div>
					<div style="display: flex; justify-content: center; align-items: center; margin: 20px 0;">
						<div class="userInfo">
							<dl>
								<dt>이름<span class="required">*</span></dt>
								<dd><input type="text" class="txt-field" placeholder="사용자 명을 입력 해 주세요." id="updateUserView_Name"> </dd>
							</dl>
							<dl>
								<dt>아이디<span class="required">*</span></dt>
								<dd><input type="text" class="txt-field" placeholder="아이디를 입력 해 주세요." id="updateUserView_Id"> </dd>
							</dl>
							<dl>
								<dt>비밀번호<span class="required">*</span></dt>
								<dd><input type="password" class="txt-field" placeholder="비밀번호를 입력 해 주세요." id="updateUserView_Pw"> </dd>
							</dl>
							<dl>
								<dt>개인정보 백업<span class="required">*</span></dt>
								<dd>
									<input name="backup" id="updatePassibleRadio" type="radio" class="btnRadio" checked="true">
									<label for="updatePassibleRadio">가능</label> 
									<input name="backup" id="updateImpassibleRadio" type="radio" class="btnRadio">
									<label for="updateImpassibleRadio">불가능</label>
								</dd>
							</dl>
							<dl>
								<dt>계정 상태</dt>
								<dd>
									<input name="used" id="updateUsedRadio" type="Radio" class="btnRadio" checked="true">
									<label for="updateUsedRadio">사용</label> 
									<input name="used" id="updateNotUsedRadio" type="radio" class="btnRadio">
									<label for="updateNotUsedRadio">미사용</label>
								</dd>
							</dl>
						</div>
					</div>
					<div class="pop-btnBox">
						<a class="rollover" alt="수정" id="updateUserInfo" onclick="addUserInfo();">
							<img src="/resources/img/admin/btn_save.png"> 
							<img src="/resources/img/admin/btn_save_hover.png" class="over">
						</a>
						<a class="rollover" alt="취소" id="closeModalButton2" data-bs-dismiss="modal">
							<img src="/resources/img/admin/btn_cancel.png"> 
							<img src="/resources/img/admin/btn_cancel_hover.png" class="over">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- 사용자 정보 수정 모달창5 끝 --%>




		<%-- <a class="rollover" alt="최소화"><img src="img/btn_winMini.png"> <img src="img/btn_winMini_hover.png" class="over"></a>
		<a class="rollover" alt="창크기"><img src="img/btn_winTile.png"> <img src="img/btn_winTile_hover.png" class="over"></a> --%>
		<a href="/logout" class="rollover" ><img src="../../resources/img/btn_winClose.png"><img src="../../resources/img/btn_winClose_hover.png" class="over"></a>
	</div>

	<%--<script src="../../../resources/js/popupSetting.js">

	</script>--%>


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



	</script>

	<script>

		// 사용자 정보 등록 모달창1 x 버튼 클릭 시 모달 닫기와 입력 내용 초기화 이벤트 등록
		const x1 = document.getElementById('x1');
		x1.addEventListener('click', () => {
			// 모든 체크박스 요소를 찾아서 상태를 변경합니다.
			var checkboxes = document.querySelectorAll('.userList input[type="checkbox"]');
			checkboxes.forEach(function(checkbox) {
				checkbox.checked = false;
			});
		});




		// 사용자 정보 조회 모달창2 x 버튼 클릭 시 모달 닫기와 입력 내용 초기화 이벤트 등록
		const x2 = document.getElementById('x2');
		x2.addEventListener('click', () => {
			// 입력 내용 초기화
			document.getElementById('AddUserView_Name').value = '';
			document.getElementById('AddUserView_Id').value = '';
			document.getElementById('AddUserView_Pw').value = '';
		
			// 라디오 버튼 초기화
			const backupRadios = document.querySelectorAll('input[name="backup"]');
			backupRadios[0].checked = true;
		
			const usedRadios = document.querySelectorAll('input[name="used"]');
			usedRadios[0].checked = true;
		});




		// 사용자 정보 조회 모달창2 취소 버튼 클릭 시 모달 닫기와 입력 내용 초기화 이벤트 등록
		const closeModalButton2 = document.getElementById('closeModalButton2');
		closeModalButton2.addEventListener('click', () => {
			// 입력 내용 초기화
			document.getElementById('AddUserView_Name').value = '';
			document.getElementById('AddUserView_Id').value = '';
			document.getElementById('AddUserView_Pw').value = '';
		
			// 라디오 버튼 초기화
			const backupRadios = document.querySelectorAll('input[name="backup"]');
			backupRadios[0].checked = true;
		
			const usedRadios = document.querySelectorAll('input[name="used"]');
			usedRadios[0].checked = true;
		});




		// 사용자 정보 조회 모달창3 x 버튼 클릭 시 모달 닫기와 선택 옵션 초기화 이벤트 등록
		const x3 = document.getElementById('x3');
		x3.addEventListener('click', () => {
			// 선택 옵션 초기화 - "객체우선"으로 변경
			const firstPage = document.getElementById('firstPage');
			firstPage.selectedIndex = 0;

			const todayWindow = document.getElementById('todayWindow');
			todayWindow.selectedIndex = 0;

			x3.style.color = 'white';
			activeButton = searchUserButton;
		});


		// 사용자 정보 조회 모달창3 취소 버튼 클릭 시 모달 닫기와 선택 옵션 초기화 이벤트 등록
		const closeModalButton3 = document.getElementById('closeModalButton3');
		closeModalButton3.addEventListener('click', () => {
			// 선택 옵션 초기화 - "객체우선"으로 변경
			const firstPage = document.getElementById('firstPage');
			firstPage.selectedIndex = 0;

			const todayWindow = document.getElementById('todayWindow');
			todayWindow.selectedIndex = 0;

			closeModalButton3.style.color = 'white';
			activeButton = searchUserButton;
		});





	</script>


<script>

// 초기 상태를 저장하는 객체를 생성합니다.
var initialStates = {
    choiceGroup: document.querySelector('.choiceGroup_container').innerHTML,
	allCameraList: document.querySelector('.allCameraList').innerHTML
};

// 요소를 초기 상태로 되돌리는 함수를 정의합니다.
function resetElementPositions() {
	document.querySelector('.choiceGroup_container').innerHTML = initialStates.choiceGroup;
	document.querySelector('.allCameraList').innerHTML = initialStates.allCameraList;

  // 초기 상태로 되돌릴 때 복제된 노드를 다시 복제하여 삽입합니다.
	choiceGroupContainer.innerHTML = '';
	choiceGroupContainer.appendChild(initialStates.choiceGroup.cloneNode(true));

	allCameraList.innerHTML = '';
	allCameraList.appendChild(initialStates.allCameraList.cloneNode(true));

  // 초기 상태 갱신
	//setInitialStates();

}


function moveSelectedItems() {
	
  // 선택그룹 테이블과 전체카메라리스트 테이블을 찾습니다.
	var choiceGroupTable = document.querySelector('.choiceGroup');
	var cameraListTable = document.querySelector('.allCameraList'); // 수정된 부분

  // 선택그룹에서 체크된 행을 찾습니다.
	var selectedRows = choiceGroupTable.querySelectorAll('tr input:checked');

  // 각 체크된 행을 전체카메라리스트 테이블로 이동시킵니다.
	selectedRows.forEach(function (row) {
    // 새로운 행 생성
    var newRow = document.createElement('tr');

    // 체크박스 열 복사
    var checkboxCell = document.createElement('td');
    checkboxCell.innerHTML = '<input type="checkbox" name="" id="">';
    newRow.appendChild(checkboxCell);

    // 이름 열 복사
    var nameCell = document.createElement('td');
    nameCell.textContent = row.parentElement.nextElementSibling.textContent;
    newRow.appendChild(nameCell);


	// 스타일 추가
	nameCell.style.paddingTop = '5px'; // 위쪽 padding
    nameCell.style.paddingBottom = '5px'; // 아래쪽 padding
    newRow.style.borderBottom = '1px solid #333333'; // 하단에 선 추가

    // 선택그룹 테이블에 행 추가
    cameraListTable.appendChild(newRow);






    // 선택그룹에서 해당 행 삭제
    row.parentElement.parentElement.remove();
	});
}

// rightBtn 클릭 시 moveSelectedItems 함수 호출
document.getElementById('rightBtn').addEventListener('click', moveSelectedItems);



function moveSelectedItemsToLeft() {
  // 선택그룹 테이블과 전체카메라리스트 테이블을 찾습니다.
	var choiceGroupTable = document.querySelector('.choiceGroup');
	var cameraListTable = document.querySelector('.allCameraList'); // 수정된 부분

  // 전체카메라리스트에서 체크된 행을 찾습니다.
	var selectedRows = cameraListTable.querySelectorAll('tr input:checked');

  // 각 체크된 행을 선택그룹 테이블로 이동시킵니다.
	selectedRows.forEach(function (row) {
    // 새로운 행 생성
    var newRow = document.createElement('tr');

    // 체크박스 열 복사
    var checkboxCell = document.createElement('td');
    checkboxCell.innerHTML = '<input type="checkbox" name="" id="">';
    newRow.appendChild(checkboxCell);

    // 이름 열 복사
    var nameCell = document.createElement('td');
    nameCell.textContent = row.parentElement.nextElementSibling.textContent;

    newRow.appendChild(nameCell);

	// 스타일 추가
	nameCell.style.paddingTop = '5px'; // 위쪽 padding
    nameCell.style.paddingBottom = '5px'; // 아래쪽 padding
    newRow.style.borderBottom = '1px solid #333333'; // 하단에 선 추가

    // 선택그룹 테이블에 행 추가
    choiceGroupTable.appendChild(newRow);

    // 전체카메라리스트에서 해당 행 삭제
    row.parentElement.parentElement.remove();
	});
}

// leftBtn 클릭 시 moveSelectedItemsToLeft 함수 호출
document.getElementById('leftBtn').addEventListener('click', moveSelectedItemsToLeft);


// "취소" 버튼 클릭 이벤트 핸들러를 정의합니다.
document.querySelector('#listCencle').addEventListener('click', function () {
  // "취소" 버튼을 클릭했을 때 resetElementPositions 함수를 호출합니다.
	resetElementPositions();
});

// 초기 상태를 설정합니다.
setInitialStates();



/* 사용자 조회에서 등록버튼 클릭 시 */
function openAddUserView() {
    // 사용자 등록 모달 창을 띄우는 코드 추가
    $('#exampleModal2').modal('show');
}


</script>


<%-- 사용자 조회 창에서 수정 버튼 클릭 시 수정모달창 생성 --%>
<script>
	function updateUserInfo() {
	  // 테이블 참조를 가져옵니다.
	var table = document.querySelector('.userList');

	  // 테이블 내 모든 체크박스를 가져옵니다.
	var checkboxes = table.querySelectorAll('input[type="checkbox"]');

	  // 선택된 행의 데이터를 저장할 변수를 초기화합니다.
	var selectedName, selectedId, selectedPw, selectedBackup, selectedUsed;

	  // 체크박스를 반복하여 선택된 행을 찾습니다.
	checkboxes.forEach(function (checkbox, index) {
		if (checkbox.checked) {
		var row = checkbox.closest('tr');
		selectedName = row.cells[1].innerText;
		selectedId = row.cells[2].innerText;
		selectedPw = row.cells[3].innerText;
		selectedBackup = row.cells[4].innerText;
		selectedUsed = row.cells[5].innerText;
		}
	});

	  // 두 번째 모달의 입력 필드에 선택된 데이터를 채웁니다.
	document.getElementById('updateUserView_Name').value = selectedName;
	document.getElementById('updateUserView_Id').value = selectedId;
	document.getElementById('updateUserView_Pw').value = selectedPw;

	  // 선택된 데이터를 기반으로 적절한 라디오 버튼을 체크합니다.
	document.getElementById('updatePassibleRadio').checked = selectedBackup === '가능';
	document.getElementById('updateImpassibleRadio').checked = selectedBackup === '불가능';
	document.getElementById('updateUsedRadio').checked = selectedUsed === '사용';
	document.getElementById('updateNotUsedRadio').checked = selectedUsed === '미사용';

	  // 두 번째 모달을 표시합니다.
	$('#exampleModal5').modal('show');
	}
</script>



	<%--
	<script>
		





		





		// 사용자 환경 설정 버튼 클릭 이벤트 등록
		document.getElementById('settingUserButton').addEventListener('click',()=>{


			// 현재 활성화된 버튼의 스타일을 원래대로 되돌립니다.
			if (activeButton) {
				activeButton.style.color = 'white'; // 빈 문자열로 설정하면 원래 색상으로 돌아갑니다.
			}

			// 클릭한 버튼의 글자 색을 변경합니다.
			settingUserButton.style.color = '#ffa800'; // 변경하고자 하는 색상으로 설정합니다.

			// 클릭한 버튼을 활성화된 버튼으로 설정합니다.
			activeButton = settingUserButton;

			// 사용자 환경 설정 버튼 클릭 시 모달 내용을 동적으로 변경하는 함수
			modalBody.innerHTML = `
			<div class="userInfo" style="height: 400px; justify-content: center;">
				<div style="display: flex; flex-direction: row; justify-content: start; align-items: center;">
					<div>
						▶
					</div>
					<div>처음 실행페이지</div>
					<div style="margin-left: 140px;">
						<select name="" id="firstPage">
							<option value="객체우선">객체우선</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</div>
				</div>
				<div style="display: flex; flex-direction: row; justify-content: start; align-items: center; margin-top: 20px;">
					<div>
						▶ 
					</div>
					<div>TODAY WINDOW 기본 분할 화면</div>
					<div style="margin-left: 20px;">
						<select name="" id="todayWindow">
							<option value="6분할">6분할</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</div>
				</div>
				
			</div>
			`;
			modalFooter.innerHTML=`
			<div class="pop-btnBox">
				<a class="rollover" alt="저장" id="addUserInfo" onclick="addUserInfo();">
					<img src="/resources/img/admin/btn_save.png"> 
					<img src="/resources/img/admin/btn_save_hover.png" class="over">
				</a>
				<a class="rollover" alt="취소" id="closeModalButton" data-bs-dismiss="modal" >
					<img src="/resources/img/admin/btn_cancel.png"> 
					<img src="/resources/img/admin/btn_cancel_hover.png" class="over">
				</a>
			</div>
			`

			



		});



		// 카메라 그룹 설정 버튼 클릭 이벤트 등록
		document.getElementById('settingCameraButton').addEventListener('click',()=>{


			// 현재 활성화된 버튼의 스타일을 원래대로 되돌립니다.
			if (activeButton) {
				activeButton.style.color = 'white'; // 빈 문자열로 설정하면 원래 색상으로 돌아갑니다.
			}

			// 클릭한 버튼의 글자 색을 변경합니다.
			settingCameraButton.style.color = '#ffa800'; // 변경하고자 하는 색상으로 설정합니다.

			// 클릭한 버튼을 활성화된 버튼으로 설정합니다.
			activeButton = settingCameraButton;


			// 카메라 그룹 설정 버튼 클릭 시 모달 내용을 동적으로 변경하는 함수
			modalBody.innerHTML = `
			<div class="userInfo" style="height: 500px; display: flex; justify-content: space-around; align-items: center; ">
				<div style="height: 80%; width: 210px;">
					<div class="userGroup_container" style="display: flex; flex-direction: column; justify-content: start;">
						<div style="margin: 10px 0;">사용자그룹</div>
						<div style="border: 1px solid #333333; background-color: #282828; width: 100%; height: 100px;">
							<table class="userGroup" style="display: flex; width: 100%; height: 100%; overflow-y: scroll; border: 1px solid #333333; font-family: NanumSquareEB; ">
								<tr >
									<td style="width: 207.03px; height: 30px; border: 1px solid #333333;">
										<a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#" >1</a>
									</td>
								</tr>
								<tr>
									<td style="width: 207.03px; height: 30px; border: 1px solid #333333;"><a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#">2</a></td>
								</tr>
								<tr>
									<td style="width: 207.03px; height: 30px; border: 1px solid #333333;"><a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#">3</a></td>
								</tr>
								<tr>
									<td style="width: 207.03px; height: 30px; border: 1px solid #333333;"><a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#">3</a></td>
								</tr>
								<tr>
									<td style="width: 207.03px; height: 30px; border: 1px solid #333333;"><a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#">3</a></td>
								</tr>
								<tr>
									<td style="width: 207.03px; height: 30px; border: 1px solid #333333;"><a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#">3</a></td>
								</tr>
								<tr>
									<td style="width: 207.03px; height: 30px; border: 1px solid #333333;"><a style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: start;" href="#">3</a></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="choiceGroup_container" style="margin-top: 15px; display: flex; flex-direction: column; justify-content: start;">
						<div style="margin: 10px 0;">선택그룹</div>
						<div style="background-color: #282828; width: 100%; height: 180px;">
							<table class="choiceGroup" style="display: flex; width: 100%; height: 100%; overflow-y: scroll; border: 1px solid #333333; font-family: NanumSquareEB; ">
								<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
									<td><input type="checkbox" name="" id=""></td>
									<td style="width: 200px; height: 30px;" >오리온</td>
								</tr>
								<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
									<td><input type="checkbox" name="" id=""></td>
									<td>후레쉬베리</td>
								</tr>
								<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
									<td><input type="checkbox" name="" id=""></td>
									<td>딸기맛</td>
								</tr>
								<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
									<td><input type="checkbox" name="" id=""></td>
									<td style="width: 200px; height: 30px;" >오리온</td>
								</tr>
								<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
									<td><input type="checkbox" name="" id=""></td>
									<td>후레쉬베리</td>
								</tr>
								<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
									<td><input type="checkbox" name="" id=""></td>
									<td>딸기맛</td>
								</tr>
								<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
									<td><input type="checkbox" name="" id=""></td>
									<td style="width: 200px; height: 30px;" >오리온</td>
								</tr>
								<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
									<td><input type="checkbox" name="" id=""></td>
									<td>후레쉬베리</td>
								</tr>
								<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
									<td><input type="checkbox" name="" id=""></td>
									<td>딸기맛</td>
								</tr>
							</table>
							
						</div>
					</div>
				</div>
				<div style="display: flex; flex-direction: column; margin: 180px 10px 0 10px;">
					<button id="moveRightButton" style="background-color: black; color: white; width: 15px; height: 40px; border-radius: 5px; margin-bottom: 10px;" >▶</button>
					<button id="moveLeftButton" style="background-color: black; color: white; width: 15px; height: 40px; border-radius: 5px;">◀</button>
				</div>
				<div style="height: 302px; width: 350px; margin: 0 0 48px 0;">
					<div style="margin: 0 0 10px 0;">
						전체카메라리스트
					</div>
					<div style=" overflow-y: scroll;  background-color: #282828; width: 100%; height: 335px;">
						<table style="width: 100%; height: 100%;border: 1px solid #333333; font-family: NanumSquareEB; ">
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>베이비</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>소피</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>핸드크림</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>베이비</td>
							</tr>
							
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>베이비</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>소피</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>핸드크림</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>베이비</td>
							</tr>
							
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>베이비</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>소피</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>핸드크림</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>베이비</td>
							</tr>
							
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>베이비</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>소피</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>핸드크림</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>베이비</td>
							</tr>
							
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>베이비</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>소피</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>핸드크림</td>
							</tr>
							<tr style="width: 207.03px; height: 30px; border: 1px solid #333333;">
								<td style="width: 15px;"><input type="checkbox" name="" id=""></td>
								<td>베이비</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			`;
			modalFooter.innerHTML=`
			<div class="pop-btnBox">
				<a class="rollover" alt="저장" id="addUserInfo" onclick="addUserInfo();">
					<img src="/resources/img/admin/btn_save.png"> 
					<img src="/resources/img/admin/btn_save_hover.png" class="over">
				</a>
				<a class="rollover" alt="취소" data-bs-dismiss="modal">
					<img src="/resources/img/admin/btn_cancel.png"> 
					<img src="/resources/img/admin/btn_cancel_hover.png" class="over">
				</a>
			</div>
			`
		});


		// 오른쪽 버튼 클릭 시
		document.getElementById("moveRightButton").addEventListener("click", function() {
			// 선택 그룹에서 선택된 항목 가져오기
			const selectedItems = document.querySelectorAll(".choiceGroup input:checked + td");

			// 전체 카메라 리스트 테이블 엘리먼트 가져오기
			const cameraListTable = document.querySelector(".cameraListTable");

			// 선택 그룹에서 항목을 제거하고 전체 카메라 리스트에 추가
			selectedItems.forEach(function(item) {
				// 새로운 행을 만들어서 항목을 복사
				const newRow = document.createElement("tr");
				newRow.innerHTML = item.parentElement.outerHTML;

				// 새로운 행을 전체 카메라 리스트에 추가
				cameraListTable.appendChild(newRow);

				// 선택 그룹에서 항목 제거
				item.parentElement.parentElement.remove();
			});
		});

		// 왼쪽 버튼 클릭 시
		document.getElementById("moveLeftButton").addEventListener("click", function() {
			// 전체 카메라 리스트에서 선택된 항목 가져오기
			const selectedItems = document.querySelectorAll(".cameraListTable input:checked + td");

			// 선택 그룹 테이블 엘리먼트 가져오기
			const choiceGroupTable = document.querySelector(".choiceGroup");

			// 전체 카메라 리스트에서 항목을 제거하고 선택 그룹에 추가
			selectedItems.forEach(function(item) {
				// 새로운 행을 만들어서 항목을 복사
				const newRow = document.createElement("tr");
				newRow.innerHTML = item.parentElement.outerHTML;

				// 새로운 행을 선택 그룹에 추가
				choiceGroupTable.appendChild(newRow);

				// 전체 카메라 리스트에서 항목 제거
				item.parentElement.parentElement.remove();
			});
		});

		// 오른쪽 버튼 클릭 시
document.getElementById("moveRightButton").addEventListener("click", function() {
    // 선택 그룹에서 선택된 항목 가져오기
    const selectedItems = document.querySelectorAll(".choiceGroup input:checked + td");

    // 전체 카메라 리스트 테이블 엘리먼트 가져오기
    const cameraListTable = document.querySelector(".cameraListTable tbody");

    // 선택 그룹에서 항목을 제거하고 전체 카메라 리스트에 추가
    selectedItems.forEach(function(item) {
        // 새로운 행을 만들어서 항목을 복사
        const newRow = document.createElement("tr");
        newRow.innerHTML = item.parentElement.outerHTML;

        // 새로운 행을 전체 카메라 리스트에 추가
        cameraListTable.appendChild(newRow);

        // 선택 그룹에서 항목 제거
        item.parentElement.parentElement.remove();
    });
});

// 왼쪽 버튼 클릭 시
document.getElementById("moveLeftButton").addEventListener("click", function() {
    // 전체 카메라 리스트에서 선택된 항목 가져오기
    const selectedItems = document.querySelectorAll(".cameraListTable input:checked + td");

    // 선택 그룹 테이블 엘리먼트 가져오기
    const choiceGroupTable = document.querySelector(".choiceGroup");

    // 전체 카메라 리스트에서 항목을 제거하고 선택 그룹에 추가
    selectedItems.forEach(function(item) {
        // 새로운 행을 만들어서 항목을 복사
        const newRow = document.createElement("tr");
        newRow.innerHTML = item.parentElement.outerHTML;

        // 새로운 행을 선택 그룹에 추가
        choiceGroupTable.appendChild(newRow);

        // 전체 카메라 리스트에서 항목 제거
        item.parentElement.parentElement.remove();
    });
});

		
		
	</script>

--%>




</body>
</html>
