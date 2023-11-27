SELECT * FROM "TB_AI_NVR_DASH_BOARD_COUNT";

SELECT user_id, user_pw, user_name
		FROM TB_AI_NVR_DASH_BOARD_USER
		WHERE user_id = 'admin';
		
	

SELECT COUNT(*) FROM TB_AI_NVR_DASH_BOARD_USER
WHERE USER_ID = 'admin'
AND CAST(DECRYPTBYPASSPHRASE((SELECT site_code FROM TB_SERVER_RECORD WHERE type = 34), enc_user_pw) AS NVARCHAR(2000)) = 'admin';



EXEC SP_AI_NVR_DASH_BOARD_DAILY_COUNT_SUMMARY '20231106', '20231106', 0;


EXEC SP_AI_NVR_DASH_BOARD_DAILY_COUNT_SUMMARY_EVERY_HOUR '2023110300', '2023110399', 0;


EXEC SP_AI_NVR_DASH_BOARD_DAILY_COUNT_SUMMARY_BY_CAMERA '2023110600', '2023110699', 0;

SELECT
FACE_YOUNGMALE AS YOUNG_MALE    -- 미성년_남자
, FACE_YOUNGFEMALE AS YOUNG_FEMALE  -- 미성년 여자
, FACE_ADULTMALE AS ADULT_MALE   -- 성인_남자
, FACE_ADULTFEMALE AS ADULT_FEMALE  -- 성인_여자
, FACE_MIDDLEMALE AS MIDDLE_MALE   -- 중년_남자
, FACE_MIDDLEFEMALE AS MIDDLE_FEMALE -- 중년_여자
, FACE_SENIORMALE AS SENIOR_MALE   -- 노년_남자
, FACE_SENIORFEMALE AS SENIOR_FEMALE -- 노년_여자
FROM TB_AI_NVR_DASH_BOARD_DAILY_COUNT_SUMMARY
WHERE OCCU_DATE = '20231115';


SELECT
*
FROM TB_AI_NVR_DASH_BOARD_DAILY_COUNT_SUMMARY
WHERE OCCU_DATE = '20231123';

--사람
SELECT
  FACE_YOUNGMALE AS YOUNG_MALE,
  FACE_YOUNGFEMALE AS YOUNG_FEMALE,
  FACE_ADULTMALE AS ADULT_MALE,
  FACE_ADULTFEMALE AS ADULT_FEMALE,
  FACE_MIDDLEMALE AS MIDDLE_MALE,
  FACE_MIDDLEFEMALE AS MIDDLE_FEMALE,
  FACE_SENIORMALE AS SENIOR_MALE,
  FACE_SENIORFEMALE AS SENIOR_FEMALE,
  OCCU_DATE
FROM TB_AI_NVR_DASH_BOARD_DAILY_COUNT_SUMMARY
WHERE OCCU_DATE = CONVERT(varchar, GETDATE(), 112);

--사람 누적 합계 구하기
SELECT
	SUM(FACE_YOUNGMALE + FACE_YOUNGFEMALE + FACE_ADULTMALE + FACE_ADULTFEMALE + FACE_MIDDLEMALE + FACE_MIDDLEFEMALE + FACE_SENIORMALE + FACE_SENIORFEMALE)
FROM TB_AI_NVR_DASH_BOARD_DAILY_COUNT_SUMMARY
WHERE OCCU_DATE = CONVERT(varchar, GETDATE(), 112);

SELECT ISNULL(
           SUM(FACE_YOUNGMALE + FACE_YOUNGFEMALE + FACE_ADULTMALE + FACE_ADULTFEMALE + FACE_MIDDLEMALE + FACE_MIDDLEFEMALE + FACE_SENIORMALE + FACE_SENIORFEMALE),
           0
       ) AS TotalSum
FROM TB_AI_NVR_DASH_BOARD_DAILY_COUNT_SUMMARY
WHERE OCCU_DATE = CONVERT(varchar, GETDATE(), 112);




SELECT CONVERT(varchar, DATEADD(DAY, 1, GETDATE()), 112) AS Tomorrow;
SELECT CONVERT(varchar, DATE(DAY, 1, GETDATE()), 112) AS Today;




SELECT
*
FROM TB_AI_NVR_DASH_BOARD_DAILY_COUNT_SUMMARY
WHERE OCCU_DATE = CONVERT(varchar, GETDATE(), 112);

SELECT
  *
FROM TB_AI_NVR_DASH_BOARD_DAILY_COUNT_SUMMARY
WHERE OCCU_DATE = CONVERT(varchar, DATEADD(DAY, 1, GETDATE()), 112);



-- 시간대별 현황
SELECT
SUBSTRING(OCCU_TIME, 9, 2)     
, PERSON             
, VEHICLE             
, FACE                   
, LPR                     
, INV_CNT              
, LOT_CNT              
, CNT_CNT             
, FAL_CNT           C43    
FROM TB_AI_NVR_DASH_BOARD_DAILY_COUNT
WHERE SUBSTRING(OCCU_TIME, 1, 8) = CONVERT(varchar, GETDATE(), 112)
ORDER BY OCCU_TIME;

--마스크 미착용자 성별/연령 비교
SELECT
FACE_NOMASKMALEYOUNG         -- 마스크미착용_남자_미성년
, FACE_NOMASKMALEADULT         -- 마스크미착용_남자_성인
, FACE_NOMASKMALEMIDDLE       -- 마스크미착용_남자_중년
, FACE_NOMASKMALESENIOR        -- 마스크미착용_남자_노년
, FACE_NOMASKFEMALEYOUNG     -- 마스크미착용_여자_미성년
, FACE_NOMASKFEMALEADULT      -- 마스크미착용_여자_성인
, FACE_NOMASKFEMALEMIDDLE     -- 마스크미착용_여자_중년
, FACE_NOMASKFEMALESENIOR     -- 마스크미착용_여자_노년
, OCCU_DATE
FROM TB_AI_NVR_DASH_BOARD_DAILY_COUNT_SUMMARY
WHERE OCCU_DATE = CONVERT(varchar, GETDATE(), 112);



SELECT
TOP 10
CNT.CAMERA_NAME   
, SUM(CNT.TOT_CNT)                       -- 카메라명
, SUM(CNT.PERSON)   AS PERSON     -- 사람
, SUM(CNT.VEHICLE)  AS VEHICLE     -- 차량
, SUM(CNT.FACE)   AS FACE             -- 얼굴
, SUM(CNT.LPR)    AS LPR                -- 차량번호판
, SUM(CNT.INV_CNT)  AS INV_CNT    -- 침입
, SUM(CNT.LOT_CNT)  AS LOT_CNT    -- 배회
, SUM(CNT.CNT_CNT)  AS CNT_CNT   -- 카운팅
, SUM(CNT.FAL_CNT)  AS FAL_CNT     -- 쓰러짐
FROM TB_AI_NVR_DASH_BOARD_DAILY_COUNT CNT
WHERE SUBSTRING(CNT.OCCU_TIME, 1, 8) = CONVERT(varchar, GETDATE(), 112)
GROUP BY CNT.CAMERA_NAME
ORDER BY SUM(CNT.TOT_CNT);

-- 사람 최다검지 카메라
SELECT
			TOP 10
			CNT.CAMERA_NAME   
			, SUM(CNT.PERSON)   AS personCount     
			, SUM(CNT.VEHICLE)  AS vehicleCount     
			, SUM(CNT.FACE)   AS faceCount             
			, SUM(CNT.LPR)    AS lprCount               
			, SUM(CNT.INV_CNT)  AS invCntCount   
			, SUM(CNT.LOT_CNT)  AS lotCntCount   
			, SUM(CNT.CNT_CNT)  AS cntCntCount   
			, SUM(CNT.FAL_CNT)  AS falCntCont     
		FROM "TB_AI_NVR_DASH_BOARD_DAILY_COUNT" CNT
		WHERE SUBSTRING(CNT.OCCU_TIME, 1, 8) = CONVERT(varchar, GETDATE(), 112)
		GROUP BY CNT.CAMERA_NAME
		ORDER BY SUM(CNT.TOT_CNT);
	
	--차량 최다검지카메라
	SELECT TOP 10
    CNT.CAMERA_NAME,
    SUM(CNT.TOT_CNT) AS total_count,
    SUM(CNT.VEHICLE_CAR) AS carCount,
    SUM(CNT.VEHICLE_BUS) AS busCount,
    SUM(CNT.VEHICLE_TRUCK) AS truckCount,
    SUM(CNT.VEHICLE_MOTORCYCLE) AS motocycleCount,
    SUM(CNT.VEHICLE_BICYCLE) AS bicycleCount
FROM "TB_AI_NVR_DASH_BOARD_DAILY_COUNT" CNT
WHERE SUBSTRING(CNT.OCCU_TIME, 1, 8) = CONVERT(varchar, GETDATE(), 112)
GROUP BY CNT.CAMERA_NAME
ORDER BY SUM(CNT.TOT_CNT) DESC;



--차량 막대차트
SELECT
SUM(CNT.VEHICLE_CAR) AS carCount,
SUM(CNT.VEHICLE_BUS) AS busCount,
SUM(CNT.VEHICLE_TRUCK) AS truckCount,
SUM(CNT.VEHICLE_MOTORCYCLE) AS motocycleCount,
SUM(CNT.VEHICLE_BICYCLE) AS bicycleCount
FROM "TB_AI_NVR_DASH_BOARD_DAILY_COUNT" CNT
WHERE SUBSTRING(CNT.OCCU_TIME, 1, 8) = CONVERT(varchar, GETDATE(), 112);

-- 차량 누적 수 ????안됨
SELECT 
    ISNULL(
        SUM(CNT.VEHICLE_CAR + CNT.VEHICLE_BUS + CNT.VEHICLE_TRUCK + CNT.VEHICLE_MOTORCYCLE + CNT.VEHICLE_BICYCLE),
        0
    ) AS TotalSum
FROM "TB_AI_NVR_DASH_BOARD_DAILY_COUNT" CNT
WHERE SUBSTRING(CNT.OCCU_TIME, 1, 8) = CONVERT(varchar, GETDATE(), 112);




