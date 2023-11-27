<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <%-- css --%>

        <link rel="stylesheet" href="/resources/css/main/main.css">
        <link rel="stylesheet" href="/resources/css/style.css">
        <link rel="stylesheet" href="/resources/css/object.css">
        <link rel="stylesheet" href="/resources/css/popup.css">
        <link rel="stylesheet" href="/resources/css/style_scrollBar.css"> 
        <link rel="stylesheet" href="/resources/font/nanumsquare.css">
        <link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="/resources/css/style_grid.css">

        <%-- bootstrap --%>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        
        <%-- fontawesome --%>
        <script src="https://kit.fontawesome.com/e75afc7597.js" crossorigin="anonymous"></script>


    <style>
        .contents {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 10px;
        }

        /* 막대 */
		.innerBox:nth-child(1){
			order:1;
		}

		/* 차량 */
		.innerBox:nth-child(2){
			order:3;
		}

		/* 라인 */
		.innerBox:nth-child(3){
			order:2;
		}

		/* 테이블 */
		.innerBox:nth-child(4){
			order:4;
		}

		/* 도넛 */
		.innerBox:nth-child(5){
			order:5;
		}
		
		/* 이벤트 발생 비율 */
		.innerBox:nth-child(6){
			order:6;
		}


        .innerBox {
            height: 450px;
            max-width: 845px;
            width: 100%;
            box-sizing: border-box;
        }

        @media (max-width: 600px) {
            .contents.fourColumns {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 10px;
            }

            .contents.fourColumns .innerBox {
                display: none;
            }

            .contents.fourColumns .innerBox:nth-child(-n+4) {
                display: block;
            }

            .contents.sixColumns .innerBox {
                display: block;
                max-width: none;
            }
        }

        @media (min-width: 601px) {
            .contents.fourColumns {
                grid-template-columns: repeat(2, minmax(0, 1fr)); /* 수정된 부분 */
                gap: 10px;
            }

            .contents.fourColumns .innerBox {
                display: block;
            }

            .contents.fourColumns .innerBox:nth-child(n+5) {
                display: none;
            }

            .contents.sixColumns {
                grid-template-columns: repeat(3, minmax(0, 1fr));
                gap: 10px;
            }

            .contents.sixColumns .innerBox {
                display: block;
                max-width: 560px;
            }

            .contents.sixColumns .innerBox:nth-child(n+7) {
                display: none;
            }
        }
    </style>
</head>
<body>

    <%-- 전체 wrap.S --%>
	<div class="wrap" id="indexWrap">  
		<div file="Setting">
    </div>
    	
		<%-- 헤더.S --%>
		<header id="header"> 
			<jsp:include page="/WEB-INF/views/common/dropdown.jsp"/>
			<jsp:include page="/WEB-INF/views/common/inc_header.jsp"/>
		</header>
        <%-- 헤더.E --%>

        <%-- 내용.S --%>		
		<div class="container">
            <%-- side 영역.S --%>
			<div id="side">
        
                <%-- 좌측 네비.S --%>
				<div class="btn-navi" >
					<a href="/main"><button type="button" class="btn_object_on">M A I N</button></a>
					<%-- <a href="/main"><button type="button" class="btn_evnet">E V E N T</button></a> --%>
					<a href="/mainCamera"><button type="button" class="btn_camera">C A M E R A</button></a>
				</div>
				<%-- 좌측 네비.E --%>
        
				<%-- 실시간 채널.S --%>
				<div file="inc_side">
					<jsp:include page="/WEB-INF/views/main/inc_side.jsp"/>
				</div>
				<%-- 실시간 채널.E --%>
			</div>
			<%-- side 영역.E --%>

            <%-- 우측 메인.S --%>
			<div id="contentsWrap">
				<%-- 상단 날짜,버튼 영역.S --%>
				<form action="/main" method="get" >
				<div class="mainTop">
					<div class=" dateArea" style="display: flex; flex-direction: row; align-items: center;">


						<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
							<input type="date" id="tui-date-picker-target" aria-label="Date-Time">
							<span class="tui-ico-date"></span>
							<div id="tui-date-picker-container"></div>
						</div>

						<div>
							<button type="button" class="btn-date" id="minusBtn" ><i class="fa-solid fa-caret-left fa-xl" style="color: #ffffff;"></i></button>
							<button type="button" class="btn" id="todayBtn" >오늘</button>
							<button type="button" class="btn-date" id="plusBtn"><i class="fa-solid fa-caret-right fa-xl" style="color: #ffffff;"></i></button>
						</div>
					</div>
					<div class="btnArea">						
						<%-- <a class="rollover" alt="csv파일" OnClick="OnCSV_Click()"><img src="img/btn-downCSV.png"> <img src="img/btn-downCSV_hover.png" class="over"></a> --%>
						<a class="rollover" alt="csv파일" OnClick="OnCSV_Click()"><img src="../../resources/img/btn-downCSV.png"> <img src="../../resources/img/btn-downCSV_hover.png" class="over"></a>
						<a class="rollover" alt="bmp파일" OnClick="OnBMP_Click()"><img src="../../resources/img/btn-downBMP.png"> <img src="../../resources/img/btn-downBMP_hover.png" class="over"></a>
						<a class="rollover" alt="csv파일" OnClick="OnPrint_Click()"><img src="../../resources/img/btn-downPrint.png"> <img src="../../resources/img/btn-downPrint_hover.png" class="over"></a>
					</div>
				</div>
				</form>
				<%-- 상단 날짜,버튼 영역.E --%>
        

            <%-- 여기서 부터 그리드 연습장 --%>
                <button id="sixInnerBox">6개</button>
                <button id="fourInnerBox">4개</button>
                <br><br>
                <div class="contents">
                    <div class="innerBox"></div>
                    <div class="innerBox"></div>
                    <div class="innerBox"></div>
                    <div class="innerBox"></div>
                    <div class="innerBox"></div>
                    <div class="innerBox"></div>
                </div>
            <%-- 여기까지 그리드 연습장 --%>
        </div>



    <script>
        document.getElementById('sixInnerBox').addEventListener('click', function () {
            document.querySelector('.contents').classList.remove('fourColumns');
            document.querySelector('.contents').classList.add('sixColumns');
        });

        document.getElementById('fourInnerBox').addEventListener('click', function () {
            document.querySelector('.contents').classList.remove('sixColumns');
            document.querySelector('.contents').classList.add('fourColumns');
        });
    </script>
</body>
</html>
