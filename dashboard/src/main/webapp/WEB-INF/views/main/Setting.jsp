<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Ai VinUS DASHBOARD</title>
</head>
<body>
	



<div class="divpop" id="modal">
	<!-- POPUP --> 
	<div class="divpop-content" >
		<div class="pu-tabBox">
			<div class="pu-tabTitle">
				<img src="img/admin/icon_setting.png">
			</div>
			<div class="pop-btnWin">
				<!--<a class="rollover" alt="창내림" ><img src="img/admin/btn_POPwinMini.png"> <img src="img/admin/btn_POPwinMini_hover.png" class="over"></a>-->
				<a class="rollover" alt="창닫기" onclick="closePopup();">
					<img src="img/admin/btn_POPwinClose.png"> 
					<img src="img/admin/btn_POPwinClose_hover.png" class="over">
				</a>
			</div>
			<ul class="pop-tabs" data-persist="true">
				<li onclick="openUserInfoView();"><a>사용자 정보 조회</a></li>
				<li onclick="openAddUserView();"><a>사용자 정보 등록</a></li>
				<li onclick="openUserEnvironmentView();"><a>사용자 환경 설정</a></li>
				<li onclick="openUserGroupView();"><a>카메라 그룹 설정</a></li>
			</ul>
		</div>

		<!-- 1-사용자 정보 조회.S -->
		<div id="view1" class="settingBox">

			<div class="pop-background"> 
				<!-- 사용자 정보 -->
				<div class="popupTable" id="testPopupGrid">
					<table class="userList" onclick="clickUserTable(event);" ondblclick="dblClickUserTable(event);">
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
					</table>
				</div>

				<!--  테이블 영역 샘플.e -->
				<div class="pop-btnBox">
					<a class="rollover" alt="사용자 추가" onclick="openAddUserView();">
						<img src="img/admin/btn_user.png"> 
						<img src="img/admin/btn_user_hover.png" class="over">
					</a>
					<a class="rollover" alt="수정" onclick="editUserInfo();">
						<img src="img/admin/btn_popEdit.png"> 
						<img src="img/admin/btn_popEdit_hover.png" class="over">
					</a>
					<a class="rollover" alt="사용자 삭제" onclick="deleteUser();">
						<img src="img/admin/btn_userDel.png"> 
						<img src="img/admin/btn_userDel_hover.png" class="over">
					</a>
				</div>
			</div>
			<!-- 1-사용자 정보 조회.E -->
		</div>
			
		<!-- 2-사용자 정보 등록.S -->
		<div id="view2" class="settingBox ">
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
			<div class="pop-btnBox">
				<a class="rollover" alt="저장" id="addUserInfo" onclick="addUserInfo();">
					<img src="img/admin/btn_save.png"> 
					<img src="img/admin/btn_save_hover.png" class="over">
				</a>
				<a class="rollover" alt="취소" onclick="closePopup();">
					<img src="img/admin/btn_cancel.png"> 
					<img src="img/admin/btn_cancel_hover.png" class="over">
				</a>
			</div>
		</div>
		<!-- 2-사용자 정보 등록.E -->

		<!-- 3-사용자 환경설정.S -->
		<div id="view3" class="settingBox ">
			
			<div class="userEnvironment">
				<div style="border-bottom: solid 1px #404040; margin-bottom: 25px;">
					<dt>처음 실행 페이지</dt>
					<dd>
						<input name="startPage" id="radio" type="radio" class="btnRadio" checked="true" o  33>
						<label>MAIN</label> 
						<input name="startPage" id="radio" type="radio" class="btnRadio">
						<label>EVENT 우선</label>
						<input name="startPage" id="radio" type="radio" class="btnRadio">
						<label>CAMERA 우선</label>
					</dd>
				</div>
				<div style="border-bottom: solid 1px #404040; margin-bottom: 25px;">
					<dt style="float: left; margin-top: 30px; margin-bottom: 30px;">TODAY WINDOW<br>기본 분할 화면</dt>
					<dd>
						<div class="imgRow">
							<div class="imgRowRadio">
								<input name="splitWindow" id="radio" type="radio" class="btnRadio" checked="true">
								<label>2분할</label>
							</div>
							<img style="margin-bottom: 20px;" src ="./img/set_monitorDiv2.png"></img>
						</div>
						<div class="imgRow">
							<div class="imgRowRadio">
								<input name="splitWindow" id="radio" type="radio" class="btnRadio">
								<label>4분할</label>
							</div>
							<img style="margin-bottom: 20px;" src ="./img/set_monitorDiv4.png"></img>
						</div>
						<div class="imgRow">
							<div class="imgRowRadio">
								<input name="splitWindow" id="radio" type="radio" class="btnRadio">
								<label>6분할</label>
							</div>
							<img style="margin-bottom: 20px;" src ="./img/set_monitorDiv6.png"></img>
						</div>
						<div class="imgRow">
							<div class="imgRowRadio">
								<input name="splitWindow" id="radio" type="radio" class="btnRadio">
								<label>8분할</label>
							</div>
							<img style="margin-bottom: 20px;" src ="./img/set_monitorDiv8.png"></img>
						</div>
					</dd>
				</div>
				<div>
					<dt>기본 실행 타입</dt>
					<dd>
						<input name="mode" id="radio" type="radio" class="btnRadio" checked="true">
						<label>클라이언트</label> 
						<input name="mode" id="radio" type="radio" class="btnRadio">
						<label>서버</label>
					</dd>
				</div>
			</div>

			<!--
			<div>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;► &emsp;처음 실행 페이지&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;
					<select id="default_page" name="default_page" onchange="handlePageOnChange(this)">					
						<option value="0">M A I N</option>
						<option value="1">E V E N T</option>
						<option value="2">C A M E R A</option>						
					</select>
				</p>
				<p style = "margin-top: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;► &emsp; TODAY WINDOW 기본 분할 화면&emsp;&emsp;&emsp;
					<select id="divide_page" name="divide_page" onchange="handleDividePageOnChange(this)">				
						<option value="2">2분할</option>
						<option value="4">4분할</option>
						<option value="6">6분할</option>						
						<option value="8">8분할</option>						
					</select>				
				</p>
				<p style = "margin-top: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;► &emsp; 기본 실행 타입 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<select id="exe_type" name="exe_type" onchange="handleExeTypeOnChange(this)">				
						<option value="0">클라이언트</option>
						<option value="1">서버</option>
					</select>				
				</p>

			</div>
			-->
			<div class="pop-btnBox">
				<a class="rollover" alt="저장" id="addUserInfo" onclick="saveConfigInfo();">
					<img src="img/admin/btn_save.png"> 
					<img src="img/admin/btn_save_hover.png" class="over"
				></a>
				<a class="rollover" alt="취소" onclick="closePopup();">
					<img src="img/admin/btn_cancel.png"> 
					<img src="img/admin/btn_cancel_hover.png" class="over">
				</a>
			</div>
		</div>
		<!-- 3-사용자 환경설정.E -->
		
		<!-- 4-카메라 그룹설정.S -->
		<div id="view4" class="settingBox ">

			<div class="cameraSet">

				<div class="camera-GroupBox">
					<div class="cameraGroup">
						<div class="cameraGroupTitle">
							<h3>카메라 그룹</h3>
							<div class="groupAdd">
								<a class="rollover" alt="추가" onclick="addGroup();" >
									<img src="img/admin/btn_folderAdd.png"> 
									<img src="img/admin/btn_folderAdd_hover.png" class="over">
								</a>
								<a class="rollover" alt="삭제" onclick="deleteGroup();">
									<img src="img/admin/btn_folderDel.png"> 
									<img src="img/admin/btn_folderDel_hover.png" class="over">
								</a>
								<a class="rollover" alt="수정" onclick="deleteGroup();">
									<img src="img/admin/btn_folderDel.png"> 
									<img src="img/admin/btn_folderDel_hover.png" class="over">
								</a>
							</div>
						</div>
					
						<!-- 그룹 -->
						<!--<div id="lstGroup"></div> -->
						<ul id="lstGroup" onclick="clickCameraGroup(event);" ondblclick="dbclickCameraGroup(event);">

						</ul>
					</div>
					<div class="groupSelect">
						<div class="cameraGroupTitle">
							<h3>선택그룹 : <span id="selectedGroupName">카메라 그룹에서 선택</span></h3>
							<div class="cameraCH" id="selectedGroupCh">0 CH</div>
						</div>
						

						<!-- 선택 그룹 -->
						<!--<div id="lstSelectedGroup"></div>-->
						<ul id="lstSelectedGroup">

						</ul>
					</div>
				</div>

				<div class="camera-ListBox">
					<div class="camera-AddBtn">
						<button type="button" class="btn-Add" onclick="moveGroup();">◀</button>
						<button type="button" class="btn-Add" onclick="deleteCamera();">▶</button>
					</div>
				</div>

				<div class="cameraList">
					<div class="cameraTitle">
						<h3>전체 카메라 리스트</h3>
						<div class="cameraCH" id="totalCameraCH">0 CH</div>
					</div>

					<!-- 카메라 -->
					<!--<div id="lstCamera"></div>-->
					<ul id="lstCamera">

					</ul>
				</div>

			</div>
			<div class="pop-btnBox">
				<a class="rollover" alt="저장" onclick="saveGroupSetting();">
					<img src="img/admin/btn_save.png"> 
					<img src="img/admin/btn_save_hover.png" class="over">
				</a>
				<a class="rollover" alt="취소" onclick="closePopup();">
					<img src="img/admin/btn_cancel.png"> 
					<img src="img/admin/btn_cancel_hover.png" class="over">
				</a>
			</div>
		</div>
		<!-- 4-카메라 그룹설정.E -->
	</div>
	<!-- POPUP --> 

</div> 


</body>
</html>


