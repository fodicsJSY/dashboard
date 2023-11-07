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

	<style>
		#settingBtn:hover{
			background-image: url('../../resources/img/btn_setting_hover.png') !important;
		}

		
		#searchUserButton:hover, #addUserButton:hover, #settingUserButton:hover, #settingCameraButton:hover{
			color: #ffa800;
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
		<!--<a href="/setting" class="rollover" alt="셋팅팝업" ><img src="../../resources/img/btn_setting.png"> <img src="../../resources/img/btn_setting_hover.png" class="over"></a>-->
		<button type="button" id="settingBtn" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal2" data-bs-whatever="@mdo" style="background-image: url('../../resources/img/btn_setting.png'); background-size: cover; width: 26px;"></button>
		
		<!-- 사용자 정보 조회 모달창1 시작 -->
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
			<div class="modal-dialog" style="position: absolute; top: 300px; left: 800px;">
				<div class="modal-content" style="background-color: black; width: 900px;">
					<div class="modal-header">
						<div class="pu-tabTitle">
							<img src="/resources/img/admin/icon_setting.png">
						</div>
						<ul class="pop-tabs" data-persist="true">
							<li><a id="searchUserButton" >사용자 정보 조회</a></li>
							<li><a id="addUserButton">사용자 정보 등록</a></li>
							<li><a id="settingUserButton">사용자 환경 설정</a></li>
							<li><a id="settingCameraButton">카메라 그룹 설정</a></li>
						</ul>
						
						<a class="rollover" alt="창닫기" data-bs-dismiss="modal" aria-label="Close">
							<img src="/resources/img/admin/btn_POPwinClose.png"> 
							<img src="/resources/img/admin/btn_POPwinClose_hover.png" class="over">
						</a>
					</div>
					<div class="modal-body" id="modalBody" style="display: flex; justify-content: center;">
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
					<div class="modal-footer"  id="modalFooter" style="display: flex; justify-content: center;">
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
		</div>
		
		<!-- 사용자 정보 조회 모달창1 끝 -->

		
		
		<!-- 사용자 정보 조회 모달창2 시작 -->
		<!--
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
									<input name="backup" id="radio" type="radio" class="btnRadio" checked="true">
									<label>가능</label> 
									<input name="backup" id="radio" type="radio" class="btnRadio">
									<label>불가능</label>
								</dd>
							</dl>
							<dl>
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
		-->
		<!-- 사용자 정보 조회 모달창2 끝 -->


		<!-- 사용자 정보 조회 모달창3 시작 -->
		<!--
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
			<div class="modal-dialog" style="position: absolute; top: 300px; left: 800px;">
				<div class="modal-content" style="background-color: black; width: 900px;">
					<div class="modal-header">
						<div class="pu-tabTitle">
							<img src="/resources/img/admin/icon_setting.png">
						</div>
						<ul class="pop-tabs" data-persist="true">
							<li><a id="searchUserButton">사용자 정보 조회</a></li>
							<li><a id="addUserButton">사용자 정보 등록</a></li>
							<li><a id="settingUserButton">사용자 환경 설정</a></li>
							<li><a id="settingCameraButton">카메라 그룹 설정</a></li>
						</ul>

						<a class="rollover" alt="창닫기" data-bs-dismiss="modal" aria-label="Close">
							<img src="/resources/img/admin/btn_POPwinClose.png"> 
							<img src="/resources/img/admin/btn_POPwinClose_hover.png" class="over">
						</a>
					</div>
					<div class="modal-body" style="display: flex; justify-content: center;" id="modalBody">
						<div class="userInfo" style="height: 400px; justify-content: center;">
							<div style="display: flex; flex-direction: row; justify-content: start; align-items: center;">
								<div>
									▶
								</div>
								<div>처음 실행페이지</div>
								<div style="margin-left: 140px;">
									<select name="" id="dd">
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
									<select name="" id="dd">
										<option value="6분할">6분할</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
									</select>
								</div>
							</div>
							
						</div>
					</div>
					<div class="modal-footer" style="display: flex; justify-content: center;" id="modalFooter">
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
		-->
		<!-- 사용자 정보 조회 모달창3 끝 -->



		<!-- 사용자 정보 조회 모달창4 시작 -->
		<!--
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
								<button style="background-color: black; color: white; width: 15px; height: 40px; border-radius: 5px; margin-bottom: 10px;" >▶</button>
								<button style="background-color: black; color: white; width: 15px; height: 40px; border-radius: 5px;">◀</button>
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
		-->
		<!-- 사용자 정보 조회 모달창4 끝 -->



		<!-- <a class="rollover" alt="최소화"><img src="img/btn_winMini.png"> <img src="img/btn_winMini_hover.png" class="over"></a>
		<a class="rollover" alt="창크기"><img src="img/btn_winTile.png"> <img src="img/btn_winTile_hover.png" class="over"></a> -->
		<a href="/logout" class="rollover" ><img src="../../resources/img/btn_winClose.png"><img src="../../resources/img/btn_winClose_hover.png" class="over"></a>
	</div>

	<script src="../../../resources/js/popupSetting.js">

	</script>


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
		var modalBody = document.getElementById('modalBody');
		var modalFooter = document.getElementById('modalFooter');
		var searchUserButton = document.getElementById('searchUserButton');
		let activeButton = null;






		// 사용자 정보 등록 버튼 클릭 이벤트 조회
		document.getElementById('searchUserButton').addEventListener('click',()=>{

			// 현재 활성화된 버튼의 스타일을 원래대로 되돌립니다.
			if (activeButton) {
				activeButton.style.color = 'white'; // 빈 문자열로 설정하면 원래 색상으로 돌아갑니다.
			}

			// 클릭한 버튼의 글자 색을 변경합니다.
			searchUserButton.style.color = '#ffa800'; // 변경하고자 하는 색상으로 설정합니다.

			// 클릭한 버튼을 활성화된 버튼으로 설정합니다.
			activeButton = searchUserButton;

			// 사용자 정보 조회 버튼 클릭 시 모달 내용을 동적으로 변경하는 함수
			modalBody.innerHTML = `
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
				
			`;
			modalFooter.innerHTML=`
			<div class="pop-btnBox">
				<a class="rollover" alt="사용자 추가" onclick="openAddUserView();">
					<img src="/resources/img/admin/btn_user.png"> 
					<img src="/resources/img/admin/btn_user_hover.png" class="over">
				</a>
				<a class="rollover" alt="수정" onclick="editUserInfo();">
					<img src="/resources/img/admin/btn_popEdit.png"> 
					<img src="/resources/img/admin/btn_popEdit_hover.png" class="over">
				</a>
				<a class="rollover" alt="사용자 삭제" data-bs-dismiss="modal">
					<img src="/resources/img/admin/btn_userDel.png"> 
					<img src="/resources/img/admin/btn_userDel_hover.png" class="over">
				</a>
			</div>
			`
		});





		// 사용자 정보 등록 버튼 클릭 이벤트 등록
		document.getElementById('addUserButton').addEventListener('click',()=>{

			// 현재 활성화된 버튼의 스타일을 원래대로 되돌립니다.
			if (activeButton) {
				activeButton.style.color = 'white'; // 빈 문자열로 설정하면 원래 색상으로 돌아갑니다.
			}

			// 클릭한 버튼의 글자 색을 변경합니다.
			addUserButton.style.color = '#ffa800'; // 변경하고자 하는 색상으로 설정합니다.

			// 클릭한 버튼을 활성화된 버튼으로 설정합니다.
			activeButton = addUserButton;

			// 사용자 정보 등록 버튼 클릭 시 모달 내용을 동적으로 변경하는 함수
			modalBody.innerHTML = `
				<div class="userInfo">
					<dl>
						<dt>이름<span class="required">*</span></dt>
						<dd><input type="text" class="txt-field" placeholder="사용자 명을 입력 해 주세요." id="AddUserView_Name"> </dd>
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
							<input name="backup" id="radio" type="radio" class="btnRadio" checked="true">
							<label>가능</label> 
							<input name="backup" id="radio" type="radio" class="btnRadio">
							<label>불가능</label>
						</dd>
					</dl>
					<dl>
						<dt>계정 상태</dt>
						<dd>
							<input name="used" id="radio" type="radio" class="btnRadio" checked="true">
							<label>사용</label> 
							<input name="used" id="radio" type="radio" class="btnRadio">
							<label>미사용</label>
						</dd>
					</dl>
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


			// 취소 버튼 클릭 시 모달 닫기와 입력 내용 초기화 이벤트 등록
			const closeModalButton = document.getElementById('closeModalButton');
			closeModalButton.addEventListener('click', () => {
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
		});



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

			// 취소 버튼 클릭 시 모달 닫기와 선택 옵션 초기화 이벤트 등록
			const closeModalButton = document.getElementById('closeModalButton');
			closeModalButton.addEventListener('click', () => {
				// 선택 옵션 초기화 - "객체우선"으로 변경
				const firstPage = document.getElementById('firstPage');
				firstPage.selectedIndex = 0;

				const todayWindow = document.getElementById('todayWindow');
				todayWindow.selectedIndex = 0;


				settingUserButton.style.color = 'white';
				activeButton = searchUserButton;
			});



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
					<button style="background-color: black; color: white; width: 15px; height: 40px; border-radius: 5px; margin-bottom: 10px;" >▶</button>
					<button style="background-color: black; color: white; width: 15px; height: 40px; border-radius: 5px;">◀</button>
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



		
		
	</script>

	<script>


	</script>



</body>
</html>
